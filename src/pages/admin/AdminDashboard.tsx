import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './AdminDashboard.css';

interface Store {
  id: number;
  name: string;
  address: string;
}

export default function AdminDashboard() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [pendingSchedules, setPendingSchedules] = useState(0);
  const [pendingReservations, setPendingReservations] = useState(0);
  const [todayReservations, setTodayReservations] = useState(0);
  const [todayStaff, setTodayStaff] = useState(0);
  const [pendingWorkRequests, setPendingWorkRequests] = useState(0);
  const [loading, setLoading] = useState(true);

  const today = new Date().toISOString().split('T')[0];

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 관리하는 가게 목록
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map(s => s.store_id) || [];

    if (storeIds.length > 0) {
      // 가게 정보
      const { data: storesData } = await supabase
        .from('stores')
        .select('*')
        .in('id', storeIds);
      setStores(storesData || []);

      // 대기 중 스케줄
      const { count: scheduleCount } = await supabase
        .from('schedules')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('status', 'pending');
      setPendingSchedules(scheduleCount || 0);

      // 대기 중 예약
      const { count: reservationCount } = await supabase
        .from('reservations')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('status', 'pending');
      setPendingReservations(reservationCount || 0);

      // 오늘 예약
      const { count: todayResCount } = await supabase
        .from('reservations')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('date', today)
        .neq('status', 'cancelled');
      setTodayReservations(todayResCount || 0);

      // 오늘 출근 직원
      const { count: todayStaffCount } = await supabase
        .from('schedules')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('date', today)
        .eq('status', 'approved');
      setTodayStaff(todayStaffCount || 0);

      // 대기 중인 출근 요청
      const { count: workRequestCount } = await supabase
        .from('work_requests')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('status', 'pending');
      setPendingWorkRequests(workRequestCount || 0);
    }

    setLoading(false);
  };

  if (loading) {
    return <div className="admin-dashboard"><p>로딩 중...</p></div>;
  }

  return (
    <div className="admin-dashboard">
      <h1>관리자 대시보드</h1>
      <p className="welcome">안녕하세요, {user?.name}님</p>

      {/* 승인 대기 알림 */}
      {(pendingSchedules > 0 || pendingReservations > 0) && (
        <div className="alerts">
          {pendingSchedules > 0 && (
            <Link to="/admin/schedules" className="alert-card schedule">
              <span className="alert-count">{pendingSchedules}</span>
              <span className="alert-text">출근 승인 대기</span>
            </Link>
          )}
          {pendingReservations > 0 && (
            <Link to="/admin/reservations" className="alert-card reservation">
              <span className="alert-count">{pendingReservations}</span>
              <span className="alert-text">예약 승인 대기</span>
            </Link>
          )}
        </div>
      )}

      {/* 오늘 현황 */}
      <section className="section">
        <h2>오늘 현황</h2>
        <div className="stats-grid">
          <div className="stat-card">
            <span className="stat-value">{todayReservations}</span>
            <span className="stat-label">총 예약</span>
          </div>
          <div className="stat-card">
            <span className="stat-value">{todayStaff}</span>
            <span className="stat-label">출근 직원</span>
          </div>
          <div className="stat-card">
            <span className="stat-value">{stores.length}</span>
            <span className="stat-label">관리 가게</span>
          </div>
        </div>
      </section>

      {/* 관리 가게 목록 */}
      <section className="section">
        <h2>관리 가게</h2>
        <div className="store-list">
          {stores.length === 0 ? (
            <p className="empty">관리하는 가게가 없습니다.</p>
          ) : (
            stores.map((store) => (
              <div key={store.id} className="store-card">
                <div className="store-info">
                  <h3>{store.name}</h3>
                  <p className="address">{store.address}</p>
                </div>
              </div>
            ))
          )}
        </div>
      </section>

      {/* 빠른 링크 */}
      <section className="section">
        <h2>관리 메뉴</h2>
        <div className="quick-links">
          <Link to="/admin/staff" className="quick-link">
            <span className="icon">👥</span>
            <span className="text">직원 관리</span>
          </Link>
          <Link to="/admin/schedules" className="quick-link">
            <span className="icon">📅</span>
            <span className="text">출근 관리</span>
          </Link>
          <Link to="/admin/reservations" className="quick-link">
            <span className="icon">📋</span>
            <span className="text">예약 관리</span>
          </Link>
          <Link to="/admin/find-staff" className="quick-link highlight">
            <span className="icon">🔍</span>
            <span className="text">직원 찾기</span>
          </Link>
          <Link to="/admin/work-requests" className="quick-link">
            <span className="icon">📨</span>
            <span className="text">보낸 요청</span>
            {pendingWorkRequests > 0 && <span className="badge">{pendingWorkRequests}</span>}
          </Link>
        </div>
      </section>
    </div>
  );
}
