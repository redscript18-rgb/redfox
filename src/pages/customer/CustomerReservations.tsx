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

export default function CustomerReservations() {
  const { user } = useAuth();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);
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
    </div>
  );
}
