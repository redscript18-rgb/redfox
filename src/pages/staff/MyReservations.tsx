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

export default function MyReservations() {
  const { user } = useAuth();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);
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

  const ReservationCard = ({ reservation }: { reservation: Reservation }) => {
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
          <div className="customer-info">손님: {reservation.customer?.name || '고객'}</div>
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
    </div>
  );
}
