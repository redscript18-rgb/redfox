import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Stats {
  totalUsers: number;
  usersByRole: { role: string; count: number }[];
  totalStores: number;
  totalReservations: number;
  reservationsByStatus: { status: string; count: number }[];
  todayReservations: number;
  recentUsers: { id: string; name: string; email: string; role: string; created_at: string }[];
}

export default function SuperAdminDashboard() {
  const { user } = useAuth();
  const [stats, setStats] = useState<Stats | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchStats();
    }
  }, [user]);

  const fetchStats = async () => {
    // Total users
    const { count: totalUsers } = await supabase
      .from('profiles')
      .select('*', { count: 'exact', head: true });

    // Users by role
    const { data: usersData } = await supabase
      .from('profiles')
      .select('role');

    const roleCounts: Record<string, number> = {};
    usersData?.forEach(u => {
      roleCounts[u.role] = (roleCounts[u.role] || 0) + 1;
    });
    const usersByRole = Object.entries(roleCounts).map(([role, count]) => ({ role, count }));

    // Total stores
    const { count: totalStores } = await supabase
      .from('stores')
      .select('*', { count: 'exact', head: true });

    // Total reservations
    const { count: totalReservations } = await supabase
      .from('reservations')
      .select('*', { count: 'exact', head: true });

    // Reservations by status
    const { data: reservationsData } = await supabase
      .from('reservations')
      .select('status');

    const statusCounts: Record<string, number> = {};
    reservationsData?.forEach(r => {
      statusCounts[r.status] = (statusCounts[r.status] || 0) + 1;
    });
    const reservationsByStatus = Object.entries(statusCounts).map(([status, count]) => ({ status, count }));

    // Today's reservations
    const today = new Date().toISOString().split('T')[0];
    const { count: todayReservations } = await supabase
      .from('reservations')
      .select('*', { count: 'exact', head: true })
      .eq('date', today);

    // Recent users
    const { data: recentUsers } = await supabase
      .from('profiles')
      .select('id, name, email, role, created_at')
      .order('created_at', { ascending: false })
      .limit(5);

    setStats({
      totalUsers: totalUsers || 0,
      usersByRole,
      totalStores: totalStores || 0,
      totalReservations: totalReservations || 0,
      reservationsByStatus,
      todayReservations: todayReservations || 0,
      recentUsers: recentUsers || []
    });
    setLoading(false);
  };

  const getRoleName = (role: string) => {
    switch (role) {
      case 'superadmin': return '서비스관리자';
      case 'owner': return '사장';
      case 'admin': return '관리자';
      case 'staff': return '매니저';
      case 'customer': return '손님';
      default: return role;
    }
  };

  const getStatusName = (status: string) => {
    switch (status) {
      case 'pending': return '대기';
      case 'confirmed': return '확정';
      case 'cancelled': return '취소';
      case 'completed': return '완료';
      default: return status;
    }
  };

  if (user?.role !== 'superadmin') {
    return (
      <div className="p-8 text-center">
        <p className="text-red-600 font-semibold">접근 권한이 없습니다.</p>
      </div>
    );
  }

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">서비스 관리자 대시보드</h1>

      {/* Quick Stats */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <p className="text-sm text-slate-500 mb-1">전체 사용자</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalUsers}</p>
        </div>
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <p className="text-sm text-slate-500 mb-1">전체 가게</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalStores}</p>
        </div>
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <p className="text-sm text-slate-500 mb-1">전체 예약</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalReservations}</p>
        </div>
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <p className="text-sm text-slate-500 mb-1">오늘 예약</p>
          <p className="text-3xl font-bold text-orange-600">{stats?.todayReservations}</p>
        </div>
      </div>

      {/* Navigation Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
        <Link to="/superadmin/users" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors">
          <h3 className="font-semibold text-slate-900 mb-2">사용자 관리</h3>
          <p className="text-sm text-slate-500">회원 목록, 역할 변경, 계정 관리</p>
        </Link>
        <Link to="/superadmin/stores" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors">
          <h3 className="font-semibold text-slate-900 mb-2">가게 관리</h3>
          <p className="text-sm text-slate-500">가게 목록, 정보 수정, 삭제</p>
        </Link>
        <Link to="/superadmin/reservations" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors">
          <h3 className="font-semibold text-slate-900 mb-2">예약 현황</h3>
          <p className="text-sm text-slate-500">전체 예약 조회, 상태별 필터</p>
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Users by Role */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">역할별 사용자</h2>
          <div className="space-y-2">
            {stats?.usersByRole.map(({ role, count }) => (
              <div key={role} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                <span className="text-slate-700">{getRoleName(role)}</span>
                <span className="font-semibold text-slate-900">{count}명</span>
              </div>
            ))}
          </div>
        </div>

        {/* Reservations by Status */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">예약 상태별 현황</h2>
          <div className="space-y-2">
            {stats?.reservationsByStatus.map(({ status, count }) => (
              <div key={status} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                <span className="text-slate-700">{getStatusName(status)}</span>
                <span className="font-semibold text-slate-900">{count}건</span>
              </div>
            ))}
            {stats?.reservationsByStatus.length === 0 && (
              <p className="text-slate-500 text-sm">예약 데이터가 없습니다.</p>
            )}
          </div>
        </div>

        {/* Recent Users */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl md:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-900">최근 가입 사용자</h2>
            <Link to="/superadmin/users" className="text-sm text-orange-600 hover:underline">
              전체 보기 →
            </Link>
          </div>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-slate-200">
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">이름</th>
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">이메일</th>
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">역할</th>
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">가입일</th>
                </tr>
              </thead>
              <tbody>
                {stats?.recentUsers.map((u) => (
                  <tr key={u.id} className="border-b border-slate-100">
                    <td className="py-3 px-3 text-slate-900">{u.name}</td>
                    <td className="py-3 px-3 text-slate-600 text-sm">{u.email}</td>
                    <td className="py-3 px-3">
                      <span className="px-2 py-1 bg-orange-50 text-orange-600 text-xs rounded">
                        {getRoleName(u.role)}
                      </span>
                    </td>
                    <td className="py-3 px-3 text-slate-500 text-sm">
                      {new Date(u.created_at).toLocaleDateString('ko-KR')}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}
