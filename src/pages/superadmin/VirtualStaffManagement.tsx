import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import ToggleSwitch from '../../components/ToggleSwitch';

interface VirtualStaff {
  id: string;
  name: string;
  phone: string | null;
  bio: string | null;
  store_id: number;
  store_name: string;
  store_type: string | null;
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
  is_visible: boolean;
}

interface Store {
  id: number;
  name: string;
  store_type: string | null;
}

export default function VirtualStaffManagement() {
  const { user } = useAuth();
  const [staffList, setStaffList] = useState<VirtualStaff[]>([]);
  const [stores, setStores] = useState<Store[]>([]);
  const [loading, setLoading] = useState(true);
  const [storeFilterQuery, setStoreFilterQuery] = useState('');
  const [selectedStoreId, setSelectedStoreId] = useState<number | null>(null);
  const [showStoreDropdown, setShowStoreDropdown] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');

  // Add/Edit modal
  const [showModal, setShowModal] = useState(false);
  const [editingStaff, setEditingStaff] = useState<VirtualStaff | null>(null);
  const [formData, setFormData] = useState({ name: '', phone: '', bio: '', store_id: 0, store_name: '' });
  const [formStoreQuery, setFormStoreQuery] = useState('');
  const [showFormStoreDropdown, setShowFormStoreDropdown] = useState(false);
  const [saving, setSaving] = useState(false);
  const [selectedStaff, setSelectedStaff] = useState<VirtualStaff | null>(null);
  const [viewingPhoto, setViewingPhoto] = useState<string | null>(null);

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchData();
    }
  }, [user]);

  const searchStores = async (query: string) => {
    if (!query.trim()) {
      setStores([]);
      return;
    }
    const { data } = await supabase
      .from('stores')
      .select('id, name, store_type')
      .ilike('name', `%${query}%`)
      .order('name')
      .limit(10);
    setStores(data || []);
  };

  const fetchData = async () => {
    // Fetch virtual staff with store info
    const { data: staffData } = await supabase
      .from('virtual_staff')
      .select('*, store:stores(name, store_type)')
      .order('name', { ascending: true });

    const mapped = (staffData || []).map(s => ({
      id: s.id,
      name: s.name,
      phone: s.phone,
      bio: s.bio,
      store_id: s.store_id,
      store_name: (s.store as { name: string; store_type: string | null } | null)?.name || '알 수 없음',
      store_type: (s.store as { name: string; store_type: string | null } | null)?.store_type || null,
      created_at: s.created_at,
      profile_photo_url: s.profile_photo_url,
      age: s.age,
      height: s.height,
      weight: s.weight,
      body_size: s.body_size,
      job: s.job,
      mbti: s.mbti,
      is_smoker: s.is_smoker,
      personality: s.personality,
      style: s.style,
      skin_tone: s.skin_tone,
      hair_length: s.hair_length,
      hair_style: s.hair_style,
      hair_color: s.hair_color,
      is_waxed: s.is_waxed,
      specialties: s.specialties,
      nationalities: s.nationalities,
      languages: s.languages,
      is_visible: s.is_visible ?? true
    }));
    setStaffList(mapped);
    setLoading(false);
  };

  const filteredStaff = staffList.filter(s => {
    const matchesStore = !selectedStoreId || s.store_id === selectedStoreId;
    const matchesSearch = searchQuery === '' ||
      s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      s.store_name.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesStore && matchesSearch;
  });

  // stores is now populated by server-side search

  const openAddModal = () => {
    setEditingStaff(null);
    setFormData({ name: '', phone: '', bio: '', store_id: 0, store_name: '' });
    setFormStoreQuery('');
    setShowModal(true);
  };

  const openEditModal = (staff: VirtualStaff) => {
    setEditingStaff(staff);
    setFormData({
      name: staff.name,
      phone: staff.phone || '',
      bio: staff.bio || '',
      store_id: staff.store_id,
      store_name: staff.store_name
    });
    setFormStoreQuery(staff.store_name);
    setShowModal(true);
  };

  const handleSave = async () => {
    if (!formData.name.trim() || !formData.store_id) {
      alert('이름과 소속 가게를 입력해주세요.');
      return;
    }

    setSaving(true);

    if (editingStaff) {
      // Update
      const { error } = await supabase
        .from('virtual_staff')
        .update({
          name: formData.name.trim(),
          phone: formData.phone.trim() || null,
          bio: formData.bio.trim() || null,
          store_id: formData.store_id
        })
        .eq('id', editingStaff.id);

      if (!error) {
        setStaffList(prev => prev.map(s =>
          s.id === editingStaff.id
            ? { ...s, name: formData.name.trim(), phone: formData.phone.trim() || null, bio: formData.bio.trim() || null, store_id: formData.store_id, store_name: formData.store_name || '알 수 없음' }
            : s
        ));
        setShowModal(false);
      } else {
        alert('수정 중 오류가 발생했습니다.');
      }
    } else {
      // Create
      const { data, error } = await supabase
        .from('virtual_staff')
        .insert({
          name: formData.name.trim(),
          phone: formData.phone.trim() || null,
          bio: formData.bio.trim() || null,
          store_id: formData.store_id,
          created_by_admin_id: user?.id
        })
        .select()
        .single();

      if (!error && data) {
        setStaffList(prev => [{
          id: data.id,
          name: data.name,
          phone: data.phone,
          bio: data.bio,
          store_id: data.store_id,
          store_name: formData.store_name || '알 수 없음',
          store_type: null,
          created_at: data.created_at,
          profile_photo_url: null,
          age: null,
          height: null,
          weight: null,
          body_size: null,
          job: null,
          mbti: null,
          is_smoker: null,
          personality: null,
          style: null,
          skin_tone: null,
          hair_length: null,
          hair_style: null,
          hair_color: null,
          is_waxed: null,
          specialties: null,
          nationalities: null,
          languages: null,
          is_visible: true
        }, ...prev]);
        setShowModal(false);
      } else {
        alert('추가 중 오류가 발생했습니다.');
      }
    }

    setSaving(false);
  };

  const handleDelete = async (staff: VirtualStaff) => {
    if (!confirm(`"${staff.name}" 매니저를 삭제하시겠습니까?`)) return;

    const { error } = await supabase
      .from('virtual_staff')
      .delete()
      .eq('id', staff.id);

    if (!error) {
      setStaffList(prev => prev.filter(s => s.id !== staff.id));
    } else {
      alert('삭제 중 오류가 발생했습니다.');
    }
  };

  const handleStaffVisibilityChange = async (staffId: string, isVisible: boolean) => {
    // Optimistic update
    setStaffList(prev => prev.map(s =>
      s.id === staffId ? { ...s, is_visible: isVisible } : s
    ));

    const { error } = await supabase
      .from('virtual_staff')
      .update({ is_visible: isVisible })
      .eq('id', staffId);

    if (error) {
      // Revert on error
      setStaffList(prev => prev.map(s =>
        s.id === staffId ? { ...s, is_visible: !isVisible } : s
      ));
      console.error('Failed to update staff visibility:', error);
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
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-2">
          <Link to="/superadmin" className="text-slate-400 hover:text-slate-600">←</Link>
          <h1 className="text-2xl font-bold text-slate-900">등록 매니저 관리</h1>
          <span className="text-slate-400">({filteredStaff.length}명)</span>
          <span className="px-2 py-1 bg-purple-50 text-purple-600 text-xs rounded">실장 등록</span>
        </div>
        <button
          onClick={openAddModal}
          className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
        >
          + 매니저 추가
        </button>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap gap-4 mb-6">
        <input
          type="text"
          placeholder="매니저 이름 검색..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="flex-1 min-w-[200px] px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        <div className="relative">
          <input
            type="text"
            placeholder="가게 필터..."
            value={storeFilterQuery}
            onChange={(e) => {
              setStoreFilterQuery(e.target.value);
              setShowStoreDropdown(true);
              if (e.target.value === '') {
                setSelectedStoreId(null);
                setStores([]);
              } else {
                searchStores(e.target.value);
              }
            }}
            onFocus={() => setShowStoreDropdown(true)}
            onBlur={() => setTimeout(() => setShowStoreDropdown(false), 200)}
            className="w-48 px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
          />
          {selectedStoreId && (
            <button
              onClick={() => { setSelectedStoreId(null); setStoreFilterQuery(''); }}
              className="absolute right-2 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600"
            >
              ×
            </button>
          )}
          {showStoreDropdown && storeFilterQuery && stores.length > 0 && (
            <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-slate-200 rounded-lg shadow-lg z-10 max-h-60 overflow-y-auto">
              {stores.map(store => (
                <button
                  key={store.id}
                  onClick={() => {
                    setSelectedStoreId(store.id);
                    setStoreFilterQuery(store.name);
                    setShowStoreDropdown(false);
                  }}
                  className="w-full px-4 py-2 text-left text-sm hover:bg-slate-50 truncate"
                >
                  {store.name}
                  {store.store_type && <span className="text-orange-500 ml-1">({store.store_type})</span>}
                </button>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Staff List */}
      <div className="space-y-3">
        {filteredStaff.map((staff) => (
          <div
            key={staff.id}
            className="p-4 bg-white border border-slate-200 rounded-xl hover:border-slate-300 transition-colors cursor-pointer"
            onClick={() => setSelectedStaff(staff)}
          >
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-lg font-bold text-white overflow-hidden flex-shrink-0">
                {staff.profile_photo_url ? (
                  <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
                ) : (
                  staff.name.charAt(0)
                )}
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <span className="font-medium text-slate-900">{staff.name}</span>
                  {staff.age && <span className="text-xs text-slate-400">{staff.age}세</span>}
                  <Link
                    to={`/store/${staff.store_id}`}
                    onClick={(e) => e.stopPropagation()}
                    className="px-2 py-0.5 bg-slate-100 text-slate-600 text-xs rounded hover:bg-slate-200"
                  >
                    {staff.store_name}
                    {staff.store_type && <span className="text-orange-500 ml-1">({staff.store_type})</span>}
                  </Link>
                </div>
                {staff.bio && (
                  <p className="text-sm text-slate-500 truncate">{staff.bio}</p>
                )}
                <div className="flex flex-wrap items-center gap-x-4 gap-y-1 mt-2 text-xs text-slate-400">
                  {staff.phone && <span>{staff.phone}</span>}
                  <span>{new Date(staff.created_at).toLocaleDateString('ko-KR')} 등록</span>
                </div>
              </div>
              <div className="flex items-center gap-2 shrink-0">
                <div className="flex items-center gap-1 mr-2">
                  <span className="text-xs text-slate-400">노출</span>
                  <ToggleSwitch
                    enabled={staff.is_visible}
                    onChange={(v) => handleStaffVisibilityChange(staff.id, v)}
                    size="sm"
                  />
                </div>
                <button
                  onClick={(e) => { e.stopPropagation(); openEditModal(staff); }}
                  className="px-3 py-1.5 text-xs font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors"
                >
                  수정
                </button>
                <button
                  onClick={(e) => { e.stopPropagation(); handleDelete(staff); }}
                  className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors"
                >
                  삭제
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      {filteredStaff.length === 0 && (
        <div className="p-8 text-center text-slate-500">
          {searchQuery || selectedStoreId ? '검색 결과가 없습니다.' : '등록된 매니저가 없습니다.'}
        </div>
      )}

      {/* Detail Modal */}
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
                    className="text-sm text-slate-500 hover:text-red-600"
                  >
                    {selectedStaff.store_name}
                    {selectedStaff.store_type && <span className="text-orange-500 ml-1">({selectedStaff.store_type})</span>}
                    {' →'}
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

            <div className="flex gap-2 mt-6">
              <Link
                to={`/virtual-staff/${selectedStaff.id}`}
                className="flex-1 px-4 py-2 text-center text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors font-medium"
              >
                상세 페이지
              </Link>
              <button
                onClick={() => {
                  setSelectedStaff(null);
                  openEditModal(selectedStaff);
                }}
                className="flex-1 px-4 py-2 text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors font-medium"
              >
                수정
              </button>
              <button
                onClick={() => {
                  handleDelete(selectedStaff);
                  setSelectedStaff(null);
                }}
                className="flex-1 px-4 py-2 text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors font-medium"
              >
                삭제
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Add/Edit Modal */}
      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">
              {editingStaff ? '매니저 수정' : '매니저 추가'}
            </h2>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">이름 *</label>
                <input
                  type="text"
                  value={formData.name}
                  onChange={(e) => setFormData(prev => ({ ...prev, name: e.target.value }))}
                  placeholder="매니저 이름"
                  className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>

              <div className="relative">
                <label className="block text-sm font-medium text-slate-700 mb-1">소속 가게 *</label>
                <input
                  type="text"
                  value={formStoreQuery}
                  onChange={(e) => {
                    setFormStoreQuery(e.target.value);
                    setShowFormStoreDropdown(true);
                    if (e.target.value === '') {
                      setFormData(prev => ({ ...prev, store_id: 0, store_name: '' }));
                      setStores([]);
                    } else {
                      searchStores(e.target.value);
                    }
                  }}
                  onFocus={() => setShowFormStoreDropdown(true)}
                  onBlur={() => setTimeout(() => setShowFormStoreDropdown(false), 200)}
                  placeholder="가게 이름 검색..."
                  className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
                {showFormStoreDropdown && formStoreQuery && (
                  <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-slate-200 rounded-lg shadow-lg z-10 max-h-40 overflow-y-auto">
                    {stores.length > 0 ? stores.map(store => (
                      <button
                        key={store.id}
                        type="button"
                        onClick={() => {
                          setFormData(prev => ({ ...prev, store_id: store.id, store_name: store.name }));
                          setFormStoreQuery(store.name);
                          setShowFormStoreDropdown(false);
                        }}
                        className="w-full px-4 py-2 text-left text-sm hover:bg-slate-50 truncate"
                      >
                        {store.name}
                        {store.store_type && <span className="text-orange-500 ml-1">({store.store_type})</span>}
                      </button>
                    )) : (
                      <div className="px-4 py-2 text-sm text-slate-400">검색 결과 없음</div>
                    )}
                  </div>
                )}
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">전화번호</label>
                <input
                  type="tel"
                  value={formData.phone}
                  onChange={(e) => setFormData(prev => ({ ...prev, phone: e.target.value }))}
                  placeholder="010-0000-0000"
                  className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">소개</label>
                <textarea
                  value={formData.bio}
                  onChange={(e) => setFormData(prev => ({ ...prev, bio: e.target.value }))}
                  placeholder="매니저 소개"
                  rows={3}
                  className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>
            </div>

            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setShowModal(false)}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={handleSave}
                disabled={saving}
                className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
              >
                {saving ? '저장 중...' : (editingStaff ? '수정' : '추가')}
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
