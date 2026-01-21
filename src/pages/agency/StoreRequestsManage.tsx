import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface StoreRequest {
  id: number;
  store_id: number;
  status: string;
  message: string | null;
  created_at: string;
  store: {
    id: number;
    name: string;
    address: string;
    store_type: string | null;
  };
}

interface ConnectedStore {
  id: number;
  store_id: number;
  joined_at: string;
  store: {
    id: number;
    name: string;
    address: string;
    store_type: string | null;
  };
}

export default function StoreRequestsManage() {
  const { user } = useAuth();
  const [pendingRequests, setPendingRequests] = useState<StoreRequest[]>([]);
  const [connectedStores, setConnectedStores] = useState<ConnectedStore[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<'pending' | 'connected'>('pending');

  useEffect(() => {
    if (user?.role === 'agency') {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 대기 중인 요청
    const { data: requests } = await supabase
      .from('store_agency_requests')
      .select(`
        id,
        store_id,
        status,
        message,
        created_at,
        store:stores(id, name, address, store_type)
      `)
      .eq('agency_id', user.id)
      .eq('status', 'pending')
      .order('created_at', { ascending: false });

    if (requests) {
      const formattedRequests = requests.map(r => ({
        ...r,
        store: Array.isArray(r.store) ? r.store[0] : r.store
      })).filter(r => r.store) as StoreRequest[];
      setPendingRequests(formattedRequests);
    }

    // 연결된 가게
    const { data: stores } = await supabase
      .from('store_agencies')
      .select(`
        id,
        store_id,
        joined_at,
        store:stores(id, name, address, store_type)
      `)
      .eq('agency_id', user.id)
      .order('joined_at', { ascending: false });

    if (stores) {
      const formattedStores = stores.map(s => ({
        ...s,
        store: Array.isArray(s.store) ? s.store[0] : s.store
      })).filter(s => s.store) as ConnectedStore[];
      setConnectedStores(formattedStores);
    }

    setLoading(false);
  };

  const approveRequest = async (requestId: number) => {
    const { data, error } = await supabase.rpc('approve_store_agency_request', {
      p_request_id: requestId
    });

    if (error) {
      alert('승인 중 오류가 발생했습니다.');
      console.error(error);
    } else if (data) {
      alert('요청이 승인되었습니다.');
      fetchData();
    } else {
      alert('요청을 처리할 수 없습니다.');
    }
  };

  const rejectRequest = async (requestId: number) => {
    if (!confirm('이 요청을 거절하시겠습니까?')) return;

    const { data, error } = await supabase.rpc('reject_store_agency_request', {
      p_request_id: requestId
    });

    if (error) {
      alert('거절 중 오류가 발생했습니다.');
      console.error(error);
    } else if (data) {
      alert('요청이 거절되었습니다.');
      fetchData();
    }
  };

  const disconnectStore = async (storeId: number) => {
    if (!confirm('이 가게와의 연결을 해제하시겠습니까?')) return;

    const { error } = await supabase
      .from('store_agencies')
      .delete()
      .eq('store_id', storeId)
      .eq('agency_id', user?.id);

    if (!error) {
      fetchData();
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getMonth() + 1}/${date.getDate()} ${date.getHours()}:${String(date.getMinutes()).padStart(2, '0')}`;
  };

  if (user?.role !== 'agency') {
    return (
      <div className="p-8 text-center">
        <p className="text-red-600 font-semibold">접근 권한이 없습니다.</p>
      </div>
    );
  }

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <Link to="/agency" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-2">가게 요청 관리</h1>
      <p className="text-slate-500 text-sm mb-6">가게들의 연결 요청을 관리하세요</p>

      {/* 탭 */}
      <div className="flex gap-2 mb-6 border-b border-slate-200">
        <button
          onClick={() => setActiveTab('pending')}
          className={`px-4 py-2 font-medium text-sm border-b-2 transition-colors ${
            activeTab === 'pending'
              ? 'border-orange-600 text-orange-600'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          대기 중인 요청 ({pendingRequests.length})
        </button>
        <button
          onClick={() => setActiveTab('connected')}
          className={`px-4 py-2 font-medium text-sm border-b-2 transition-colors ${
            activeTab === 'connected'
              ? 'border-orange-600 text-orange-600'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          연결된 가게 ({connectedStores.length})
        </button>
      </div>

      {/* 대기 중인 요청 */}
      {activeTab === 'pending' && (
        <div>
          {pendingRequests.length === 0 ? (
            <div className="text-center py-12 bg-slate-50 rounded-xl">
              <p className="text-slate-500">대기 중인 요청이 없습니다.</p>
            </div>
          ) : (
            <div className="space-y-4">
              {pendingRequests.map(request => (
                <div key={request.id} className="p-5 bg-white border border-slate-200 rounded-xl">
                  <div className="flex items-start justify-between mb-3">
                    <div>
                      <h3 className="font-semibold text-slate-900 text-lg">{request.store.name}</h3>
                      <p className="text-sm text-slate-500">{request.store.address}</p>
                      {request.store.store_type && (
                        <span className="inline-block mt-1 px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">
                          {request.store.store_type}
                        </span>
                      )}
                    </div>
                    <span className="px-3 py-1 bg-yellow-100 text-yellow-700 text-sm font-medium rounded-full">
                      대기 중
                    </span>
                  </div>

                  {request.message && (
                    <div className="mb-4 p-3 bg-slate-50 rounded-lg">
                      <p className="text-sm text-slate-600">{request.message}</p>
                    </div>
                  )}

                  <div className="flex items-center justify-between">
                    <span className="text-xs text-slate-400">{formatDate(request.created_at)}</span>
                    <div className="flex gap-2">
                      <button
                        onClick={() => rejectRequest(request.id)}
                        className="px-4 py-2 border border-slate-200 text-slate-600 rounded-lg hover:bg-slate-50 transition-colors text-sm"
                      >
                        거절
                      </button>
                      <button
                        onClick={() => approveRequest(request.id)}
                        className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors text-sm"
                      >
                        승인
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}

      {/* 연결된 가게 */}
      {activeTab === 'connected' && (
        <div>
          {connectedStores.length === 0 ? (
            <div className="text-center py-12 bg-slate-50 rounded-xl">
              <p className="text-slate-500">연결된 가게가 없습니다.</p>
            </div>
          ) : (
            <div className="space-y-4">
              {connectedStores.map(connection => (
                <div key={connection.id} className="p-5 bg-white border border-green-200 rounded-xl">
                  <div className="flex items-start justify-between mb-2">
                    <div>
                      <h3 className="font-semibold text-slate-900 text-lg">{connection.store.name}</h3>
                      <p className="text-sm text-slate-500">{connection.store.address}</p>
                      {connection.store.store_type && (
                        <span className="inline-block mt-1 px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">
                          {connection.store.store_type}
                        </span>
                      )}
                    </div>
                    <span className="px-3 py-1 bg-green-100 text-green-700 text-sm font-medium rounded-full">
                      연결됨
                    </span>
                  </div>

                  <div className="flex items-center justify-between mt-3">
                    <span className="text-xs text-slate-400">
                      연결일: {new Date(connection.joined_at).toLocaleDateString('ko-KR')}
                    </span>
                    <button
                      onClick={() => disconnectStore(connection.store_id)}
                      className="px-3 py-1.5 text-sm text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                    >
                      연결 해제
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
