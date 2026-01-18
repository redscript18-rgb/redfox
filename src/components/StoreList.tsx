import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

interface Store {
  id: number;
  name: string;
  address: string;
  store_type: string | null;
  region: string | null;
}

interface StoreRating {
  avgRating: number | null;
  ratingCount: number;
}

const REGIONS = [
  '강남', '강서', '강동', '가락', '가산', '계양', '고양', '구로', '구미', '군포', '김포',
  '당산', '대구', '대전', '동탄', '동대문', '동암', '마곡', '마포', '문래동', '부산', '부천', '부평', '분당', '북창동',
  '상봉', '상동', '선릉', '서울대입구역', '수원', '시흥', '신대방', '신림', '안양',
  '역곡', '역삼', '연신내', '영등포', '오산', '용인', '의정부', '인천', '일산',
  '잠실', '장안동', '전주', '제주도', '주안', '중랑', '천안', '철산', '청주', '평택', '하남', '홍대', '화곡', '화정',
  '기타'
];

const STORE_TYPES = ['룸', '오피', '휴게텔', '건마', '안마', '출장', '립카페', '핸플', '페티쉬', '스웨디시'];

export default function StoreList() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [ratingMap, setRatingMap] = useState<Record<number, StoreRating>>({});
  const [blockedStoreIds, setBlockedStoreIds] = useState<Set<number>>(new Set());
  const [favoriteStoreIds, setFavoriteStoreIds] = useState<Set<number>>(new Set());
  const [loading, setLoading] = useState(true);
  const [sortBy, setSortBy] = useState<'rating' | 'reviewCount'>('rating');
  const [filterType, setFilterType] = useState('룸');
  const [filterRegion, setFilterRegion] = useState('강남');

  useEffect(() => {
    if (user) {
      fetchBlockedStores();
      fetchFavorites();
    }
  }, [user]);

  useEffect(() => {
    fetchStores();
  }, [filterRegion, filterType]);

  const fetchFavorites = async () => {
    if (!user) return;
    const { data } = await supabase.from('favorites').select('target_store_id').eq('user_id', user.id).eq('target_type', 'store');
    if (data) setFavoriteStoreIds(new Set(data.map(f => f.target_store_id).filter(Boolean)));
  };

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
    setLoading(true);

    let query = supabase.from('stores').select('*');

    if (filterRegion && filterRegion !== '기타') {
      query = query.eq('region', filterRegion);
    } else if (filterRegion === '기타') {
      query = query.is('region', null);
    }

    if (filterType) {
      query = query.eq('store_type', filterType);
    }

    const { data: storesData } = await query;

    if (storesData) {
      setStores(storesData);

      if (storesData.length > 0) {
        const { data: ratingsData } = await supabase
          .from('ratings')
          .select('target_store_id, rating, reservation_id')
          .eq('target_type', 'store')
          .not('reservation_id', 'is', null)
          .in('target_store_id', storesData.map(s => s.id));

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
    }
    setLoading(false);
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  const filteredStores = stores
    .filter((store) => !blockedStoreIds.has(store.id))
    .sort((a, b) => {
      const aFav = favoriteStoreIds.has(a.id) ? 1 : 0;
      const bFav = favoriteStoreIds.has(b.id) ? 1 : 0;
      if (bFav !== aFav) return bFav - aFav;

      if (sortBy === 'rating') {
        const ratingDiff = (ratingMap[b.id]?.avgRating ?? 0) - (ratingMap[a.id]?.avgRating ?? 0);
        if (ratingDiff !== 0) return ratingDiff;
      }
      if (sortBy === 'reviewCount') {
        const countDiff = (ratingMap[b.id]?.ratingCount ?? 0) - (ratingMap[a.id]?.ratingCount ?? 0);
        if (countDiff !== 0) return countDiff;
      }

      return a.name.localeCompare(b.name, 'ko');
    });

  return (
    <div>
      <div className="flex gap-2 mb-6 flex-wrap">
        <select
          value={filterRegion}
          onChange={(e) => setFilterRegion(e.target.value)}
          className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
        >
          {REGIONS.map((r) => (
            <option key={r} value={r}>{r}</option>
          ))}
        </select>
        <select
          value={filterType}
          onChange={(e) => setFilterType(e.target.value)}
          className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
        >
          {STORE_TYPES.map((type) => (
            <option key={type} value={type}>{type}</option>
          ))}
        </select>
        <select
          value={sortBy}
          onChange={(e) => setSortBy(e.target.value as 'rating' | 'reviewCount')}
          className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
        >
          <option value="rating">별점순</option>
          <option value="reviewCount">리뷰 많은순</option>
        </select>
        <span className="flex items-center text-sm text-slate-500 ml-2">
          {filteredStores.length}개
        </span>
      </div>

      <div className="grid grid-cols-2 gap-3 max-md:grid-cols-1">
        {filteredStores.map((store) => {
          const storeRating = ratingMap[store.id];
          return (
            <Link to={`/store/${store.id}`} key={store.id} className="p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 hover:shadow-md transition-all">
              <div className="flex items-start justify-between mb-2">
                <div className="flex items-center gap-2 flex-wrap">
                  <h2 className="font-semibold text-slate-900">{store.name}</h2>
                  {store.store_type && <span className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs font-medium rounded">{store.store_type}</span>}
                </div>
                {storeRating && storeRating.ratingCount > 0 && (
                  <span className="flex items-center gap-1 text-sm">
                    <span className="text-amber-500">★</span>
                    <span className="font-medium text-slate-900">{storeRating.avgRating?.toFixed(1)}</span>
                    <span className="text-slate-400">({storeRating.ratingCount})</span>
                  </span>
                )}
              </div>
              <p className="text-sm text-slate-500">{store.address}</p>
            </Link>
          );
        })}
      </div>

      {filteredStores.length === 0 && (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">해당 조건의 가게가 없습니다.</p>
        </div>
      )}
    </div>
  );
}
