import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import ToggleSwitch from '../../components/ToggleSwitch';

interface Stats {
  totalUsers: number;
  usersByRole: { role: string; count: number }[];
  totalStores: number;
  storesByType: { type: string; count: number }[];
  totalVirtualStaff: number;
  totalReservations: number;
  reservationsByStatus: { status: string; count: number }[];
  todayReservations: number;
  pendingOwners: number;
  pendingPasswordResets: number;
  recentUsers: { id: string; name: string; email: string; role: string; created_at: string }[];
  recentVirtualStaff: { id: string; name: string; store_name: string; created_at: string }[];
}

interface UserDetail {
  id: string;
  name: string;
  email: string;
  role: string;
  phone?: string;
  created_at: string;
  stores?: { id: number; name: string }[];
  reservationCount?: number;
  favoriteCount?: number;
}

interface VirtualStaffDetail {
  id: string;
  name: string;
  phone: string | null;
  bio: string | null;
  store_id: number;
  store_name: string;
  created_at: string;
  profile_photo_url: string | null;
  age: number | null;
  height: number | null;
  weight: number | null;
  body_size: string | null;
  job: string | null;
  mbti: string | null;
  is_smoker: boolean | null;
  personality: string | null;
  style: string | null;
  skin_tone: string | null;
  hair_length: string | null;
  hair_style: string | null;
  hair_color: string | null;
  is_waxed: boolean | null;
  specialties: string[] | null;
  nationalities: string[] | null;
  languages: string[] | null;
}

