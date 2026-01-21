import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // Get stores where user is admin
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);
    const adminStoreIds = adminStores?.map(s => s.store_id) || [];

    // Get stores where user is owner
    const { data: ownedStores } = await supabase.from('stores').select('id').eq('owner_id', user.id);
    const ownedStoreIds = ownedStores?.map(s => s.id) || [];

    // Combine unique store IDs
    const storeIds = [...new Set([...adminStoreIds, ...ownedStoreIds])];

    if (storeIds.length > 0) {
      const { data: storesData } = await supabase
        .from('stores')
        .select('*')
        .in('id', storeIds);
      setStores(storesData || []);

      const { count: scheduleCount } = await supabase
        .from('schedules')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('status', 'pending');
      setPendingSchedules(scheduleCount || 0);

      const { count: reservationCount } = await supabase
        .from('reservations')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('status', 'pending');
      setPendingReservations(reservationCount || 0);

      const { count: todayResCount } = await supabase
        .from('reservations')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('date', today)
        .neq('status', 'cancelled');
      setTodayReservations(todayResCount || 0);

      const { count: todayStaffCount } = await supabase
        .from('schedules')
        .select('*', { count: 'exact', head: true })
        .in('store_id', storeIds)
        .eq('date', today)
        .eq('status', 'approved');
      setTodayStaff(todayStaffCount || 0);

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
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-1">실장 대시보드</h1>
      <p className="text-slate-500 mb-6">안녕하세요, {user?.name}님</p>

      {/* Alert Cards */}
      {(pendingSchedules > 0 || pendingReservations > 0) && (
        <div className="grid grid-cols-2 gap-3 mb-6 max-md:grid-cols-1">
          {pendingSchedules > 0 && (
            <Link to="/admin/schedules" className="flex items-center gap-4 p-4 bg-amber-50 border border-amber-200 rounded-xl hover:bg-amber-100 transition-colors">
              <span className="text-2xl font-bold text-amber-600">{pendingSchedules}</span>
              <span className="text-sm font-medium text-amber-700">출근 승인 대기</span>
            </Link>
          )}
          {pendingReservations > 0 && (
            <Link to="/admin/reservations" className="flex items-center gap-4 p-4 bg-orange-50 border border-blue-200 rounded-xl hover:bg-orange-100 transition-colors">
              <span className="text-2xl font-bold text-orange-600">{pendingReservations}</span>
              <span className="text-sm font-medium text-orange-700">예약 승인 대기</span>
            </Link>
          )}
        </div>
      )}

      {/* Today Stats */}
      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">오늘 현황</h2>
        <div className="grid grid-cols-3 gap-3 max-md:grid-cols-1">
          <div className="p-4 bg-white border border-slate-200 rounded-xl text-center">
            <span className="block text-2xl font-bold text-slate-900">{todayReservations}</span>
            <span className="text-sm text-slate-500">총 예약</span>
          </div>
          <div className="p-4 bg-white border border-slate-200 rounded-xl text-center">
            <span className="block text-2xl font-bold text-slate-900">{todayStaff}</span>
            <span className="text-sm text-slate-500">출근 매니저</span>
          </div>
          <div className="p-4 bg-white border border-slate-200 rounded-xl text-center">
            <span className="block text-2xl font-bold text-slate-900">{stores.length}</span>
            <span className="text-sm text-slate-500">관리 가게</span>
          </div>
        </div>
      </section>

      {/* Store List */}
      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">관리 가게</h2>
        <div className="flex flex-col gap-2">
          {stores.length === 0 ? (
            <p className="text-slate-400 text-sm py-4">관리하는 가게가 없습니다.</p>
          ) : (
            stores.map((store) => (
              <Link
                key={store.id}
                to={`/admin/store/${store.id}/settings`}
                className="flex items-center justify-between p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all"
              >
                <div>
                  <h3 className="font-semibold text-slate-900">{store.name}</h3>
                  <p className="text-sm text-slate-500">{store.address}</p>
                </div>
                <span className="text-sm text-orange-600 font-medium">설정 →</span>
              </Link>
            ))
          )}
        </div>
      </section>

      {/* Quick Links */}
      <section>
        <h2 className="text-lg font-semibold text-slate-900 mb-3">관리 메뉴</h2>
        <div className="grid grid-cols-3 gap-3 max-md:grid-cols-2">
          <Link to="/admin/staff" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">👥</span>
            <span className="text-sm font-medium text-slate-700">매니저 관리</span>
          </Link>
          <Link to="/admin/schedules" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">📅</span>
            <span className="text-sm font-medium text-slate-700">출근 관리</span>
          </Link>
          <Link to="/admin/reservations" className="flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">📋</span>
            <span className="text-sm font-medium text-slate-700">예약 관리</span>
          </Link>
          <Link to="/admin/find-staff" className="flex flex-col items-center gap-2 p-4 bg-orange-50 border border-blue-200 rounded-xl hover:bg-orange-100 transition-all">
            <span className="text-2xl">🔍</span>
            <span className="text-sm font-medium text-orange-700">매니저 찾기</span>
          </Link>
          <Link to="/admin/work-requests" className="relative flex flex-col items-center gap-2 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
            <span className="text-2xl">📨</span>
            <span className="text-sm font-medium text-slate-700">보낸 요청</span>
            {pendingWorkRequests > 0 && (
              <span className="absolute top-2 right-2 min-w-[20px] h-5 px-1.5 bg-red-500 text-white text-xs font-semibold rounded-full flex items-center justify-center">
                {pendingWorkRequests}
              </span>
            )}
          </Link>
        </div>
      </section>
    </div>
  );
}
