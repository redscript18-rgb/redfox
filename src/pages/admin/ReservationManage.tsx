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

export default function ReservationManage() {
  const { user } = useAuth();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'pending' | 'confirmed' | 'all'>('pending');
  const today = new Date().toISOString().split('T')[0];

  useEffect(() => {
    if (user) {
      fetchReservations();
    }
  }, [user]);

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
        {filteredReservations.map((reservation) => (
          <div key={reservation.id} className={`reservation-card ${reservation.status}`}>
            <div className="reservation-datetime">
              <span className="date">{formatDate(reservation.date)}</span>
              <span className="time">{reservation.start_time}</span>
            </div>
            <div className="reservation-info">
              <div className="service-row">
                <span className="menu-name">{reservation.menu?.name}</span>
                <span className="price">{reservation.menu?.price?.toLocaleString()}원</span>
              </div>
              <div className="people-row">
                <span className="customer">손님: {reservation.customer?.name || '고객'}</span>
                <span className="staff">담당: {reservation.staff?.name}</span>
              </div>
              <div className="store-name">{reservation.store?.name}</div>
            </div>
            <div className="reservation-status">
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
        ))}
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
