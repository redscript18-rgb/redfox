import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './CustomerReservations.css';

interface Reservation {
  id: number;
  store_id: number;
  staff_id: string;
  menu_id: number;
  date: string;
  start_time: string;
  status: string;
  status_read_at: string | null;
  store?: { name: string };
  staff?: { name: string };
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
  const today = new Date().toISOString().split('T')[0];

  const fetchReservations = useCallback(async () => {
    if (!user) return;

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`
        *,
        store:stores(name),
        staff:profiles!reservations_staff_id_fkey(name),
        menu:menus(name, price)
      `)
      .eq('customer_id', user.id)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setReservations(reservationsData || []);

    // 내가 준 별점 조회
    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, reservation_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);
    setLoading(false);
  }, [user]);

  // 읽지 않은 알림 읽음 처리
  const markAsRead = useCallback(async () => {
    if (!user) return;

    // status_read_at이 null이고 status가 pending이 아닌 예약들 업데이트
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

  // 30초 폴링
  useEffect(() => {
    const interval = setInterval(() => {
      fetchReservations();
    }, 30000);

    return () => clearInterval(interval);
  }, [fetchReservations]);

  // 오늘 예약
  const todayReservations = reservations.filter((r) => r.date === today);

  // 예정된 예약 (오늘 이후)
  const upcomingReservations = reservations.filter(
    (r) => r.date > today && r.status !== 'cancelled'
  );

  // 지난 예약
  const pastReservations = reservations.filter(
    (r) => r.date < today || r.status === 'completed'
  );

  // 날짜 포맷
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  // 상태 텍스트
  const getStatusText = (status: string) => {
    switch (status) {
      case 'confirmed':
        return '확정';
      case 'pending':
        return '대기';
      case 'cancelled':
        return '취소';
      case 'completed':
        return '완료';
      default:
        return status;
    }
  };

  // 새 알림 여부 (status != pending && status_read_at == null)
  const isNewNotification = (reservation: Reservation) => {
    return reservation.status !== 'pending' && reservation.status_read_at === null;
  };

  const handleCancel = async (reservationId: number) => {
    if (!confirm('예약을 취소하시겠습니까?')) return;

    const { error } = await supabase
      .from('reservations')
      .update({ status: 'cancelled' })
      .eq('id', reservationId);

    if (error) {
      alert('취소 처리 중 오류가 발생했습니다.');
    } else {
      fetchReservations();
    }
  };

  const hasRated = (reservationId: number, targetType: string) => {
    return myRatings.some(
      (r) => r.reservation_id === reservationId && r.target_type === targetType
    );
  };

  const openRatingModal = (reservation: Reservation, targetType: 'staff' | 'store') => {
    setSelectedReservation(reservation);
    setRatingTargetType(targetType);
    setShowRatingModal(true);
  };

  const ReservationCard = ({ reservation }: { reservation: Reservation }) => {
    const isNew = isNewNotification(reservation);

    return (
      <div className={`reservation-card status-${reservation.status} ${isNew ? 'new-notification' : ''}`}>
        {isNew && <span className="new-badge">NEW</span>}
        <div className="reservation-time">
          <span className="time">{reservation.start_time}</span>
          <span className="date">{formatDate(reservation.date)}</span>
        </div>
        <div className="reservation-details">
          <div className="service-info">
            <span className="menu-name">{reservation.menu?.name}</span>
            <span className="price">{reservation.menu?.price?.toLocaleString()}원</span>
          </div>
          <div className="store-name">{reservation.store?.name}</div>
          <div className="staff-info">담당: {reservation.staff?.name || '미정'}</div>
        </div>
        <div className="reservation-actions">
          <span className={`status-badge ${reservation.status}`}>
            {getStatusText(reservation.status)}
          </span>
          {reservation.status === 'pending' && (
            <button className="cancel-btn" onClick={() => handleCancel(reservation.id)}>
              취소
            </button>
          )}
          {reservation.status === 'completed' && (
            <div className="rating-buttons">
              {!hasRated(reservation.id, 'staff') ? (
                <button className="rate-btn" onClick={() => openRatingModal(reservation, 'staff')}>
                  직원 별점
                </button>
              ) : (
                <span className="rated-badge">직원 평가완료</span>
              )}
              {!hasRated(reservation.id, 'store') ? (
                <button className="rate-btn" onClick={() => openRatingModal(reservation, 'store')}>
                  가게 별점
                </button>
              ) : (
                <span className="rated-badge">가게 평가완료</span>
              )}
            </div>
          )}
        </div>
      </div>
    );
  };

  if (loading) {
    return <div className="customer-reservations"><p>로딩 중...</p></div>;
  }

  return (
    <div className="customer-reservations">
      <Link to="/" className="back-link">← 홈</Link>

      <h1>내 예약</h1>

      {/* 오늘 예약 */}
      <section className="section">
        <h2>오늘 예약 ({todayReservations.length}건)</h2>
        {todayReservations.length > 0 ? (
          <div className="reservation-list">
            {todayReservations.map((r) => (
              <ReservationCard key={r.id} reservation={r} />
            ))}
          </div>
        ) : (
          <p className="empty">오늘 예약이 없습니다.</p>
        )}
      </section>

      {/* 예정된 예약 */}
      <section className="section">
        <h2>예정된 예약 ({upcomingReservations.length}건)</h2>
        {upcomingReservations.length > 0 ? (
          <div className="reservation-list">
            {upcomingReservations.map((r) => (
              <ReservationCard key={r.id} reservation={r} />
            ))}
          </div>
        ) : (
          <p className="empty">예정된 예약이 없습니다.</p>
        )}
      </section>

      {/* 지난 예약 */}
      {pastReservations.length > 0 && (
        <section className="section">
          <h2>지난 예약</h2>
          <div className="reservation-list past">
            {pastReservations.slice(0, 5).map((r) => (
              <ReservationCard key={r.id} reservation={r} />
            ))}
          </div>
        </section>
      )}

      {showRatingModal && selectedReservation && (
        <RatingModal
          reservation={selectedReservation}
          raterId={user?.id || ''}
          targetType={ratingTargetType}
          targetId={ratingTargetType === 'staff' ? selectedReservation.staff_id : selectedReservation.store_id}
          targetName={ratingTargetType === 'staff' ? (selectedReservation.staff?.name || '직원') : (selectedReservation.store?.name || '가게')}
          onClose={() => {
            setShowRatingModal(false);
            setSelectedReservation(null);
          }}
          onSuccess={() => {
            setShowRatingModal(false);
            setSelectedReservation(null);
            fetchReservations();
          }}
        />
      )}
    </div>
  );
}

function RatingModal({
  reservation,
  raterId,
  targetType,
  targetId,
  targetName,
  onClose,
  onSuccess,
}: {
  reservation: Reservation;
  raterId: string;
  targetType: 'staff' | 'store';
  targetId: string | number;
  targetName: string;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [rating, setRating] = useState(5);
  const [serviceRating, setServiceRating] = useState(5);
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

    // 직원 평가 시 서비스 별점 추가
    if (targetType === 'staff') {
      insertData.service_rating = serviceRating;
      insertData.target_profile_id = targetId;
    } else {
      insertData.target_store_id = targetId;
    }

    const { error } = await supabase.from('ratings').insert(insertData);

    setSubmitting(false);

    if (error) {
      alert('별점 등록 중 오류가 발생했습니다.');
    } else {
      onSuccess();
    }
  };

  const ratingOptions = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5];

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <h2>별점 주기</h2>
        <p className="rating-target">{targetName}에게 별점을 주세요</p>

        <div className="rating-section">
          <label className="rating-label">기본 별점</label>
          <div className="rating-select">
            <div className="stars">
              {[1, 2, 3, 4, 5].map((star) => (
                <span
                  key={star}
                  className={`star ${rating >= star ? 'filled' : rating >= star - 0.5 ? 'half' : ''}`}
                  onClick={() => setRating(star)}
                >
                  ★
                </span>
              ))}
            </div>
            <select value={rating} onChange={(e) => setRating(Number(e.target.value))}>
              {ratingOptions.map((opt) => (
                <option key={opt} value={opt}>
                  {opt}점
                </option>
              ))}
            </select>
          </div>
        </div>

        {targetType === 'staff' && (
          <div className="rating-section">
            <label className="rating-label">서비스 별점</label>
            <div className="rating-select">
              <div className="stars">
                {[1, 2, 3, 4, 5].map((star) => (
                  <span
                    key={star}
                    className={`star ${serviceRating >= star ? 'filled' : serviceRating >= star - 0.5 ? 'half' : ''}`}
                    onClick={() => setServiceRating(star)}
                  >
                    ★
                  </span>
                ))}
              </div>
              <select value={serviceRating} onChange={(e) => setServiceRating(Number(e.target.value))}>
                {ratingOptions.map((opt) => (
                  <option key={opt} value={opt}>
                    {opt}점
                  </option>
                ))}
              </select>
            </div>
          </div>
        )}

        <div className="form-group">
          <label>코멘트 (선택)</label>
          <textarea
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            placeholder="코멘트를 남겨주세요..."
            rows={3}
          />
        </div>

        <div className="modal-actions">
          <button onClick={onClose} className="cancel-btn">취소</button>
          <button onClick={handleSubmit} className="submit-btn" disabled={submitting}>
            {submitting ? '등록 중...' : '별점 등록'}
          </button>
        </div>
      </div>
    </div>
  );
}
