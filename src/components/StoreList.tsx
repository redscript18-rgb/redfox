import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

interface Store {
  id: number;
  name: string;
  address: string;
  store_type: string | null;
  menuCount?: number;
  staffCount?: number;
}

const STORE_TYPES = ['1인샵', '커플관리샵', '왁싱샵', '스웨디시', '타이마사지', '중국마사지', '스포츠마사지', '발마사지', '네일샵', '피부관리샵', '기타'];

interface StoreRating {
  avgRating: number | null;
  ratingCount: number;
}

export default function StoreList() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [ratingMap, setRatingMap] = useState<Record<number, StoreRating>>({});
  const [blockedStoreIds, setBlockedStoreIds] = useState<Set<number>>(new Set());
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortBy, setSortBy] = useState<'name' | 'rating' | 'reviewCount'>('name');
  const [filterType, setFilterType] = useState('');

  useEffect(() => { fetchStores(); if (user) fetchBlockedStores(); }, [user]);

  const fetchBlockedStores = async () => {
    if (!user) return;
    try {
      const { data: blocksData } = await supabase.from('blocks').select('blocker_id').eq('blocked_id', user.id);
      if (!blocksData || blocksData.length === 0) return;

      const blockerIds = blocksData.map(b => b.blocker_id);
      const { data: staffStores } = await supabase.from('store_staff').select('store_id').in('staff_id', blockerIds);
      const { data: adminStores } = await supabase.from('store_admins').select('store_id').in('admin_id', blockerIds);

      const blockedIds = new Set<number>();
      staffStores?.forEach(s => blockedIds.add(s.store_id));
      adminStores?.forEach(s => blockedIds.add(s.store_id));
      setBlockedStoreIds(blockedIds);
    } catch { /* ignore */ }
  };

  const fetchStores = async () => {
    const { data: storesData } = await supabase.from('stores').select('*');

    if (storesData) {
      const storesWithCounts = await Promise.all(
        storesData.map(async (store) => {
          const { count: menuCount } = await supabase.from('menus').select('*', { count: 'exact', head: true }).eq('store_id', store.id);
          const { count: staffCount } = await supabase.from('store_staff').select('*', { count: 'exact', head: true }).eq('store_id', store.id);
          return { ...store, menuCount: menuCount || 0, staffCount: staffCount || 0 };
        })
      );
      setStores(storesWithCounts);

      const { data: ratingsData } = await supabase.from('ratings').select('target_store_id, rating, reservation_id').eq('target_type', 'store').not('reservation_id', 'is', null);

      if (ratingsData) {
        const ratingsByStore: Record<number, StoreRating> = {};
        const grouped: Record<number, number[]> = {};

        ratingsData.forEach((r) => {
          if (!r.target_store_id || r.rating === null) return;
          if (!grouped[r.target_store_id]) grouped[r.target_store_id] = [];
          grouped[r.target_store_id].push(r.rating);
        });

        Object.entries(grouped).forEach(([storeId, ratings]) => {
          ratingsByStore[Number(storeId)] = { avgRating: ratings.reduce((a, b) => a + b, 0) / ratings.length, ratingCount: ratings.length };
        });
        setRatingMap(ratingsByStore);
      }
    }
    setLoading(false);
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  const filteredStores = stores
    .filter((store) => {
      if (blockedStoreIds.has(store.id)) return false;
      const matchesSearch = store.name.toLowerCase().includes(searchTerm.toLowerCase()) || store.address.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesType = !filterType || store.store_type === filterType;
      return matchesSearch && matchesType;
    })
    .sort((a, b) => {
      if (sortBy === 'rating') return (ratingMap[b.id]?.avgRating ?? 0) - (ratingMap[a.id]?.avgRating ?? 0);
      if (sortBy === 'reviewCount') return (ratingMap[b.id]?.ratingCount ?? 0) - (ratingMap[a.id]?.ratingCount ?? 0);
      return a.name.localeCompare(b.name, 'ko');
    });

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-4">가게 목록</h1>

      <div className="flex gap-2 mb-6 flex-wrap">
        <input type="text" placeholder="가게명 또는 주소로 검색" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} className="flex-1 min-w-[200px] h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
        <select value={filterType} onChange={(e) => setFilterType(e.target.value)} className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
          <option value="">전체 업종</option>
          {STORE_TYPES.map((type) => (<option key={type} value={type}>{type}</option>))}
        </select>
        <select value={sortBy} onChange={(e) => setSortBy(e.target.value as 'name' | 'rating' | 'reviewCount')} className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
          <option value="name">이름순</option>
          <option value="rating">별점순</option>
          <option value="reviewCount">리뷰 많은순</option>
        </select>
      </div>

      <div className="grid grid-cols-2 gap-3 max-md:grid-cols-1">
        {filteredStores.map((store) => {
          const storeRating = ratingMap[store.id];
          return (
            <Link to={`/store/${store.id}`} key={store.id} className="p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
              <div className="flex items-start justify-between mb-2">
                <h2 className="font-semibold text-slate-900">{store.name}</h2>
                {storeRating && storeRating.ratingCount > 0 && (
                  <span className="flex items-center gap-1 text-sm">
                    <span className="text-amber-500">★</span>
                    <span className="font-medium text-slate-900">{storeRating.avgRating?.toFixed(1)}</span>
                    <span className="text-slate-400">({storeRating.ratingCount})</span>
                  </span>
                )}
              </div>
              {store.store_type && <span className="inline-block px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded mb-2">{store.store_type}</span>}
              <p className="text-sm text-slate-500 mb-2">{store.address}</p>
              <div className="flex gap-3 text-xs text-slate-400">
                <span>메뉴 {store.menuCount}개</span>
                <span>직원 {store.staffCount}명</span>
              </div>
            </Link>
          );
        })}
      </div>

      {filteredStores.length === 0 && (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">검색 결과가 없습니다.</p>
        </div>
      )}
    </div>
  );
}
