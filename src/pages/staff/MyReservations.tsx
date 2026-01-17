import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './MyReservations.css';

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
  const [loading, setLoading] = useState(true);
  const [showRatingModal, setShowRatingModal] = useState(false);
  const [selectedReservation, setSelectedReservation] = useState<Reservation | null>(null);
  const today = new Date().toISOString().split('T')[0];

  useEffect(() => {
    if (user) {
      fetchReservations();
    }
  }, [user]);

  const fetchReservations = async () => {
    if (!user) return;

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`
        *,
        store:stores(name),
        menu:menus(name, price),
        customer:profiles!reservations_customer_id_fkey(name)
      `)
      .eq('staff_id', user.id)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setReservations(reservationsData || []);

    // 내가 준 별점 조회
    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, reservation_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);

    // 손님별 평균 별점 조회
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

    setLoading(false);
  };

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

  const handleConfirm = async (reservationId: number) => {
    const { error } = await supabase
      .from('reservations')
      .update({ status: 'confirmed' })
      .eq('id', reservationId);

    if (error) {
      alert('확정 처리 중 오류가 발생했습니다.');
    } else {
      fetchReservations();
    }
  };

  const handleReject = async (reservationId: number) => {
    const { error } = await supabase
      .from('reservations')
      .update({ status: 'cancelled' })
      .eq('id', reservationId);

    if (error) {
      alert('거절 처리 중 오류가 발생했습니다.');
    } else {
      fetchReservations();
    }
  };

  const handleComplete = async (reservationId: number) => {
    const { error } = await supabase
      .from('reservations')
      .update({ status: 'completed' })
      .eq('id', reservationId);

    if (error) {
      alert('완료 처리 중 오류가 발생했습니다.');
    } else {
      fetchReservations();
    }
  };

  const hasRated = (reservationId: number, targetType: string) => {
    return myRatings.some(
      (r) => r.reservation_id === reservationId && r.target_type === targetType
    );
  };

  const openRatingModal = (reservation: Reservation) => {
    setSelectedReservation(reservation);
    setShowRatingModal(true);
  };

  const ReservationCard = ({ reservation }: { reservation: Reservation }) => {
    const customerRating = customerRatings[reservation.customer_id];
    return (
      <div className={`reservation-card status-${reservation.status}`}>
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
          <div className="customer-info">
            손님: {reservation.customer?.name || '고객'}
            {customerRating && customerRating.totalCount > 0 && (
              <span className="customer-rating">
                <span className="star">★</span>
                {customerRating.avgRating?.toFixed(1)}
              </span>
            )}
          </div>
        </div>
        <div className="reservation-actions">
          <span className={`status-badge ${reservation.status}`}>
            {getStatusText(reservation.status)}
          </span>
          {reservation.status === 'pending' && (
            <div className="action-buttons">
              <button className="confirm-btn" onClick={() => handleConfirm(reservation.id)}>
                확정
              </button>
              <button className="reject-btn" onClick={() => handleReject(reservation.id)}>
                거절
              </button>
            </div>
          )}
          {reservation.status === 'confirmed' && (
            <div className="action-buttons">
              <button className="complete-btn" onClick={() => handleComplete(reservation.id)}>
                서비스 완료
              </button>
            </div>
          )}
          {reservation.status === 'completed' && !hasRated(reservation.id, 'customer') && (
            <div className="action-buttons">
              <button className="rate-btn" onClick={() => openRatingModal(reservation)}>
                손님 별점 주기
              </button>
            </div>
          )}
          {reservation.status === 'completed' && hasRated(reservation.id, 'customer') && (
            <span className="rated-badge">평가 완료</span>
          )}
        </div>
      </div>
    );
  };

  if (loading) {
    return <div className="my-reservations"><p>로딩 중...</p></div>;
  }

  return (
    <div className="my-reservations">
      <Link to="/" className="back-link">← 대시보드</Link>

      <h1>내 예약 관리</h1>

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
          targetType="customer"
          targetId={selectedReservation.customer_id}
          targetName={selectedReservation.customer?.name || '손님'}
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
  targetType: 'staff' | 'customer' | 'store';
  targetId: string | number;
  targetName: string;
  onClose: () => void;
  onSuccess: () => void;
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
        <p className="rating-target">{targetName}님에게 별점을 주세요</p>

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
