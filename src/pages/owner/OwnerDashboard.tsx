import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './OwnerDashboard.css';

interface Store {
  id: number;
  name: string;
  address: string;
}

interface Reservation {
  id: number;
  store_id: number;
  staff_id: string;
  menu_id: number;
  date: string;
  start_time: string;
  status: string;
  menu?: { name: string; price: number };
  staff?: { name: string };
  store?: { name: string };
}

interface Schedule {
  id: number;
  store_id: number;
  staff_id: string;
  date: string;
  status: string;
}

export default function OwnerDashboard() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [todayReservations, setTodayReservations] = useState<Reservation[]>([]);
  const [todaySchedules, setTodaySchedules] = useState<Schedule[]>([]);
  const [storeStaffCounts, setStoreStaffCounts] = useState<Record<number, number>>({});
  const [loading, setLoading] = useState(true);
  const today = new Date().toISOString().split('T')[0];

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 소유한 가게 목록 조회
    const { data: storesData } = await supabase
      .from('stores')
      .select('*')
      .eq('owner_id', user.id);

    const myStores = storesData || [];
    setStores(myStores);

    const storeIds = myStores.map(s => s.id);

    if (storeIds.length > 0) {
      // 오늘 예약 조회
      const { data: reservationsData } = await supabase
        .from('reservations')
        .select(`
          *,
          menu:menus(name, price),
          staff:profiles!reservations_staff_id_fkey(name),
          store:stores(name)
        `)
        .in('store_id', storeIds)
        .eq('date', today)
        .neq('status', 'cancelled');

      setTodayReservations(reservationsData || []);

      // 오늘 출근 직원 조회
      const { data: schedulesData } = await supabase
        .from('schedules')
        .select('*')
        .in('store_id', storeIds)
        .eq('date', today)
        .eq('status', 'approved');

      setTodaySchedules(schedulesData || []);

      // 가게별 소속 직원 수 조회
      const counts: Record<number, number> = {};
      for (const store of myStores) {
        const { count } = await supabase
          .from('store_staff')
          .select('*', { count: 'exact', head: true })
          .eq('store_id', store.id);
        counts[store.id] = count || 0;
      }
      setStoreStaffCounts(counts);
    }

    setLoading(false);
  };

  // 예상 매출 계산
  const calculateRevenue = (storeId?: number) => {
    const targetReservations = storeId
      ? todayReservations.filter((r) => r.store_id === storeId)
      : todayReservations;

    return targetReservations.reduce((sum, r) => {
      return sum + (r.menu?.price || 0);
    }, 0);
  };

  // 가게별 통계
  const getStoreStats = (storeId: number) => {
    const storeReservations = todayReservations.filter((r) => r.store_id === storeId);
    const storeSchedules = todaySchedules.filter((s) => s.store_id === storeId);
    const revenue = calculateRevenue(storeId);

    return {
      reservations: storeReservations.length,
      staffWorking: storeSchedules.length,
      totalStaff: storeStaffCounts[storeId] || 0,
      revenue,
    };
  };

  const totalRevenue = calculateRevenue();

  if (loading) {
    return <div className="owner-dashboard"><p>로딩 중...</p></div>;
  }

  return (
    <div className="owner-dashboard">
      <h1>사장님 대시보드</h1>
      <p className="welcome">안녕하세요, {user?.name}님</p>

      {/* 오늘 요약 */}
      <section className="section">
        <h2>오늘 현황</h2>
        <div className="summary-cards">
          <div className="summary-card revenue">
            <span className="label">예상 매출</span>
            <span className="value">{totalRevenue.toLocaleString()}원</span>
          </div>
          <div className="summary-card">
            <span className="label">총 예약</span>
            <span className="value">{todayReservations.length}건</span>
          </div>
          <div className="summary-card">
            <span className="label">출근 직원</span>
            <span className="value">{todaySchedules.length}명</span>
          </div>
          <div className="summary-card">
            <span className="label">운영 가게</span>
            <span className="value">{stores.length}개</span>
          </div>
        </div>
      </section>

      {/* 이번 주 트렌드 (간단한 차트 대체) */}
      <section className="section">
        <h2>이번 주 예약 트렌드</h2>
        <div className="trend-chart">
          {['월', '화', '수', '목', '금', '토', '일'].map((day, i) => {
            const height = Math.random() * 60 + 20; // 목업 데이터
            const isToday = new Date().getDay() === (i + 1) % 7;
            return (
              <div key={day} className="trend-bar-container">
                <div
                  className={`trend-bar ${isToday ? 'today' : ''}`}
                  style={{ height: `${height}%` }}
                />
                <span className="day-label">{day}</span>
              </div>
            );
          })}
        </div>
      </section>

      {/* 가게별 현황 */}
      <section className="section">
        <div className="section-header">
          <h2>가게별 현황</h2>
          <Link to="/owner/stores" className="manage-link">가게 관리 →</Link>
        </div>
        <div className="store-cards">
          {stores.map((store) => {
            const stats = getStoreStats(store.id);
            return (
              <Link
                to={`/owner/store/${store.id}`}
                key={store.id}
                className="store-card"
              >
                <div className="store-header">
                  <h3>{store.name}</h3>
                  <span className="store-address">{store.address}</span>
                </div>
                <div className="store-stats">
                  <div className="stat">
                    <span className="stat-value">
                      {stats.revenue.toLocaleString()}원
                    </span>
                    <span className="stat-label">오늘 매출</span>
                  </div>
                  <div className="stat">
                    <span className="stat-value">{stats.reservations}</span>
                    <span className="stat-label">예약</span>
                  </div>
                  <div className="stat">
                    <span className="stat-value">
                      {stats.staffWorking}/{stats.totalStaff}
                    </span>
                    <span className="stat-label">출근 직원</span>
                  </div>
                </div>
                <div className="view-detail">상세 보기 →</div>
              </Link>
            );
          })}
        </div>
      </section>

      {/* 최근 예약 */}
      <section className="section">
        <h2>오늘 예약 목록</h2>
        {todayReservations.length > 0 ? (
          <div className="recent-reservations">
            {todayReservations.slice(0, 5).map((reservation) => (
              <div key={reservation.id} className="reservation-row">
                <span className="time">{reservation.start_time}</span>
                <span className="menu">{reservation.menu?.name}</span>
                <span className="staff">{reservation.staff?.name}</span>
                <span className="store">{reservation.store?.name}</span>
                <span className={`status ${reservation.status}`}>
                  {reservation.status === 'confirmed' ? '확정' : '대기'}
                </span>
              </div>
            ))}
          </div>
        ) : (
          <p className="empty">오늘 예약이 없습니다.</p>
        )}
      </section>
    </div>
  );
}
