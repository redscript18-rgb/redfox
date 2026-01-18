import { useState, useEffect } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store {
  id: number;
  name: string;
  address: string;
}

interface Admin {
  id: string;
  name: string;
  email: string;
}

export default function StoreManage() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [storeAdmins, setStoreAdmins] = useState<Record<number, Admin[]>>({});
  const [loading, setLoading] = useState(true);

  const [showStoreForm, setShowStoreForm] = useState(false);
  const [editingStore, setEditingStore] = useState<Store | null>(null);
  const [storeName, setStoreName] = useState('');
  const [storeAddress, setStoreAddress] = useState('');
  const [savingStore, setSavingStore] = useState(false);

  const [addAdminStoreId, setAddAdminStoreId] = useState<number | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState<Admin[]>([]);
  const [searching, setSearching] = useState(false);
  const [addingAdmin, setAddingAdmin] = useState(false);

  const [inviteLinkStoreId, setInviteLinkStoreId] = useState<number | null>(null);
  const [inviteLink, setInviteLink] = useState('');

  useEffect(() => { if (user) fetchData(); }, [user]);

  const fetchData = async () => {
    if (!user) return;

    const { data: storesData } = await supabase.from('stores').select('*').eq('owner_id', user.id);
    const myStores = storesData || [];
    setStores(myStores);

    const adminMap: Record<number, Admin[]> = {};
    for (const store of myStores) {
      const { data: storeAdminsData } = await supabase.from('store_admins').select(`store_id, admin_id, admin:profiles!store_admins_admin_id_fkey(id, name, email)`).eq('store_id', store.id);
      adminMap[store.id] = (storeAdminsData || []).map((sa: any) => sa.admin).filter(Boolean);
    }
    setStoreAdmins(adminMap);
    setLoading(false);
  };

  const openStoreForm = (store?: Store) => {
    if (store) { setEditingStore(store); setStoreName(store.name); setStoreAddress(store.address); }
    else { setEditingStore(null); setStoreName(''); setStoreAddress(''); }
    setShowStoreForm(true);
  };

  const closeStoreForm = () => { setShowStoreForm(false); setEditingStore(null); setStoreName(''); setStoreAddress(''); };

  const handleSaveStore = async () => {
    if (!user || !storeName.trim() || !storeAddress.trim()) return;
    setSavingStore(true);

    if (editingStore) {
      const { error } = await supabase.from('stores').update({ name: storeName.trim(), address: storeAddress.trim() }).eq('id', editingStore.id);
      if (error) alert('가게 수정 실패: ' + error.message);
      else { closeStoreForm(); fetchData(); }
    } else {
      const { error } = await supabase.from('stores').insert({ name: storeName.trim(), address: storeAddress.trim(), owner_id: user.id });
      if (error) alert('가게 추가 실패: ' + error.message);
      else { closeStoreForm(); fetchData(); }
    }
    setSavingStore(false);
  };

  const handleDeleteStore = async (storeId: number) => {
    if (!confirm('이 가게를 삭제하시겠습니까? 관련된 모든 데이터가 삭제됩니다.')) return;
    const { error } = await supabase.from('stores').delete().eq('id', storeId);
    if (error) alert('가게 삭제 실패: ' + error.message);
    else fetchData();
  };

  const handleSearchUser = async () => {
    if (!searchQuery.trim()) return;
    setSearching(true);
    const { data } = await supabase.from('profiles').select('id, name, email').or(`email.ilike.%${searchQuery}%,name.ilike.%${searchQuery}%`).limit(10);
    setSearchResults(data || []);
    setSearching(false);
  };

  const handleAddAdmin = async (adminId: string, storeId?: number) => {
    const targetStoreId = storeId || addAdminStoreId;
    if (!targetStoreId) return;
    const existingAdmins = storeAdmins[targetStoreId] || [];
    if (existingAdmins.some((a) => a.id === adminId)) { alert('이미 연결된 관리자입니다.'); return; }

    setAddingAdmin(true);
    const { error } = await supabase.from('store_admins').insert({ store_id: targetStoreId, admin_id: adminId });
    if (error) alert('관리자 추가 실패: ' + error.message);
    else { setSearchQuery(''); setSearchResults([]); setAddAdminStoreId(null); fetchData(); }
    setAddingAdmin(false);
  };

  const handleRemoveAdmin = async (storeId: number, adminId: string) => {
    if (!confirm('이 관리자를 해제하시겠습니까?')) return;
    const { error } = await supabase.from('store_admins').delete().eq('store_id', storeId).eq('admin_id', adminId);
    if (error) alert('관리자 해제 실패: ' + error.message);
    else fetchData();
  };

  const generateInviteLink = (storeId: number) => {
    const store = stores.find((s) => s.id === storeId);
    if (!store) return;
    const inviteData = { storeId, ownerId: user?.id, storeName: store.name, createdAt: Date.now() };
    const inviteCode = btoa(encodeURIComponent(JSON.stringify(inviteData)));
    const link = `${window.location.origin}/invite/${inviteCode}`;
    setInviteLinkStoreId(storeId);
    setInviteLink(link);
  };

  const copyInviteLink = async () => {
    try { await navigator.clipboard.writeText(inviteLink); alert('초대 링크가 복사되었습니다.'); }
    catch { alert('복사에 실패했습니다. 링크를 직접 복사해주세요.'); }
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">가게 관리</h1>
        <button className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors" onClick={() => openStoreForm()}>+ 가게 추가</button>
      </div>

      {/* Store Form Modal */}
      {showStoreForm && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={closeStoreForm}>
          <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
            <h3 className="text-xl font-bold text-slate-900 mb-4">{editingStore ? '가게 수정' : '새 가게 추가'}</h3>
            <div className="mb-4">
              <label className="block text-sm font-medium text-slate-700 mb-2">가게명</label>
              <input type="text" value={storeName} onChange={(e) => setStoreName(e.target.value)} placeholder="가게 이름을 입력하세요" className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
            </div>
            <div className="mb-6">
              <label className="block text-sm font-medium text-slate-700 mb-2">주소</label>
              <input type="text" value={storeAddress} onChange={(e) => setStoreAddress(e.target.value)} placeholder="가게 주소를 입력하세요" className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
            </div>
            <div className="flex gap-3">
              <button className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors" onClick={closeStoreForm}>취소</button>
              <button className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400" onClick={handleSaveStore} disabled={savingStore || !storeName.trim() || !storeAddress.trim()}>
                {savingStore ? '저장 중...' : '저장'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Add Admin Modal */}
      {addAdminStoreId && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={() => setAddAdminStoreId(null)}>
          <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
            <h3 className="text-xl font-bold text-slate-900 mb-2">관리자 추가</h3>
            <p className="text-sm text-slate-500 mb-4">이메일 또는 이름으로 검색하세요</p>
            <div className="flex gap-2 mb-4">
              <input type="text" value={searchQuery} onChange={(e) => setSearchQuery(e.target.value)} placeholder="이메일 또는 이름 검색" className="flex-1 h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" onKeyDown={(e) => e.key === 'Enter' && handleSearchUser()} />
              <button className="px-4 h-11 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400" onClick={handleSearchUser} disabled={searching}>
                {searching ? '검색 중...' : '검색'}
              </button>
            </div>

            {searchResults.length > 0 && (
              <div className="flex flex-col gap-2 mb-4 max-h-48 overflow-y-auto">
                {searchResults.map((result) => (
                  <div key={result.id} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                    <div>
                      <div className="font-medium text-slate-900">{result.name}</div>
                      <div className="text-sm text-slate-500">{result.email}</div>
                    </div>
                    <button className="px-3 py-1.5 bg-red-600 text-white text-xs font-medium rounded-lg hover:bg-red-700 disabled:bg-slate-400" onClick={() => handleAddAdmin(result.id)} disabled={addingAdmin}>추가</button>
                  </div>
                ))}
              </div>
            )}

            {searchQuery && searchResults.length === 0 && !searching && (
              <p className="text-slate-500 text-sm mb-4">검색 결과가 없습니다.</p>
            )}

            <button className="w-full py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors" onClick={() => setAddAdminStoreId(null)}>닫기</button>
          </div>
        </div>
      )}

      {/* Invite Link Modal */}
      {inviteLinkStoreId && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={() => setInviteLinkStoreId(null)}>
          <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
            <h3 className="text-xl font-bold text-slate-900 mb-2">초대 링크</h3>
            <p className="text-sm text-slate-500 mb-4">이 링크를 관리자에게 공유하세요</p>
            <div className="flex gap-2 mb-4">
              <input type="text" value={inviteLink} readOnly className="flex-1 h-11 px-4 border border-slate-200 rounded-lg text-sm bg-slate-50" />
              <button className="px-4 h-11 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors" onClick={copyInviteLink}>복사</button>
            </div>
            <button className="w-full py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors" onClick={() => setInviteLinkStoreId(null)}>닫기</button>
          </div>
        </div>
      )}

      {/* Store List */}
      <section>
        <h2 className="text-lg font-semibold text-slate-900 mb-4">내 가게 목록</h2>
        {stores.length === 0 ? (
          <div className="p-8 bg-slate-50 rounded-xl text-center">
            <p className="text-slate-500">소유한 가게가 없습니다.</p>
          </div>
        ) : (
          <div className="flex flex-col gap-4">
            {stores.map((store) => (
              <div key={store.id} className="p-5 bg-white border border-slate-200 rounded-xl">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-lg font-semibold text-slate-900">{store.name}</h3>
                    <p className="text-sm text-slate-500">{store.address}</p>
                  </div>
                  <div className="flex gap-2">
                    <button className="px-3 py-1.5 bg-slate-100 text-slate-600 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors" onClick={() => openStoreForm(store)}>수정</button>
                    <button className="px-3 py-1.5 bg-red-50 text-red-600 text-sm font-medium rounded-lg hover:bg-red-100 transition-colors" onClick={() => handleDeleteStore(store.id)}>삭제</button>
                  </div>
                </div>

                {/* Admins Section */}
                <div className="pt-4 border-t border-slate-100">
                  <div className="flex items-center justify-between mb-3">
                    <h4 className="font-medium text-slate-900">관리자</h4>
                    <div className="flex gap-2">
                      {!(storeAdmins[store.id] || []).some((a) => a.id === user?.id) && (
                        <button className="px-3 py-1.5 bg-blue-50 text-blue-600 text-xs font-medium rounded-lg hover:bg-blue-100 transition-colors" onClick={() => user && handleAddAdmin(user.id, store.id)}>+ 나를 추가</button>
                      )}
                      <button className="px-3 py-1.5 bg-orange-50 text-orange-600 text-xs font-medium rounded-lg hover:bg-orange-100 transition-colors" onClick={() => { setAddAdminStoreId(store.id); setSearchQuery(''); setSearchResults([]); }}>+ 검색으로 추가</button>
                      <button className="px-3 py-1.5 bg-green-50 text-green-600 text-xs font-medium rounded-lg hover:bg-green-100 transition-colors" onClick={() => generateInviteLink(store.id)}>초대 링크</button>
                    </div>
                  </div>

                  {(storeAdmins[store.id] || []).length === 0 ? (
                    <p className="text-sm text-slate-400">연결된 관리자가 없습니다.</p>
                  ) : (
                    <div className="flex flex-col gap-2">
                      {(storeAdmins[store.id] || []).map((admin) => (
                        <div key={admin.id} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                          <div>
                            <span className="font-medium text-slate-900">{admin.name}</span>
                            <span className="ml-2 text-sm text-slate-500">{admin.email}</span>
                          </div>
                          <button className="px-2 py-1 text-xs text-red-500 hover:bg-red-50 rounded transition-colors" onClick={() => handleRemoveAdmin(store.id, admin.id)}>해제</button>
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </section>
    </div>
  );
}
