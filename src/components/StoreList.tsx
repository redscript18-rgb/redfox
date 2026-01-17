import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import './StoreList.css';

interface Store {
  id: number;
  name: string;
  address: string;
  store_type: string | null;
  menuCount?: number;
  staffCount?: number;
}

const STORE_TYPES = [
  '1인샵',
  '커플관리샵',
  '왁싱샵',
  '스웨디시',
  '타이마사지',
  '중국마사지',
  '스포츠마사지',
  '발마사지',
  '네일샵',
  '피부관리샵',
  '기타',
];

interface StoreRating {
  avgRating: number | null;
  ratingCount: number;
}

export default function StoreList() {
  const [stores, setStores] = useState<Store[]>([]);
  const [ratingMap, setRatingMap] = useState<Record<number, StoreRating>>({});
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortBy, setSortBy] = useState<'name' | 'rating' | 'reviewCount'>('name');
  const [filterType, setFilterType] = useState('');

  useEffect(() => {
    fetchStores();
  }, []);

  const fetchStores = async () => {
    // 가게 목록 조회
    const { data: storesData } = await supabase
      .from('stores')
      .select('*');

    if (storesData) {
      // 각 가게별 메뉴 수, 직원 수 조회
      const storesWithCounts = await Promise.all(
        storesData.map(async (store) => {
          const { count: menuCount } = await supabase
            .from('menus')
            .select('*', { count: 'exact', head: true })
            .eq('store_id', store.id);

          const { count: staffCount } = await supabase
            .from('store_staff')
            .select('*', { count: 'exact', head: true })
            .eq('store_id', store.id);

          return {
            ...store,
            menuCount: menuCount || 0,
            staffCount: staffCount || 0,
          };
        })
      );

      setStores(storesWithCounts);

      // 가게별 평균 별점 조회 (손님 평가만 - reservation_id가 있는 것)
      const { data: ratingsData } = await supabase
        .from('ratings')
        .select('target_store_id, rating, reservation_id')
        .eq('target_type', 'store')
        .not('reservation_id', 'is', null);

      if (ratingsData) {
        const ratingsByStore: Record<number, StoreRating> = {};
        const grouped: Record<number, number[]> = {};

        ratingsData.forEach((r) => {
          if (!r.target_store_id || r.rating === null) return;
          if (!grouped[r.target_store_id]) {
            grouped[r.target_store_id] = [];
          }
          grouped[r.target_store_id].push(r.rating);
        });

        Object.entries(grouped).forEach(([storeId, ratings]) => {
          ratingsByStore[Number(storeId)] = {
            avgRating: ratings.reduce((a, b) => a + b, 0) / ratings.length,
            ratingCount: ratings.length,
          };
        });

        setRatingMap(ratingsByStore);
      }
    }

    setLoading(false);
  };

  if (loading) {
    return <div className="store-list"><p>로딩 중...</p></div>;
  }

  // 필터링 및 정렬된 가게 목록
  const filteredStores = stores
    .filter((store) => {
      const matchesSearch = store.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        store.address.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesType = !filterType || store.store_type === filterType;
      return matchesSearch && matchesType;
    })
    .sort((a, b) => {
      if (sortBy === 'rating') {
        const ratingA = ratingMap[a.id]?.avgRating ?? 0;
        const ratingB = ratingMap[b.id]?.avgRating ?? 0;
        return ratingB - ratingA;
      } else if (sortBy === 'reviewCount') {
        const countA = ratingMap[a.id]?.ratingCount ?? 0;
        const countB = ratingMap[b.id]?.ratingCount ?? 0;
        return countB - countA;
      }
      return a.name.localeCompare(b.name, 'ko');
    });

  return (
    <div className="store-list">
      <h1>가게 목록</h1>
      <div className="filters">
        <input
          type="text"
          placeholder="가게명 또는 주소로 검색"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="search-input"
        />
        <select
          value={filterType}
          onChange={(e) => setFilterType(e.target.value)}
          className="type-select"
        >
          <option value="">전체 업종</option>
          {STORE_TYPES.map((type) => (
            <option key={type} value={type}>{type}</option>
          ))}
        </select>
        <select
          value={sortBy}
          onChange={(e) => setSortBy(e.target.value as 'name' | 'rating' | 'reviewCount')}
          className="sort-select"
        >
          <option value="name">이름순</option>
          <option value="rating">별점순</option>
          <option value="reviewCount">리뷰 많은순</option>
        </select>
      </div>
      <div className="stores">
        {filteredStores.map((store) => {
          const storeRating = ratingMap[store.id];
          return (
            <Link to={`/store/${store.id}`} key={store.id} className="store-card">
              <div className="store-header">
                <h2>{store.name}</h2>
                {storeRating && storeRating.ratingCount > 0 && (
                  <span className="rating-badge">
                    <span className="star">★</span>
                    {storeRating.avgRating?.toFixed(1)}
                    <span className="count">({storeRating.ratingCount})</span>
                  </span>
                )}
              </div>
              {store.store_type && <span className="store-type-badge">{store.store_type}</span>}
              <p className="address">{store.address}</p>
              <div className="store-info">
                <span>메뉴 {store.menuCount}개</span>
                <span>직원 {store.staffCount}명</span>
              </div>
            </Link>
          );
        })}
      </div>

      {filteredStores.length === 0 && (
        <p className="no-results">검색 결과가 없습니다.</p>
      )}
    </div>
  );
}
