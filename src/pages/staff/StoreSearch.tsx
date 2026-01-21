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
  const [joinRequests, setJoinRequests] = useState<Record<number, string>>({});
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [page, setPage] = useState(0);
  const [hasMore, setHasMore] = useState(true);
  const [storeDemand, setStoreDemand] = useState<Record<number, number>>({});
  const [applyingStore, setApplyingStore] = useState<Store | null>(null);
  const [applyMessage, setApplyMessage] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchMyStores();
      fetchJoinRequests();
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

  const fetchJoinRequests = async () => {
    if (!user) return;
    const { data } = await supabase
      .from('store_join_requests')
      .select('store_id, status')
      .eq('staff_id', user.id);

    const requestMap: Record<number, string> = {};
    data?.forEach(r => { requestMap[r.store_id] = r.status; });
    setJoinRequests(requestMap);
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

  const handleApply = (store: Store) => {
    setApplyingStore(store);
    setApplyMessage('');
  };

  const submitApplication = async () => {
    if (!user || !applyingStore) return;

    setSubmitting(true);
    const { error } = await supabase
      .from('store_join_requests')
      .insert({
        store_id: applyingStore.id,
        staff_id: user.id,
        message: applyMessage || null,
        status: 'pending'
      });

    setSubmitting(false);

    if (error) {
      if (error.code === '23505') {
        alert('이미 가입 요청을 보냈습니다.');
      } else {
        alert('요청 중 오류가 발생했습니다: ' + error.message);
      }
    } else {
      alert('가입 요청을 보냈습니다. 실장의 승인을 기다려주세요.');
      setJoinRequests(prev => ({ ...prev, [applyingStore.id]: 'pending' }));
      setApplyingStore(null);
    }
  };

  const cancelRequest = async (storeId: number) => {
    if (!user) return;
    if (!confirm('가입 요청을 취소하시겠습니까?')) return;

    const { error } = await supabase
      .from('store_join_requests')
      .delete()
      .eq('store_id', storeId)
      .eq('staff_id', user.id);

    if (!error) {
      setJoinRequests(prev => {
        const updated = { ...prev };
        delete updated[storeId];
        return updated;
      });
    }
  };

  const getButtonForStore = (store: Store) => {
    const isMyStore = myStoreIds.has(store.id);
    const requestStatus = joinRequests[store.id];

    if (isMyStore) {
      return null; // Already a member
    }

    if (requestStatus === 'pending') {
      return (
        <button
          onClick={() => cancelRequest(store.id)}
          className="px-3 py-1.5 bg-amber-100 text-amber-700 text-sm font-medium rounded-lg hover:bg-amber-200 transition-colors"
        >
          대기중
        </button>
      );
    }

    if (requestStatus === 'rejected') {
      return (
        <span className="px-3 py-1.5 bg-slate-100 text-slate-500 text-sm font-medium rounded-lg">
          거절됨
        </span>
      );
    }

    return (
      <button
        onClick={() => handleApply(store)}
        className="px-3 py-1.5 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
      >
        지원하기
      </button>
    );
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
                      <div className="flex items-center gap-2 mb-1 flex-wrap">
                        <h3 className="font-semibold text-slate-900 truncate">{store.name}</h3>
                        {isMyStore && (
                          <span className="px-2 py-0.5 bg-green-50 text-green-600 text-xs font-medium rounded flex-shrink-0">소속</span>
                        )}
                        {joinRequests[store.id] === 'pending' && (
                          <span className="px-2 py-0.5 bg-amber-50 text-amber-600 text-xs font-medium rounded flex-shrink-0">승인대기</span>
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
                      {getButtonForStore(store)}
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

      {/* Apply Modal */}
      {applyingStore && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={() => setApplyingStore(null)}>
          <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
            <h2 className="text-xl font-bold text-slate-900 mb-4">가게 가입 신청</h2>

            <div className="p-4 bg-slate-50 rounded-lg mb-4">
              <h3 className="font-semibold text-slate-900">{applyingStore.name}</h3>
              <p className="text-sm text-slate-500">{applyingStore.address}</p>
            </div>

            <div className="mb-6">
              <label className="block text-sm font-medium text-slate-700 mb-2">메시지 (선택)</label>
              <textarea
                value={applyMessage}
                onChange={(e) => setApplyMessage(e.target.value)}
                placeholder="실장님께 전달할 메시지를 입력하세요..."
                rows={3}
                className="w-full px-4 py-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
              />
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => setApplyingStore(null)}
                className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors"
              >
                취소
              </button>
              <button
                onClick={submitApplication}
                disabled={submitting}
                className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400"
              >
                {submitting ? '신청 중...' : '신청하기'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
