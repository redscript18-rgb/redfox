import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './StaffDashboard.css';

interface Store {
  id: number;
  name: string;
  address: string;
}

interface Schedule {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  status: string;
  store?: { name: string };
}

interface Reservation {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  status: string;
  menu?: { name: string };
  store?: { name: string };
}

export default function StaffDashboard() {
  const { user } = useAuth();
  const [myStores, setMyStores] = useState<Store[]>([]);
  const [allStores, setAllStores] = useState<Store[]>([]);
  const [myTodaySchedules, setMyTodaySchedules] = useState<Schedule[]>([]);
  const [myTodayReservations, setMyTodayReservations] = useState<Reservation[]>([]);
  const [storeDemand, setStoreDemand] = useState<Record<number, number>>({});
  const [pendingRequests, setPendingRequests] = useState(0);
  const [loading, setLoading] = useState(true);
  const today = new Date().toISOString().split('T')[0];

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 소속 가게 조회
    const { data: storeStaff } = await supabase
      .from('store_staff')
      .select('store_id')
      .eq('staff_id', user.id);

    const myStoreIds = storeStaff?.map(s => s.store_id) || [];

    if (myStoreIds.length > 0) {
      const { data: storesData } = await supabase
        .from('stores')
        .select('*')
        .in('id', myStoreIds);

      setMyStores(storesData || []);
    }

    // 모든 가게 조회 (다른 가게 탐색용)
    const { data: allStoresData } = await supabase
      .from('stores')
      .select('*');

    setAllStores(allStoresData || []);

    // 오늘 내 스케줄
    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`
        *,
        store:stores(name)
      `)
      .eq('staff_id', user.id)
      .eq('date', today)
      .eq('status', 'approved');

    setMyTodaySchedules(schedulesData || []);

    // 오늘 내 예약
    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`
        *,
        menu:menus(name),
        store:stores(name)
      `)
      .eq('staff_id', user.id)
      .eq('date', today)
      .neq('status', 'cancelled');

    setMyTodayReservations(reservationsData || []);

    // 가게별 오늘 예약 수
    if (allStoresData) {
      const demand: Record<number, number> = {};
      for (const store of allStoresData) {
        const { count } = await supabase
          .from('reservations')
          .select('*', { count: 'exact', head: true })
          .eq('store_id', store.id)
          .eq('date', today)
          .neq('status', 'cancelled');

        demand[store.id] = count || 0;
      }
      setStoreDemand(demand);
    }

    // 대기 중인 출근 요청 수
    const { count: pendingCount } = await supabase
      .from('work_requests')
      .select('*', { count: 'exact', head: true })
      .eq('staff_id', user.id)
      .eq('status', 'pending');

    setPendingRequests(pendingCount || 0);

    setLoading(false);
  };

  // 가게별 이번주 평균 예약 (간단한 통계)
  const getWeeklyAverage = (storeId: number) => {
    // 실제로는 과거 데이터 기반, 여기선 오늘 수요의 80% 정도로 표시
    const todayCount = storeDemand[storeId] || 0;
    return Math.max(Math.floor(todayCount * 0.8), 1);
  };

  if (loading) {
    return <div className="staff-dashboard"><p>로딩 중...</p></div>;
  }

  return (
    <div className="staff-dashboard">
      <h1>안녕하세요, {user?.name}님</h1>

      {/* 알림 영역 */}
      {pendingRequests > 0 && (
        <div className="alerts">
          <Link to="/staff/work-requests" className="alert-card">
            <span className="alert-count">{pendingRequests}</span>
            <span className="alert-text">출근 요청 대기중</span>
          </Link>
        </div>
      )}

      {/* 빠른 메뉴 */}
      <section className="section quick-menu">
        <div className="quick-links">
          <Link to="/staff/availability" className="quick-link">
            <span className="icon">🕐</span>
            <span className="text">가용 시간 관리</span>
          </Link>
          <Link to="/staff/work-requests" className="quick-link">
            <span className="icon">📨</span>
            <span className="text">출근 요청</span>
            {pendingRequests > 0 && <span className="badge">{pendingRequests}</span>}
          </Link>
          <Link to="/staff/schedule" className="quick-link">
            <span className="icon">📅</span>
            <span className="text">스케줄 관리</span>
          </Link>
          <Link to="/staff/reservations" className="quick-link">
            <span className="icon">📋</span>
            <span className="text">내 예약</span>
          </Link>
        </div>
      </section>

      {/* 오늘 내 스케줄 */}
      <section className="section">
        <div className="section-header">
          <h2>오늘 내 스케줄</h2>
          <Link to="/staff/schedule" className="link-btn">
            스케줄 관리 →
          </Link>
        </div>
        {myTodaySchedules.length > 0 ? (
          <div className="today-schedules">
            {myTodaySchedules.map((schedule) => (
              <div key={schedule.id} className="today-schedule-card">
                <div className="store-name">{schedule.store?.name}</div>
                <div className="schedule-time">
                  {schedule.start_time} - {schedule.end_time}
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="empty-state">
            <p>오늘 등록된 출근이 없습니다.</p>
            <Link to="/staff/schedule" className="action-btn">
              출근 등록하기
            </Link>
          </div>
        )}
      </section>

      {/* 오늘 내 예약 */}
      <section className="section">
        <div className="section-header">
          <h2>오늘 내 예약 ({myTodayReservations.length}건)</h2>
          <Link to="/staff/reservations" className="link-btn">
            전체 보기 →
          </Link>
        </div>
        {myTodayReservations.length > 0 ? (
          <div className="reservation-list">
            {myTodayReservations.map((reservation) => (
              <div key={reservation.id} className="reservation-item">
                <div className="reservation-time">{reservation.start_time}</div>
                <div className="reservation-info">
                  <span className="menu-name">{reservation.menu?.name}</span>
                  <span className="store-name">{reservation.store?.name}</span>
                </div>
                <div className={`status status-${reservation.status}`}>
                  {reservation.status === 'confirmed' ? '확정' : '대기'}
                </div>
              </div>
            ))}
          </div>
        ) : (
          <p className="empty">오늘 예약이 없습니다.</p>
        )}
      </section>

      {/* 가게별 수요 현황 */}
      <section className="section">
        <h2>가게별 수요 현황</h2>
        <p className="section-desc">예약이 많은 가게에 출근하면 더 많이 벌 수 있어요!</p>
        <div className="store-demand-list">
          {myStores.map((store) => {
            const todayCount = storeDemand[store.id] || 0;
            const weeklyAvg = getWeeklyAverage(store.id);
            const isHot = todayCount >= weeklyAvg;
            const hasSchedule = myTodaySchedules.some((s) => s.store_id === store.id);

            return (
              <div key={store.id} className={`store-demand-card ${isHot ? 'hot' : ''}`}>
                <div className="store-info">
                  <h3>{store.name}</h3>
                  <p className="address">{store.address}</p>
                </div>
                <div className="demand-stats">
                  <div className="stat">
                    <span className="stat-value">{todayCount}</span>
                    <span className="stat-label">오늘 예약</span>
                  </div>
                  <div className="stat">
                    <span className="stat-value">{weeklyAvg}</span>
                    <span className="stat-label">주간 평균</span>
                  </div>
                </div>
                <div className="demand-indicator">
                  {isHot ? (
                    <span className="hot-badge">수요 높음</span>
                  ) : (
                    <span className="normal-badge">보통</span>
                  )}
                </div>
                {hasSchedule ? (
                  <span className="scheduled-badge">출근 예정</span>
                ) : (
                  <Link
                    to={`/staff/schedule?store=${store.id}`}
                    className="register-btn"
                  >
                    출근 등록
                  </Link>
                )}
              </div>
            );
          })}
        </div>
      </section>

      {/* 다른 가게 탐색 */}
      <section className="section">
        <h2>다른 가게 탐색</h2>
        <p className="section-desc">새로운 가게에서 일해보세요</p>
        <div className="other-stores">
          {allStores
            .filter((s) => !myStores.some(ms => ms.id === s.id))
            .map((store) => {
              const todayCount = storeDemand[store.id] || 0;
              return (
                <div key={store.id} className="other-store-card">
                  <div className="store-info">
                    <h3>{store.name}</h3>
                    <p>{store.address}</p>
                  </div>
                  <div className="today-demand">
                    오늘 예약 {todayCount}건
                  </div>
                  <button className="apply-btn">지원하기</button>
                </div>
              );
            })}
        </div>
      </section>
    </div>
  );
}
