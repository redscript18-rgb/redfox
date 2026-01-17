import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './StoreStats.css';

interface Store {
  id: number;
  name: string;
  address: string;
  owner_id: string;
}

interface Menu {
  id: number;
  name: string;
  price: number;
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
}

interface Schedule {
  id: number;
  store_id: number;
  staff_id: string;
  date: string;
  status: string;
}

interface StaffMember {
  id: string;
  name: string;
}

export default function StoreStats() {
  const { id } = useParams<{ id: string }>();
  const { user } = useAuth();
  const storeId = Number(id);
  const today = new Date().toISOString().split('T')[0];

  const [store, setStore] = useState<Store | null>(null);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [staffMembers, setStaffMembers] = useState<StaffMember[]>([]);
  const [loading, setLoading] = useState(true);
  const [hasAccess, setHasAccess] = useState(false);

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user, storeId]);

  const fetchData = async () => {
    if (!user) return;

    // 가게 정보 조회
    const { data: storeData } = await supabase
      .from('stores')
      .select('*')
      .eq('id', storeId)
      .single();

    if (!storeData || storeData.owner_id !== user.id) {
      setHasAccess(false);
      setLoading(false);
      return;
    }

    setStore(storeData);
    setHasAccess(true);

    // 메뉴 조회
    const { data: menusData } = await supabase
      .from('menus')
      .select('*')
      .eq('store_id', storeId);

    setMenus(menusData || []);

    // 예약 조회
    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`
        *,
        menu:menus(name, price),
        staff:profiles!reservations_staff_id_fkey(name)
      `)
      .eq('store_id', storeId);

    setReservations(reservationsData || []);

    // 스케줄 조회
    const { data: schedulesData } = await supabase
      .from('schedules')
      .select('*')
      .eq('store_id', storeId);

    setSchedules(schedulesData || []);

    // 소속 직원 조회
    const { data: storeStaff } = await supabase
      .from('store_staff')
      .select('staff_id')
      .eq('store_id', storeId);

    if (storeStaff && storeStaff.length > 0) {
      const staffIds = storeStaff.map(s => s.staff_id);
      const { data: staffData } = await supabase
        .from('profiles')
        .select('id, name')
        .in('id', staffIds);

      setStaffMembers(staffData || []);
    }

    setLoading(false);
  };

  if (loading) {
    return <div className="store-stats"><p>로딩 중...</p></div>;
  }

  if (!hasAccess || !store) {
    return (
      <div className="store-stats">
        <Link to="/" className="back-link">← 대시보드</Link>
        <p className="error">가게를 찾을 수 없거나 접근 권한이 없습니다.</p>
      </div>
    );
  }

  // 이 가게의 예약들
  const todayReservations = reservations.filter(
    (r) => r.date === today && r.status !== 'cancelled'
  );
  const confirmedReservations = reservations.filter(
    (r) => r.status === 'confirmed'
  );

  // 이 가게의 스케줄
  const todaySchedules = schedules.filter(
    (s) => s.date === today && s.status === 'approved'
  );

  // 매출 계산
  const calculateRevenue = (targetReservations: Reservation[]) => {
    return targetReservations.reduce((sum, r) => {
      return sum + (r.menu?.price || 0);
    }, 0);
  };

  const todayRevenue = calculateRevenue(todayReservations);
  const totalRevenue = calculateRevenue(confirmedReservations);

  // 메뉴별 통계
  const menuStats = menus.map((menu) => {
    const menuReservations = confirmedReservations.filter(
      (r) => r.menu_id === menu.id
    );
    return {
      ...menu,
      count: menuReservations.length,
      revenue: menuReservations.length * menu.price,
    };
  }).sort((a, b) => b.count - a.count);

  // 직원별 통계
  const staffStats = staffMembers.map((staff) => {
    const staffReservations = confirmedReservations.filter(
      (r) => r.staff_id === staff.id
    );
    const staffScheduleCount = schedules.filter(
      (s) => s.staff_id === staff.id && s.status === 'approved'
    ).length;
    return {
      ...staff,
      reservationCount: staffReservations.length,
      revenue: calculateRevenue(staffReservations),
      scheduleCount: staffScheduleCount,
    };
  }).sort((a, b) => b.revenue - a.revenue);

  // 최근 7일 일별 통계
  const last7Days = Array.from({ length: 7 }, (_, i) => {
    const date = new Date();
    date.setDate(date.getDate() - (6 - i));
    const dateStr = date.toISOString().split('T')[0];
    const dayReservations = reservations.filter(
      (r) => r.date === dateStr && r.status !== 'cancelled'
    );
    return {
      date: dateStr,
      dayLabel: ['일', '월', '화', '수', '목', '금', '토'][date.getDay()],
      count: dayReservations.length,
      revenue: calculateRevenue(dayReservations),
    };
  });

  const maxDayRevenue = Math.max(...last7Days.map((d) => d.revenue), 1);

  return (
    <div className="store-stats">
      <Link to="/" className="back-link">← 대시보드</Link>

      <div className="store-header">
        <h1>{store.name}</h1>
        <p className="address">{store.address}</p>
      </div>

      {/* 오늘 요약 */}
      <section className="section">
        <h2>오늘 현황</h2>
        <div className="summary-row">
          <div className="summary-item highlight">
            <span className="label">오늘 매출</span>
            <span className="value">{todayRevenue.toLocaleString()}원</span>
          </div>
          <div className="summary-item">
            <span className="label">오늘 예약</span>
            <span className="value">{todayReservations.length}건</span>
          </div>
          <div className="summary-item">
            <span className="label">출근 직원</span>
            <span className="value">{todaySchedules.length}명</span>
          </div>
          <div className="summary-item">
            <span className="label">총 직원</span>
            <span className="value">{staffMembers.length}명</span>
          </div>
        </div>
      </section>

      {/* 누적 통계 */}
      <section className="section">
        <h2>누적 통계</h2>
        <div className="summary-row">
          <div className="summary-item">
            <span className="label">총 매출</span>
            <span className="value">{totalRevenue.toLocaleString()}원</span>
          </div>
          <div className="summary-item">
            <span className="label">완료된 예약</span>
            <span className="value">{confirmedReservations.length}건</span>
          </div>
        </div>
      </section>

      {/* 일별 매출 차트 */}
      <section className="section">
        <h2>최근 7일 매출</h2>
        <div className="daily-chart">
          {last7Days.map((day) => (
            <div key={day.date} className="day-column">
              <div className="bar-wrapper">
                <div
                  className={`bar ${day.date === today ? 'today' : ''}`}
                  style={{ height: `${(day.revenue / maxDayRevenue) * 100}%` }}
                />
              </div>
              <span className="day-label">{day.dayLabel}</span>
              <span className="day-revenue">
                {(day.revenue / 10000).toFixed(0)}만
              </span>
            </div>
          ))}
        </div>
      </section>

      {/* 인기 메뉴 */}
      <section className="section">
        <h2>메뉴별 실적</h2>
        <div className="stats-table">
          <div className="table-header">
            <span className="col-name">메뉴</span>
            <span className="col-count">예약 수</span>
            <span className="col-revenue">매출</span>
          </div>
          {menuStats.map((menu) => (
            <div key={menu.id} className="table-row">
              <span className="col-name">
                {menu.name}
                <small>{menu.price.toLocaleString()}원</small>
              </span>
              <span className="col-count">{menu.count}건</span>
              <span className="col-revenue">
                {menu.revenue.toLocaleString()}원
              </span>
            </div>
          ))}
        </div>
      </section>

      {/* 직원별 실적 */}
      <section className="section">
        <h2>직원별 실적</h2>
        <div className="stats-table">
          <div className="table-header">
            <span className="col-name">직원</span>
            <span className="col-count">예약 수</span>
            <span className="col-revenue">매출</span>
          </div>
          {staffStats.map((staff) => (
            <div key={staff.id} className="table-row">
              <span className="col-name">
                {staff.name}
                <small>출근 {staff.scheduleCount}회</small>
              </span>
              <span className="col-count">{staff.reservationCount}건</span>
              <span className="col-revenue">
                {staff.revenue.toLocaleString()}원
              </span>
            </div>
          ))}
        </div>
      </section>

      {/* 오늘 예약 목록 */}
      <section className="section">
        <h2>오늘 예약 목록</h2>
        {todayReservations.length > 0 ? (
          <div className="reservation-list">
            {todayReservations.map((reservation) => (
              <div key={reservation.id} className="reservation-item">
                <span className="time">{reservation.start_time}</span>
                <span className="menu">{reservation.menu?.name}</span>
                <span className="staff">{reservation.staff?.name}</span>
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
