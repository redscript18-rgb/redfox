import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './ReservationManage.css';

interface Reservation {
  id: number;
  store_id: number;
  staff_id: string;
  customer_id: string;
  menu_id: number;
  date: string;
  start_time: string;
  status: string;
  store?: { name: string };
  staff?: { name: string };
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
  const today = new Date().toISOString().split('T')[0];

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
      // 차단 해제
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
      // 차단
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

    // 관리하는 가게 목록 조회
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map(s => s.store_id) || [];

    if (storeIds.length > 0) {
      // 예약과 관련 정보 조회
      const { data: reservationsData } = await supabase
        .from('reservations')
        .select(`
          *,
          store:stores(name),
          staff:profiles!reservations_staff_id_fkey(name),
          customer:profiles!reservations_customer_id_fkey(name),
          menu:menus(name, price)
        `)
        .in('store_id', storeIds)
        .gte('date', today)
        .order('date', { ascending: true })
        .order('start_time', { ascending: true });

      setReservations(reservationsData || []);

      // 손님별 평균 별점 조회
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

  // 필터링
  const filteredReservations =
    filter === 'all'
      ? reservations
      : reservations.filter((r) => r.status === filter);

  // 대기 중인 것 개수
  const pendingCount = reservations.filter((r) => r.status === 'pending').length;

  // 날짜 포맷
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const isToday = dateStr === today;
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})${isToday ? ' 오늘' : ''}`;
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
    return <div className="reservation-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="reservation-manage">
      <Link to="/" className="back-link">← 대시보드</Link>

      <h1>예약 관리</h1>

      <div className="filter-tabs">
        <button
          className={`tab ${filter === 'pending' ? 'active' : ''}`}
          onClick={() => setFilter('pending')}
        >
          승인 대기 {pendingCount > 0 && <span className="count">{pendingCount}</span>}
        </button>
        <button
          className={`tab ${filter === 'confirmed' ? 'active' : ''}`}
          onClick={() => setFilter('confirmed')}
        >
          확정됨
        </button>
        <button
          className={`tab ${filter === 'all' ? 'active' : ''}`}
          onClick={() => setFilter('all')}
        >
          전체
        </button>
      </div>

      <div className="reservation-list">
        {filteredReservations.map((reservation) => {
          const customerRating = customerRatings[reservation.customer_id];
          const isLowRating = customerRating?.avgRating !== null && customerRating?.avgRating < 3;
          const isBlocked = blockedCustomers.has(reservation.customer_id);
          return (
            <div key={reservation.id} className={`reservation-card ${reservation.status} ${isLowRating ? 'low-rating' : ''}`}>
              <div className="card-header">
                <div className="datetime-service">
                  <div className="datetime">
                    <span className="time">{reservation.start_time.slice(0, 5)}</span>
                    <span className="date">{formatDate(reservation.date)}</span>
                  </div>
                  <div className="service">
                    <span className="menu-name">{reservation.menu?.name}</span>
                    <span className="price">{reservation.menu?.price?.toLocaleString()}원</span>
                  </div>
                </div>
                <div className="actions">
                  {reservation.status === 'pending' ? (
                    <div className="action-buttons">
                      <button
                        className="confirm-btn"
                        onClick={() => handleConfirm(reservation.id)}
                      >
                        확정
                      </button>
                      <button
                        className="cancel-btn"
                        onClick={() => handleCancel(reservation.id)}
                      >
                        취소
                      </button>
                    </div>
                  ) : (
                    <span className={`status-badge ${reservation.status}`}>
                      {reservation.status === 'confirmed' ? '확정' :
                       reservation.status === 'cancelled' ? '취소됨' : reservation.status}
                    </span>
                  )}
                </div>
              </div>
              <div className="card-body">
                <div className="customer-info">
                  <span className="label">손님</span>
                  <span className="name">{reservation.customer?.name || '고객'}</span>
                  {customerRating && customerRating.totalCount > 0 ? (
                    <span className={`customer-rating ${isLowRating ? 'low' : ''}`}>
                      <span className="star">★</span>
                      {customerRating.avgRating?.toFixed(1)}
                      <span className="count">({customerRating.totalCount})</span>
                    </span>
                  ) : (
                    <span className="no-rating">평가 없음</span>
                  )}
                  <button
                    className={`block-btn ${isBlocked ? 'blocked' : ''}`}
                    onClick={() => handleBlock(reservation.customer_id, reservation.customer?.name || '고객')}
                    title={isBlocked ? '차단 해제' : '차단'}
                  >
                    {isBlocked ? '차단됨' : '차단'}
                  </button>
                </div>
                <div className="staff-store">
                  <span className="staff">담당: {reservation.staff?.name}</span>
                  <span className="store">{reservation.store?.name}</span>
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {filteredReservations.length === 0 && (
        <div className="empty-state">
          <p>
            {filter === 'pending'
              ? '승인 대기 중인 예약이 없습니다.'
              : '예약이 없습니다.'}
          </p>
        </div>
      )}
    </div>
  );
}
