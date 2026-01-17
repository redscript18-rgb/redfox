import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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

  useEffect(() => { if (user) fetchData(); }, [user]);

  const fetchData = async () => {
    if (!user) return;

    const { data: storesData } = await supabase.from('stores').select('*').eq('owner_id', user.id);
    const myStores = storesData || [];
    setStores(myStores);

    const storeIds = myStores.map(s => s.id);

    if (storeIds.length > 0) {
      const { data: reservationsData } = await supabase.from('reservations').select(`*, menu:menus(name, price), staff:profiles!reservations_staff_id_fkey(name), store:stores(name)`).in('store_id', storeIds).eq('date', today).neq('status', 'cancelled');
      setTodayReservations(reservationsData || []);

      const { data: schedulesData } = await supabase.from('schedules').select('*').in('store_id', storeIds).eq('date', today).eq('status', 'approved');
      setTodaySchedules(schedulesData || []);

      const counts: Record<number, number> = {};
      for (const store of myStores) {
        const { count } = await supabase.from('store_staff').select('*', { count: 'exact', head: true }).eq('store_id', store.id);
        counts[store.id] = count || 0;
      }
      setStoreStaffCounts(counts);
    }

    setLoading(false);
  };

  const calculateRevenue = (storeId?: number) => {
    const targetReservations = storeId ? todayReservations.filter((r) => r.store_id === storeId) : todayReservations;
    return targetReservations.reduce((sum, r) => sum + (r.menu?.price || 0), 0);
  };

  const getStoreStats = (storeId: number) => {
    const storeReservations = todayReservations.filter((r) => r.store_id === storeId);
    const storeSchedules = todaySchedules.filter((s) => s.store_id === storeId);
    return {
      reservations: storeReservations.length,
      staffWorking: storeSchedules.length,
      totalStaff: storeStaffCounts[storeId] || 0,
      revenue: calculateRevenue(storeId),
    };
  };

  const totalRevenue = calculateRevenue();

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-1">사장님 대시보드</h1>
      <p className="text-slate-500 mb-6">안녕하세요, {user?.name}님</p>

      {/* Today Summary */}
      <section className="mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">오늘 현황</h2>
        <div className="grid grid-cols-4 gap-3 max-sm:grid-cols-2">
          <div className="p-4 bg-gradient-to-br from-blue-600 to-blue-700 rounded-xl text-white">
            <span className="text-blue-100 text-sm">예상 매출</span>
            <div className="text-xl font-bold mt-1">{totalRevenue.toLocaleString()}원</div>
          </div>
          <div className="p-4 bg-white border border-slate-200 rounded-xl">
            <span className="text-slate-500 text-sm">총 예약</span>
            <div className="text-xl font-bold text-slate-900 mt-1">{todayReservations.length}건</div>
          </div>
          <div className="p-4 bg-white border border-slate-200 rounded-xl">
            <span className="text-slate-500 text-sm">출근 직원</span>
            <div className="text-xl font-bold text-slate-900 mt-1">{todaySchedules.length}명</div>
          </div>
          <div className="p-4 bg-white border border-slate-200 rounded-xl">
            <span className="text-slate-500 text-sm">운영 가게</span>
            <div className="text-xl font-bold text-slate-900 mt-1">{stores.length}개</div>
          </div>
        </div>
      </section>

      {/* Weekly Trend Chart */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">이번 주 예약 트렌드</h2>
        <div className="flex items-end justify-between h-28 gap-2">
          {['월', '화', '수', '목', '금', '토', '일'].map((day, i) => {
            const height = Math.random() * 60 + 20;
            const isToday = new Date().getDay() === (i + 1) % 7;
            return (
              <div key={day} className="flex flex-col items-center flex-1">
                <div className="w-full flex-1 flex items-end">
                  <div className={`w-full rounded-t transition-all ${isToday ? 'bg-blue-600' : 'bg-slate-200'}`} style={{ height: `${height}%` }} />
                </div>
                <span className={`text-xs mt-2 ${isToday ? 'text-blue-600 font-semibold' : 'text-slate-500'}`}>{day}</span>
              </div>
            );
          })}
        </div>
      </section>

      {/* Store List */}
      <section className="mb-6">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold text-slate-900">가게별 현황</h2>
          <Link to="/owner/stores" className="text-sm text-blue-600 hover:underline">가게 관리 →</Link>
        </div>
        <div className="flex flex-col gap-3">
          {stores.map((store) => {
            const stats = getStoreStats(store.id);
            return (
              <Link to={`/owner/store/${store.id}`} key={store.id} className="p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-600 hover:shadow-md transition-all">
                <div className="flex items-start justify-between mb-3">
                  <div>
                    <h3 className="font-semibold text-slate-900">{store.name}</h3>
                    <p className="text-sm text-slate-500">{store.address}</p>
                  </div>
                  <span className="text-sm text-blue-600">상세 보기 →</span>
                </div>
                <div className="grid grid-cols-3 gap-4 pt-3 border-t border-slate-100">
                  <div className="text-center">
                    <div className="text-lg font-bold text-blue-600">{stats.revenue.toLocaleString()}원</div>
                    <div className="text-xs text-slate-500">오늘 매출</div>
                  </div>
                  <div className="text-center">
                    <div className="text-lg font-bold text-slate-900">{stats.reservations}</div>
                    <div className="text-xs text-slate-500">예약</div>
                  </div>
                  <div className="text-center">
                    <div className="text-lg font-bold text-slate-900">{stats.staffWorking}/{stats.totalStaff}</div>
                    <div className="text-xs text-slate-500">출근 직원</div>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </section>

      {/* Today Reservations */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">오늘 예약 목록</h2>
        {todayReservations.length > 0 ? (
          <div className="flex flex-col gap-2">
            {todayReservations.slice(0, 5).map((reservation) => (
              <div key={reservation.id} className="flex items-center gap-4 p-3 bg-slate-50 rounded-lg text-sm">
                <span className="font-medium text-slate-900 w-14">{reservation.start_time.slice(0, 5)}</span>
                <span className="flex-1 text-slate-700">{reservation.menu?.name}</span>
                <span className="text-slate-500">{reservation.staff?.name}</span>
                <span className="text-slate-400 text-xs">{reservation.store?.name}</span>
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
