import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Manager {
  id: string;
  name: string;
  email: string;
  phone?: string;
  profile_photo_url?: string;
  status: string;
  joined_at: string;
}

interface VirtualStaff {
  id: string;
  name: string;
  phone?: string;
  bio?: string;
  specialties?: string[];
  profile_photo_url?: string;
  age?: number;
  height?: number;
  weight?: number;
  body_size?: string;
  job?: string;
  mbti?: string;
  is_visible: boolean;
  created_at: string;
}

interface Invite {
  id: number;
  invite_code: string;
  expires_at: string | null;
  max_uses: number;
  used_count: number;
  created_at: string;
}

type TabType = 'managers' | 'virtual' | 'invites';

export default function AgencyManagerManagement() {
  const { user } = useAuth();
  const [activeTab, setActiveTab] = useState<TabType>('managers');
  const [managers, setManagers] = useState<Manager[]>([]);
  const [virtualStaff, setVirtualStaff] = useState<VirtualStaff[]>([]);
  const [invites, setInvites] = useState<Invite[]>([]);
  const [loading, setLoading] = useState(true);
  const [showCreateInvite, setShowCreateInvite] = useState(false);
  const [showVirtualStaffModal, setShowVirtualStaffModal] = useState(false);
  const [editingVirtualStaff, setEditingVirtualStaff] = useState<VirtualStaff | null>(null);
  const [inviteMaxUses, setInviteMaxUses] = useState(1);
  const [inviteExpiresInDays, setInviteExpiresInDays] = useState(7);

  // Virtual staff form state
  const [vsForm, setVsForm] = useState({
    name: '',
    phone: '',
    bio: '',
    specialties: '',
    age: '',
    height: '',
    weight: '',
    body_size: '',
    job: '',
    mbti: ''
  });

  useEffect(() => {
    if (user?.role === 'agency') {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 소속 매니저
    const { data: managersData } = await supabase
      .from('agency_managers')
      .select(`
        manager_id,
        status,
        joined_at,
        manager:profiles!agency_managers_manager_id_fkey(id, name, email, phone, profile_photo_url)
      `)
      .eq('agency_id', user.id);

    if (managersData) {
      const formattedManagers: Manager[] = managersData.map(m => {
        const manager = m.manager as unknown as { id: string; name: string; email: string; phone?: string; profile_photo_url?: string };
        return {
          id: manager.id,
          name: manager.name,
          email: manager.email,
          phone: manager.phone,
          profile_photo_url: manager.profile_photo_url,
          status: m.status,
          joined_at: m.joined_at
        };
      });
      setManagers(formattedManagers);
    }

    // 가상 매니저
    const { data: virtualData } = await supabase
      .from('agency_virtual_staff')
      .select('*')
      .eq('agency_id', user.id)
      .order('created_at', { ascending: false });

    if (virtualData) {
      setVirtualStaff(virtualData);
    }

    // 초대 링크
    const { data: invitesData } = await supabase
      .from('agency_invites')
      .select('*')
      .eq('agency_id', user.id)
      .order('created_at', { ascending: false });

    if (invitesData) {
      setInvites(invitesData);
    }

    setLoading(false);
  };

  const generateInviteCode = () => {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let code = '';
    for (let i = 0; i < 8; i++) {
      code += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return code;
  };

  const createInvite = async () => {
    if (!user) return;

    const code = generateInviteCode();
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + inviteExpiresInDays);

    const { error } = await supabase
      .from('agency_invites')
      .insert({
        agency_id: user.id,
        invite_code: code,
        expires_at: expiresAt.toISOString(),
        max_uses: inviteMaxUses
      });

    if (!error) {
      setShowCreateInvite(false);
      fetchData();
    }
  };

  const deleteInvite = async (id: number) => {
    if (!confirm('이 초대 링크를 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('agency_invites')
      .delete()
      .eq('id', id);

    if (!error) {
      setInvites(prev => prev.filter(i => i.id !== id));
    }
  };

  const updateManagerStatus = async (managerId: string, newStatus: string) => {
    if (!user) return;

    const { error } = await supabase
      .from('agency_managers')
      .update({ status: newStatus })
      .eq('agency_id', user.id)
      .eq('manager_id', managerId);

    if (!error) {
      setManagers(prev => prev.map(m =>
        m.id === managerId ? { ...m, status: newStatus } : m
      ));
    }
  };

  const removeManager = async (managerId: string) => {
    if (!user) return;
    if (!confirm('이 매니저를 에이전시에서 제외하시겠습니까?')) return;

    const { error } = await supabase
      .from('agency_managers')
      .delete()
      .eq('agency_id', user.id)
      .eq('manager_id', managerId);

    if (!error) {
      setManagers(prev => prev.filter(m => m.id !== managerId));
    }
  };

  const openVirtualStaffModal = (vs?: VirtualStaff) => {
    if (vs) {
      setEditingVirtualStaff(vs);
      setVsForm({
        name: vs.name,
        phone: vs.phone || '',
        bio: vs.bio || '',
        specialties: vs.specialties?.join(', ') || '',
        age: vs.age?.toString() || '',
        height: vs.height?.toString() || '',
        weight: vs.weight?.toString() || '',
        body_size: vs.body_size || '',
        job: vs.job || '',
        mbti: vs.mbti || ''
      });
    } else {
      setEditingVirtualStaff(null);
      setVsForm({
        name: '',
        phone: '',
        bio: '',
        specialties: '',
        age: '',
        height: '',
        weight: '',
        body_size: '',
        job: '',
        mbti: ''
      });
    }
    setShowVirtualStaffModal(true);
  };

  const saveVirtualStaff = async () => {
    if (!user || !vsForm.name.trim()) return;

    const data = {
      agency_id: user.id,
      name: vsForm.name.trim(),
      phone: vsForm.phone.trim() || null,
      bio: vsForm.bio.trim() || null,
      specialties: vsForm.specialties ? vsForm.specialties.split(',').map(s => s.trim()).filter(Boolean) : null,
      age: vsForm.age ? parseInt(vsForm.age) : null,
      height: vsForm.height ? parseInt(vsForm.height) : null,
      weight: vsForm.weight ? parseInt(vsForm.weight) : null,
      body_size: vsForm.body_size.trim() || null,
      job: vsForm.job.trim() || null,
      mbti: vsForm.mbti.trim() || null,
      updated_at: new Date().toISOString()
    };

    if (editingVirtualStaff) {
      const { error } = await supabase
        .from('agency_virtual_staff')
        .update(data)
        .eq('id', editingVirtualStaff.id);

      if (!error) {
        setShowVirtualStaffModal(false);
        fetchData();
      }
    } else {
      const { error } = await supabase
        .from('agency_virtual_staff')
        .insert(data);

      if (!error) {
        setShowVirtualStaffModal(false);
        fetchData();
      }
    }
  };

  const deleteVirtualStaff = async (id: string) => {
    if (!confirm('이 가상 매니저를 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('agency_virtual_staff')
      .delete()
      .eq('id', id);

    if (!error) {
      setVirtualStaff(prev => prev.filter(v => v.id !== id));
    }
  };

  const toggleVirtualStaffVisibility = async (id: string, currentVisibility: boolean) => {
    const { error } = await supabase
      .from('agency_virtual_staff')
      .update({ is_visible: !currentVisibility, updated_at: new Date().toISOString() })
      .eq('id', id);

    if (!error) {
      setVirtualStaff(prev => prev.map(v =>
        v.id === id ? { ...v, is_visible: !currentVisibility } : v
      ));
    }
  };

  const copyInviteLink = (code: string) => {
    const link = `${window.location.origin}/agency-invite/${code}`;
    navigator.clipboard.writeText(link);
    alert('초대 링크가 복사되었습니다!');
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
      <div className="flex items-center gap-2 mb-6">
        <Link to="/agency" className="text-slate-400 hover:text-slate-600">←</Link>
        <h1 className="text-2xl font-bold text-slate-900">매니저 관리</h1>
      </div>

      {/* Tabs */}
      <div className="flex gap-1 md:gap-2 mb-6 border-b border-slate-200 overflow-x-auto">
        <button
          onClick={() => setActiveTab('managers')}
          className={`px-3 md:px-4 py-2 font-medium text-xs md:text-sm border-b-2 transition-colors whitespace-nowrap ${
            activeTab === 'managers'
              ? 'border-orange-600 text-orange-600'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          소속 ({managers.length})
        </button>
        <button
          onClick={() => setActiveTab('virtual')}
          className={`px-3 md:px-4 py-2 font-medium text-xs md:text-sm border-b-2 transition-colors whitespace-nowrap ${
            activeTab === 'virtual'
              ? 'border-orange-600 text-orange-600'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          가상 ({virtualStaff.length})
        </button>
        <button
          onClick={() => setActiveTab('invites')}
          className={`px-3 md:px-4 py-2 font-medium text-xs md:text-sm border-b-2 transition-colors whitespace-nowrap ${
            activeTab === 'invites'
              ? 'border-orange-600 text-orange-600'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          초대 ({invites.length})
        </button>
      </div>

      {/* Content */}
      {activeTab === 'managers' && (
        <div className="space-y-3">
          {managers.length === 0 ? (
            <div className="p-8 text-center text-slate-500 bg-white border border-slate-200 rounded-xl">
              <p className="mb-2">소속 매니저가 없습니다.</p>
              <button
                onClick={() => setActiveTab('invites')}
                className="text-orange-600 hover:underline"
              >
                초대 링크를 생성해보세요 →
              </button>
            </div>
          ) : (
            managers.map((manager) => (
              <div key={manager.id} className="p-3 md:p-4 bg-white border border-slate-200 rounded-xl">
                <div className="flex flex-col md:flex-row md:items-center gap-3 md:justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 md:w-12 md:h-12 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold overflow-hidden flex-shrink-0">
                      {manager.profile_photo_url ? (
                        <img src={manager.profile_photo_url} alt={manager.name} className="w-full h-full object-cover" />
                      ) : (
                        manager.name.charAt(0)
                      )}
                    </div>
                    <div className="min-w-0">
                      <div className="flex items-center gap-2 flex-wrap">
                        <span className="font-medium text-slate-900">{manager.name}</span>
                        <span className={`px-2 py-0.5 text-xs font-medium rounded ${getStatusColor(manager.status)}`}>
                          {getStatusName(manager.status)}
                        </span>
                      </div>
                      <p className="text-sm text-slate-500 truncate">{manager.email}</p>
                      {manager.phone && <p className="text-sm text-slate-400">{manager.phone}</p>}
                    </div>
                  </div>
                  <div className="flex items-center gap-2 ml-13 md:ml-0">
                    {manager.status === 'pending' && (
                      <button
                        onClick={() => updateManagerStatus(manager.id, 'active')}
                        className="px-3 py-1.5 text-xs font-medium text-green-600 bg-green-50 rounded-lg hover:bg-green-100"
                      >
                        승인
                      </button>
                    )}
                    {manager.status === 'active' && (
                      <button
                        onClick={() => updateManagerStatus(manager.id, 'inactive')}
                        className="px-3 py-1.5 text-xs font-medium text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200"
                      >
                        비활성
                      </button>
                    )}
                    {manager.status === 'inactive' && (
                      <button
                        onClick={() => updateManagerStatus(manager.id, 'active')}
                        className="px-3 py-1.5 text-xs font-medium text-green-600 bg-green-50 rounded-lg hover:bg-green-100"
                      >
                        활성화
                      </button>
                    )}
                    <button
                      onClick={() => removeManager(manager.id)}
                      className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100"
                    >
                      제외
                    </button>
                  </div>
                </div>
              </div>
            ))
          )}
        </div>
      )}

      {activeTab === 'virtual' && (
        <div>
          <div className="flex justify-end mb-4">
            <button
              onClick={() => openVirtualStaffModal()}
              className="px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700 transition-colors font-medium"
            >
              + 가상 매니저 추가
            </button>
          </div>
          {virtualStaff.length === 0 ? (
            <div className="p-8 text-center text-slate-500 bg-white border border-slate-200 rounded-xl">
              <p>등록된 가상 매니저가 없습니다.</p>
            </div>
          ) : (
            <div className="space-y-3">
              {virtualStaff.map((vs) => (
                <div key={vs.id} className="p-3 md:p-4 bg-white border border-slate-200 rounded-xl">
                  <div className="flex flex-col md:flex-row md:items-center gap-3 md:justify-between">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 md:w-12 md:h-12 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-bold overflow-hidden flex-shrink-0">
                        {vs.profile_photo_url ? (
                          <img src={vs.profile_photo_url} alt={vs.name} className="w-full h-full object-cover" />
                        ) : (
                          vs.name.charAt(0)
                        )}
                      </div>
                      <div className="min-w-0">
                        <div className="flex items-center gap-2 flex-wrap">
                          <span className="font-medium text-slate-900">{vs.name}</span>
                          {!vs.is_visible && (
                            <span className="px-2 py-0.5 text-xs font-medium rounded bg-slate-100 text-slate-500">
                              숨김
                            </span>
                          )}
                        </div>
                        <div className="flex flex-wrap gap-1 mt-1">
                          {vs.age && <span className="text-xs text-slate-400">{vs.age}세</span>}
                          {vs.height && <span className="text-xs text-slate-400">{vs.height}cm</span>}
                          {vs.job && <span className="text-xs text-blue-500">{vs.job}</span>}
                        </div>
                        {vs.specialties && vs.specialties.length > 0 && (
                          <div className="flex flex-wrap gap-1 mt-1">
                            {vs.specialties.slice(0, 3).map((s) => (
                              <span key={s} className="px-1.5 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">
                                {s}
                              </span>
                            ))}
                          </div>
                        )}
                      </div>
                    </div>
                    <div className="flex items-center gap-2 ml-13 md:ml-0">
                      <button
                        onClick={() => toggleVirtualStaffVisibility(vs.id, vs.is_visible)}
                        className={`px-3 py-1.5 text-xs font-medium rounded-lg ${
                          vs.is_visible
                            ? 'text-slate-600 bg-slate-100 hover:bg-slate-200'
                            : 'text-green-600 bg-green-50 hover:bg-green-100'
                        }`}
                      >
                        {vs.is_visible ? '숨기기' : '노출'}
                      </button>
                      <button
                        onClick={() => openVirtualStaffModal(vs)}
                        className="px-3 py-1.5 text-xs font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100"
                      >
                        수정
                      </button>
                      <button
                        onClick={() => deleteVirtualStaff(vs.id)}
                        className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100"
                      >
                        삭제
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}

      {activeTab === 'invites' && (
        <div>
          <div className="flex justify-end mb-4">
            <button
              onClick={() => setShowCreateInvite(true)}
              className="px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700 transition-colors font-medium"
            >
              + 초대 링크 생성
            </button>
          </div>
          {invites.length === 0 ? (
            <div className="p-8 text-center text-slate-500 bg-white border border-slate-200 rounded-xl">
              <p>생성된 초대 링크가 없습니다.</p>
            </div>
          ) : (
            <div className="space-y-3">
              {invites.map((invite) => {
                const isExpired = invite.expires_at && new Date(invite.expires_at) < new Date();
                const isUsedUp = invite.used_count >= invite.max_uses;

                return (
                  <div key={invite.id} className="p-4 bg-white border border-slate-200 rounded-xl">
                    <div className="flex items-center justify-between">
                      <div>
                        <div className="flex items-center gap-2">
                          <code className="px-2 py-1 bg-slate-100 rounded text-sm font-mono">
                            {invite.invite_code}
                          </code>
                          {isExpired && (
                            <span className="px-2 py-0.5 text-xs font-medium rounded bg-red-100 text-red-700">
                              만료됨
                            </span>
                          )}
                          {isUsedUp && !isExpired && (
                            <span className="px-2 py-0.5 text-xs font-medium rounded bg-slate-100 text-slate-700">
                              사용 완료
                            </span>
                          )}
                        </div>
                        <div className="text-sm text-slate-500 mt-1">
                          <span>사용: {invite.used_count}/{invite.max_uses}</span>
                          {invite.expires_at && (
                            <span className="ml-3">
                              만료: {new Date(invite.expires_at).toLocaleDateString('ko-KR')}
                            </span>
                          )}
                        </div>
                      </div>
                      <div className="flex items-center gap-2">
                        {!isExpired && !isUsedUp && (
                          <button
                            onClick={() => copyInviteLink(invite.invite_code)}
                            className="px-3 py-1.5 text-xs font-medium text-blue-600 bg-blue-50 rounded-lg hover:bg-blue-100"
                          >
                            링크 복사
                          </button>
                        )}
                        <button
                          onClick={() => deleteInvite(invite.id)}
                          className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100"
                        >
                          삭제
                        </button>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      )}

      {/* Create Invite Modal */}
      {showCreateInvite && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">초대 링크 생성</h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">
                  최대 사용 횟수
                </label>
                <input
                  type="number"
                  value={inviteMaxUses}
                  onChange={(e) => setInviteMaxUses(parseInt(e.target.value) || 1)}
                  min={1}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">
                  유효 기간 (일)
                </label>
                <input
                  type="number"
                  value={inviteExpiresInDays}
                  onChange={(e) => setInviteExpiresInDays(parseInt(e.target.value) || 7)}
                  min={1}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
              </div>
            </div>
            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setShowCreateInvite(false)}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50"
              >
                취소
              </button>
              <button
                onClick={createInvite}
                className="flex-1 px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700"
              >
                생성
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Virtual Staff Modal */}
      {showVirtualStaffModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg p-6 max-h-[90vh] overflow-y-auto">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">
              {editingVirtualStaff ? '가상 매니저 수정' : '가상 매니저 추가'}
            </h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">이름 *</label>
                <input
                  type="text"
                  value={vsForm.name}
                  onChange={(e) => setVsForm({ ...vsForm, name: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                  placeholder="이름"
                />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">전화번호</label>
                  <input
                    type="text"
                    value={vsForm.phone}
                    onChange={(e) => setVsForm({ ...vsForm, phone: e.target.value })}
                    className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    placeholder="010-0000-0000"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">직업</label>
                  <input
                    type="text"
                    value={vsForm.job}
                    onChange={(e) => setVsForm({ ...vsForm, job: e.target.value })}
                    className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    placeholder="대학생, 직장인 등"
                  />
                </div>
              </div>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4">
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">나이</label>
                  <input
                    type="number"
                    value={vsForm.age}
                    onChange={(e) => setVsForm({ ...vsForm, age: e.target.value })}
                    className="w-full px-3 md:px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    placeholder="25"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">키</label>
                  <input
                    type="number"
                    value={vsForm.height}
                    onChange={(e) => setVsForm({ ...vsForm, height: e.target.value })}
                    className="w-full px-3 md:px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    placeholder="165"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">몸무게</label>
                  <input
                    type="number"
                    value={vsForm.weight}
                    onChange={(e) => setVsForm({ ...vsForm, weight: e.target.value })}
                    className="w-full px-3 md:px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    placeholder="50"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">사이즈</label>
                  <input
                    type="text"
                    value={vsForm.body_size}
                    onChange={(e) => setVsForm({ ...vsForm, body_size: e.target.value })}
                    className="w-full px-3 md:px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    placeholder="C"
                  />
                </div>
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">MBTI</label>
                <input
                  type="text"
                  value={vsForm.mbti}
                  onChange={(e) => setVsForm({ ...vsForm, mbti: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                  placeholder="ENFP"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">특기 (쉼표로 구분)</label>
                <input
                  type="text"
                  value={vsForm.specialties}
                  onChange={(e) => setVsForm({ ...vsForm, specialties: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                  placeholder="마사지, 대화, 요리"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">소개</label>
                <textarea
                  value={vsForm.bio}
                  onChange={(e) => setVsForm({ ...vsForm, bio: e.target.value })}
                  rows={3}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500 resize-none"
                  placeholder="자기소개..."
                />
              </div>
            </div>
            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setShowVirtualStaffModal(false)}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50"
              >
                취소
              </button>
              <button
                onClick={saveVirtualStaff}
                disabled={!vsForm.name.trim()}
                className="flex-1 px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700 disabled:bg-slate-400"
              >
                {editingVirtualStaff ? '수정' : '추가'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