export default function SuperAdminDashboard() {
  const { user } = useAuth();
  const [stats, setStats] = useState<Stats | null>(null);
  const [loading, setLoading] = useState(true);
  const [selectedUser, setSelectedUser] = useState<UserDetail | null>(null);
  const [selectedStaff, setSelectedStaff] = useState<VirtualStaffDetail | null>(null);
  const [viewingPhoto, setViewingPhoto] = useState<string | null>(null);
  const [typeVisibility, setTypeVisibility] = useState<Record<string, boolean>>({});
  const [showAddTypeModal, setShowAddTypeModal] = useState(false);
  const [newTypeName, setNewTypeName] = useState('');
  const [addingType, setAddingType] = useState(false);
  const [draggedType, setDraggedType] = useState<string | null>(null);
  const [showDeleteConfirm, setShowDeleteConfirm] = useState<string | null>(null);
  const [roleVisibility, setRoleVisibility] = useState<Record<string, boolean>>({});

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchStats();
      fetchTypeVisibility();
      fetchRoleVisibility();
    }
  }, [user]);

  const fetchTypeVisibility = async () => {
    const { data } = await supabase
      .from('store_type_visibility')
      .select('store_type, is_visible');

    if (data) {
      const visibility: Record<string, boolean> = {};
      data.forEach(item => {
        visibility[item.store_type] = item.is_visible;
      });
      setTypeVisibility(visibility);
    }
  };

  const fetchRoleVisibility = async () => {
    const { data } = await supabase
      .from('role_visibility')
      .select('role_type, is_visible');

    if (data) {
      const visibility: Record<string, boolean> = {};
      data.forEach(item => {
        visibility[item.role_type] = item.is_visible;
      });
      setRoleVisibility(visibility);
    }
  };

  const handleRoleVisibilityChange = async (roleType: string, isVisible: boolean) => {
    // Optimistic update
    setRoleVisibility(prev => ({ ...prev, [roleType]: isVisible }));

    // Upsert to database
    const { error } = await supabase
      .from('role_visibility')
      .upsert({
        role_type: roleType,
        is_visible: isVisible,
        updated_at: new Date().toISOString()
      }, { onConflict: 'role_type' });

    if (error) {
      // Revert on error
      setRoleVisibility(prev => ({ ...prev, [roleType]: !isVisible }));
      console.error('Failed to update role visibility:', error);
    }
  };

  const handleTypeVisibilityChange = async (storeType: string, isVisible: boolean) => {
    // Optimistic update
    setTypeVisibility(prev => ({ ...prev, [storeType]: isVisible }));

    // Upsert to database
    const { error } = await supabase
      .from('store_type_visibility')
      .upsert({
        store_type: storeType,
        is_visible: isVisible,
        updated_at: new Date().toISOString()
      }, { onConflict: 'store_type' });

    if (error) {
      // Revert on error
      setTypeVisibility(prev => ({ ...prev, [storeType]: !isVisible }));
      console.error('Failed to update type visibility:', error);
    }
  };

  const handleAddStoreType = async () => {
    const trimmedName = newTypeName.trim();
    if (!trimmedName) {
      alert('업종 이름을 입력해주세요.');
      return;
    }

    // Check if already exists in stats
    if (stats?.storesByType.some(t => t.type === trimmedName)) {
      alert('이미 존재하는 업종입니다.');
      return;
    }

    setAddingType(true);

    // Add to store_type_visibility table
    const { error } = await supabase
      .from('store_type_visibility')
      .upsert({
        store_type: trimmedName,
        is_visible: true,
        updated_at: new Date().toISOString()
      }, { onConflict: 'store_type' });

    if (error) {
      console.error('Failed to add store type:', error);
      alert('업종 추가 중 오류가 발생했습니다.');
    } else {
      // Add to local stats with count 0
      if (stats) {
        setStats({
          ...stats,
          storesByType: [...stats.storesByType, { type: trimmedName, count: 0 }]
        });
      }
      setTypeVisibility(prev => ({ ...prev, [trimmedName]: true }));
      setNewTypeName('');
      setShowAddTypeModal(false);
    }

    setAddingType(false);
  };

  const handleDeleteStoreType = async (storeType: string) => {
    // Delete from store_type_visibility table
    const { error } = await supabase
      .from('store_type_visibility')
      .delete()
      .eq('store_type', storeType);

    if (error) {
      console.error('Failed to delete store type:', error);
      alert('업종 삭제 중 오류가 발생했습니다.');
    } else {
      // Remove from local stats
      if (stats) {
        setStats({
          ...stats,
          storesByType: stats.storesByType.filter(t => t.type !== storeType)
        });
      }
      // Remove from visibility
      setTypeVisibility(prev => {
        const newVis = { ...prev };
        delete newVis[storeType];
        return newVis;
      });
    }
    setShowDeleteConfirm(null);
  };

  const handleDragStart = (e: React.DragEvent, type: string) => {
    setDraggedType(type);
    e.dataTransfer.effectAllowed = 'move';
  };

  const handleDragOver = (e: React.DragEvent) => {
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
  };

  const handleDrop = async (e: React.DragEvent, targetType: string) => {
    e.preventDefault();
    if (!draggedType || draggedType === targetType || !stats) return;

    const types = [...stats.storesByType];
    const draggedIndex = types.findIndex(t => t.type === draggedType);
    const targetIndex = types.findIndex(t => t.type === targetType);

    if (draggedIndex === -1 || targetIndex === -1) return;

    // Reorder array
    const [removed] = types.splice(draggedIndex, 1);
    types.splice(targetIndex, 0, removed);

    // Update local state
    setStats({ ...stats, storesByType: types });

    // Update order in database
    const updates = types.map((t, index) => {
      return supabase
        .from('store_type_visibility')
        .upsert({
          store_type: t.type,
          is_visible: typeVisibility[t.type] ?? true,
          display_order: index,
          updated_at: new Date().toISOString()
        }, { onConflict: 'store_type' });
    });

    await Promise.all(updates);
    setDraggedType(null);
  };

  const handleDragEnd = () => {
    setDraggedType(null);
  };

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

    // Stores by type - get distinct types and count each
    const { data: distinctTypes } = await supabase
      .from('stores')
      .select('store_type');

    // Count occurrences (handle 1000 limit by using count queries)
    const typeSet = new Set<string>();
    distinctTypes?.forEach(s => {
      if (s.store_type) typeSet.add(s.store_type);
    });

    const storesByType: { type: string; count: number }[] = [];

    // Count each distinct type
    for (const type of typeSet) {
      const { count } = await supabase
        .from('stores')
        .select('*', { count: 'exact', head: true })
        .eq('store_type', type);
      if (count && count > 0) {
        storesByType.push({ type, count });
      }
    }

    // Count unclassified (null store_type)
    const { count: nullCount } = await supabase
      .from('stores')
      .select('*', { count: 'exact', head: true })
      .is('store_type', null);
    if (nullCount && nullCount > 0) {
      storesByType.push({ type: '미분류', count: nullCount });
    }

    // Fetch custom store types from store_type_visibility table with order
    const { data: customTypes } = await supabase
      .from('store_type_visibility')
      .select('store_type, display_order');

    // Create order map
    const orderMap: Record<string, number> = {};
    customTypes?.forEach(ct => {
      orderMap[ct.store_type] = ct.display_order ?? 999;
    });

    // Add custom types that don't exist in storesByType yet (count 0)
    const existingTypes = new Set(storesByType.map(t => t.type));
    customTypes?.forEach(ct => {
      if (!existingTypes.has(ct.store_type)) {
        storesByType.push({ type: ct.store_type, count: 0 });
      }
    });

    // Sort by display_order (stored types first), then by count for unordered types
    storesByType.sort((a, b) => {
      const orderA = orderMap[a.type] ?? 999;
      const orderB = orderMap[b.type] ?? 999;
      if (orderA !== orderB) return orderA - orderB;
      return b.count - a.count;
    });

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

    // Total virtual staff (admin-registered managers)
    const { count: totalVirtualStaff } = await supabase
      .from('virtual_staff')
      .select('*', { count: 'exact', head: true });

    // Recent virtual staff
    const { data: recentVirtualStaff } = await supabase
      .from('virtual_staff')
      .select('id, name, created_at, store:stores(name)')
      .order('created_at', { ascending: false })
      .limit(5);

    // Pending owner approvals
    const { data: pendingOwnersData } = await supabase.rpc('get_pending_owners');
    const pendingOwners = pendingOwnersData?.length || 0;

    // Pending password reset requests
    const { data: pendingResetData } = await supabase.rpc('get_pending_reset_count');
    const pendingPasswordResets = pendingResetData || 0;

    setStats({
      totalUsers: totalUsers || 0,
      usersByRole,
      totalStores: totalStores || 0,
      storesByType,
      totalVirtualStaff: totalVirtualStaff || 0,
      totalReservations: totalReservations || 0,
      reservationsByStatus,
      todayReservations: todayReservations || 0,
      pendingOwners,
      pendingPasswordResets,
      recentUsers: recentUsers || [],
      recentVirtualStaff: (recentVirtualStaff || []).map(vs => ({
        id: vs.id,
        name: vs.name,
        store_name: (vs.store as unknown as { name: string } | null)?.name || '알 수 없음',
        created_at: vs.created_at
      }))
    });
    setLoading(false);
  };

  const getRoleName = (role: string) => {
    switch (role) {
      case 'superadmin': return 'ADMIN';
      case 'agency': return '에이전시';
      case 'owner': return '사장';
      case 'staff': return '실장';
      case 'manager': return '프리 매니저';
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

  const openUserDetail = async (userId: string) => {
    // Basic user info
    const { data: userData } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .single();

    if (!userData) return;

    // Get stores for owner/admin
    let stores: { id: number; name: string }[] = [];
    if (userData.role === 'owner' || userData.role === 'staff') {
      const { data: ownedStores } = await supabase
        .from('stores')
        .select('id, name')
        .eq('owner_id', userId);

      const { data: adminStores } = await supabase
        .from('store_admins')
        .select('store:stores(id, name)')
        .eq('admin_id', userId);

      stores = [
        ...(ownedStores || []),
        ...(adminStores || []).map(s => s.store as unknown as { id: number; name: string }).filter(Boolean)
      ];
    }

    // Get reservation count for customer
    let reservationCount = 0;
    if (userData.role === 'customer') {
      const { count } = await supabase
        .from('reservations')
        .select('*', { count: 'exact', head: true })
        .eq('customer_id', userId);
      reservationCount = count || 0;
    }

    // Get favorite count
    const { count: favoriteCount } = await supabase
      .from('favorites')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', userId);

    setSelectedUser({
      ...userData,
      stores,
      reservationCount,
      favoriteCount: favoriteCount || 0
    });
  };

  const openStaffDetail = async (staffId: string) => {
    const { data } = await supabase
      .from('virtual_staff')
      .select('*, store:stores(name)')
      .eq('id', staffId)
      .single();

    if (!data) return;

    setSelectedStaff({
      id: data.id,
      name: data.name,
      phone: data.phone,
      bio: data.bio,
      store_id: data.store_id,
      store_name: (data.store as { name: string } | null)?.name || '알 수 없음',
      created_at: data.created_at,
      profile_photo_url: data.profile_photo_url,
      age: data.age,
      height: data.height,
      weight: data.weight,
      body_size: data.body_size,
      job: data.job,
      mbti: data.mbti,
      is_smoker: data.is_smoker,
      personality: data.personality,
      style: data.style,
      skin_tone: data.skin_tone,
      hair_length: data.hair_length,
      hair_style: data.hair_style,
      hair_color: data.hair_color,
      is_waxed: data.is_waxed,
      specialties: data.specialties,
      nationalities: data.nationalities,
      languages: data.languages
    });
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

      {/* Pending Alerts */}
      <div className="space-y-3 mb-6">
        {stats?.pendingOwners && stats.pendingOwners > 0 && (
          <Link
            to="/superadmin/owner-approval"
            className="block p-4 bg-amber-50 border border-amber-200 rounded-xl hover:bg-amber-100 transition-colors"
          >
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <span className="text-2xl">⏳</span>
                <div>
                  <p className="font-semibold text-amber-800">사장 가입 승인 대기</p>
                  <p className="text-sm text-amber-600">{stats.pendingOwners}건의 가입 신청이 대기 중입니다.</p>
                </div>
              </div>
              <span className="text-amber-600 font-medium">승인하기 →</span>
            </div>
          </Link>
        )}

        {stats?.pendingPasswordResets && stats.pendingPasswordResets > 0 && (
          <Link
            to="/superadmin/password-reset"
            className="block p-4 bg-blue-50 border border-blue-200 rounded-xl hover:bg-blue-100 transition-colors"
          >
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <span className="text-2xl">🔑</span>
                <div>
                  <p className="font-semibold text-blue-800">비밀번호 초기화 요청</p>
                  <p className="text-sm text-blue-600">{stats.pendingPasswordResets}건의 초기화 요청이 대기 중입니다.</p>
                </div>
              </div>
              <span className="text-blue-600 font-medium">처리하기 →</span>
            </div>
          </Link>
        )}
      </div>

      {/* Quick Stats */}
      <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
        <Link to="/superadmin/users" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-sm text-slate-500 mb-1">전체 사용자</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalUsers}</p>
        </Link>
        <Link to="/superadmin/virtual-staff" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-sm text-slate-500 mb-1">등록 매니저</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalVirtualStaff}</p>
          <p className="text-xs text-slate-400 mt-1">관리자가 등록</p>
        </Link>
        <Link to="/superadmin/stores" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-sm text-slate-500 mb-1">전체 가게</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalStores}</p>
        </Link>
        <Link to="/superadmin/reservations" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-sm text-slate-500 mb-1">전체 예약</p>
          <p className="text-3xl font-bold text-slate-900">{stats?.totalReservations}</p>
        </Link>
        <Link to="/superadmin/reservations" className="p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 hover:shadow-sm transition-all">
          <p className="text-sm text-slate-500 mb-1">오늘 예약</p>
          <p className="text-3xl font-bold text-orange-600">{stats?.todayReservations}</p>
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Users by Role */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">역할별 사용자</h2>
          <div className="space-y-2">
            {stats?.usersByRole.filter(({ role }) => role !== 'superadmin').map(({ role, count }) => {
              const showToggle = ['owner', 'staff', 'manager', 'agency'].includes(role);
              return (
                <div
                  key={role}
                  className="flex items-center justify-between p-3 bg-slate-50 rounded-lg"
                >
                  <Link
                    to={`/superadmin/users?role=${role}`}
                    className="flex-1 flex items-center justify-between hover:text-orange-600 transition-colors"
                  >
                    <span className="text-slate-700">{getRoleName(role)}</span>
                    <span className="font-semibold text-slate-900">{count}명 →</span>
                  </Link>
                  {showToggle && (
                    <div className="ml-3 flex items-center gap-2">
                      <span className="text-xs text-slate-400">노출</span>
                      <ToggleSwitch
                        enabled={roleVisibility[role] ?? true}
                        onChange={(v) => handleRoleVisibilityChange(role, v)}
                        size="sm"
                      />
                    </div>
                  )}
                </div>
              );
            })}
            {/* 등록 매니저 (virtual_staff) */}
            <div className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
              <Link
                to="/superadmin/virtual-staff"
                className="flex-1 flex items-center justify-between hover:text-orange-600 transition-colors"
              >
                <span className="text-slate-700">등록 매니저</span>
                <span className="font-semibold text-slate-900">{stats?.totalVirtualStaff}명 →</span>
              </Link>
              <div className="ml-3 flex items-center gap-2">
                <span className="text-xs text-slate-400">노출</span>
                <ToggleSwitch
                  enabled={roleVisibility['virtual_staff'] ?? true}
                  onChange={(v) => handleRoleVisibilityChange('virtual_staff', v)}
                  size="sm"
                />
              </div>
            </div>
          </div>
        </div>

        {/* Reservations by Status */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">예약 상태별 현황</h2>
          <div className="space-y-2">
            {stats?.reservationsByStatus.map(({ status, count }) => (
              <Link
                key={status}
                to={`/superadmin/reservations?status=${status}`}
                className="flex items-center justify-between p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors"
              >
                <span className="text-slate-700">{getStatusName(status)}</span>
                <span className="font-semibold text-slate-900">{count}건 →</span>
              </Link>
            ))}
            {stats?.reservationsByStatus.length === 0 && (
              <p className="text-slate-500 text-sm">예약 데이터가 없습니다.</p>
            )}
          </div>
        </div>

        {/* Stores by Type */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-900">업종별 가게 현황</h2>
            <button
              onClick={() => setShowAddTypeModal(true)}
              className="px-3 py-1.5 text-sm font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors"
            >
              + 업종 추가
            </button>
          </div>
          <p className="text-xs text-slate-400 mb-2">드래그하여 순서를 변경할 수 있습니다</p>
          <div className="space-y-2">
            {stats?.storesByType.map(({ type, count }) => (
              <div
                key={type}
                draggable
                onDragStart={(e) => handleDragStart(e, type)}
                onDragOver={handleDragOver}
                onDrop={(e) => handleDrop(e, type)}
                onDragEnd={handleDragEnd}
                className={`flex items-center justify-between p-3 bg-slate-50 rounded-lg cursor-move transition-all ${
                  draggedType === type ? 'opacity-50 scale-95' : ''
                } ${draggedType && draggedType !== type ? 'hover:bg-slate-100' : ''}`}
              >
                {/* Drag Handle */}
                <div className="mr-2 text-slate-400 cursor-grab active:cursor-grabbing">
                  <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                    <circle cx="5" cy="4" r="1.5" />
                    <circle cx="11" cy="4" r="1.5" />
                    <circle cx="5" cy="8" r="1.5" />
                    <circle cx="11" cy="8" r="1.5" />
                    <circle cx="5" cy="12" r="1.5" />
                    <circle cx="11" cy="12" r="1.5" />
                  </svg>
                </div>
                <Link
                  to={`/superadmin/stores?type=${encodeURIComponent(type)}`}
                  className="flex-1 flex items-center justify-between hover:text-orange-600 transition-colors"
                  onClick={(e) => e.stopPropagation()}
                  draggable={false}
                >
                  <span className="text-slate-700">{type}</span>
                  <span className="font-semibold text-slate-900">{count}개 →</span>
                </Link>
                <div className="ml-3 flex items-center gap-3">
                  <div className="flex items-center gap-2">
                    <span className="text-xs text-slate-400">노출</span>
                    <ToggleSwitch
                      enabled={typeVisibility[type] ?? true}
                      onChange={(v) => handleTypeVisibilityChange(type, v)}
                      size="sm"
                    />
                  </div>
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      setShowDeleteConfirm(type);
                    }}
                    className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded transition-colors"
                    title="업종 삭제"
                  >
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M3 6h18M19 6v14a2 2 0 01-2 2H7a2 2 0 01-2-2V6m3 0V4a2 2 0 012-2h4a2 2 0 012 2v2" />
                    </svg>
                  </button>
                </div>
              </div>
            ))}
            {stats?.storesByType.length === 0 && (
              <p className="text-slate-500 text-sm">가게 데이터가 없습니다.</p>
            )}
          </div>
        </div>

        {/* Recent Users */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
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
                  <tr
                    key={u.id}
                    onClick={() => openUserDetail(u.id)}
                    className="border-b border-slate-100 hover:bg-slate-50 cursor-pointer transition-colors"
                  >
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

        {/* Recent Virtual Staff (Admin-registered) */}
        <div className="p-5 bg-white border border-slate-200 rounded-xl">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-900">최근 등록된 매니저</h2>
            <Link to="/superadmin/virtual-staff" className="text-sm text-orange-600 hover:underline">
              전체 보기 →
            </Link>
          </div>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-slate-200">
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">이름</th>
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">소속 가게</th>
                  <th className="text-left py-2 px-3 text-sm font-medium text-slate-500">등록일</th>
                </tr>
              </thead>
              <tbody>
                {stats?.recentVirtualStaff.map((vs) => (
                  <tr
                    key={vs.id}
                    onClick={() => openStaffDetail(vs.id)}
                    className="border-b border-slate-100 hover:bg-slate-50 cursor-pointer transition-colors"
                  >
                    <td className="py-3 px-3 text-slate-900">{vs.name}</td>
                    <td className="py-3 px-3">
                      <span className="px-2 py-1 bg-slate-100 text-slate-600 text-xs rounded">
                        {vs.store_name}
                      </span>
                    </td>
                    <td className="py-3 px-3 text-slate-500 text-sm">
                      {new Date(vs.created_at).toLocaleDateString('ko-KR')}
                    </td>
                  </tr>
                ))}
                {stats?.recentVirtualStaff.length === 0 && (
                  <tr>
                    <td colSpan={3} className="py-4 text-center text-slate-500 text-sm">
                      등록된 매니저가 없습니다.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </div>

      {/* User Detail Modal */}
      {selectedUser && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md p-6 max-h-[90vh] overflow-y-auto">
            <div className="flex items-start justify-between mb-6">
              <div className="flex items-center gap-3">
                <div className="w-12 h-12 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-lg font-bold text-white">
                  {selectedUser.name?.charAt(0) || '?'}
                </div>
                <div>
                  <h2 className="text-lg font-bold text-slate-900">{selectedUser.name}</h2>
                  <span className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">
                    {getRoleName(selectedUser.role)}
                  </span>
                </div>
              </div>
              <button
                onClick={() => setSelectedUser(null)}
                className="text-slate-400 hover:text-slate-600 text-2xl"
              >
                ×
              </button>
            </div>

            <div className="space-y-4">
              {/* Basic Info */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">기본 정보</h3>
                <div className="space-y-2 text-sm">
                  <div className="flex justify-between">
                    <span className="text-slate-500">이메일</span>
                    <span className="text-slate-900">{selectedUser.email}</span>
                  </div>
                  {selectedUser.phone && (
                    <div className="flex justify-between">
                      <span className="text-slate-500">전화번호</span>
                      <span className="text-slate-900">{selectedUser.phone}</span>
                    </div>
                  )}
                  <div className="flex justify-between">
                    <span className="text-slate-500">가입일</span>
                    <span className="text-slate-900">
                      {new Date(selectedUser.created_at).toLocaleDateString('ko-KR')}
                    </span>
                  </div>
                </div>
              </div>

              {/* Stores for owner/admin */}
              {selectedUser.stores && selectedUser.stores.length > 0 && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">소속 가게</h3>
                  <div className="flex flex-wrap gap-2">
                    {selectedUser.stores.map(store => (
                      <Link
                        key={store.id}
                        to={`/store/${store.id}`}
                        onClick={() => setSelectedUser(null)}
                        className="px-3 py-1 bg-white border border-slate-200 rounded-lg text-sm text-slate-700 hover:border-orange-300 hover:text-orange-600"
                      >
                        {store.name}
                      </Link>
                    ))}
                  </div>
                </div>
              )}

              {/* Activity for customer */}
              {selectedUser.role === 'customer' && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">활동</h3>
                  <div className="grid grid-cols-2 gap-3">
                    <div className="p-3 bg-white rounded-lg text-center">
                      <p className="text-2xl font-bold text-slate-900">{selectedUser.reservationCount}</p>
                      <p className="text-xs text-slate-500">총 예약</p>
                    </div>
                    <div className="p-3 bg-white rounded-lg text-center">
                      <p className="text-2xl font-bold text-slate-900">{selectedUser.favoriteCount}</p>
                      <p className="text-xs text-slate-500">즐겨찾기</p>
                    </div>
                  </div>
                </div>
              )}
            </div>

            <div className="mt-6">
              <Link
                to={`/superadmin/users?role=${selectedUser.role}`}
                onClick={() => setSelectedUser(null)}
                className="block w-full px-4 py-2 text-center text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors font-medium"
              >
                {getRoleName(selectedUser.role)} 목록 보기
              </Link>
            </div>
          </div>
        </div>
      )}

      {/* Virtual Staff Detail Modal */}
      {selectedStaff && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg p-6 max-h-[90vh] overflow-y-auto">
            <div className="flex items-start justify-between mb-6">
              <div className="flex items-center gap-4">
                <div
                  className={`w-16 h-16 rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-xl font-bold text-white overflow-hidden flex-shrink-0 ${selectedStaff.profile_photo_url ? 'cursor-pointer hover:opacity-80 transition-opacity' : ''}`}
                  onClick={() => selectedStaff.profile_photo_url && setViewingPhoto(selectedStaff.profile_photo_url)}
                >
                  {selectedStaff.profile_photo_url ? (
                    <img src={selectedStaff.profile_photo_url} alt={selectedStaff.name} className="w-full h-full object-cover" />
                  ) : (
                    selectedStaff.name.charAt(0)
                  )}
                </div>
                <div>
                  <h2 className="text-xl font-bold text-slate-900">{selectedStaff.name}</h2>
                  <Link
                    to={`/store/${selectedStaff.store_id}`}
                    onClick={() => setSelectedStaff(null)}
                    className="text-sm text-slate-500 hover:text-orange-600"
                  >
                    {selectedStaff.store_name} →
                  </Link>
                </div>
              </div>
              <button
                onClick={() => setSelectedStaff(null)}
                className="text-slate-400 hover:text-slate-600 text-2xl"
              >
                ×
              </button>
            </div>

            <div className="space-y-4">
              {/* Basic Info Tags */}
              {(selectedStaff.age || selectedStaff.height || selectedStaff.weight || selectedStaff.body_size || selectedStaff.job || selectedStaff.mbti) && (
                <div className="flex flex-wrap gap-2">
                  {selectedStaff.job && <span className="px-2 py-1 bg-blue-50 text-blue-600 text-sm rounded">{selectedStaff.job}</span>}
                  {selectedStaff.mbti && <span className="px-2 py-1 bg-purple-50 text-purple-600 text-sm rounded">{selectedStaff.mbti}</span>}
                  {selectedStaff.age && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{selectedStaff.age}세</span>}
                  {selectedStaff.height && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{selectedStaff.height}cm</span>}
                  {selectedStaff.weight && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{selectedStaff.weight}kg</span>}
                  {selectedStaff.body_size && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{selectedStaff.body_size}컵</span>}
                </div>
              )}

              {/* Specialties */}
              {selectedStaff.specialties && selectedStaff.specialties.length > 0 && (
                <div className="flex flex-wrap gap-1">
                  {selectedStaff.specialties.map((s) => (
                    <span key={s} className="px-2 py-1 bg-orange-50 text-orange-600 text-sm rounded">{s}</span>
                  ))}
                </div>
              )}

              {/* Nationalities & Languages */}
              {((selectedStaff.nationalities && selectedStaff.nationalities.length > 0) || (selectedStaff.languages && selectedStaff.languages.length > 0)) && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">국적 & 언어</h3>
                  <div className="space-y-2">
                    {selectedStaff.nationalities && selectedStaff.nationalities.length > 0 && (
                      <div className="flex items-center gap-2">
                        <span className="text-sm text-slate-500 w-12">국적</span>
                        <div className="flex flex-wrap gap-1">
                          {selectedStaff.nationalities.map((n) => (
                            <span key={n} className="px-2 py-1 bg-green-50 text-green-600 text-sm rounded">{n}</span>
                          ))}
                        </div>
                      </div>
                    )}
                    {selectedStaff.languages && selectedStaff.languages.length > 0 && (
                      <div className="flex items-center gap-2">
                        <span className="text-sm text-slate-500 w-12">언어</span>
                        <div className="flex flex-wrap gap-1">
                          {selectedStaff.languages.map((l) => (
                            <span key={l} className="px-2 py-1 bg-indigo-50 text-indigo-600 text-sm rounded">{l}</span>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                </div>
              )}

              {/* Contact & Date */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">연락처 및 등록일</h3>
                <div className="grid grid-cols-2 gap-3 text-sm">
                  <div>
                    <span className="text-slate-500">전화번호</span>
                    <p className="font-medium text-slate-900">{selectedStaff.phone || '-'}</p>
                  </div>
                  <div>
                    <span className="text-slate-500">등록일</span>
                    <p className="font-medium text-slate-900">
                      {new Date(selectedStaff.created_at).toLocaleDateString('ko-KR')}
                    </p>
                  </div>
                </div>
              </div>

              {/* Bio */}
              {selectedStaff.bio && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-2">소개</h3>
                  <p className="text-sm text-slate-600 whitespace-pre-wrap">{selectedStaff.bio}</p>
                </div>
              )}

              {/* Appearance */}
              {(selectedStaff.skin_tone || selectedStaff.hair_length || selectedStaff.hair_style || selectedStaff.hair_color || selectedStaff.is_waxed !== null) && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">외모</h3>
                  <div className="grid grid-cols-2 gap-2 text-sm">
                    {selectedStaff.skin_tone && (
                      <div className="flex justify-between"><span className="text-slate-500">피부톤</span><span className="text-slate-900">{selectedStaff.skin_tone}</span></div>
                    )}
                    {selectedStaff.hair_length && (
                      <div className="flex justify-between"><span className="text-slate-500">머리길이</span><span className="text-slate-900">{selectedStaff.hair_length}</span></div>
                    )}
                    {selectedStaff.hair_style && (
                      <div className="flex justify-between"><span className="text-slate-500">헤어스타일</span><span className="text-slate-900">{selectedStaff.hair_style}</span></div>
                    )}
                    {selectedStaff.hair_color && (
                      <div className="flex justify-between"><span className="text-slate-500">머리색</span><span className="text-slate-900">{selectedStaff.hair_color}</span></div>
                    )}
                    {selectedStaff.is_waxed !== null && (
                      <div className="flex justify-between"><span className="text-slate-500">왁싱</span><span className="text-slate-900">{selectedStaff.is_waxed ? '함' : '안함'}</span></div>
                    )}
                  </div>
                </div>
              )}

              {/* Personality & Style */}
              {(selectedStaff.personality || selectedStaff.style || selectedStaff.is_smoker !== null) && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">성격 & 스타일</h3>
                  <div className="grid grid-cols-2 gap-2 text-sm">
                    {selectedStaff.personality && (
                      <div className="flex justify-between"><span className="text-slate-500">성격</span><span className="text-slate-900">{selectedStaff.personality}</span></div>
                    )}
                    {selectedStaff.style && (
                      <div className="flex justify-between"><span className="text-slate-500">스타일</span><span className="text-slate-900">{selectedStaff.style}</span></div>
                    )}
                    {selectedStaff.is_smoker !== null && (
                      <div className="flex justify-between"><span className="text-slate-500">흡연</span><span className="text-slate-900">{selectedStaff.is_smoker ? '흡연' : '비흡연'}</span></div>
                    )}
                  </div>
                </div>
              )}
            </div>

            <div className="mt-6">
              <Link
                to="/superadmin/virtual-staff"
                onClick={() => setSelectedStaff(null)}
                className="block w-full px-4 py-2 text-center text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors font-medium"
              >
                등록 매니저 목록 보기
              </Link>
            </div>
          </div>
        </div>
      )}

      {/* Photo Viewer Modal */}
      {viewingPhoto && (
        <div
          className="fixed inset-0 bg-black/90 flex items-center justify-center z-[60] p-4"
          onClick={() => setViewingPhoto(null)}
        >
          <button
            className="absolute top-4 right-4 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors"
            onClick={() => setViewingPhoto(null)}
          >
            ×
          </button>
          <img
            src={viewingPhoto}
            alt="프로필 사진"
            className="max-w-full max-h-[90vh] object-contain rounded-lg"
            onClick={(e) => e.stopPropagation()}
          />
        </div>
      )}

      {/* Add Store Type Modal */}
      {showAddTypeModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-sm p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">업종 추가</h2>
            <input
              type="text"
              value={newTypeName}
              onChange={(e) => setNewTypeName(e.target.value)}
              placeholder="새 업종 이름"
              className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500 mb-4"
              onKeyDown={(e) => {
                if (e.key === 'Enter') handleAddStoreType();
              }}
              autoFocus
            />
            <div className="flex gap-2">
              <button
                onClick={() => {
                  setShowAddTypeModal(false);
                  setNewTypeName('');
                }}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={handleAddStoreType}
                disabled={addingType}
                className="flex-1 px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700 transition-colors disabled:bg-slate-400"
              >
                {addingType ? '추가 중...' : '추가'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Delete Store Type Confirmation Modal */}
      {showDeleteConfirm && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-sm p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-2">업종 삭제</h2>
            <p className="text-slate-600 mb-4">
              <span className="font-semibold text-red-600">"{showDeleteConfirm}"</span> 업종을 삭제하시겠습니까?
            </p>
            <p className="text-sm text-slate-500 mb-4">
              이 업종에 속한 가게들은 삭제되지 않지만, 업종 분류에서 제외됩니다.
            </p>
            <div className="flex gap-2">
              <button
                onClick={() => setShowDeleteConfirm(null)}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={() => handleDeleteStoreType(showDeleteConfirm)}
                className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
              >
                삭제
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
