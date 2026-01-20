import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import ToggleSwitch from '../../components/ToggleSwitch';

interface Store {
  id: number;
  name: string;
  address: string;
  store_type: string | null;
  region: string | null;
  phone: string | null;
  owner_id: string;
  created_at: string;
  rating: number;
  is_visible: boolean;
  owner?: { name: string; email: string };
  adminCount: number;
  freeStaffCount: number;
  virtualStaffCount: number;
}

type SortBy = 'name' | 'created_at' | 'rating' | 'staff_count';

const PAGE_SIZE = 500;
const STORE_TYPES = ['룸', '오피', '휴게텔', '건마', '안마', '출장', '립카페', '핸플', '페티쉬', '스웨디시'];
const REGIONS = [
  '강남', '강서', '강동', '가락', '가산', '계양', '고양', '구로', '구미', '군포', '김포',
  '당산', '대구', '대전', '동탄', '동대문', '동암', '마곡', '마포', '문래동', '부산', '부천', '부평', '분당', '북창동',
  '상봉', '상동', '선릉', '서울대입구역', '수원', '시흥', '신대방', '신림', '안양',
  '역곡', '역삼', '연신내', '영등포', '오산', '용인', '의정부', '인천', '일산',
  '잠실', '장안동', '전주', '제주도', '주안', '중랑', '천안', '철산', '청주', '평택', '하남', '홍대', '화곡', '화정'
];

