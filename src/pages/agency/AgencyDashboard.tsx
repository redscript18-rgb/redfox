import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Stats {
  totalManagers: number;
  activeManagers: number;
  pendingManagers: number;
  totalVirtualStaff: number;
  totalDispatches: number;
  todayDispatches: number;
  pendingDispatches: number;
}

interface RecentDispatch {
  id: number;
  date: string;
  start_time: string;
  end_time: string;
  status: string;
  manager_name?: string;
  virtual_staff_name?: string;
  target_type: string;
  target_name?: string;
}

export default function AgencyDashboard() {
  const { user } = useAuth();
  const [stats, setStats] = useState<Stats | null>(null);
  const [recentDispatches, setRecentDispatches] = useState<RecentDispatch[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user?.role === 'agency') {
      fetchDashboardData();
    }
  }, [user]);

  const fetchDashboardData = async () => {
    if (!user) return;

    // 매니저 통계
    const { data: managersData } = await supabase
      .from('agency_managers')
      .select('status')
      .eq('agency_id', user.id);

    const totalManagers = managersData?.length || 0;
    const activeManagers = managersData?.filter(m => m.status === 'active').length || 0;
    const pendingManagers = managersData?.filter(m => m.status === 'pending').length || 0;

    // 가상 매니저 수
    const { count: virtualStaffCount } = await supabase
      .from('agency_virtual_staff')
      .select('*', { count: 'exact', head: true })
      .eq('agency_id', user.id);

    // 파견 통계
    const today = new Date().toISOString().split('T')[0];

    const { count: totalDispatches } = await supabase
      .from('agency_dispatches')
      .select('*', { count: 'exact', head: true })
      .eq('agency_id', user.id);

    const { count: todayDispatches } = await supabase
      .from('agency_dispatches')
      .select('*', { count: 'exact', head: true })
      .eq('agency_id', user.id)
      .eq('date', today);

    const { count: pendingDispatches } = await supabase
      .from('agency_dispatches')
      .select('*', { count: 'exact', head: true })
      .eq('agency_id', user.id)
      .eq('status', 'pending');

    setStats({
      totalManagers,
      activeManagers,
      pendingManagers,
      totalVirtualStaff: virtualStaffCount || 0,
      totalDispatches: totalDispatches || 0,
      todayDispatches: todayDispatches || 0,
      pendingDispatches: pendingDispatches || 0
    });

    // 최근 파견 목록
    const { data: dispatches } = await supabase
      .from('agency_dispatches')
      .select(`
        id,
        date,
        start_time,
        end_time,
        status,
        target_type,
        manager:profiles!agency_dispatches_manager_id_fkey(name),
        virtual_staff:agency_virtual_staff(name),
        target_customer:profiles!agency_dispatches_target_customer_id_fkey(name),
        target_store:stores(name)
      `)
      .eq('agency_id', user.id)
      .order('date', { ascending: false })
      .order('start_time', { ascending: false })
      .limit(5);

    if (dispatches) {
      const formattedDispatches: RecentDispatch[] = dispatches.map(d => {
        const manager = Array.isArray(d.manager) ? d.manager[0] : d.manager;
        const virtualStaff = Array.isArray(d.virtual_staff) ? d.virtual_staff[0] : d.virtual_staff;
        const targetCustomer = Array.isArray(d.target_customer) ? d.target_customer[0] : d.target_customer;
        const targetStore = Array.isArray(d.target_store) ? d.target_store[0] : d.target_store;

        return {
          id: d.id,
          date: d.date,
          start_time: d.start_time,
          end_time: d.end_time,
          status: d.status,
          manager_name: (manager as { name: string } | null)?.name,
          virtual_staff_name: (virtualStaff as { name: string } | null)?.name,
          target_type: d.target_type,
          target_name: d.target_type === 'customer'
            ? (targetCustomer as { name: string } | null)?.name
            : (targetStore as { name: string } | null)?.name
        };
      });
      setRecentDispatches(formattedDispatches);
    }

    setLoading(false);
  };

  const getStatusName = (status: string) => {
    switch (status) {
      case 'pending': return '대기';
      case 'confirmed': return '확정';
      case 'completed': return '완료';
      case 'cancelled': return '취소';
      default: return status;
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pending': return 'bg-yellow-100 text-yellow-700';
      case 'confirmed': return 'bg-blue-100 text-blue-700';
      case 'completed': return 'bg-green-100 text-green-700';
      case 'cancelled': return 'bg-red-100 text-red-700';
      default: return 'bg-slate-100 text-slate-700';
    }
  };

  if (user?.role !== 'agency') {
    return (
      <div className="p-8 text-center">
        <p className="text-red-600 font-semibold">접근 권한이 없습니다.</p>
      </div>
    );
  }

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6 max-md:text-xl">에이전시 대시보드</h1>

      {/* Quick Stats */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4 mb-8">
        <Link to="/agency/managers" className="p-4 md:p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-xs md:text-sm text-slate-500 mb-1">소속 매니저</p>
          <p className="text-2xl md:text-3xl font-bold text-slate-900">{stats?.activeManagers}</p>
          {stats?.pendingManagers ? (
            <p className="text-xs text-orange-500 mt-1">{stats.pendingManagers}명 대기</p>
          ) : null}
        </Link>
        <Link to="/agency/managers" className="p-4 md:p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-xs md:text-sm text-slate-500 mb-1">가상 매니저</p>
          <p className="text-2xl md:text-3xl font-bold text-slate-900">{stats?.totalVirtualStaff}</p>
        </Link>
        <Link to="/agency/dispatches" className="p-4 md:p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-xs md:text-sm text-slate-500 mb-1">오늘 파견</p>
          <p className="text-2xl md:text-3xl font-bold text-orange-600">{stats?.todayDispatches}</p>
        </Link>
        <Link to="/agency/dispatches?status=pending" className="p-4 md:p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-xs md:text-sm text-slate-500 mb-1">대기 파견</p>
          <p className="text-2xl md:text-3xl font-bold text-yellow-600">{stats?.pendingDispatches}</p>
        </Link>
      </div>

      {/* Quick Actions */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">빠른 작업</h2>
          <div className="space-y-2">
            <Link
              to="/agency/managers"
              className="flex items-center justify-between p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors"
            >
              <span className="text-slate-700">매니저 관리</span>
              <span className="text-slate-400">→</span>
            </Link>
            <Link
              to="/agency/dispatches"
              className="flex items-center justify-between p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors"
            >
              <span className="text-slate-700">파견 관리</span>
              <span className="text-slate-400">→</span>
            </Link>
            <Link
              to="/chat"
              className="flex items-center justify-between p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors"
            >
              <span className="text-slate-700">메시지</span>
              <span className="text-slate-400">→</span>
            </Link>
          </div>
        </div>

        {/* Recent Dispatches */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-900">최근 파견</h2>
            <Link to="/agency/dispatches" className="text-sm text-orange-600 hover:underline">
              전체 보기 →
            </Link>
          </div>
          {recentDispatches.length === 0 ? (
            <p className="text-slate-500 text-sm py-4 text-center">파견 데이터가 없습니다.</p>
          ) : (
            <div className="space-y-3">
              {recentDispatches.map((dispatch) => (
                <div key={dispatch.id} className="p-3 bg-slate-50 rounded-lg">
                  <div className="flex items-center justify-between mb-1">
                    <span className="font-medium text-slate-900">
                      {dispatch.manager_name || dispatch.virtual_staff_name}
                    </span>
                    <span className={`px-2 py-0.5 text-xs font-medium rounded ${getStatusColor(dispatch.status)}`}>
                      {getStatusName(dispatch.status)}
                    </span>
                  </div>
                  <div className="text-sm text-slate-500">
                    <span>{dispatch.date}</span>
                    <span className="mx-2">·</span>
                    <span>{dispatch.start_time.slice(0, 5)} - {dispatch.end_time.slice(0, 5)}</span>
                  </div>
                  <div className="text-sm text-slate-500">
                    <span className="text-orange-600">{dispatch.target_type === 'customer' ? '손님' : '가게'}</span>
                    <span className="mx-1">→</span>
                    <span>{dispatch.target_name || '미정'}</span>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Stats Summary */}
      <div className="p-4 md:p-5 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-base md:text-lg font-semibold text-slate-900 mb-4">전체 통계</h2>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4">
          <div className="p-3 md:p-4 bg-slate-50 rounded-lg text-center">
            <p className="text-xl md:text-2xl font-bold text-slate-900">{stats?.totalManagers}</p>
            <p className="text-xs md:text-sm text-slate-500">전체 매니저</p>
          </div>
          <div className="p-3 md:p-4 bg-slate-50 rounded-lg text-center">
            <p className="text-xl md:text-2xl font-bold text-slate-900">{stats?.totalVirtualStaff}</p>
            <p className="text-xs md:text-sm text-slate-500">가상 매니저</p>
          </div>
          <div className="p-3 md:p-4 bg-slate-50 rounded-lg text-center">
            <p className="text-xl md:text-2xl font-bold text-slate-900">{stats?.totalDispatches}</p>
            <p className="text-xs md:text-sm text-slate-500">전체 파견</p>
          </div>
          <div className="p-3 md:p-4 bg-slate-50 rounded-lg text-center">
            <p className="text-xl md:text-2xl font-bold text-orange-600">{stats?.todayDispatches}</p>
            <p className="text-xs md:text-sm text-slate-500">오늘 파견</p>
          </div>
        </div>
      </div>
    </div>
  );
}
