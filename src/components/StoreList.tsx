import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import './StoreList.css';

interface Store {
  id: number;
  name: string;
  address: string;
  menuCount?: number;
  staffCount?: number;
}

interface StoreRating {
  avgRating: number | null;
  ratingCount: number;
}

export default function StoreList() {
  const [stores, setStores] = useState<Store[]>([]);
  const [ratingMap, setRatingMap] = useState<Record<number, StoreRating>>({});
  const [loading, setLoading] = useState(true);
  const [sortBy, setSortBy] = useState<'name' | 'rating' | 'reviewCount'>('name');

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

  // 정렬된 가게 목록
  const sortedStores = [...stores].sort((a, b) => {
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
      <div className="list-header">
        <h1>가게 목록</h1>
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
        {sortedStores.map((store) => {
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
              <p className="address">{store.address}</p>
              <div className="store-info">
                <span>메뉴 {store.menuCount}개</span>
                <span>직원 {store.staffCount}명</span>
              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
