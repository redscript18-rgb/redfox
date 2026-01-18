import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Reservation {
  id: number;
  store_id: number;
  staff_id: string | null;
  virtual_staff_id: string | null;
  menu_id: number;
  date: string;
  start_time: string;
  status: string;
  status_read_at: string | null;
  store?: { name: string };
  staff?: { name: string };
  virtual_staff?: { name: string };
  menu?: { name: string; price: number };
}

interface Rating {
  id: number;
  reservation_id: number;
  target_type: string;
}

export default function CustomerReservations() {
  const { user } = useAuth();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [myRatings, setMyRatings] = useState<Rating[]>([]);
  const [loading, setLoading] = useState(true);
  const [showRatingModal, setShowRatingModal] = useState(false);
  const [selectedReservation, setSelectedReservation] = useState<Reservation | null>(null);
  const [ratingTargetType, setRatingTargetType] = useState<'staff' | 'store'>('staff');
  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  const fetchReservations = useCallback(async () => {
    if (!user) return;

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`*, store:stores(name), staff:profiles!reservations_staff_id_fkey(name), virtual_staff:virtual_staff(name), menu:menus(name, price)`)
      .eq('customer_id', user.id)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setReservations(reservationsData || []);

    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, reservation_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);
    setLoading(false);
  }, [user]);

  const markAsRead = useCallback(async () => {
    if (!user) return;
    await supabase
      .from('reservations')
      .update({ status_read_at: new Date().toISOString() })
      .eq('customer_id', user.id)
      .neq('status', 'pending')
      .is('status_read_at', null);
  }, [user]);

  useEffect(() => {
    if (user) {
      fetchReservations();
      markAsRead();
    }
  }, [user, fetchReservations, markAsRead]);

  useEffect(() => {
    const interval = setInterval(() => fetchReservations(), 30000);
    return () => clearInterval(interval);
  }, [fetchReservations]);

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

  const isNewNotification = (reservation: Reservation) => {
    return reservation.status !== 'pending' && reservation.status_read_at === null;
  };

  const handleCancel = async (reservationId: number) => {
    if (!confirm('예약을 취소하시겠습니까?')) return;
    const { error } = await supabase.from('reservations').update({ status: 'cancelled' }).eq('id', reservationId);
    if (error) alert('취소 처리 중 오류가 발생했습니다.');
    else fetchReservations();
  };

  const hasRated = (reservationId: number, targetType: string) => {
    return myRatings.some((r) => r.reservation_id === reservationId && r.target_type === targetType);
  };

  const openRatingModal = (reservation: Reservation, targetType: 'staff' | 'store') => {
    setSelectedReservation(reservation);
    setRatingTargetType(targetType);
    setShowRatingModal(true);
  };

  const ReservationCard = ({ reservation }: { reservation: Reservation }) => {
    const isNew = isNewNotification(reservation);

    return (
      <div className={`relative p-4 bg-white border rounded-xl ${
        reservation.status === 'confirmed' ? 'border-green-300' :
        reservation.status === 'pending' ? 'border-orange-300 border-2' :
        reservation.status === 'cancelled' ? 'border-slate-200 opacity-60' : 'border-slate-200'
      } ${isNew ? 'ring-2 ring-blue-500' : ''}`}>
        {isNew && (
          <span className="absolute -top-2 -right-2 px-2 py-0.5 bg-red-600 text-white text-xs font-bold rounded-full">NEW</span>
        )}
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
            <div className="text-xs text-slate-500">담당: {reservation.staff?.name || reservation.virtual_staff?.name || '미정'}</div>
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
              <button className="text-xs text-red-500 hover:underline" onClick={() => handleCancel(reservation.id)}>
                취소
              </button>
            )}
            {reservation.status === 'completed' && (
              <div className="flex gap-1">
                {!hasRated(reservation.id, 'staff') ? (
                  <button className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-medium rounded hover:bg-amber-200" onClick={() => openRatingModal(reservation, 'staff')}>
                    매니저 별점
                  </button>
                ) : (
                  <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded">매니저 평가완료</span>
                )}
                {!hasRated(reservation.id, 'store') ? (
                  <button className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-medium rounded hover:bg-amber-200" onClick={() => openRatingModal(reservation, 'store')}>
                    가게 별점
                  </button>
                ) : (
                  <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded">가게 평가완료</span>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    );
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 홈</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">내 예약</h1>

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
          targetType={ratingTargetType}
          targetId={ratingTargetType === 'staff' ? (selectedReservation.staff_id || selectedReservation.virtual_staff_id || '') : selectedReservation.store_id}
          targetName={ratingTargetType === 'staff' ? (selectedReservation.staff?.name || selectedReservation.virtual_staff?.name || '매니저') : (selectedReservation.store?.name || '가게')}
          isVirtualStaff={!selectedReservation.staff_id && !!selectedReservation.virtual_staff_id}
          onClose={() => { setShowRatingModal(false); setSelectedReservation(null); }}
          onSuccess={() => { setShowRatingModal(false); setSelectedReservation(null); fetchReservations(); }}
        />
      )}
    </div>
  );
}

function RatingModal({
  reservation, raterId, targetType, targetId, targetName, isVirtualStaff, onClose, onSuccess,
}: {
  reservation: Reservation; raterId: string; targetType: 'staff' | 'store'; targetId: string | number; targetName: string; isVirtualStaff?: boolean; onClose: () => void; onSuccess: () => void;
}) {
  const [rating, setRating] = useState(5);
  const [serviceRating, setServiceRating] = useState(5);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);
    const insertData: Record<string, unknown> = { reservation_id: reservation.id, rater_id: raterId, target_type: targetType, rating, comment: comment || null };
    if (targetType === 'staff') {
      insertData.service_rating = serviceRating;
      if (isVirtualStaff) {
        insertData.target_virtual_staff_id = targetId;
      } else {
        insertData.target_profile_id = targetId;
      }
    } else {
      insertData.target_store_id = targetId;
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
        <p className="text-slate-600 mb-4">{targetName}에게 별점을 주세요</p>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">기본 별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">
              {[1, 2, 3, 4, 5].map((star) => (
                <span key={star} className={`text-2xl cursor-pointer ${rating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setRating(star)}>★</span>
              ))}
            </div>
            <span className="text-sm text-slate-600">{rating}점</span>
          </div>
        </div>

        {targetType === 'staff' && (
          <div className="mb-4">
            <label className="block text-sm font-medium text-slate-700 mb-2">서비스 별점</label>
            <div className="flex items-center gap-2">
              <div className="flex">
                {[1, 2, 3, 4, 5].map((star) => (
                  <span key={star} className={`text-2xl cursor-pointer ${serviceRating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setServiceRating(star)}>★</span>
                ))}
              </div>
              <span className="text-sm text-slate-600">{serviceRating}점</span>
            </div>
          </div>
        )}

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">코멘트 (선택)</label>
          <textarea value={comment} onChange={(e) => setComment(e.target.value)} placeholder="코멘트를 남겨주세요..." rows={3}
            className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
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
