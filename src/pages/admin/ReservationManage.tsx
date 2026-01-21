import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Reservation {
  id: number;
  store_id: number;
  staff_id: string | null;
  virtual_staff_id: string | null;
  customer_id: string;
  menu_id: number;
  date: string;
  start_time: string;
  status: string;
  store?: { name: string };
  staff?: { name: string };
  virtual_staff?: { name: string };
  customer?: { name: string };
  menu?: { name: string; price: number };
}

interface CustomerRating {
  avgRating: number | null;
  totalCount: number;
}

export default function ReservationManage() {
  const { user } = useAuth();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [customerRatings, setCustomerRatings] = useState<Record<string, CustomerRating>>({});
  const [blockedCustomers, setBlockedCustomers] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'pending' | 'confirmed' | 'all'>('pending');
  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchReservations();
      fetchBlockedCustomers();
    }
  }, [user]);

  const fetchBlockedCustomers = async () => {
    if (!user) return;
    const { data } = await supabase
      .from('blocks')
      .select('blocked_id')
      .eq('blocker_id', user.id);

    if (data) {
      setBlockedCustomers(new Set(data.map(b => b.blocked_id)));
    }
  };

  const handleBlock = async (customerId: string, customerName: string) => {
    if (!user) return;

    const isBlocked = blockedCustomers.has(customerId);

    if (isBlocked) {
      await supabase
        .from('blocks')
        .delete()
        .eq('blocker_id', user.id)
        .eq('blocked_id', customerId);

      setBlockedCustomers(prev => {
        const next = new Set(prev);
        next.delete(customerId);
        return next;
      });
    } else {
      if (!confirm(`${customerName}님을 차단하시겠습니까?\n차단하면 이 손님은 당신을 볼 수 없습니다.`)) {
        return;
      }

      await supabase
        .from('blocks')
        .insert({
          blocker_id: user.id,
          blocked_id: customerId,
        });

      setBlockedCustomers(prev => new Set([...prev, customerId]));
    }
  };

  const fetchReservations = async () => {
    if (!user) return;

    // Get stores where user is admin
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);
    const adminStoreIds = adminStores?.map(s => s.store_id) || [];

    // Get stores where user is owner
    const { data: ownedStores } = await supabase.from('stores').select('id').eq('owner_id', user.id);
    const ownedStoreIds = ownedStores?.map(s => s.id) || [];

    // Combine unique store IDs
    const storeIds = [...new Set([...adminStoreIds, ...ownedStoreIds])];

    if (storeIds.length > 0) {
      const { data: reservationsData, error } = await supabase
        .from('reservations')
        .select(`
          *,
          store:stores(name),
          staff:profiles!reservations_staff_id_fkey(name),
          virtual_staff:virtual_staff(name),
          customer:profiles!reservations_customer_id_fkey(name),
          menu:menus!left(name, price)
        `)
        .in('store_id', storeIds)
        .gte('date', today)
        .order('date', { ascending: true })
        .order('start_time', { ascending: true });

      if (error) {
        console.error('Reservations fetch error:', error);
      }
      setReservations(reservationsData || []);

      if (reservationsData && reservationsData.length > 0) {
        const customerIds = [...new Set(reservationsData.map(r => r.customer_id))];
        const { data: ratingsData } = await supabase
          .from('ratings')
          .select('target_profile_id, rating')
          .in('target_profile_id', customerIds)
          .eq('target_type', 'customer');

        if (ratingsData) {
          const ratingsByCustomer: Record<string, CustomerRating> = {};
          const grouped: Record<string, number[]> = {};

          ratingsData.forEach(r => {
            if (!r.target_profile_id) return;
            if (!grouped[r.target_profile_id]) {
              grouped[r.target_profile_id] = [];
            }
            if (r.rating) grouped[r.target_profile_id].push(r.rating);
          });

          Object.entries(grouped).forEach(([customerId, ratings]) => {
            ratingsByCustomer[customerId] = {
              avgRating: ratings.length > 0 ? ratings.reduce((a, b) => a + b, 0) / ratings.length : null,
              totalCount: ratings.length,
            };
          });

          setCustomerRatings(ratingsByCustomer);
        }
      }
    }

    setLoading(false);
  };

  const filteredReservations =
    filter === 'all'
      ? reservations
      : reservations.filter((r) => r.status === filter);

  const pendingCount = reservations.filter((r) => r.status === 'pending').length;

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const isToday = dateStr === today;
    return `${date.getMonth() + 1}/${date.getDate()}(${days[date.getDay()]})${isToday ? ' 오늘' : ''}`;
  };

  const handleConfirm = async (reservationId: number) => {
    const { error } = await supabase
      .from('reservations')
      .update({ status: 'confirmed' })
      .eq('id', reservationId);

    if (error) {
      alert('확정 처리 중 오류가 발생했습니다.');
    } else {
      alert('예약이 확정되었습니다.');
      fetchReservations();
    }
  };

  const handleCancel = async (reservationId: number) => {
    const { error } = await supabase
      .from('reservations')
      .update({ status: 'cancelled' })
      .eq('id', reservationId);

    if (error) {
      alert('취소 처리 중 오류가 발생했습니다.');
    } else {
      alert('예약이 취소되었습니다.');
      fetchReservations();
    }
  };

  if (loading) {
    return (
      <div className="max-w-lg mx-auto p-4">
        <p className="text-slate-500">로딩 중...</p>
      </div>
    );
  }

  return (
    <div className="max-w-lg mx-auto">
      <Link to="/" className="inline-flex items-center gap-1 mb-4 text-slate-500 text-sm hover:text-slate-700">
        <span>←</span> 대시보드
      </Link>

      <h1 className="text-xl font-bold text-slate-900 mb-5">예약 관리</h1>

      {/* Filter Tabs */}
      <div className="flex gap-2 mb-5">
        <button
          className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
            filter === 'pending'
              ? 'bg-orange-500 text-white shadow-sm'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setFilter('pending')}
        >
          대기 {pendingCount > 0 && <span className="ml-1 opacity-80">({pendingCount})</span>}
        </button>
        <button
          className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
            filter === 'confirmed'
              ? 'bg-green-500 text-white shadow-sm'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setFilter('confirmed')}
        >
          확정
        </button>
        <button
          className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
            filter === 'all'
              ? 'bg-slate-700 text-white shadow-sm'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setFilter('all')}
        >
          전체
        </button>
      </div>

      {/* Reservation List */}
      <div className="flex flex-col gap-3">
        {filteredReservations.map((reservation) => {
          const customerRating = customerRatings[reservation.customer_id];
          const isLowRating = customerRating?.avgRating !== null && customerRating?.avgRating < 3;
          const isBlocked = blockedCustomers.has(reservation.customer_id);
          const isPending = reservation.status === 'pending';
          const staffName = reservation.staff?.name || reservation.virtual_staff?.name;

          return (
            <div
              key={reservation.id}
              className={`bg-white rounded-2xl overflow-hidden shadow-sm border transition-all ${
                isPending
                  ? 'border-orange-200 shadow-orange-100'
                  : isLowRating
                  ? 'border-amber-200'
                  : 'border-slate-100'
              }`}
            >
              {/* Main Content */}
              <div className="p-4">
                {/* Top Row: Time & Status */}
                <div className="flex items-center justify-between mb-3">
                  <div className="flex items-center gap-3">
                    <span className="text-2xl font-bold text-slate-900">
                      {reservation.start_time.slice(0, 5)}
                    </span>
                    <span className="text-sm text-slate-400">
                      {formatDate(reservation.date)}
                    </span>
                  </div>
                  <span className={`text-xs font-medium px-2.5 py-1 rounded-full ${
                    isPending
                      ? 'bg-orange-100 text-orange-600'
                      : reservation.status === 'confirmed'
                      ? 'bg-green-100 text-green-600'
                      : 'bg-slate-100 text-slate-500'
                  }`}>
                    {isPending && '승인 대기'}
                    {reservation.status === 'confirmed' && '확정됨'}
                    {reservation.status === 'cancelled' && '취소됨'}
                  </span>
                </div>

                {/* Customer Info */}
                <div className="flex items-center justify-between mb-3">
                  <div className="flex items-center gap-2">
                    <div className="w-9 h-9 rounded-full bg-slate-100 flex items-center justify-center text-sm font-medium text-slate-600">
                      {(reservation.customer?.name || '고')[0]}
                    </div>
                    <div>
                      <div className="flex items-center gap-2">
                        <span className="font-semibold text-slate-900">
                          {reservation.customer?.name || '고객'}
                        </span>
                        {customerRating && customerRating.totalCount > 0 ? (
                          <span className={`text-xs font-medium px-1.5 py-0.5 rounded ${
                            isLowRating
                              ? 'bg-red-50 text-red-600'
                              : 'bg-amber-50 text-amber-600'
                          }`}>
                            ★ {customerRating.avgRating?.toFixed(1)}
                          </span>
                        ) : (
                          <span className="text-xs text-slate-400">신규</span>
                        )}
                      </div>
                    </div>
                  </div>
                  <button
                    className={`text-xs font-medium px-2.5 py-1 rounded-lg transition-colors ${
                      isBlocked
                        ? 'bg-red-500 text-white'
                        : 'text-slate-400 hover:text-red-500 hover:bg-red-50'
                    }`}
                    onClick={() => handleBlock(reservation.customer_id, reservation.customer?.name || '고객')}
                  >
                    {isBlocked ? '차단됨' : '차단'}
                  </button>
                </div>

                {/* Details */}
                <div className="flex flex-wrap gap-x-4 gap-y-1 text-sm text-slate-500">
                  {reservation.menu?.name ? (
                    <span>
                      {reservation.menu.name}
                      {reservation.menu.price && (
                        <span className="text-orange-500 font-medium ml-1">
                          {reservation.menu.price.toLocaleString()}원
                        </span>
                      )}
                    </span>
                  ) : (
                    <span className="text-slate-400">메뉴 미지정</span>
                  )}
                  <span className="text-slate-300">|</span>
                  {staffName ? (
                    <span>담당: {staffName}</span>
                  ) : (
                    <span className="text-blue-500">가게 직접 예약</span>
                  )}
                </div>

                {/* Store */}
                <div className="mt-2 text-xs text-slate-400">
                  {reservation.store?.name}
                </div>
              </div>

              {/* Action Buttons */}
              {isPending && (
                <div className="flex border-t border-slate-100">
                  <button
                    className="flex-1 py-3 text-sm font-semibold text-green-600 hover:bg-green-50 transition-colors"
                    onClick={() => handleConfirm(reservation.id)}
                  >
                    확정하기
                  </button>
                  <div className="w-px bg-slate-100" />
                  <button
                    className="flex-1 py-3 text-sm font-semibold text-slate-400 hover:bg-slate-50 hover:text-slate-600 transition-colors"
                    onClick={() => handleCancel(reservation.id)}
                  >
                    거절
                  </button>
                </div>
              )}
            </div>
          );
        })}
      </div>

      {filteredReservations.length === 0 && (
        <div className="py-16 text-center">
          <div className="text-4xl mb-3">📋</div>
          <p className="text-slate-400">
            {filter === 'pending'
              ? '대기 중인 예약이 없습니다'
              : '예약이 없습니다'}
          </p>
        </div>
      )}
    </div>
  );
}
