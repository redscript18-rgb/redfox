import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface User {
  id: string;
  name: string;
  email: string;
  role: string;
  phone: string | null;
  created_at: string;
}

type RoleFilter = 'all' | 'customer' | 'staff' | 'admin' | 'owner' | 'superadmin';

export default function UserManagement() {
  const { user } = useAuth();
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);
  const [roleFilter, setRoleFilter] = useState<RoleFilter>('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [editingUser, setEditingUser] = useState<User | null>(null);
  const [newRole, setNewRole] = useState('');

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchUsers();
    }
  }, [user]);

  const fetchUsers = async () => {
    const { data } = await supabase
      .from('profiles')
      .select('*')
      .order('created_at', { ascending: false });

    setUsers(data || []);
    setLoading(false);
  };

  const filteredUsers = users.filter(u => {
    const matchesRole = roleFilter === 'all' || u.role === roleFilter;
    const matchesSearch = searchQuery === '' ||
      u.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      u.email.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesRole && matchesSearch;
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

  const getRoleColor = (role: string) => {
    switch (role) {
      case 'superadmin': return 'bg-purple-100 text-purple-700';
      case 'owner': return 'bg-blue-100 text-blue-700';
      case 'admin': return 'bg-green-100 text-green-700';
      case 'staff': return 'bg-orange-100 text-orange-700';
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
          <option value="staff">매니저</option>
          <option value="admin">관리자</option>
          <option value="owner">사장</option>
          <option value="superadmin">서비스관리자</option>
        </select>
      </div>

      {/* Users Table */}
      <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-slate-50">
              <tr>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">이름</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">이메일</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">역할</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">전화번호</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">가입일</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">작업</th>
              </tr>
            </thead>
            <tbody>
              {filteredUsers.map((u) => (
                <tr key={u.id} className="border-t border-slate-100 hover:bg-slate-50">
                  <td className="py-3 px-4 font-medium text-slate-900">{u.name}</td>
                  <td className="py-3 px-4 text-slate-600 text-sm">{u.email}</td>
                  <td className="py-3 px-4">
                    <span className={`px-2 py-1 text-xs font-medium rounded ${getRoleColor(u.role)}`}>
                      {getRoleName(u.role)}
                    </span>
                  </td>
                  <td className="py-3 px-4 text-slate-500 text-sm">{u.phone || '-'}</td>
                  <td className="py-3 px-4 text-slate-500 text-sm">
                    {new Date(u.created_at).toLocaleDateString('ko-KR')}
                  </td>
                  <td className="py-3 px-4">
                    <div className="flex items-center gap-2">
                      <button
                        onClick={() => { setEditingUser(u); setNewRole(u.role); }}
                        className="px-3 py-1 text-xs font-medium text-orange-600 bg-orange-50 rounded hover:bg-orange-100 transition-colors"
                      >
                        역할 변경
                      </button>
                      {u.id !== user?.id && u.role !== 'superadmin' && (
                        <button
                          onClick={() => deleteUser(u.id)}
                          className="px-3 py-1 text-xs font-medium text-red-600 bg-red-50 rounded hover:bg-red-100 transition-colors"
                        >
                          삭제
                        </button>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {filteredUsers.length === 0 && (
        <div className="p-8 text-center text-slate-500">
          검색 결과가 없습니다.
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
              <option value="staff">매니저</option>
              <option value="admin">관리자</option>
              <option value="owner">사장</option>
              <option value="superadmin">서비스관리자</option>
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
    </div>
  );
}
