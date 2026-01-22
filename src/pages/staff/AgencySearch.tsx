import { useState, useEffect } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Agency {
  id: string;
  name: string;
  email: string;
  phone?: string;
  bio?: string;
}

interface MyAgency {
  agency_id: string;
  status: string;
  joined_at: string;
  agency: Agency;
}

export default function AgencySearch() {
  const { user } = useAuth();
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [myAgencies, setMyAgencies] = useState<MyAgency[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [requesting, setRequesting] = useState<string | null>(null);

  useEffect(() => {
    if (user?.role === 'manager') {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // Fetch all agencies
    const { data: agenciesData } = await supabase
      .from('profiles')
      .select('id, name, email, phone, bio')
      .eq('role', 'agency');

    setAgencies(agenciesData || []);

    // Fetch my agency memberships
    const { data: myData } = await supabase
      .from('agency_managers')
      .select(`
        agency_id,
        status,
        joined_at,
        agency:profiles!agency_managers_agency_id_fkey(id, name, email, phone, bio)
      `)
      .eq('manager_id', user.id);

    if (myData) {
      const formatted: MyAgency[] = myData.map(m => ({
        agency_id: m.agency_id,
        status: m.status,
        joined_at: m.joined_at,
        agency: m.agency as unknown as Agency
      }));
      setMyAgencies(formatted);
    }

    setLoading(false);
  };

  const requestJoin = async (agencyId: string) => {
    if (!user) return;

    setRequesting(agencyId);

    const { error } = await supabase
      .from('agency_managers')
      .insert({
        agency_id: agencyId,
        manager_id: user.id,
        status: 'pending'
      });

    if (error) {
      if (error.code === '23505') {
        alert('이미 가입 요청을 보냈거나 소속되어 있습니다.');
      } else {
        alert('가입 요청 실패: ' + error.message);
      }
    } else {
      alert('가입 요청을 보냈습니다. 에이전시의 승인을 기다려주세요.');
      fetchData();
    }

    setRequesting(null);
  };

  const cancelRequest = async (agencyId: string) => {
    if (!user) return;
    if (!confirm('가입 요청을 취소하시겠습니까?')) return;

    const { error } = await supabase
      .from('agency_managers')
      .delete()
      .eq('agency_id', agencyId)
      .eq('manager_id', user.id);

    if (!error) {
      setMyAgencies(prev => prev.filter(m => m.agency_id !== agencyId));
    }
  };

  const leaveAgency = async (agencyId: string) => {
    if (!user) return;
    if (!confirm('이 에이전시에서 탈퇴하시겠습니까?')) return;

    const { error } = await supabase
      .from('agency_managers')
      .delete()
      .eq('agency_id', agencyId)
      .eq('manager_id', user.id);

    if (!error) {
      setMyAgencies(prev => prev.filter(m => m.agency_id !== agencyId));
    }
  };

  const getStatusName = (status: string) => {
    switch (status) {
      case 'pending': return '승인 대기';
      case 'active': return '활성';
      case 'inactive': return '비활성';
      default: return status;
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pending': return 'bg-yellow-100 text-yellow-700';
      case 'active': return 'bg-green-100 text-green-700';
      case 'inactive': return 'bg-slate-100 text-slate-700';
      default: return 'bg-slate-100 text-slate-700';
    }
  };

  // Filter agencies
  const filteredAgencies = agencies.filter(a => {
    if (searchQuery) {
      const query = searchQuery.toLowerCase();
      return a.name.toLowerCase().includes(query) || a.email.toLowerCase().includes(query);
    }
    return true;
  });

  // Agencies I'm not a member of
  const myAgencyIds = new Set(myAgencies.map(m => m.agency_id));
  const availableAgencies = filteredAgencies.filter(a => !myAgencyIds.has(a.id));

  if (user?.role !== 'manager') {
    return (
      <div className="p-8 text-center">
        <p className="text-red-600 font-semibold">접근 권한이 없습니다.</p>
      </div>
    );
  }

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-2xl font-bold text-slate-800">
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">에이전시</span>
        </h1>
      </div>

      {/* My Agencies */}
      {myAgencies.length > 0 && (
        <div className="bg-gradient-to-br from-purple-50 to-pink-50 rounded-3xl border border-purple-100 p-5">
          <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
            <span className="w-8 h-8 bg-purple-100 rounded-lg flex items-center justify-center text-base">🏢</span>
            내 에이전시
          </h2>
          <div className="space-y-3">
            {myAgencies.map((membership) => (
              <div key={membership.agency_id} className="p-4 bg-white/80 backdrop-blur rounded-2xl border border-purple-100">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-purple-500 to-pink-500 flex items-center justify-center text-white font-bold shadow-md shadow-purple-200">
                      {membership.agency.name.charAt(0)}
                    </div>
                    <div>
                      <div className="flex items-center gap-2">
                        <span className="font-semibold text-slate-800">{membership.agency.name}</span>
                        <span className={`px-2.5 py-0.5 text-xs font-medium rounded-full ${getStatusColor(membership.status)}`}>
                          {getStatusName(membership.status)}
                        </span>
                      </div>
                      <p className="text-sm text-slate-500">{membership.agency.email}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-2">
                    {membership.status === 'pending' ? (
                      <button
                        onClick={() => cancelRequest(membership.agency_id)}
                        className="px-3 py-1.5 text-xs font-medium text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors"
                      >
                        요청 취소
                      </button>
                    ) : (
                      <button
                        onClick={() => leaveAgency(membership.agency_id)}
                        className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors"
                      >
                        탈퇴
                      </button>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Search */}
      <div className="bg-white rounded-3xl border border-slate-100 p-5 shadow-sm">
        <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
          <span className="w-8 h-8 bg-pink-100 rounded-lg flex items-center justify-center text-base">🔍</span>
          에이전시 탐색
        </h2>
        <div className="relative">
          <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">🔍</span>
          <input
            type="text"
            placeholder="에이전시 이름 또는 이메일로 검색..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full pl-11 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm focus:outline-none focus:border-pink-400 focus:ring-2 focus:ring-pink-100 transition-all"
          />
        </div>
      </div>

      {/* Available Agencies */}
      {availableAgencies.length === 0 ? (
        <div className="py-12 bg-gradient-to-br from-slate-50 to-pink-50 rounded-3xl text-center">
          <div className="w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center mx-auto mb-4 text-2xl">🏢</div>
          <p className="text-slate-500">
            {searchQuery ? '검색 결과가 없습니다.' : '가입 가능한 에이전시가 없습니다.'}
          </p>
        </div>
      ) : (
        <div className="space-y-3">
          {availableAgencies.map((agency) => (
            <div key={agency.id} className="p-4 bg-white rounded-2xl border border-slate-100 hover:shadow-md transition-all">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-purple-500 to-pink-500 flex items-center justify-center text-white font-bold shadow-md shadow-purple-200">
                    {agency.name.charAt(0)}
                  </div>
                  <div>
                    <span className="font-semibold text-slate-800">{agency.name}</span>
                    <p className="text-sm text-slate-500">{agency.email}</p>
                    {agency.bio && (
                      <p className="text-sm text-slate-400 mt-1 line-clamp-1">{agency.bio}</p>
                    )}
                  </div>
                </div>
                <button
                  onClick={() => requestJoin(agency.id)}
                  disabled={requesting === agency.id}
                  className="px-4 py-2 text-sm font-medium text-white bg-gradient-to-r from-pink-500 to-rose-500 rounded-xl shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 disabled:opacity-50 disabled:shadow-none transition-all"
                >
                  {requesting === agency.id ? '요청 중...' : '가입 요청'}
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
