import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Staff {
  id: string;
  name: string;
  email?: string;
  phone: string | null;
  bio: string | null;
  specialties: string[] | null;
  profile_photo_url: string | null;
  age: number | null;
  height: number | null;
  weight: number | null;
  created_by_admin_id: string | null;
  isVirtual?: boolean;
  store_id?: number;
  store?: { name: string };
  stores?: { id: number; name: string }[];
}

interface VirtualStaff {
  id: string;
  store_id: number;
  name: string;
  phone: string | null;
  bio: string | null;
  specialties: string[] | null;
  profile_photo_url: string | null;
  age: number | null;
  height: number | null;
  weight: number | null;
  created_by_admin_id: string | null;
}

interface Store {
  id: number;
  name: string;
}

const SPECIALTIES_OPTIONS = ['스웨디시', '아로마', '타이', '스포츠', '딥티슈', '경락', '발마사지', '왁싱'];

export default function StaffManage() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [stores, setStores] = useState<Store[]>([]);
  const [selectedStoreId, setSelectedStoreId] = useState<number | 'all' | null>(null);
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [favoriteStaff, setFavoriteStaff] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [showAddModal, setShowAddModal] = useState(false);
  const [newStaffName, setNewStaffName] = useState('');
  const [newStaffPhone, setNewStaffPhone] = useState('');
  const [newStaffBio, setNewStaffBio] = useState('');
  const [newStaffSpecialties, setNewStaffSpecialties] = useState<string[]>([]);
  const [adding, setAdding] = useState(false);

  useEffect(() => {
    if (user) {
      fetchStores();
      fetchFavorites();
    }
  }, [user]);

  useEffect(() => {
    if (selectedStoreId !== null) {
      fetchStaff();
    }
  }, [selectedStoreId]);

  const fetchStores = async () => {
    if (!user) return;

    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id, store:stores(id, name)')
      .eq('admin_id', user.id);

    const { data: ownedStores } = await supabase
      .from('stores')
      .select('id, name')
      .eq('owner_id', user.id);

    const allStores: Store[] = [];
    const seenIds = new Set<number>();

    ownedStores?.forEach(s => {
      if (!seenIds.has(s.id)) {
        allStores.push(s);
        seenIds.add(s.id);
      }
    });

    adminStores?.forEach(s => {
      const store = s.store as unknown as Store;
      if (store && !seenIds.has(store.id)) {
        allStores.push(store);
        seenIds.add(store.id);
      }
    });

    setStores(allStores);
    if (allStores.length > 0 && selectedStoreId === null) {
      setSelectedStoreId(allStores.length > 1 ? 'all' : allStores[0].id);
    }
    setLoading(false);
  };

  const fetchFavorites = async () => {
    if (!user) return;
    const { data } = await supabase
      .from('favorites')
      .select('target_staff_id')
      .eq('user_id', user.id)
      .eq('target_type', 'staff');

    if (data) {
      setFavoriteStaff(new Set(data.map(f => f.target_staff_id).filter(Boolean)));
    }
  };

  const toggleFavorite = async (staffId: string) => {
    if (!user) return;

    const isFavorite = favoriteStaff.has(staffId);

    if (isFavorite) {
      await supabase
        .from('favorites')
        .delete()
        .eq('user_id', user.id)
        .eq('target_type', 'staff')
        .eq('target_staff_id', staffId);

      setFavoriteStaff(prev => {
        const next = new Set(prev);
        next.delete(staffId);
        return next;
      });
    } else {
      await supabase
        .from('favorites')
        .insert({ user_id: user.id, target_type: 'staff', target_staff_id: staffId });

      setFavoriteStaff(prev => new Set([...prev, staffId]));
    }
  };

  const fetchStaff = async () => {
    if (!user || selectedStoreId === null) return;

    const storeIds = selectedStoreId === 'all' ? stores.map(s => s.id) : [selectedStoreId];

    // Fetch real staff (from profiles via store_staff)
    const { data: storeStaff } = await supabase
      .from('store_staff')
      .select('staff_id, store_id, store:stores(id, name)')
      .in('store_id', storeIds);

    const staffIds = [...new Set(storeStaff?.map(s => s.staff_id) || [])];

    let realStaff: Staff[] = [];
    if (staffIds.length > 0) {
      const { data: staffData } = await supabase
        .from('profiles')
        .select('*')
        .in('id', staffIds);

      // Group stores by staff_id
      const staffStoresMap: Record<string, { id: number; name: string }[]> = {};
      storeStaff?.forEach(ss => {
        const storeInfo = ss.store as { id: number; name: string };
        if (!staffStoresMap[ss.staff_id]) {
          staffStoresMap[ss.staff_id] = [];
        }
        staffStoresMap[ss.staff_id].push({ id: storeInfo.id, name: storeInfo.name });
      });

      realStaff = (staffData || []).map(s => {
        const staffStores = staffStoresMap[s.id] || [];
        return {
          ...s,
          isVirtual: false,
          store_id: staffStores[0]?.id,
          store: staffStores[0] ? { name: staffStores[0].name } : undefined,
          stores: staffStores,
        };
      });
    }

    // Fetch virtual staff (admin-created, store-specific)
    let virtualStaffQuery = supabase
      .from('virtual_staff')
      .select('*, store:stores(id, name)');

    if (selectedStoreId !== 'all') {
      virtualStaffQuery = virtualStaffQuery.eq('store_id', selectedStoreId);
    } else {
      virtualStaffQuery = virtualStaffQuery.in('store_id', storeIds);
    }

    const { data: virtualStaffData } = await virtualStaffQuery;

    const virtualStaff: Staff[] = (virtualStaffData || []).map(s => {
      const storeInfo = s.store as { id: number; name: string };
      return {
        ...s,
        isVirtual: true,
        created_by_admin_id: s.created_by_admin_id,
        store: { name: storeInfo.name },
        stores: [{ id: storeInfo.id, name: storeInfo.name }],
      };
    });

    setStaffList([...realStaff, ...virtualStaff]);
  };

  const handleAddStaff = async () => {
    if (!user || !selectedStoreId || selectedStoreId === 'all') {
      alert('가게를 선택해주세요.');
      return;
    }
    if (!newStaffName.trim()) {
      alert('매니저 이름을 입력하세요.');
      return;
    }

    setAdding(true);

    // Create virtual staff (admin-created, store-specific)
    const { error } = await supabase
      .from('virtual_staff')
      .insert({
        store_id: selectedStoreId as number,
        name: newStaffName.trim(),
        phone: newStaffPhone.trim() || null,
        bio: newStaffBio.trim() || null,
        specialties: newStaffSpecialties.length > 0 ? newStaffSpecialties : null,
        created_by_admin_id: user.id,
      });

    if (error) {
      console.error(error);
      alert('매니저 추가 중 오류가 발생했습니다.');
      setAdding(false);
      return;
    }

    setNewStaffName('');
    setNewStaffPhone('');
    setNewStaffBio('');
    setNewStaffSpecialties([]);
    setShowAddModal(false);
    setAdding(false);
    fetchStaff();
  };

  const startChatWithStaff = async (staffId: string, storeId: number) => {
    if (!user) return;

    // Check if conversation already exists
    const { data: existing } = await supabase
      .from('conversations')
      .select('id')
      .eq('store_id', storeId)
      .eq('admin_id', user.id)
      .eq('staff_id', staffId)
      .maybeSingle();

    if (existing) {
      navigate(`/chat/${existing.id}`);
      return;
    }

    // Create new conversation
    const { data: newConv, error } = await supabase
      .from('conversations')
      .insert({
        store_id: storeId,
        admin_id: user.id,
        staff_id: staffId
      })
      .select()
      .single();

    if (!error && newConv) {
      navigate(`/chat/${newConv.id}`);
    }
  };

  const handleRemoveStaff = async (staffId: string, staffName: string, isVirtual: boolean, staffStoreId?: number) => {
    if (!confirm(`${staffName} 매니저를 ${isVirtual ? '삭제' : '이 가게에서 제거'}하시겠습니까?`)) return;

    if (isVirtual) {
      // Delete virtual staff entirely
      const { error } = await supabase
        .from('virtual_staff')
        .delete()
        .eq('id', staffId);

      if (error) {
        alert('매니저 삭제 중 오류가 발생했습니다.');
      } else {
        fetchStaff();
      }
    } else {
      // Remove real staff from store
      const storeIdToUse = selectedStoreId === 'all' ? staffStoreId : selectedStoreId;
      if (!storeIdToUse) return;

      const { error } = await supabase
        .from('store_staff')
        .delete()
        .eq('store_id', storeIdToUse)
        .eq('staff_id', staffId);

      if (error) {
        alert('매니저 제거 중 오류가 발생했습니다.');
      } else {
        fetchStaff();
      }
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">매니저 관리</h1>
        <button
          onClick={() => setShowAddModal(true)}
          disabled={selectedStoreId === 'all'}
          className={`px-4 py-2 text-white text-sm font-medium rounded-lg transition-colors ${
            selectedStoreId === 'all' ? 'bg-slate-400 cursor-not-allowed' : 'bg-red-600 hover:bg-red-700'
          }`}
          title={selectedStoreId === 'all' ? '가게를 선택해주세요' : ''}
        >
          + 매니저 추가
        </button>
      </div>

      {/* Store Selector */}
      {stores.length > 0 && (
        <div className="mb-4">
          <select
            value={selectedStoreId === 'all' ? 'all' : selectedStoreId || ''}
            onChange={(e) => setSelectedStoreId(e.target.value === 'all' ? 'all' : Number(e.target.value))}
            className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
          >
            {stores.length > 1 && <option value="all">전체 가게</option>}
            {stores.map((store) => (
              <option key={store.id} value={store.id}>{store.name}</option>
            ))}
          </select>
        </div>
      )}

      <div className="mb-4">
        <span className="text-sm text-slate-500">총 {staffList.length}명</span>
      </div>

      <div className="flex flex-col gap-3">
        {staffList.map((staff) => {
          const staffContent = (
            <>
              <div className="w-16 h-16 rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-lg font-bold text-white overflow-hidden flex-shrink-0">
                {staff.profile_photo_url ? (
                  <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
                ) : (
                  staff.name.charAt(0)
                )}
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1 flex-wrap">
                  <h3 className="font-semibold text-slate-900">{staff.name}</h3>
                  {staff.isVirtual ? (
                    <span className="px-2 py-0.5 bg-purple-50 text-purple-600 text-xs font-medium rounded">관리자 등록</span>
                  ) : (
                    <span className="px-2 py-0.5 bg-green-50 text-green-600 text-xs font-medium rounded">본인 등록</span>
                  )}
                  {selectedStoreId === 'all' && staff.stores && staff.stores.length > 0 && (
                    staff.stores.map(store => (
                      <span key={store.id} className="px-2 py-0.5 bg-red-50 text-red-600 text-xs font-medium rounded">{store.name}</span>
                    ))
                  )}
                  <div className="flex gap-1 text-xs text-slate-500">
                    {staff.age && <span>{staff.age}세</span>}
                    {staff.height && <span>{staff.height}cm</span>}
                    {staff.weight && <span>{staff.weight}kg</span>}
                  </div>
                </div>
                <p className="text-sm text-slate-600 line-clamp-1 mb-1">{staff.bio || '소개 없음'}</p>
                {staff.phone && <span className="text-xs text-slate-400">{staff.phone}</span>}
                {staff.specialties && staff.specialties.length > 0 && (
                  <div className="flex flex-wrap gap-1 mt-2">
                    {staff.specialties.map((s) => (
                      <span key={s} className="px-2 py-0.5 bg-orange-50 text-orange-600 rounded text-xs">{s}</span>
                    ))}
                  </div>
                )}
              </div>
            </>
          );

          return (
            <div key={staff.id} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
              {staff.isVirtual ? (
                <Link to={`/virtual-staff/${staff.id}`} className="flex gap-4">{staffContent}</Link>
              ) : (
                <Link to={`/staff/${staff.id}`} className="flex gap-4">{staffContent}</Link>
              )}
              <div className="absolute top-4 right-4 flex items-center gap-2">
                {!staff.isVirtual && staff.store_id && (
                  <button
                    className="w-8 h-8 flex items-center justify-center text-slate-400 hover:text-blue-500 hover:bg-blue-50 rounded-full transition-colors"
                    onClick={(e) => { e.preventDefault(); startChatWithStaff(staff.id, staff.store_id!); }}
                    title="메시지 보내기"
                  >
                    💬
                  </button>
                )}
                {!staff.isVirtual && (
                  <button
                    className={`w-8 h-8 flex items-center justify-center text-xl rounded-full transition-colors ${
                      favoriteStaff.has(staff.id) ? 'text-red-500 bg-red-50' : 'text-slate-300 hover:text-red-500 hover:bg-red-50'
                    }`}
                    onClick={(e) => { e.preventDefault(); toggleFavorite(staff.id); }}
                  >
                    {favoriteStaff.has(staff.id) ? '♥' : '♡'}
                  </button>
                )}
                {(staff.isVirtual || selectedStoreId !== 'all') && (
                  <button
                    className="w-8 h-8 flex items-center justify-center text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-full transition-colors"
                    onClick={(e) => { e.preventDefault(); handleRemoveStaff(staff.id, staff.name, staff.isVirtual || false, staff.store_id); }}
                    title={staff.isVirtual ? "삭제" : "가게에서 제거"}
                  >
                    ✕
                  </button>
                )}
              </div>
            </div>
          );
        })}
      </div>

      {staffList.length === 0 && (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">등록된 매니저가 없습니다.</p>
        </div>
      )}

      {/* Add Staff Modal */}
      {showAddModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-slate-900 mb-4">매니저 추가</h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">이름 *</label>
                <input
                  type="text"
                  value={newStaffName}
                  onChange={(e) => setNewStaffName(e.target.value)}
                  placeholder="매니저 이름"
                  className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">연락처</label>
                <input
                  type="tel"
                  value={newStaffPhone}
                  onChange={(e) => setNewStaffPhone(e.target.value)}
                  placeholder="010-0000-0000"
                  className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">소개</label>
                <textarea
                  value={newStaffBio}
                  onChange={(e) => setNewStaffBio(e.target.value)}
                  placeholder="매니저 소개"
                  rows={3}
                  className="w-full px-4 py-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">전문 분야</label>
                <div className="flex flex-wrap gap-2">
                  {SPECIALTIES_OPTIONS.map((spec) => (
                    <button
                      key={spec}
                      type="button"
                      onClick={() => setNewStaffSpecialties(prev =>
                        prev.includes(spec) ? prev.filter(s => s !== spec) : [...prev, spec]
                      )}
                      className={`px-3 py-1.5 text-sm rounded-lg border transition-colors ${
                        newStaffSpecialties.includes(spec)
                          ? 'bg-red-600 text-white border-red-600'
                          : 'bg-white text-slate-600 border-slate-200 hover:border-red-600'
                      }`}
                    >
                      {spec}
                    </button>
                  ))}
                </div>
              </div>
            </div>
            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setShowAddModal(false)}
                className="flex-1 py-3 bg-slate-100 text-slate-600 font-medium rounded-lg hover:bg-slate-200 transition-colors"
              >
                취소
              </button>
              <button
                onClick={handleAddStaff}
                disabled={adding}
                className="flex-1 py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
              >
                {adding ? '추가 중...' : '추가'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
