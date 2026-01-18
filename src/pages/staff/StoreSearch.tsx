import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store {
  id: number;
  name: string;
  address: string;
  phone: string | null;
  description: string | null;
}

const PAGE_SIZE = 20;

export default function StoreSearch() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [myStoreIds, setMyStoreIds] = useState<Set<number>>(new Set());
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [page, setPage] = useState(0);
  const [hasMore, setHasMore] = useState(true);
  const [storeDemand, setStoreDemand] = useState<Record<number, number>>({});

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchMyStores();
    }
  }, [user]);

  useEffect(() => {
    fetchStores(true);
  }, [searchQuery]);

  const fetchMyStores = async () => {
    if (!user) return;
    const { data } = await supabase
      .from('store_staff')
      .select('store_id')
      .eq('staff_id', user.id);

    setMyStoreIds(new Set(data?.map(s => s.store_id) || []));
  };

  const fetchStores = async (reset = false) => {
    if (reset) {
      setLoading(true);
      setPage(0);
    } else {
      setLoadingMore(true);
    }

    const currentPage = reset ? 0 : page;
    const from = currentPage * PAGE_SIZE;
    const to = from + PAGE_SIZE - 1;

    let query = supabase
      .from('stores')
      .select('id, name, address, phone, description')
      .order('name', { ascending: true })
      .range(from, to);

    if (searchQuery.trim()) {
      query = query.or(`name.ilike.%${searchQuery}%,address.ilike.%${searchQuery}%`);
    }

    const { data, error } = await query;

    if (!error && data) {
      if (reset) {
        setStores(data);
      } else {
        setStores(prev => [...prev, ...data]);
      }
      setHasMore(data.length === PAGE_SIZE);
      setPage(currentPage + 1);

      // Fetch demand for new stores
      fetchDemandForStores(data.map(s => s.id));
    }

    setLoading(false);
    setLoadingMore(false);
  };

  const fetchDemandForStores = async (storeIds: number[]) => {
    const newDemand: Record<number, number> = {};

    for (const storeId of storeIds) {
      const { count } = await supabase
        .from('reservations')
        .select('*', { count: 'exact', head: true })
        .eq('store_id', storeId)
        .eq('date', today)
        .neq('status', 'cancelled');
      newDemand[storeId] = count || 0;
    }

    setStoreDemand(prev => ({ ...prev, ...newDemand }));
  };

  const handleLoadMore = () => {
    if (!loadingMore && hasMore) {
      fetchStores(false);
    }
  };

  const handleApply = async (storeId: number) => {
    // For now, just navigate to store detail
    // In the future, this could open an application modal
    window.location.href = `/store/${storeId}`;
  };

  return (
    <div>
      <Link to="/staff" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-2">가게 탐색</h1>
      <p className="text-slate-500 mb-6">새로운 가게를 찾아보고 지원해보세요</p>

      {/* Search */}
      <div className="mb-6">
        <input
          type="text"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          placeholder="가게 이름 또는 주소로 검색..."
          className="w-full h-12 px-4 border border-slate-200 rounded-xl text-sm focus:outline-none focus:border-red-600"
        />
      </div>

      {loading ? (
        <div className="text-slate-500 py-8 text-center">로딩 중...</div>
      ) : stores.length === 0 ? (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">검색 결과가 없습니다.</p>
        </div>
      ) : (
        <>
          <div className="grid grid-cols-2 gap-4 max-md:grid-cols-1">
            {stores.map((store) => {
              const isMyStore = myStoreIds.has(store.id);
              const demand = storeDemand[store.id] || 0;
              const isHot = demand >= 3;

              return (
                <div
                  key={store.id}
                  className={`p-4 bg-white border rounded-xl ${isHot ? 'border-orange-300' : 'border-slate-200'}`}
                >
                  <div className="flex items-start justify-between mb-2">
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-1">
                        <h3 className="font-semibold text-slate-900 truncate">{store.name}</h3>
                        {isMyStore && (
                          <span className="px-2 py-0.5 bg-green-50 text-green-600 text-xs font-medium rounded flex-shrink-0">소속</span>
                        )}
                        {isHot && !isMyStore && (
                          <span className="px-2 py-0.5 bg-orange-100 text-orange-600 text-xs font-semibold rounded flex-shrink-0">수요 높음</span>
                        )}
                      </div>
                      <p className="text-sm text-slate-500 truncate">{store.address}</p>
                    </div>
                  </div>

                  {store.description && (
                    <p className="text-sm text-slate-600 line-clamp-2 mb-3">{store.description}</p>
                  )}

                  <div className="flex items-center justify-between">
                    <span className="text-sm text-slate-600">
                      오늘 예약 <span className="font-semibold text-slate-900">{demand}</span>건
                    </span>
                    <div className="flex gap-2">
                      <Link
                        to={`/store/${store.id}`}
                        className="px-3 py-1.5 bg-slate-100 text-slate-600 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors"
                      >
                        상세보기
                      </Link>
                      {!isMyStore && (
                        <button
                          onClick={() => handleApply(store.id)}
                          className="px-3 py-1.5 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
                        >
                          지원하기
                        </button>
                      )}
                    </div>
                  </div>
                </div>
              );
            })}
          </div>

          {hasMore && (
            <div className="mt-6 text-center">
              <button
                onClick={handleLoadMore}
                disabled={loadingMore}
                className="px-6 py-3 bg-slate-100 text-slate-700 font-medium rounded-lg hover:bg-slate-200 transition-colors disabled:opacity-50"
              >
                {loadingMore ? '로딩 중...' : '더 보기'}
              </button>
            </div>
          )}
        </>
      )}
    </div>
  );
}
