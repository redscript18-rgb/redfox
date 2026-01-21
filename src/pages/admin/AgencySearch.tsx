import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Agency {
  id: string;
  name: string;
  bio: string | null;
  profile_photo_url: string | null;
}

interface StoreAgency {
  agency_id: string;
  agency: Agency;
  status?: string;
}

interface MyStore {
  id: number;
  name: string;
}

export default function AgencySearch() {
  const { user } = useAuth();
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [myStores, setMyStores] = useState<MyStore[]>([]);
  const [connectedAgencies, setConnectedAgencies] = useState<Record<number, StoreAgency[]>>({});
  const [pendingRequests, setPendingRequests] = useState<Record<number, string[]>>({});
  const [loading, setLoading] = useState(true);
  const [selectedStore, setSelectedStore] = useState<number | null>(null);
  const [showRequestModal, setShowRequestModal] = useState(false);
  const [selectedAgency, setSelectedAgency] = useState<Agency | null>(null);
  const [requestMessage, setRequestMessage] = useState('');
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 내 가게 목록 가져오기
    let storeIds: number[] = [];

    if (user.role === 'owner') {
      const { data: ownerStores } = await supabase
        .from('stores')
        .select('id, name')
        .eq('owner_id', user.id);
      if (ownerStores) {
        setMyStores(ownerStores);
        storeIds = ownerStores.map(s => s.id);
        if (ownerStores.length > 0) setSelectedStore(ownerStores[0].id);
      }
    } else if (user.role === 'staff') {
      const { data: adminStores } = await supabase
        .from('store_admins')
        .select('store:stores(id, name)')
        .eq('admin_id', user.id);
      if (adminStores) {
        const stores = adminStores
          .map(s => Array.isArray(s.store) ? s.store[0] : s.store)
          .filter((s): s is { id: number; name: string } => s !== null && s !== undefined);
        setMyStores(stores);
        storeIds = stores.map(s => s.id);
        if (stores.length > 0) setSelectedStore(stores[0].id);
      }
    }

    // 에이전시 목록 가져오기
    const { data: agencyData } = await supabase
      .from('profiles')
      .select('id, name, bio, profile_photo_url')
      .eq('role', 'agency');
    setAgencies(agencyData || []);

    // 연결된 에이전시 확인
    if (storeIds.length > 0) {
      const { data: connections } = await supabase
        .from('store_agencies')
        .select('store_id, agency_id, agency:profiles(id, name, bio, profile_photo_url)')
        .in('store_id', storeIds);

      const connMap: Record<number, StoreAgency[]> = {};
      connections?.forEach(c => {
        const agency = Array.isArray(c.agency) ? c.agency[0] : c.agency;
        if (agency) {
          if (!connMap[c.store_id]) connMap[c.store_id] = [];
          connMap[c.store_id].push({
            agency_id: c.agency_id,
            agency: agency as Agency
          });
        }
      });
      setConnectedAgencies(connMap);

      // 대기 중인 요청 확인
      const { data: requests } = await supabase
        .from('store_agency_requests')
        .select('store_id, agency_id, status')
        .in('store_id', storeIds)
        .eq('status', 'pending');

      const pendingMap: Record<number, string[]> = {};
      requests?.forEach(r => {
        if (!pendingMap[r.store_id]) pendingMap[r.store_id] = [];
        pendingMap[r.store_id].push(r.agency_id);
      });
      setPendingRequests(pendingMap);
    }

    setLoading(false);
  };

  const handleRequestAgency = (agency: Agency) => {
    setSelectedAgency(agency);
    setRequestMessage('');
    setShowRequestModal(true);
  };

  const submitRequest = async () => {
    if (!selectedStore || !selectedAgency || !user) return;

    setSubmitting(true);
    const { error } = await supabase
      .from('store_agency_requests')
      .insert({
        store_id: selectedStore,
        agency_id: selectedAgency.id,
        message: requestMessage || null
      });

    if (error) {
      if (error.code === '23505') {
        alert('이미 요청한 에이전시입니다.');
      } else {
        alert('요청 중 오류가 발생했습니다.');
        console.error(error);
      }
    } else {
      alert('에이전시 연결 요청이 전송되었습니다.');
      setShowRequestModal(false);
      fetchData();
    }
    setSubmitting(false);
  };

  const cancelRequest = async (agencyId: string) => {
    if (!selectedStore || !user) return;

    const { error } = await supabase
      .from('store_agency_requests')
      .delete()
      .eq('store_id', selectedStore)
      .eq('agency_id', agencyId)
      .eq('status', 'pending');

    if (!error) {
      fetchData();
    }
  };

  const disconnectAgency = async (agencyId: string) => {
    if (!selectedStore || !user) return;
    if (!confirm('이 에이전시와의 연결을 해제하시겠습니까?')) return;

    const { error } = await supabase
      .from('store_agencies')
      .delete()
      .eq('store_id', selectedStore)
      .eq('agency_id', agencyId);

    if (!error) {
      fetchData();
    }
  };

  const isConnected = (agencyId: string) => {
    if (!selectedStore) return false;
    return connectedAgencies[selectedStore]?.some(a => a.agency_id === agencyId);
  };

  const isPending = (agencyId: string) => {
    if (!selectedStore) return false;
    return pendingRequests[selectedStore]?.includes(agencyId);
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  if (myStores.length === 0) {
    return (
      <div className="text-center py-12">
        <p className="text-slate-500 mb-4">소속된 가게가 없습니다.</p>
        <Link to="/" className="text-orange-600 hover:underline">← 홈으로</Link>
      </div>
    );
  }

  const currentStoreAgencies = selectedStore ? connectedAgencies[selectedStore] || [] : [];

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 홈</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-2">에이전시 연결</h1>
      <p className="text-slate-500 text-sm mb-6">에이전시와 연결하여 매니저 파견을 받으세요</p>

      {/* 가게 선택 */}
      {myStores.length > 1 && (
        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">가게 선택</label>
          <select
            value={selectedStore || ''}
            onChange={(e) => setSelectedStore(Number(e.target.value))}
            className="w-full max-w-xs px-4 py-2 border border-slate-200 rounded-lg focus:outline-none focus:border-orange-500"
          >
            {myStores.map(store => (
              <option key={store.id} value={store.id}>{store.name}</option>
            ))}
          </select>
        </div>
      )}

      {/* 연결된 에이전시 */}
      {currentStoreAgencies.length > 0 && (
        <section className="mb-8">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">연결된 에이전시</h2>
          <div className="grid gap-4 md:grid-cols-2">
            {currentStoreAgencies.map(({ agency }) => (
              <div key={agency.id} className="p-4 bg-white border border-green-200 rounded-xl">
                <div className="flex items-start gap-4">
                  <div className="w-14 h-14 rounded-full bg-gradient-to-br from-purple-500 to-indigo-600 flex items-center justify-center text-white font-bold text-lg overflow-hidden flex-shrink-0">
                    {agency.profile_photo_url ? (
                      <img src={agency.profile_photo_url} alt={agency.name} className="w-full h-full object-cover" />
                    ) : (
                      agency.name.charAt(0)
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 mb-1">
                      <h3 className="font-semibold text-slate-900">{agency.name}</h3>
                      <span className="px-2 py-0.5 bg-green-100 text-green-700 text-xs rounded">연결됨</span>
                    </div>
                    {agency.bio && (
                      <p className="text-sm text-slate-500 line-clamp-2">{agency.bio}</p>
                    )}
                  </div>
                </div>
                <div className="mt-3 flex justify-end">
                  <button
                    onClick={() => disconnectAgency(agency.id)}
                    className="px-3 py-1.5 text-sm text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                  >
                    연결 해제
                  </button>
                </div>
              </div>
            ))}
          </div>
        </section>
      )}

      {/* 에이전시 목록 */}
      <section>
        <h2 className="text-lg font-semibold text-slate-900 mb-4">에이전시 목록</h2>
        {agencies.length === 0 ? (
          <p className="text-slate-500 py-8 text-center bg-slate-50 rounded-xl">등록된 에이전시가 없습니다.</p>
        ) : (
          <div className="grid gap-4 md:grid-cols-2">
            {agencies.filter(a => !isConnected(a.id)).map(agency => (
              <div key={agency.id} className="p-4 bg-white border border-slate-200 rounded-xl hover:border-slate-300 transition-colors">
                <div className="flex items-start gap-4">
                  <div className="w-14 h-14 rounded-full bg-gradient-to-br from-purple-500 to-indigo-600 flex items-center justify-center text-white font-bold text-lg overflow-hidden flex-shrink-0">
                    {agency.profile_photo_url ? (
                      <img src={agency.profile_photo_url} alt={agency.name} className="w-full h-full object-cover" />
                    ) : (
                      agency.name.charAt(0)
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-semibold text-slate-900 mb-1">{agency.name}</h3>
                    {agency.bio && (
                      <p className="text-sm text-slate-500 line-clamp-2">{agency.bio}</p>
                    )}
                  </div>
                </div>
                <div className="mt-3 flex justify-end">
                  {isPending(agency.id) ? (
                    <div className="flex items-center gap-2">
                      <span className="text-sm text-orange-600">요청 중</span>
                      <button
                        onClick={() => cancelRequest(agency.id)}
                        className="px-3 py-1.5 text-sm text-slate-600 hover:bg-slate-100 rounded-lg transition-colors"
                      >
                        취소
                      </button>
                    </div>
                  ) : (
                    <button
                      onClick={() => handleRequestAgency(agency)}
                      className="px-4 py-2 bg-orange-600 text-white text-sm font-medium rounded-lg hover:bg-orange-700 transition-colors"
                    >
                      연결 요청
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </section>

      {/* 요청 모달 */}
      {showRequestModal && selectedAgency && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={() => setShowRequestModal(false)}>
          <div className="bg-white rounded-2xl w-full max-w-md p-6" onClick={e => e.stopPropagation()}>
            <h2 className="text-xl font-bold text-slate-900 mb-4">에이전시 연결 요청</h2>

            <div className="flex items-center gap-3 p-3 bg-slate-50 rounded-lg mb-4">
              <div className="w-12 h-12 rounded-full bg-gradient-to-br from-purple-500 to-indigo-600 flex items-center justify-center text-white font-bold overflow-hidden">
                {selectedAgency.profile_photo_url ? (
                  <img src={selectedAgency.profile_photo_url} alt={selectedAgency.name} className="w-full h-full object-cover" />
                ) : (
                  selectedAgency.name.charAt(0)
                )}
              </div>
              <div>
                <p className="font-semibold text-slate-900">{selectedAgency.name}</p>
                <p className="text-sm text-slate-500">에이전시</p>
              </div>
            </div>

            <div className="mb-4">
              <label className="block text-sm font-medium text-slate-700 mb-2">
                요청 메시지 <span className="text-slate-400">(선택)</span>
              </label>
              <textarea
                value={requestMessage}
                onChange={(e) => setRequestMessage(e.target.value)}
                placeholder="에이전시에게 전달할 메시지를 입력하세요"
                className="w-full px-4 py-3 border border-slate-200 rounded-lg focus:outline-none focus:border-orange-500 resize-none"
                rows={3}
              />
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => setShowRequestModal(false)}
                className="flex-1 px-4 py-3 border border-slate-200 text-slate-600 rounded-lg hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={submitRequest}
                disabled={submitting}
                className="flex-1 px-4 py-3 bg-orange-600 text-white rounded-lg hover:bg-orange-700 transition-colors disabled:bg-slate-400"
              >
                {submitting ? '요청 중...' : '요청 보내기'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
