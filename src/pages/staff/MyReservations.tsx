import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Reservation {
  id: number;
  store_id: number;
  customer_id: string;
  menu_id: number;
  date: string;
  start_time: string;
  status: string;
  store?: { name: string };
  menu?: { name: string; price: number };
  customer?: { name: string };
}

interface Rating {
  id: number;
  reservation_id: number;
  target_type: string;
}

interface CustomerRating {
  avgRating: number | null;
  totalCount: number;
}

export default function MyReservations() {
  const { user } = useAuth();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [myRatings, setMyRatings] = useState<Rating[]>([]);
  const [customerRatings, setCustomerRatings] = useState<Record<string, CustomerRating>>({});
  const [blockedCustomers, setBlockedCustomers] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [showRatingModal, setShowRatingModal] = useState(false);
  const [selectedReservation, setSelectedReservation] = useState<Reservation | null>(null);
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
        .insert({ blocker_id: user.id, blocked_id: customerId });

      setBlockedCustomers(prev => new Set([...prev, customerId]));
    }
  };

  const fetchReservations = async () => {
    if (!user) return;

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`*, store:stores(name), menu:menus(name, price), customer:profiles!reservations_customer_id_fkey(name)`)
      .eq('staff_id', user.id)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setReservations(reservationsData || []);

    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, reservation_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);

    if (reservationsData && reservationsData.length > 0) {
      const customerIds = [...new Set(reservationsData.map(r => r.customer_id))];
      const { data: customerRatingsData } = await supabase
        .from('ratings')
        .select('target_profile_id, rating')
        .in('target_profile_id', customerIds)
        .eq('target_type', 'customer');

      if (customerRatingsData) {
        const ratingsByCustomer: Record<string, CustomerRating> = {};
        const grouped: Record<string, number[]> = {};

        customerRatingsData.forEach(r => {
          if (!r.target_profile_id) return;
          if (!grouped[r.target_profile_id]) grouped[r.target_profile_id] = [];
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

    setLoading(false);
  };

  const todayReservations = reservations.filter((r) => r.date === today);
  const upcomingReservations = reservations.filter((r) => r.date > today && r.status !== 'cancelled');
  const pastReservations = reservations.filter((r) => r.date < today || r.status === 'completed');

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  const getStatusText = (status: string) => {
    switch (status) {
      case 'confirmed': return '확정';
      case 'pending': return '대기';
      case 'cancelled': return '취소';
      case 'completed': return '완료';
      default: return status;
    }
  };

  const handleConfirm = async (reservationId: number) => {
    const { error } = await supabase.from('reservations').update({ status: 'confirmed' }).eq('id', reservationId);
    if (error) alert('확정 처리 중 오류가 발생했습니다.');
    else fetchReservations();
  };

  const handleReject = async (reservationId: number) => {
    const { error } = await supabase.from('reservations').update({ status: 'cancelled' }).eq('id', reservationId);
    if (error) alert('거절 처리 중 오류가 발생했습니다.');
    else fetchReservations();
  };

  const handleComplete = async (reservationId: number) => {
    const { error } = await supabase.from('reservations').update({ status: 'completed' }).eq('id', reservationId);
    if (error) alert('완료 처리 중 오류가 발생했습니다.');
    else fetchReservations();
  };

  const hasRated = (reservationId: number, targetType: string) => {
    return myRatings.some((r) => r.reservation_id === reservationId && r.target_type === targetType);
  };

  const openRatingModal = (reservation: Reservation) => {
    setSelectedReservation(reservation);
    setShowRatingModal(true);
  };

  const ReservationCard = ({ reservation }: { reservation: Reservation }) => {
    const customerRating = customerRatings[reservation.customer_id];
    const isBlocked = blockedCustomers.has(reservation.customer_id);

    return (
      <div className={`p-4 bg-white border rounded-xl ${
        reservation.status === 'confirmed' ? 'border-green-300' :
        reservation.status === 'pending' ? 'border-orange-300' :
        reservation.status === 'cancelled' ? 'border-slate-200 opacity-60' : 'border-slate-200'
      }`}>
        <div className="flex gap-4">
          <div className="text-center">
            <span className="block text-lg font-bold text-slate-900">{reservation.start_time}</span>
            <span className="text-xs text-slate-500">{formatDate(reservation.date)}</span>
          </div>
          <div className="flex-1">
            <div className="flex items-baseline gap-2 mb-1">
              <span className="font-semibold text-slate-900">{reservation.menu?.name}</span>
              <span className="text-sm font-medium text-orange-600">{reservation.menu?.price?.toLocaleString()}원</span>
            </div>
            <div className="text-sm text-slate-600">{reservation.store?.name}</div>
            <div className="flex items-center gap-2 text-xs text-slate-500 mt-1">
              <span>손님: {reservation.customer?.name || '고객'}</span>
              {customerRating && customerRating.totalCount > 0 && (
                <span className="inline-flex items-center gap-0.5 px-1.5 py-0.5 bg-amber-50 text-amber-600 rounded text-xs">
                  <span>★</span> {customerRating.avgRating?.toFixed(1)}
                </span>
              )}
              <button
                className={`px-2 py-0.5 text-xs rounded ${isBlocked ? 'bg-red-100 text-red-600' : 'bg-slate-100 text-slate-500 hover:bg-slate-200'}`}
                onClick={() => handleBlock(reservation.customer_id, reservation.customer?.name || '고객')}
              >
                {isBlocked ? '차단됨' : '차단'}
              </button>
            </div>
          </div>
          <div className="flex flex-col items-end gap-2">
            <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
              reservation.status === 'confirmed' ? 'bg-green-100 text-green-600' :
              reservation.status === 'pending' ? 'bg-orange-100 text-orange-600' :
              reservation.status === 'cancelled' ? 'bg-slate-100 text-slate-500' : 'bg-slate-100 text-slate-600'
            }`}>
              {getStatusText(reservation.status)}
            </span>
            {reservation.status === 'pending' && (
              <div className="flex gap-1">
                <button className="px-2 py-1 bg-green-600 text-white text-xs font-medium rounded hover:bg-green-700" onClick={() => handleConfirm(reservation.id)}>
                  확정
                </button>
                <button className="px-2 py-1 bg-red-100 text-red-600 text-xs font-medium rounded hover:bg-red-200" onClick={() => handleReject(reservation.id)}>
                  거절
                </button>
              </div>
            )}
            {reservation.status === 'confirmed' && (
              <button className="px-2 py-1 bg-red-600 text-white text-xs font-medium rounded hover:bg-red-700" onClick={() => handleComplete(reservation.id)}>
                서비스 완료
              </button>
            )}
            {reservation.status === 'completed' && !hasRated(reservation.id, 'customer') && (
              <button className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-medium rounded hover:bg-amber-200" onClick={() => openRatingModal(reservation)}>
                손님 별점 주기
              </button>
            )}
            {reservation.status === 'completed' && hasRated(reservation.id, 'customer') && (
              <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded">평가 완료</span>
            )}
          </div>
        </div>
      </div>
    );
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">내 예약 관리</h1>

      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">오늘 예약 ({todayReservations.length}건)</h2>
        {todayReservations.length > 0 ? (
          <div className="flex flex-col gap-3">{todayReservations.map((r) => <ReservationCard key={r.id} reservation={r} />)}</div>
        ) : (
          <p className="text-slate-400 text-sm py-4">오늘 예약이 없습니다.</p>
        )}
      </section>

      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">예정된 예약 ({upcomingReservations.length}건)</h2>
        {upcomingReservations.length > 0 ? (
          <div className="flex flex-col gap-3">{upcomingReservations.map((r) => <ReservationCard key={r.id} reservation={r} />)}</div>
        ) : (
          <p className="text-slate-400 text-sm py-4">예정된 예약이 없습니다.</p>
        )}
      </section>

      {pastReservations.length > 0 && (
        <section className="mb-8">
          <h2 className="text-lg font-semibold text-slate-900 mb-3">지난 예약</h2>
          <div className="flex flex-col gap-3 opacity-80">{pastReservations.slice(0, 5).map((r) => <ReservationCard key={r.id} reservation={r} />)}</div>
        </section>
      )}

      {showRatingModal && selectedReservation && (
        <RatingModal
          reservation={selectedReservation}
          raterId={user?.id || ''}
          targetType="customer"
          targetId={selectedReservation.customer_id}
          targetName={selectedReservation.customer?.name || '손님'}
          onClose={() => { setShowRatingModal(false); setSelectedReservation(null); }}
          onSuccess={() => { setShowRatingModal(false); setSelectedReservation(null); fetchReservations(); }}
        />
      )}
    </div>
  );
}

function RatingModal({
  reservation, raterId, targetType, targetId, targetName, onClose, onSuccess,
}: {
  reservation: Reservation; raterId: string; targetType: 'staff' | 'customer' | 'store'; targetId: string | number; targetName: string; onClose: () => void; onSuccess: () => void;
}) {
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);
    const insertData: Record<string, unknown> = {
      reservation_id: reservation.id,
      rater_id: raterId,
      target_type: targetType,
      rating,
      comment: comment || null,
    };

    if (targetType === 'store') {
      insertData.target_store_id = targetId;
    } else {
      insertData.target_profile_id = targetId;
    }

    const { error } = await supabase.from('ratings').insert(insertData);
    setSubmitting(false);
    if (error) alert('별점 등록 중 오류가 발생했습니다.');
    else onSuccess();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-2">별점 주기</h2>
        <p className="text-slate-600 mb-4">{targetName}님에게 별점을 주세요</p>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">
              {[1, 2, 3, 4, 5].map((star) => (
                <span key={star} className={`text-2xl cursor-pointer ${rating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setRating(star)}>★</span>
              ))}
            </div>
            <span className="text-sm text-slate-600">{rating}점</span>
          </div>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">코멘트 (선택)</label>
          <textarea
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            placeholder="코멘트를 남겨주세요..."
            rows={3}
            className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
          />
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={submitting} className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400">
            {submitting ? '등록 중...' : '별점 등록'}
          </button>
        </div>
      </div>
    </div>
  );
}
