import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface User {
  id: string;
  name: string;
  email: string;
  role: string;
  phone: string | null;
  created_at: string;
  is_visible?: boolean;
}

interface StoreInfo {
  id: number;
  name: string;
}

interface StaffProfile {
  bio: string | null;
  specialties: string[] | null;
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
  nationalities: string[] | null;
  languages: string[] | null;
}

type RoleFilter = 'all' | 'customer' | 'manager' | 'staff' | 'owner' | 'superadmin' | 'agency';
type SortOption = 'newest' | 'oldest' | 'score_high' | 'score_low';

export default function UserManagement() {
  const { user } = useAuth();
  const [searchParams, setSearchParams] = useSearchParams();
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);
  const [roleFilter, setRoleFilter] = useState<RoleFilter>(() => {
    const roleParam = searchParams.get('role');
    if (roleParam && ['customer', 'manager', 'staff', 'owner', 'superadmin', 'agency'].includes(roleParam)) {
      return roleParam as RoleFilter;
    }
    return 'all';
  });
  const [searchQuery, setSearchQuery] = useState('');
  const [sortOption, setSortOption] = useState<SortOption>('newest');
  const [editingUser, setEditingUser] = useState<User | null>(null);
  const [newRole, setNewRole] = useState('');
  const [userStoreMap, setUserStoreMap] = useState<Record<string, StoreInfo[]>>({});
  const [userScoreMap, setUserScoreMap] = useState<Record<string, number>>({});
  const [selectedUser, setSelectedUser] = useState<User | null>(null);
  const [userDetails, setUserDetails] = useState<{
    reservationCount: number;
    favoriteCount: number;
    chatCount: number;
    score: number;
  } | null>(null);
  const [staffProfile, setStaffProfile] = useState<StaffProfile | null>(null);
  const [viewingPhoto, setViewingPhoto] = useState<string | null>(null);

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchUsers();
    }
  }, [user]);

  // URL 파라미터 동기화
  useEffect(() => {
    if (roleFilter === 'all') {
      searchParams.delete('role');
    } else {
      searchParams.set('role', roleFilter);
    }
    setSearchParams(searchParams, { replace: true });
  }, [roleFilter]);

  const fetchUsers = async () => {
    const { data } = await supabase
      .from('profiles')
      .select('*')
      .order('created_at', { ascending: false });

    setUsers(data || []);

    // Fetch stores for owners and admins
    const storeMap: Record<string, StoreInfo[]> = {};

    // Get stores where user is owner
    const { data: ownerStores } = await supabase
      .from('stores')
      .select('id, name, owner_id');

    ownerStores?.forEach(store => {
      if (store.owner_id) {
        if (!storeMap[store.owner_id]) {
          storeMap[store.owner_id] = [];
        }
        storeMap[store.owner_id].push({ id: store.id, name: store.name });
      }
    });

    // Get stores where user is admin
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('admin_id, store:stores(id, name)');

    adminStores?.forEach(sa => {
      if (sa.admin_id && sa.store) {
        const store = sa.store as unknown as { id: number; name: string };
        if (!storeMap[sa.admin_id]) {
          storeMap[sa.admin_id] = [];
        }
        storeMap[sa.admin_id].push({ id: store.id, name: store.name });
      }
    });

    setUserStoreMap(storeMap);

    // Fetch user scores
    const { data: scoresData } = await supabase
      .from('user_scores')
      .select('user_id, total_score');

    const scoreMap: Record<string, number> = {};
    scoresData?.forEach(score => {
      scoreMap[score.user_id] = score.total_score;
    });
    setUserScoreMap(scoreMap);

    setLoading(false);
  };

  const filteredUsers = users
    .filter(u => {
      const matchesRole = roleFilter === 'all' || u.role === roleFilter;
      const matchesSearch = searchQuery === '' ||
        u.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        u.email.toLowerCase().includes(searchQuery.toLowerCase());
      return matchesRole && matchesSearch;
    })
    .sort((a, b) => {
      switch (sortOption) {
        case 'newest':
          return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
        case 'oldest':
          return new Date(a.created_at).getTime() - new Date(b.created_at).getTime();
        case 'score_high':
          return (userScoreMap[b.id] || 0) - (userScoreMap[a.id] || 0);
        case 'score_low':
          return (userScoreMap[a.id] || 0) - (userScoreMap[b.id] || 0);
        default:
          return 0;
      }
    });

  const updateUserRole = async () => {
    if (!editingUser || !newRole) return;

    const { error } = await supabase
      .from('profiles')
      .update({ role: newRole })
      .eq('id', editingUser.id);

    if (!error) {
      setUsers(prev => prev.map(u =>
        u.id === editingUser.id ? { ...u, role: newRole } : u
      ));
      setEditingUser(null);
      setNewRole('');
    }
  };

  const deleteUser = async (userId: string) => {
    if (!confirm('정말 이 사용자를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.')) return;

    // Note: This only deletes the profile, not the auth user
    // To fully delete, you'd need to use Supabase admin API
    const { error } = await supabase
      .from('profiles')
      .delete()
      .eq('id', userId);

    if (!error) {
      setUsers(prev => prev.filter(u => u.id !== userId));
    }
  };

  const toggleStaffVisibility = async (userId: string, currentVisibility: boolean) => {
    const newVisibility = !currentVisibility;
    const { error } = await supabase
      .from('profiles')
      .update({ is_visible: newVisibility })
      .eq('id', userId);

    if (!error) {
      setUsers(prev => prev.map(u =>
        u.id === userId ? { ...u, is_visible: newVisibility } : u
      ));
    }
  };

  const openUserDetail = async (u: User) => {
    setSelectedUser(u);
    setUserDetails(null);
    setStaffProfile(null);

    // Fetch additional user details
    // For manager, count reservations where they are the staff (받은 예약)
    // For customers, count reservations where they are the customer (한 예약)
    const reservationQuery = u.role === 'manager'
      ? supabase.from('reservations').select('id', { count: 'exact', head: true }).eq('staff_id', u.id)
      : supabase.from('reservations').select('id', { count: 'exact', head: true }).eq('customer_id', u.id);

    const [reservations, favorites, chats, scoreData] = await Promise.all([
      reservationQuery,
      supabase.from('favorites').select('id', { count: 'exact', head: true }).eq('user_id', u.id),
      supabase.from('conversations').select('id', { count: 'exact', head: true }).or(`admin_id.eq.${u.id},customer_id.eq.${u.id},staff_id.eq.${u.id},agency_id.eq.${u.id}`),
      supabase.from('user_scores').select('total_score').eq('user_id', u.id).single()
    ]);

    setUserDetails({
      reservationCount: reservations.count || 0,
      favoriteCount: favorites.count || 0,
      chatCount: chats.count || 0,
      score: scoreData.data?.total_score || 0
    });

    // Fetch staff profile if user is manager
    if (u.role === 'manager') {
      const { data: profileData } = await supabase
        .from('profiles')
        .select('bio, specialties, profile_photo_url, age, height, weight, body_size, job, mbti, is_smoker, personality, style, skin_tone, hair_length, hair_style, hair_color, is_waxed, nationalities, languages')
        .eq('id', u.id)
        .single();

      if (profileData) {
        setStaffProfile(profileData);
      }
    }
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

  const getRoleColor = (role: string) => {
    switch (role) {
      case 'superadmin': return 'bg-purple-100 text-purple-700';
      case 'agency': return 'bg-indigo-100 text-indigo-700';
      case 'owner': return 'bg-blue-100 text-blue-700';
      case 'staff': return 'bg-green-100 text-green-700';
      case 'manager': return 'bg-orange-100 text-orange-700';
      case 'customer': return 'bg-slate-100 text-slate-700';
      default: return 'bg-slate-100 text-slate-700';
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
      <div className="flex items-center gap-2 mb-6">
        <Link to="/superadmin" className="text-slate-400 hover:text-slate-600">←</Link>
        <h1 className="text-2xl font-bold text-slate-900">사용자 관리</h1>
        <span className="text-slate-400">({filteredUsers.length}명)</span>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap gap-4 mb-6">
        <input
          type="text"
          placeholder="이름 또는 이메일 검색..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="flex-1 min-w-[200px] px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        <select
          value={roleFilter}
          onChange={(e) => setRoleFilter(e.target.value as RoleFilter)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        >
          <option value="all">전체 역할</option>
          <option value="customer">손님</option>
          <option value="manager">프리 매니저</option>
          <option value="agency">에이전시</option>
          <option value="staff">실장</option>
          <option value="owner">사장</option>
          <option value="superadmin">ADMIN</option>
        </select>
        <select
          value={sortOption}
          onChange={(e) => setSortOption(e.target.value as SortOption)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        >
          <option value="newest">최신 가입순</option>
          <option value="oldest">오래된 가입순</option>
          <option value="score_high">점수 높은순</option>
          <option value="score_low">점수 낮은순</option>
        </select>
      </div>

      {/* Users List */}
      <div className="space-y-3">
        {filteredUsers.map((u) => (
          <div
            key={u.id}
            className="p-4 bg-white border border-slate-200 rounded-xl hover:border-slate-300 transition-colors cursor-pointer"
            onClick={() => openUserDetail(u)}
          >
            <div className="flex items-start justify-between gap-4">
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <span className="font-medium text-slate-900">{u.name}</span>
                  <span className={`px-2 py-0.5 text-xs font-medium rounded ${getRoleColor(u.role)}`}>
                    {getRoleName(u.role)}
                  </span>
                </div>
                <p className="text-sm text-slate-500 truncate">{u.email}</p>
                <div className="flex flex-wrap items-center gap-x-4 gap-y-1 mt-2 text-xs text-slate-400">
                  {u.phone && <span>{u.phone}</span>}
                  <span>{new Date(u.created_at).toLocaleDateString('ko-KR')} 가입</span>
                  {userScoreMap[u.id] !== undefined && (
                    <span className="flex items-center gap-1 text-amber-600">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-3 h-3">
                        <path fillRule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.006 5.404.434c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.434 2.082-5.005Z" clipRule="evenodd" />
                      </svg>
                      {userScoreMap[u.id].toLocaleString()}점
                    </span>
                  )}
                </div>
                {(u.role === 'owner' || u.role === 'staff') && userStoreMap[u.id]?.length > 0 && (
                  <div className="flex flex-wrap gap-1 mt-2">
                    {userStoreMap[u.id].map(store => (
                      <Link
                        key={store.id}
                        to={`/store/${store.id}`}
                        onClick={(e) => e.stopPropagation()}
                        className="px-2 py-0.5 bg-slate-100 text-slate-600 text-xs rounded hover:bg-slate-200"
                      >
                        {store.name}
                      </Link>
                    ))}
                  </div>
                )}
              </div>
              <div className="flex items-center gap-2 shrink-0">
                {u.role === 'manager' && (
                  <label
                    className="relative inline-flex items-center cursor-pointer"
                    onClick={(e) => e.stopPropagation()}
                    title={u.is_visible !== false ? '손님에게 노출됨' : '손님에게 숨겨짐'}
                  >
                    <input
                      type="checkbox"
                      checked={u.is_visible !== false}
                      onChange={() => toggleStaffVisibility(u.id, u.is_visible !== false)}
                      className="sr-only peer"
                    />
                    <div className="w-9 h-5 bg-slate-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-slate-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all peer-checked:bg-green-500"></div>
                    <span className="ml-2 text-xs text-slate-500">{u.is_visible !== false ? '노출' : '숨김'}</span>
                  </label>
                )}
                <button
                  onClick={(e) => { e.stopPropagation(); setEditingUser(u); setNewRole(u.role); }}
                  className="px-3 py-1.5 text-xs font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors"
                >
                  역할 변경
                </button>
                {u.id !== user?.id && u.role !== 'superadmin' && (
                  <button
                    onClick={(e) => { e.stopPropagation(); deleteUser(u.id); }}
                    className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors"
                  >
                    삭제
                  </button>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      {filteredUsers.length === 0 && (
        <div className="p-8 text-center text-slate-500">
          검색 결과가 없습니다.
        </div>
      )}

      {/* User Detail Modal */}
      {selectedUser && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg p-6 max-h-[90vh] overflow-y-auto">
            <div className="flex items-start justify-between mb-6">
              <div className="flex items-center gap-4">
                {/* Profile Photo for Staff */}
                {selectedUser.role === 'manager' && (
                  <div
                    className={`w-16 h-16 rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-xl font-bold text-white overflow-hidden flex-shrink-0 ${staffProfile?.profile_photo_url ? 'cursor-pointer hover:opacity-80 transition-opacity' : ''}`}
                    onClick={() => staffProfile?.profile_photo_url && setViewingPhoto(staffProfile.profile_photo_url)}
                  >
                    {staffProfile?.profile_photo_url ? (
                      <img src={staffProfile.profile_photo_url} alt={selectedUser.name} className="w-full h-full object-cover" />
                    ) : (
                      selectedUser.name.charAt(0)
                    )}
                  </div>
                )}
                <div>
                  <div className="flex items-center gap-2 mb-1">
                    <h2 className="text-xl font-bold text-slate-900">{selectedUser.name}</h2>
                    <span className={`px-2 py-0.5 text-xs font-medium rounded ${getRoleColor(selectedUser.role)}`}>
                      {getRoleName(selectedUser.role)}
                    </span>
                  </div>
                  <p className="text-slate-500">{selectedUser.email}</p>
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
              {/* Staff Profile Tags */}
              {selectedUser.role === 'manager' && staffProfile && (
                (staffProfile.age || staffProfile.height || staffProfile.weight || staffProfile.body_size || staffProfile.job || staffProfile.mbti) && (
                  <div className="flex flex-wrap gap-2">
                    {staffProfile.job && <span className="px-2 py-1 bg-blue-50 text-blue-600 text-sm rounded">{staffProfile.job}</span>}
                    {staffProfile.mbti && <span className="px-2 py-1 bg-purple-50 text-purple-600 text-sm rounded">{staffProfile.mbti}</span>}
                    {staffProfile.age && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staffProfile.age}세</span>}
                    {staffProfile.height && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staffProfile.height}cm</span>}
                    {staffProfile.weight && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staffProfile.weight}kg</span>}
                    {staffProfile.body_size && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staffProfile.body_size}컵</span>}
                  </div>
                )
              )}

              {/* Staff Specialties */}
              {selectedUser.role === 'manager' && staffProfile?.specialties && staffProfile.specialties.length > 0 && (
                <div className="flex flex-wrap gap-1">
                  {staffProfile.specialties.map((s) => (
                    <span key={s} className="px-2 py-1 bg-orange-50 text-orange-600 text-sm rounded">{s}</span>
                  ))}
                </div>
              )}

              {/* Staff Nationalities & Languages */}
              {selectedUser.role === 'manager' && staffProfile && ((staffProfile.nationalities && staffProfile.nationalities.length > 0) || (staffProfile.languages && staffProfile.languages.length > 0)) && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">국적 & 언어</h3>
                  <div className="space-y-2">
                    {staffProfile.nationalities && staffProfile.nationalities.length > 0 && (
                      <div className="flex items-center gap-2">
                        <span className="text-sm text-slate-500 w-12">국적</span>
                        <div className="flex flex-wrap gap-1">
                          {staffProfile.nationalities.map((n) => (
                            <span key={n} className="px-2 py-1 bg-green-50 text-green-600 text-sm rounded">{n}</span>
                          ))}
                        </div>
                      </div>
                    )}
                    {staffProfile.languages && staffProfile.languages.length > 0 && (
                      <div className="flex items-center gap-2">
                        <span className="text-sm text-slate-500 w-12">언어</span>
                        <div className="flex flex-wrap gap-1">
                          {staffProfile.languages.map((l) => (
                            <span key={l} className="px-2 py-1 bg-indigo-50 text-indigo-600 text-sm rounded">{l}</span>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                </div>
              )}

              {/* Basic Info */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">기본 정보</h3>
                <div className="grid grid-cols-2 gap-3 text-sm">
                  <div>
                    <span className="text-slate-500">전화번호</span>
                    <p className="font-medium text-slate-900">{selectedUser.phone || '-'}</p>
                  </div>
                  <div>
                    <span className="text-slate-500">가입일</span>
                    <p className="font-medium text-slate-900">
                      {new Date(selectedUser.created_at).toLocaleDateString('ko-KR')}
                    </p>
                  </div>
                </div>
              </div>

              {/* Staff Bio */}
              {selectedUser.role === 'manager' && staffProfile?.bio && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-2">소개</h3>
                  <p className="text-sm text-slate-600 whitespace-pre-wrap">{staffProfile.bio}</p>
                </div>
              )}

              {/* Staff Appearance */}
              {selectedUser.role === 'manager' && staffProfile && (staffProfile.skin_tone || staffProfile.hair_length || staffProfile.hair_style || staffProfile.hair_color || staffProfile.is_waxed !== null) && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">외모</h3>
                  <div className="grid grid-cols-2 gap-2 text-sm">
                    {staffProfile.skin_tone && (
                      <div className="flex justify-between"><span className="text-slate-500">피부톤</span><span className="text-slate-900">{staffProfile.skin_tone}</span></div>
                    )}
                    {staffProfile.hair_length && (
                      <div className="flex justify-between"><span className="text-slate-500">머리길이</span><span className="text-slate-900">{staffProfile.hair_length}</span></div>
                    )}
                    {staffProfile.hair_style && (
                      <div className="flex justify-between"><span className="text-slate-500">헤어스타일</span><span className="text-slate-900">{staffProfile.hair_style}</span></div>
                    )}
                    {staffProfile.hair_color && (
                      <div className="flex justify-between"><span className="text-slate-500">머리색</span><span className="text-slate-900">{staffProfile.hair_color}</span></div>
                    )}
                    {staffProfile.is_waxed !== null && (
                      <div className="flex justify-between"><span className="text-slate-500">왁싱</span><span className="text-slate-900">{staffProfile.is_waxed ? '함' : '안함'}</span></div>
                    )}
                  </div>
                </div>
              )}

              {/* Staff Personality & Style */}
              {selectedUser.role === 'manager' && staffProfile && (staffProfile.personality || staffProfile.style || staffProfile.is_smoker !== null) && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">성격 & 스타일</h3>
                  <div className="grid grid-cols-2 gap-2 text-sm">
                    {staffProfile.personality && (
                      <div className="flex justify-between"><span className="text-slate-500">성격</span><span className="text-slate-900">{staffProfile.personality}</span></div>
                    )}
                    {staffProfile.style && (
                      <div className="flex justify-between"><span className="text-slate-500">스타일</span><span className="text-slate-900">{staffProfile.style}</span></div>
                    )}
                    {staffProfile.is_smoker !== null && (
                      <div className="flex justify-between"><span className="text-slate-500">흡연</span><span className="text-slate-900">{staffProfile.is_smoker ? '흡연' : '비흡연'}</span></div>
                    )}
                  </div>
                </div>
              )}

              {/* Stores (for owner/admin) */}
              {(selectedUser.role === 'owner' || selectedUser.role === 'staff') && userStoreMap[selectedUser.id]?.length > 0 && (
                <div className="p-4 bg-slate-50 rounded-xl">
                  <h3 className="text-sm font-medium text-slate-700 mb-3">
                    {selectedUser.role === 'owner' ? '소유 가게' : '관리 가게'}
                  </h3>
                  <div className="flex flex-wrap gap-2">
                    {userStoreMap[selectedUser.id].map(store => (
                      <Link
                        key={store.id}
                        to={`/store/${store.id}`}
                        onClick={() => setSelectedUser(null)}
                        className="px-3 py-1.5 bg-white border border-slate-200 text-slate-700 text-sm rounded-lg hover:border-red-600 hover:text-red-600 transition-colors"
                      >
                        {store.name} →
                      </Link>
                    ))}
                  </div>
                </div>
              )}

              {/* Activity Stats */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">활동 통계</h3>
                {userDetails ? (
                  <div className="grid grid-cols-4 gap-3 text-center">
                    <div className="p-3 bg-gradient-to-br from-amber-50 to-orange-50 border border-amber-200 rounded-lg">
                      <p className="text-2xl font-bold text-amber-600">{userDetails.score.toLocaleString()}</p>
                      <p className="text-xs text-amber-600">점수</p>
                    </div>
                    <div className="p-3 bg-white rounded-lg">
                      <p className="text-2xl font-bold text-slate-900">{userDetails.reservationCount}</p>
                      <p className="text-xs text-slate-500">예약</p>
                    </div>
                    <div className="p-3 bg-white rounded-lg">
                      <p className="text-2xl font-bold text-slate-900">{userDetails.favoriteCount}</p>
                      <p className="text-xs text-slate-500">즐겨찾기</p>
                    </div>
                    <div className="p-3 bg-white rounded-lg">
                      <p className="text-2xl font-bold text-slate-900">{userDetails.chatCount}</p>
                      <p className="text-xs text-slate-500">채팅</p>
                    </div>
                  </div>
                ) : (
                  <div className="text-center py-4 text-slate-400">로딩 중...</div>
                )}
              </div>
            </div>

            <div className="flex gap-2 mt-6">
              {selectedUser.role === 'manager' && (
                <Link
                  to={`/staff/${selectedUser.id}`}
                  onClick={() => setSelectedUser(null)}
                  className="flex-1 px-4 py-2 text-center text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors font-medium"
                >
                  상세 페이지
                </Link>
              )}
              <button
                onClick={() => {
                  setSelectedUser(null);
                  setEditingUser(selectedUser);
                  setNewRole(selectedUser.role);
                }}
                className="flex-1 px-4 py-2 text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors font-medium"
              >
                역할 변경
              </button>
              {selectedUser.id !== user?.id && selectedUser.role !== 'superadmin' && (
                <button
                  onClick={() => {
                    deleteUser(selectedUser.id);
                    setSelectedUser(null);
                  }}
                  className="flex-1 px-4 py-2 text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors font-medium"
                >
                  삭제
                </button>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Edit Role Modal */}
      {editingUser && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">역할 변경</h2>
            <p className="text-slate-600 mb-4">
              <span className="font-medium">{editingUser.name}</span>님의 역할을 변경합니다.
            </p>
            <select
              value={newRole}
              onChange={(e) => setNewRole(e.target.value)}
              className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg mb-4 focus:outline-none focus:ring-2 focus:ring-red-600"
            >
              <option value="customer">손님</option>
              <option value="manager">프리 매니저</option>
              <option value="agency">에이전시</option>
              <option value="staff">실장</option>
              <option value="owner">사장</option>
              <option value="superadmin">ADMIN</option>
            </select>
            <div className="flex gap-2">
              <button
                onClick={() => { setEditingUser(null); setNewRole(''); }}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={updateUserRole}
                className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
              >
                변경
              </button>
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
    </div>
  );
}
