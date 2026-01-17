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

export default function StoreList() {
  const [stores, setStores] = useState<Store[]>([]);
  const [loading, setLoading] = useState(true);

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
    }

    setLoading(false);
  };

  if (loading) {
    return <div className="store-list"><p>로딩 중...</p></div>;
  }

  return (
    <div className="store-list">
      <h1>가게 목록</h1>
      <div className="stores">
        {stores.map((store) => (
          <Link to={`/store/${store.id}`} key={store.id} className="store-card">
            <h2>{store.name}</h2>
            <p className="address">{store.address}</p>
            <div className="store-info">
              <span>메뉴 {store.menuCount}개</span>
              <span>직원 {store.staffCount}명</span>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