export default function StoreManagement() {
  const { user } = useAuth();
  const [searchParams] = useSearchParams();
  const [stores, setStores] = useState<Store[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [currentPage, setCurrentPage] = useState(1);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [sortBy, setSortBy] = useState<SortBy>('name');
  const [filterType, setFilterType] = useState(searchParams.get('type') || '');
  const [filterRegion, setFilterRegion] = useState(searchParams.get('region') || '');
  const [editingStore, setEditingStore] = useState<Store | null>(null);
  const [editForm, setEditForm] = useState({ name: '', address: '', store_type: '', region: '', phone: '' });
  const [selectedStore, setSelectedStore] = useState<Store | null>(null);
  const [storeDetails, setStoreDetails] = useState<{
    admins: { id: string; name: string; email: string }[];
    virtualStaff: { id: string; name: string }[];
    reservationCount: number;
  } | null>(null);
  const [typeCounts, setTypeCounts] = useState<Record<string, number>>({});
  const [allStoreTypes, setAllStoreTypes] = useState<string[]>([]);
  const [regionCounts, setRegionCounts] = useState<Record<string, number>>({});
  const [allRegions, setAllRegions] = useState<string[]>([]);

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchTotalCount();
      fetchStores();
      fetchTypeCounts();
      fetchRegionCounts();
    }
  }, [user, currentPage, sortBy, filterType, filterRegion]);

  const fetchTypeCounts = async () => {
    // First get all distinct store types from DB
    const { data: distinctData } = await supabase
      .from('stores')
      .select('store_type');

    const typeSet = new Set<string>();
    distinctData?.forEach(s => {
      if (s.store_type) typeSet.add(s.store_type);
    });

    // Combine with predefined types
    STORE_TYPES.forEach(t => typeSet.add(t));

    // Fetch custom types with display_order from store_type_visibility table
    const { data: customTypes } = await supabase
      .from('store_type_visibility')
      .select('store_type, display_order')
      .order('display_order', { ascending: true });

    customTypes?.forEach(ct => typeSet.add(ct.store_type));

    // Create order map
    const orderMap: Record<string, number> = {};
    customTypes?.forEach(ct => {
      orderMap[ct.store_type] = ct.display_order ?? 999;
    });

    // Sort by display_order first, then alphabetically for types without order
    const allTypes = Array.from(typeSet).sort((a, b) => {
      const orderA = orderMap[a] ?? 999;
      const orderB = orderMap[b] ?? 999;
      if (orderA !== orderB) return orderA - orderB;
      return a.localeCompare(b, 'ko');
    });
    setAllStoreTypes(allTypes);

    // Count each type
    const counts: Record<string, number> = {};
    for (const type of allTypes) {
      const { count } = await supabase
        .from('stores')
        .select('*', { count: 'exact', head: true })
        .eq('store_type', type);
      counts[type] = count || 0;
    }

    // Count unclassified
    const { count: nullCount } = await supabase
      .from('stores')
      .select('*', { count: 'exact', head: true })
      .is('store_type', null);
    counts['미분류'] = nullCount || 0;

    setTypeCounts(counts);
  };

  const fetchRegionCounts = async () => {
    // Get all distinct regions from DB
    const { data: distinctData } = await supabase
      .from('stores')
      .select('region');

    const regionSet = new Set<string>();
    distinctData?.forEach(s => {
      if (s.region) regionSet.add(s.region);
    });

    // Combine with predefined regions
    REGIONS.forEach(r => regionSet.add(r));
    const allRegs = Array.from(regionSet).sort((a, b) => a.localeCompare(b, 'ko'));
    setAllRegions(allRegs);

    // Count each region
    const counts: Record<string, number> = {};
    for (const region of allRegs) {
      const { count } = await supabase
        .from('stores')
        .select('*', { count: 'exact', head: true })
        .eq('region', region);
      counts[region] = count || 0;
    }

    // Count unclassified
    const { count: nullCount } = await supabase
      .from('stores')
      .select('*', { count: 'exact', head: true })
      .is('region', null);
    counts['미분류'] = nullCount || 0;

    setRegionCounts(counts);
  };

  const fetchTotalCount = async () => {
    let query = supabase.from('stores').select('*', { count: 'exact', head: true });
    if (filterType === '미분류') {
      query = query.is('store_type', null);
    } else if (filterType) {
      query = query.eq('store_type', filterType);
    }
    if (filterRegion === '미분류') {
      query = query.is('region', null);
    } else if (filterRegion) {
      query = query.eq('region', filterRegion);
    }
    const { count } = await query;
    setTotalCount(count || 0);
  };

  const fetchStores = async () => {
    setLoading(true);
    const from = (currentPage - 1) * PAGE_SIZE;
    const to = from + PAGE_SIZE - 1;

    let query = supabase.from('stores').select('*');

    if (filterType === '미분류') {
      query = query.is('store_type', null);
    } else if (filterType) {
      query = query.eq('store_type', filterType);
    }

    if (filterRegion === '미분류') {
      query = query.is('region', null);
    } else if (filterRegion) {
      query = query.eq('region', filterRegion);
    }

    // staff_count는 DB에서 직접 정렬 불가 (이름순으로 가져온 후 클라이언트 정렬)
    if (sortBy === 'name' || sortBy === 'staff_count') {
      query = query.order('name', { ascending: true });
    } else if (sortBy === 'created_at') {
      query = query.order('created_at', { ascending: false });
    } else if (sortBy === 'rating') {
      query = query.order('rating', { ascending: false, nullsFirst: false });
    }

    const { data: storesData } = await query.range(from, to);

    if (!storesData) {
      setLoading(false);
      return;
    }

    // Fetch owners
    const ownerIds = [...new Set(storesData.map(s => s.owner_id).filter(Boolean))];
    let ownersMap = new Map();
    if (ownerIds.length > 0) {
      const { data: ownersData } = await supabase
        .from('profiles')
        .select('id, name, email')
        .in('id', ownerIds);
      ownersMap = new Map(ownersData?.map(o => [o.id, o]) || []);
    }

    // Fetch admin, staff, and virtual staff counts
    const storeIds = storesData.map(s => s.id);
    const { data: adminsData } = await supabase
      .from('store_admins')
      .select('store_id')
      .in('store_id', storeIds);

    const { data: staffData } = await supabase
      .from('store_staff')
      .select('store_id')
      .in('store_id', storeIds);

    const { data: virtualStaffData } = await supabase
      .from('virtual_staff')
      .select('store_id')
      .in('store_id', storeIds);

    const adminCounts: Record<number, number> = {};
    adminsData?.forEach(a => {
      adminCounts[a.store_id] = (adminCounts[a.store_id] || 0) + 1;
    });

    const freeStaffCounts: Record<number, number> = {};
    staffData?.forEach(s => {
      freeStaffCounts[s.store_id] = (freeStaffCounts[s.store_id] || 0) + 1;
    });

    const virtualStaffCounts: Record<number, number> = {};
    virtualStaffData?.forEach(vs => {
      virtualStaffCounts[vs.store_id] = (virtualStaffCounts[vs.store_id] || 0) + 1;
    });

    let storesWithDetails = storesData.map(store => ({
      ...store,
      rating: store.rating || 0,
      is_visible: store.is_visible ?? true,
      owner: ownersMap.get(store.owner_id),
      adminCount: 1 + (adminCounts[store.id] || 0),
      freeStaffCount: freeStaffCounts[store.id] || 0,
      virtualStaffCount: virtualStaffCounts[store.id] || 0
    }));

    // 매니저순 정렬 (클라이언트)
    if (sortBy === 'staff_count') {
      storesWithDetails = storesWithDetails.sort((a, b) => {
        const aTotal = a.freeStaffCount + a.virtualStaffCount;
        const bTotal = b.freeStaffCount + b.virtualStaffCount;
        return bTotal - aTotal;
      });
    }

    setStores(storesWithDetails);
    setLoading(false);
  };

  const totalPages = Math.ceil(totalCount / PAGE_SIZE);

  const filteredStores = stores.filter(s =>
    searchQuery === '' ||
    s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    s.address.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const handleSortChange = (newSort: SortBy) => {
    setSortBy(newSort);
    setCurrentPage(1);
  };

  const handleFilterChange = (newFilter: string) => {
    setFilterType(newFilter);
    setCurrentPage(1);
  };

  const handleRegionChange = (newRegion: string) => {
    setFilterRegion(newRegion);
    setCurrentPage(1);
  };

  const openEditModal = (store: Store) => {
    setEditingStore(store);
    setEditForm({
      name: store.name,
      address: store.address,
      store_type: store.store_type || '',
      region: store.region || '',
      phone: store.phone || ''
    });
  };

  const openStoreDetail = async (store: Store) => {
    setSelectedStore(store);
    setStoreDetails(null);

    const [adminsResult, virtualStaffResult, reservationsResult] = await Promise.all([
      supabase
        .from('store_admins')
        .select('admin:profiles(id, name, email)')
        .eq('store_id', store.id),
      supabase
        .from('virtual_staff')
        .select('id, name')
        .eq('store_id', store.id),
      supabase
        .from('reservations')
        .select('id', { count: 'exact', head: true })
        .eq('store_id', store.id)
    ]);

    const admins = (adminsResult.data || []).map(a => a.admin as unknown as { id: string; name: string; email: string }).filter(Boolean);

    setStoreDetails({
      admins,
      virtualStaff: virtualStaffResult.data || [],
      reservationCount: reservationsResult.count || 0
    });
  };

  const updateStore = async () => {
    if (!editingStore) return;

    const updateData = {
      name: editForm.name,
      address: editForm.address,
      store_type: editForm.store_type || null,
      region: editForm.region || null,
      phone: editForm.phone || null
    };

    const { data, error } = await supabase
      .from('stores')
      .update(updateData)
      .eq('id', editingStore.id)
      .select()
      .single();

    if (error) {
      console.error('Store update error:', error);
      alert('수정 중 오류가 발생했습니다: ' + error.message);
      return;
    }

    if (data) {
      // 성공 시 목록 다시 불러오기
      setEditingStore(null);
      fetchStores();
      fetchTypeCounts();
      fetchRegionCounts();
      alert('수정되었습니다.');
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

  const handleStoreVisibilityChange = async (storeId: number, isVisible: boolean) => {
    // Optimistic update
    setStores(prev => prev.map(s =>
      s.id === storeId ? { ...s, is_visible: isVisible } : s
    ));

    const { error } = await supabase
      .from('stores')
      .update({ is_visible: isVisible })
      .eq('id', storeId);

    if (error) {
      // Revert on error
      setStores(prev => prev.map(s =>
        s.id === storeId ? { ...s, is_visible: !isVisible } : s
      ));
      console.error('Failed to update store visibility:', error);
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
        <span className="text-slate-400">(총 {totalCount.toLocaleString()}개)</span>
      </div>

      {/* Search & Sort */}
      <div className="flex flex-wrap gap-4 mb-6">
        <input
          type="text"
          placeholder="가게 이름 또는 주소 검색..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="flex-1 min-w-[200px] px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        <select
          value={filterType}
          onChange={(e) => handleFilterChange(e.target.value)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        >
          <option value="">전체 업종</option>
          {allStoreTypes.map(type => (
            <option key={type} value={type}>{type} ({typeCounts[type] || 0})</option>
          ))}
          <option value="미분류">미분류 ({typeCounts['미분류'] || 0})</option>
        </select>
        <select
          value={filterRegion}
          onChange={(e) => handleRegionChange(e.target.value)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        >
          <option value="">전체 지역</option>
          {allRegions.map(region => (
            <option key={region} value={region}>{region} ({regionCounts[region] || 0})</option>
          ))}
          <option value="미분류">미분류 ({regionCounts['미분류'] || 0})</option>
        </select>
        <select
          value={sortBy}
          onChange={(e) => handleSortChange(e.target.value as SortBy)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        >
          <option value="name">이름순</option>
          <option value="staff_count">매니저순</option>
          <option value="created_at">등록일순</option>
          <option value="rating">평점순</option>
        </select>
      </div>

      {/* Stores List */}
      <div className="space-y-4">
        {filteredStores.map((store) => (
          <div
            key={store.id}
            className="p-5 bg-white border border-slate-200 rounded-xl hover:border-slate-300 transition-colors cursor-pointer"
            onClick={() => openStoreDetail(store)}
          >
            <div className="flex items-start justify-between mb-3">
              <div className="flex-1">
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
              <div className="flex items-center gap-2 ml-4">
                <div className="flex items-center gap-1 mr-2">
                  <span className="text-xs text-slate-400">노출</span>
                  <ToggleSwitch
                    enabled={store.is_visible}
                    onChange={(v) => handleStoreVisibilityChange(store.id, v)}
                    size="sm"
                  />
                </div>
                <button
                  onClick={(e) => { e.stopPropagation(); openEditModal(store); }}
                  className="px-3 py-1.5 text-sm font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors"
                >
                  수정
                </button>
                <button
                  onClick={(e) => { e.stopPropagation(); deleteStore(store.id); }}
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
                <span className="text-slate-500">프리 매니저: </span>
                <span className="text-slate-700">{store.freeStaffCount}명</span>
              </div>
              <div className="text-sm">
                <span className="text-purple-500">등록 매니저: </span>
                <span className="text-purple-700">{store.virtualStaffCount}명</span>
              </div>
              <div className="text-sm">
                <span className="text-slate-500">평점: </span>
                <span className="text-orange-600 font-medium">
                  {store.rating > 0 ? `★ ${store.rating.toFixed(1)}` : '-'}
                </span>
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

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2 mt-6">
          <button
            onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
            disabled={currentPage === 1}
            className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm disabled:opacity-50 disabled:cursor-not-allowed hover:bg-slate-50"
          >
            이전
          </button>
          <span className="px-4 py-2 text-sm text-slate-600">
            {currentPage} / {totalPages}
          </span>
          <button
            onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
            disabled={currentPage === totalPages}
            className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm disabled:opacity-50 disabled:cursor-not-allowed hover:bg-slate-50"
          >
            다음
          </button>
        </div>
      )}

      {/* Store Detail Modal */}
      {selectedStore && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg p-6 max-h-[90vh] overflow-y-auto">
            <div className="flex items-start justify-between mb-6">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <h2 className="text-xl font-bold text-slate-900">{selectedStore.name}</h2>
                  {selectedStore.store_type && (
                    <span className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">
                      {selectedStore.store_type}
                    </span>
                  )}
                </div>
                <p className="text-slate-500">{selectedStore.address}</p>
              </div>
              <button
                onClick={() => setSelectedStore(null)}
                className="text-slate-400 hover:text-slate-600 text-2xl"
              >
                ×
              </button>
            </div>

            <div className="space-y-4">
              {/* Basic Info */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">기본 정보</h3>
                <div className="grid grid-cols-2 gap-3 text-sm">
                  <div>
                    <span className="text-slate-500">전화번호</span>
                    <p className="font-medium text-slate-900">{selectedStore.phone || '-'}</p>
                  </div>
                  <div>
                    <span className="text-slate-500">평점</span>
                    <p className="font-medium text-orange-600">
                      {selectedStore.rating > 0 ? `★ ${selectedStore.rating.toFixed(1)}` : '-'}
                    </p>
                  </div>
                  <div>
                    <span className="text-slate-500">등록일</span>
                    <p className="font-medium text-slate-900">
                      {new Date(selectedStore.created_at).toLocaleDateString('ko-KR')}
                    </p>
                  </div>
                  <div>
                    <span className="text-slate-500">총 예약</span>
                    <p className="font-medium text-slate-900">
                      {storeDetails ? `${storeDetails.reservationCount}건` : '...'}
                    </p>
                  </div>
                </div>
              </div>

              {/* Owner & Admins */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">사장 및 관리자</h3>
                <div className="space-y-2">
                  {selectedStore.owner && (
                    <div className="flex items-center justify-between p-2 bg-white rounded-lg">
                      <div>
                        <span className="font-medium text-slate-900">{selectedStore.owner.name}</span>
                        <span className="text-slate-400 text-xs ml-2">{selectedStore.owner.email}</span>
                      </div>
                      <span className="px-2 py-0.5 bg-blue-100 text-blue-700 text-xs rounded">사장</span>
                    </div>
                  )}
                  {storeDetails?.admins.map(admin => (
                    <div key={admin.id} className="flex items-center justify-between p-2 bg-white rounded-lg">
                      <div>
                        <span className="font-medium text-slate-900">{admin.name}</span>
                        <span className="text-slate-400 text-xs ml-2">{admin.email}</span>
                      </div>
                      <span className="px-2 py-0.5 bg-green-100 text-green-700 text-xs rounded">관리자</span>
                    </div>
                  ))}
                  {!storeDetails && <div className="text-center py-2 text-slate-400">로딩 중...</div>}
                </div>
              </div>

              {/* Staff Stats */}
              <div className="p-4 bg-slate-50 rounded-xl">
                <h3 className="text-sm font-medium text-slate-700 mb-3">매니저 현황</h3>
                <div className="grid grid-cols-2 gap-3 text-center">
                  <div className="p-3 bg-white rounded-lg">
                    <p className="text-2xl font-bold text-slate-900">{selectedStore.freeStaffCount}</p>
                    <p className="text-xs text-slate-500">프리 매니저</p>
                  </div>
                  <div className="p-3 bg-white rounded-lg">
                    <p className="text-2xl font-bold text-slate-900">{selectedStore.virtualStaffCount}</p>
                    <p className="text-xs text-slate-500">등록 매니저</p>
                  </div>
                </div>
                {storeDetails && storeDetails.virtualStaff.length > 0 && (
                  <div className="mt-3 pt-3 border-t border-slate-200">
                    <p className="text-xs text-slate-500 mb-2">등록 매니저 목록</p>
                    <div className="flex flex-wrap gap-1">
                      {storeDetails.virtualStaff.map(vs => (
                        <span key={vs.id} className="px-2 py-0.5 bg-white text-slate-600 text-xs rounded">
                          {vs.name}
                        </span>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            </div>

            <div className="flex gap-2 mt-6">
              <Link
                to={`/store/${selectedStore.id}`}
                className="flex-1 px-4 py-2 text-center text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors font-medium"
              >
                가게 페이지로 이동
              </Link>
              <button
                onClick={() => {
                  setSelectedStore(null);
                  openEditModal(selectedStore);
                }}
                className="flex-1 px-4 py-2 text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors font-medium"
              >
                수정
              </button>
            </div>
          </div>
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
                <select
                  value={editForm.store_type}
                  onChange={(e) => setEditForm({ ...editForm, store_type: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                >
                  <option value="">선택 안함</option>
                  {allStoreTypes.map(type => (
                    <option key={type} value={type}>{type}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-600 mb-1">지역</label>
                <select
                  value={editForm.region}
                  onChange={(e) => setEditForm({ ...editForm, region: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
                >
                  <option value="">선택 안함</option>
                  {allRegions.map(region => (
                    <option key={region} value={region}>{region}</option>
                  ))}
                </select>
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
