import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store {
  id: number;
  name: string;
  address: string;
  store_type: string | null;
  phone: string | null;
  owner_id: string;
  created_at: string;
  owner?: { name: string; email: string };
  adminCount: number;
  staffCount: number;
}

export default function StoreManagement() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [editingStore, setEditingStore] = useState<Store | null>(null);
  const [editForm, setEditForm] = useState({ name: '', address: '', store_type: '', phone: '' });

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchStores();
    }
  }, [user]);

  const fetchStores = async () => {
    const { data: storesData } = await supabase
      .from('stores')
      .select('*')
      .order('created_at', { ascending: false });

    if (!storesData) {
      setLoading(false);
      return;
    }

    // Fetch owners
    const ownerIds = [...new Set(storesData.map(s => s.owner_id))];
    const { data: ownersData } = await supabase
      .from('profiles')
      .select('id, name, email')
      .in('id', ownerIds);

    const ownersMap = new Map(ownersData?.map(o => [o.id, o]) || []);

    // Fetch admin and staff counts
    const storeIds = storesData.map(s => s.id);
    const { data: adminsData } = await supabase
      .from('store_admins')
      .select('store_id')
      .in('store_id', storeIds);

    const { data: staffData } = await supabase
      .from('store_staff')
      .select('store_id')
      .in('store_id', storeIds);

    const adminCounts: Record<number, number> = {};
    adminsData?.forEach(a => {
      adminCounts[a.store_id] = (adminCounts[a.store_id] || 0) + 1;
    });

    const staffCounts: Record<number, number> = {};
    staffData?.forEach(s => {
      staffCounts[s.store_id] = (staffCounts[s.store_id] || 0) + 1;
    });

    const storesWithDetails = storesData.map(store => ({
      ...store,
      owner: ownersMap.get(store.owner_id),
      adminCount: adminCounts[store.id] || 0,
      staffCount: staffCounts[store.id] || 0
    }));

    setStores(storesWithDetails);
    setLoading(false);
  };

  const filteredStores = stores.filter(s =>
    searchQuery === '' ||
    s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    s.address.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const openEditModal = (store: Store) => {
    setEditingStore(store);
    setEditForm({
      name: store.name,
      address: store.address,
      store_type: store.store_type || '',
      phone: store.phone || ''
    });
  };

  const updateStore = async () => {
    if (!editingStore) return;

    const { error } = await supabase
      .from('stores')
      .update({
        name: editForm.name,
        address: editForm.address,
        store_type: editForm.store_type || null,
        phone: editForm.phone || null
      })
      .eq('id', editingStore.id);

    if (!error) {
      setStores(prev => prev.map(s =>
        s.id === editingStore.id ? { ...s, ...editForm } : s
      ));
      setEditingStore(null);
    }
  };

  const deleteStore = async (storeId: number) => {
    if (!confirm('정말 이 가게를 삭제하시겠습니까? 관련된 모든 데이터(메뉴, 스케줄, 예약 등)가 함께 삭제됩니다.')) return;

    const { error } = await supabase
      .from('stores')
      .delete()
      .eq('id', storeId);

    if (!error) {
      setStores(prev => prev.filter(s => s.id !== storeId));
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
        <h1 className="text-2xl font-bold text-slate-900">가게 관리</h1>
        <span className="text-slate-400">({filteredStores.length}개)</span>
      </div>

      {/* Search */}
      <div className="mb-6">
        <input
          type="text"
          placeholder="가게 이름 또는 주소 검색..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="w-full max-w-md px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        />
      </div>

      {/* Stores List */}
      <div className="space-y-4">
        {filteredStores.map((store) => (
          <div key={store.id} className="p-5 bg-white border border-slate-200 rounded-xl">
            <div className="flex items-start justify-between mb-3">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <h3 className="font-semibold text-slate-900">{store.name}</h3>
                  {store.store_type && (
                    <span className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">
                      {store.store_type}
                    </span>
                  )}
                </div>
                <p className="text-sm text-slate-500">{store.address}</p>
                {store.phone && <p className="text-sm text-slate-400">{store.phone}</p>}
              </div>
              <div className="flex gap-2">
                <button
                  onClick={() => openEditModal(store)}
                  className="px-3 py-1.5 text-sm font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors"
                >
                  수정
                </button>
                <button
                  onClick={() => deleteStore(store.id)}
                  className="px-3 py-1.5 text-sm font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors"
                >
                  삭제
                </button>
              </div>
            </div>

            <div className="flex flex-wrap gap-4 pt-3 border-t border-slate-100">
              <div className="text-sm">
                <span className="text-slate-500">사장: </span>
                <span className="text-slate-700">{store.owner?.name || '-'}</span>
                {store.owner?.email && (
                  <span className="text-slate-400 text-xs ml-1">({store.owner.email})</span>
                )}
              </div>
              <div className="text-sm">
                <span className="text-slate-500">관리자: </span>
                <span className="text-slate-700">{store.adminCount}명</span>
              </div>
              <div className="text-sm">
                <span className="text-slate-500">매니저: </span>
                <span className="text-slate-700">{store.staffCount}명</span>
              </div>
              <div className="text-sm">
                <span className="text-slate-500">등록일: </span>
                <span className="text-slate-700">
                  {new Date(store.created_at).toLocaleDateString('ko-KR')}
                </span>
              </div>
            </div>
          </div>
        ))}
      </div>

      {filteredStores.length === 0 && (
        <div className="p-8 bg-slate-50 rounded-xl text-center text-slate-500">
          {searchQuery ? '검색 결과가 없습니다.' : '등록된 가게가 없습니다.'}
        </div>
      )}

      {/* Edit Modal */}
      {editingStore && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">가게 정보 수정</h2>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-slate-600 mb-1">가게 이름</label>
                <input
                  type="text"
                  value={editForm.name}
                  onChange={(e) => setEditForm({ ...editForm, name: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-600 mb-1">주소</label>
                <input
                  type="text"
                  value={editForm.address}
                  onChange={(e) => setEditForm({ ...editForm, address: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-600 mb-1">업종</label>
                <input
                  type="text"
                  value={editForm.store_type}
                  onChange={(e) => setEditForm({ ...editForm, store_type: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-600 mb-1">전화번호</label>
                <input
                  type="text"
                  value={editForm.phone}
                  onChange={(e) => setEditForm({ ...editForm, phone: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                />
              </div>
            </div>

            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setEditingStore(null)}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={updateStore}
                className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
              >
                저장
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
