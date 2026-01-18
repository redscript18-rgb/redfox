import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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
  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  const [store, setStore] = useState<Store | null>(null);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [staffMembers, setStaffMembers] = useState<StaffMember[]>([]);
  const [loading, setLoading] = useState(true);
  const [hasAccess, setHasAccess] = useState(false);

  useEffect(() => { if (user) fetchData(); }, [user, storeId]);

  const fetchData = async () => {
    if (!user) return;

    const { data: storeData } = await supabase.from('stores').select('*').eq('id', storeId).single();
    if (!storeData || storeData.owner_id !== user.id) { setHasAccess(false); setLoading(false); return; }

    setStore(storeData);
    setHasAccess(true);

    const { data: menusData } = await supabase.from('menus').select('*').eq('store_id', storeId);
    setMenus(menusData || []);

    const { data: reservationsData } = await supabase.from('reservations').select(`*, menu:menus(name, price), staff:profiles!reservations_staff_id_fkey(name)`).eq('store_id', storeId);
    setReservations(reservationsData || []);

    const { data: schedulesData } = await supabase.from('schedules').select('*').eq('store_id', storeId);
    setSchedules(schedulesData || []);

    const { data: storeStaff } = await supabase.from('store_staff').select('staff_id').eq('store_id', storeId);
    if (storeStaff && storeStaff.length > 0) {
      const staffIds = storeStaff.map(s => s.staff_id);
      const { data: staffData } = await supabase.from('profiles').select('id, name').in('id', staffIds);
      setStaffMembers(staffData || []);
    }

    setLoading(false);
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  if (!hasAccess || !store) {
    return (
      <div>
        <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>
        <p className="text-slate-500">가게를 찾을 수 없거나 접근 권한이 없습니다.</p>
      </div>
    );
  }

  const todayReservations = reservations.filter((r) => r.date === today && r.status !== 'cancelled');
  const confirmedReservations = reservations.filter((r) => r.status === 'confirmed');
  const todaySchedules = schedules.filter((s) => s.date === today && s.status === 'approved');

  const calculateRevenue = (targetReservations: Reservation[]) => targetReservations.reduce((sum, r) => sum + (r.menu?.price || 0), 0);

  const todayRevenue = calculateRevenue(todayReservations);
  const totalRevenue = calculateRevenue(confirmedReservations);

  const menuStats = menus.map((menu) => {
    const menuReservations = confirmedReservations.filter((r) => r.menu_id === menu.id);
    return { ...menu, count: menuReservations.length, revenue: menuReservations.length * menu.price };
  }).sort((a, b) => b.count - a.count);

  const staffStats = staffMembers.map((staff) => {
    const staffReservations = confirmedReservations.filter((r) => r.staff_id === staff.id);
    const staffScheduleCount = schedules.filter((s) => s.staff_id === staff.id && s.status === 'approved').length;
    return { ...staff, reservationCount: staffReservations.length, revenue: calculateRevenue(staffReservations), scheduleCount: staffScheduleCount };
  }).sort((a, b) => b.revenue - a.revenue);

  const last7Days = Array.from({ length: 7 }, (_, i) => {
    const date = new Date();
    date.setDate(date.getDate() - (6 - i));
    const dateStr = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`;
    const dayReservations = reservations.filter((r) => r.date === dateStr && r.status !== 'cancelled');
    return { date: dateStr, dayLabel: ['일', '월', '화', '수', '목', '금', '토'][date.getDay()], count: dayReservations.length, revenue: calculateRevenue(dayReservations) };
  });

  const maxDayRevenue = Math.max(...last7Days.map((d) => d.revenue), 1);

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">{store.name}</h1>
        <p className="text-slate-500">{store.address}</p>
      </div>

      {/* Today Summary */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">오늘 현황</h2>
        <div className="grid grid-cols-4 gap-4 max-sm:grid-cols-2">
          <div className="p-3 bg-orange-50 rounded-lg text-center">
            <div className="text-sm text-orange-600">오늘 매출</div>
            <div className="text-xl font-bold text-orange-700">{todayRevenue.toLocaleString()}원</div>
          </div>
          <div className="p-3 bg-slate-50 rounded-lg text-center">
            <div className="text-sm text-slate-500">오늘 예약</div>
            <div className="text-xl font-bold text-slate-900">{todayReservations.length}건</div>
          </div>
          <div className="p-3 bg-slate-50 rounded-lg text-center">
            <div className="text-sm text-slate-500">출근 매니저</div>
            <div className="text-xl font-bold text-slate-900">{todaySchedules.length}명</div>
          </div>
          <div className="p-3 bg-slate-50 rounded-lg text-center">
            <div className="text-sm text-slate-500">총 매니저</div>
            <div className="text-xl font-bold text-slate-900">{staffMembers.length}명</div>
          </div>
        </div>
      </section>

      {/* Total Summary */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">누적 통계</h2>
        <div className="grid grid-cols-2 gap-4">
          <div className="p-3 bg-slate-50 rounded-lg text-center">
            <div className="text-sm text-slate-500">총 매출</div>
            <div className="text-xl font-bold text-slate-900">{totalRevenue.toLocaleString()}원</div>
          </div>
          <div className="p-3 bg-slate-50 rounded-lg text-center">
            <div className="text-sm text-slate-500">완료된 예약</div>
            <div className="text-xl font-bold text-slate-900">{confirmedReservations.length}건</div>
          </div>
        </div>
      </section>

      {/* 7 Day Chart */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">최근 7일 매출</h2>
        <div className="flex items-end justify-between h-32 gap-2">
          {last7Days.map((day) => (
            <div key={day.date} className="flex flex-col items-center flex-1">
              <div className="w-full flex-1 flex items-end">
                <div className={`w-full rounded-t transition-all ${day.date === today ? 'bg-red-600' : 'bg-slate-200'}`} style={{ height: `${(day.revenue / maxDayRevenue) * 100}%` }} />
              </div>
              <span className={`text-xs mt-2 ${day.date === today ? 'text-orange-600 font-semibold' : 'text-slate-500'}`}>{day.dayLabel}</span>
              <span className="text-xs text-slate-400">{(day.revenue / 10000).toFixed(0)}만</span>
            </div>
          ))}
        </div>
      </section>

      {/* Menu Stats */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">메뉴별 실적</h2>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-slate-200">
                <th className="text-left py-2 font-medium text-slate-500">메뉴</th>
                <th className="text-right py-2 font-medium text-slate-500">예약 수</th>
                <th className="text-right py-2 font-medium text-slate-500">매출</th>
              </tr>
            </thead>
            <tbody>
              {menuStats.map((menu) => (
                <tr key={menu.id} className="border-b border-slate-100 last:border-0">
                  <td className="py-3">
                    <div className="font-medium text-slate-900">{menu.name}</div>
                    <div className="text-xs text-slate-400">{menu.price.toLocaleString()}원</div>
                  </td>
                  <td className="py-3 text-right text-slate-600">{menu.count}건</td>
                  <td className="py-3 text-right font-medium text-slate-900">{menu.revenue.toLocaleString()}원</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      {/* Staff Stats */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">매니저별 실적</h2>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-slate-200">
                <th className="text-left py-2 font-medium text-slate-500">매니저</th>
                <th className="text-right py-2 font-medium text-slate-500">예약 수</th>
                <th className="text-right py-2 font-medium text-slate-500">매출</th>
              </tr>
            </thead>
            <tbody>
              {staffStats.map((staff) => (
                <tr key={staff.id} className="border-b border-slate-100 last:border-0">
                  <td className="py-3">
                    <div className="font-medium text-slate-900">{staff.name}</div>
                    <div className="text-xs text-slate-400">출근 {staff.scheduleCount}회</div>
                  </td>
                  <td className="py-3 text-right text-slate-600">{staff.reservationCount}건</td>
                  <td className="py-3 text-right font-medium text-slate-900">{staff.revenue.toLocaleString()}원</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      {/* Today Reservations */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">오늘 예약 목록</h2>
        {todayReservations.length > 0 ? (
          <div className="flex flex-col gap-2">
            {todayReservations.map((reservation) => (
              <div key={reservation.id} className="flex items-center gap-4 p-3 bg-slate-50 rounded-lg text-sm">
                <span className="font-medium text-slate-900 w-14">{reservation.start_time.slice(0, 5)}</span>
                <span className="flex-1 text-slate-700">{reservation.menu?.name}</span>
                <span className="text-slate-500">{reservation.staff?.name}</span>
                <span className={`px-2 py-0.5 text-xs rounded-full ${reservation.status === 'confirmed' ? 'bg-green-100 text-green-600' : 'bg-amber-100 text-amber-600'}`}>
                  {reservation.status === 'confirmed' ? '확정' : '대기'}
                </span>
              </div>
            ))}
          </div>
        ) : (
          <p className="text-slate-500">오늘 예약이 없습니다.</p>
        )}
      </section>
    </div>
  );
}
