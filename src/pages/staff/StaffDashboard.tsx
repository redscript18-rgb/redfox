import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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
  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) fetchData();
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

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

    const { data: allStoresData } = await supabase.from('stores').select('*');
    setAllStores(allStoresData || []);

    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`*, store:stores(name)`)
      .eq('staff_id', user.id)
      .eq('date', today)
      .eq('status', 'approved');
    setMyTodaySchedules(schedulesData || []);

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`*, menu:menus(name), store:stores(name)`)
      .eq('staff_id', user.id)
      .eq('date', today)
      .neq('status', 'cancelled');
    setMyTodayReservations(reservationsData || []);

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

    const { count: pendingCount } = await supabase
      .from('work_requests')
      .select('*', { count: 'exact', head: true })
      .eq('staff_id', user.id)
      .eq('status', 'pending');
    setPendingRequests(pendingCount || 0);

    setLoading(false);
  };

  const getWeeklyAverage = (storeId: number) => {
    const todayCount = storeDemand[storeId] || 0;
    return Math.max(Math.floor(todayCount * 0.8), 1);
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">안녕하세요, {user?.name}님</h1>

      {/* Alert */}
      {pendingRequests > 0 && (
        <Link to="/staff/work-requests" className="flex items-center gap-4 p-4 mb-6 bg-amber-50 border border-amber-200 rounded-xl hover:bg-amber-100 transition-colors">
          <span className="text-2xl font-bold text-amber-600">{pendingRequests}</span>
          <span className="text-sm font-medium text-amber-700">출근 요청 대기중</span>
        </Link>
      )}

      {/* Quick Menu */}
      <section className="mb-8">
        <div className="grid grid-cols-5 gap-3 max-md:grid-cols-3 max-sm:grid-cols-2">
          <Link to="/staff/profile" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">👤</span>
            <span className="text-xs font-medium text-slate-700">프로필 관리</span>
          </Link>
          <Link to="/staff/availability" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">🕐</span>
            <span className="text-xs font-medium text-slate-700">가용 시간</span>
          </Link>
          <Link to="/staff/work-requests" className="relative flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">📨</span>
            <span className="text-xs font-medium text-slate-700">출근 요청</span>
            {pendingRequests > 0 && (
              <span className="absolute top-2 right-2 min-w-[20px] h-5 px-1.5 bg-red-500 text-white text-xs font-semibold rounded-full flex items-center justify-center">
                {pendingRequests}
              </span>
            )}
          </Link>
          <Link to="/staff/schedule" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">📅</span>
            <span className="text-xs font-medium text-slate-700">스케줄 관리</span>
          </Link>
          <Link to="/staff/reservations" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">📋</span>
            <span className="text-xs font-medium text-slate-700">내 예약</span>
          </Link>
        </div>
      </section>

      {/* Today Schedule */}
      <section className="mb-8">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold text-slate-900">오늘 내 스케줄</h2>
          <Link to="/staff/schedule" className="text-sm text-orange-600 hover:underline">스케줄 관리 →</Link>
        </div>
        {myTodaySchedules.length > 0 ? (
          <div className="flex flex-col gap-2">
            {myTodaySchedules.map((schedule) => (
              <div key={schedule.id} className="flex items-center justify-between p-4 bg-green-50 border border-green-200 rounded-xl">
                <span className="font-semibold text-green-800">{schedule.store?.name}</span>
                <span className="text-sm text-green-600">{schedule.start_time} - {schedule.end_time}</span>
              </div>
            ))}
          </div>
        ) : (
          <div className="p-6 bg-slate-50 rounded-xl text-center">
            <p className="text-slate-500 mb-3">오늘 등록된 출근이 없습니다.</p>
            <Link to="/staff/schedule" className="inline-block px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors">
              출근 등록하기
            </Link>
          </div>
        )}
      </section>

      {/* Today Reservations */}
      <section className="mb-8">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold text-slate-900">오늘 내 예약 ({myTodayReservations.length}건)</h2>
          <Link to="/staff/reservations" className="text-sm text-orange-600 hover:underline">전체 보기 →</Link>
        </div>
        {myTodayReservations.length > 0 ? (
          <div className="flex flex-col gap-2">
            {myTodayReservations.map((reservation) => (
              <div key={reservation.id} className="flex items-center gap-4 p-4 bg-white border border-slate-200 rounded-xl">
                <span className="text-lg font-bold text-slate-900">{reservation.start_time}</span>
                <div className="flex-1">
                  <span className="font-medium text-slate-900">{reservation.menu?.name}</span>
                  <span className="text-sm text-slate-500 ml-2">{reservation.store?.name}</span>
                </div>
                <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                  reservation.status === 'confirmed' ? 'bg-green-100 text-green-600' : 'bg-orange-100 text-orange-600'
                }`}>
                  {reservation.status === 'confirmed' ? '확정' : '대기'}
                </span>
              </div>
            ))}
          </div>
        ) : (
          <p className="text-slate-400 text-sm py-4">오늘 예약이 없습니다.</p>
        )}
      </section>

      {/* Store Demand */}
      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-1">가게별 수요 현황</h2>
        <p className="text-sm text-slate-500 mb-3">예약이 많은 가게에 출근하면 더 많이 벌 수 있어요!</p>
        <div className="flex flex-col gap-3">
          {myStores.map((store) => {
            const todayCount = storeDemand[store.id] || 0;
            const weeklyAvg = getWeeklyAverage(store.id);
            const isHot = todayCount >= weeklyAvg;
            const hasSchedule = myTodaySchedules.some((s) => s.store_id === store.id);

            return (
              <div key={store.id} className={`p-4 bg-white border rounded-xl ${isHot ? 'border-orange-300' : 'border-slate-200'}`}>
                <div className="flex items-start justify-between mb-3">
                  <div>
                    <h3 className="font-semibold text-slate-900">{store.name}</h3>
                    <p className="text-sm text-slate-500">{store.address}</p>
                  </div>
                  {isHot ? (
                    <span className="px-2 py-1 bg-orange-100 text-orange-600 text-xs font-semibold rounded-full">수요 높음</span>
                  ) : (
                    <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs font-medium rounded-full">보통</span>
                  )}
                </div>
                <div className="flex items-center justify-between">
                  <div className="flex gap-4">
                    <div className="text-center">
                      <span className="block text-xl font-bold text-slate-900">{todayCount}</span>
                      <span className="text-xs text-slate-500">오늘 예약</span>
                    </div>
                    <div className="text-center">
                      <span className="block text-xl font-bold text-slate-900">{weeklyAvg}</span>
                      <span className="text-xs text-slate-500">주간 평균</span>
                    </div>
                  </div>
                  {hasSchedule ? (
                    <span className="px-3 py-1.5 bg-green-100 text-green-600 text-sm font-medium rounded-lg">출근 예정</span>
                  ) : (
                    <Link to={`/staff/schedule?store=${store.id}`} className="px-3 py-1.5 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors">
                      출근 등록
                    </Link>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      </section>

      {/* Other Stores */}
      <section>
        <h2 className="text-lg font-semibold text-slate-900 mb-1">다른 가게 탐색</h2>
        <p className="text-sm text-slate-500 mb-3">새로운 가게에서 일해보세요</p>
        <div className="grid grid-cols-2 gap-3 max-md:grid-cols-1">
          {allStores
            .filter((s) => !myStores.some(ms => ms.id === s.id))
            .map((store) => (
              <div key={store.id} className="p-4 bg-white border border-slate-200 rounded-xl">
                <h3 className="font-semibold text-slate-900">{store.name}</h3>
                <p className="text-sm text-slate-500 mb-3">{store.address}</p>
                <div className="flex items-center justify-between">
                  <span className="text-sm text-slate-600">오늘 예약 {storeDemand[store.id] || 0}건</span>
                  <button className="px-3 py-1.5 bg-slate-100 text-slate-600 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors">
                    지원하기
                  </button>
                </div>
              </div>
            ))}
        </div>
      </section>
    </div>
  );
}
