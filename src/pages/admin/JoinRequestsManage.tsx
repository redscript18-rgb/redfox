import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store {
  id: number;
  name: string;
}

interface JoinRequest {
  id: number;
  store_id: number;
  staff_id: string;
  message: string | null;
  status: string;
  created_at: string;
  staff?: {
    id: string;
    name: string;
    email: string;
    phone: string | null;
    bio: string | null;
    specialties: string[] | null;
    profile_photo_url: string | null;
  };
  store?: {
    name: string;
  };
}

export default function JoinRequestsManage() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [selectedStoreId, setSelectedStoreId] = useState<number | 'all'>('all');
  const [requests, setRequests] = useState<JoinRequest[]>([]);
  const [loading, setLoading] = useState(true);
  const [processing, setProcessing] = useState<number | null>(null);

  useEffect(() => {
    if (user) {
      fetchStores();
    }
  }, [user]);

  useEffect(() => {
    if (stores.length > 0) {
      fetchRequests();
    }
  }, [stores, selectedStoreId]);

  const fetchStores = async () => {
    if (!user) return;

    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id, store:stores(id, name)')
      .eq('admin_id', user.id);

    const { data: ownedStores } = await supabase
      .from('stores')
      .select('id, name')
      .eq('owner_id', user.id);

    const allStores: Store[] = [];
    const seenIds = new Set<number>();

    ownedStores?.forEach(s => {
      if (!seenIds.has(s.id)) {
        allStores.push(s);
        seenIds.add(s.id);
      }
    });

    adminStores?.forEach(s => {
      const store = s.store as unknown as Store;
      if (store && !seenIds.has(store.id)) {
        allStores.push(store);
        seenIds.add(store.id);
      }
    });

    setStores(allStores);
    setLoading(false);
  };

  const fetchRequests = async () => {
    if (!user || stores.length === 0) return;

    const storeIds = selectedStoreId === 'all' ? stores.map(s => s.id) : [selectedStoreId];

    const { data } = await supabase
      .from('store_join_requests')
      .select('*, staff:profiles(id, name, email, phone, bio, specialties, profile_photo_url), store:stores(name)')
      .in('store_id', storeIds)
      .order('created_at', { ascending: false });

    if (data) {
      const mapped = data.map(r => ({
        ...r,
        staff: Array.isArray(r.staff) ? r.staff[0] : r.staff,
        store: Array.isArray(r.store) ? r.store[0] : r.store,
      }));
      setRequests(mapped);
    }
  };

  const handleApprove = async (request: JoinRequest) => {
    if (!confirm(`${request.staff?.name} 매니저의 가입 요청을 승인하시겠습니까?`)) return;

    setProcessing(request.id);

    // 1. Update request status
    const { error: updateError } = await supabase
      .from('store_join_requests')
      .update({ status: 'approved', updated_at: new Date().toISOString() })
      .eq('id', request.id);

    if (updateError) {
      alert('처리 중 오류가 발생했습니다.');
      setProcessing(null);
      return;
    }

    // 2. Add to store_staff
    const { error: insertError } = await supabase
      .from('store_staff')
      .insert({ store_id: request.store_id, staff_id: request.staff_id });

    if (insertError) {
      // Revert status if insert fails
      await supabase
        .from('store_join_requests')
        .update({ status: 'pending' })
        .eq('id', request.id);
      alert('매니저 등록 중 오류가 발생했습니다.');
      setProcessing(null);
      return;
    }

    alert(`${request.staff?.name} 매니저가 가게에 등록되었습니다.`);
    setProcessing(null);
    fetchRequests();
  };

  const handleReject = async (request: JoinRequest) => {
    if (!confirm(`${request.staff?.name} 매니저의 가입 요청을 거절하시겠습니까?`)) return;

    setProcessing(request.id);

    const { error } = await supabase
      .from('store_join_requests')
      .update({ status: 'rejected', updated_at: new Date().toISOString() })
      .eq('id', request.id);

    if (error) {
      alert('처리 중 오류가 발생했습니다.');
    } else {
      fetchRequests();
    }

    setProcessing(null);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('ko-KR', { month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' });
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'pending':
        return <span className="px-2 py-0.5 bg-amber-50 text-amber-600 text-xs font-medium rounded">대기중</span>;
      case 'approved':
        return <span className="px-2 py-0.5 bg-green-50 text-green-600 text-xs font-medium rounded">승인됨</span>;
      case 'rejected':
        return <span className="px-2 py-0.5 bg-red-50 text-red-600 text-xs font-medium rounded">거절됨</span>;
      default:
        return null;
    }
  };

  const pendingCount = requests.filter(r => r.status === 'pending').length;

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">매니저 가입 요청</h1>
          {pendingCount > 0 && (
            <p className="text-sm text-amber-600 mt-1">대기 중인 요청 {pendingCount}건</p>
          )}
        </div>
      </div>

      {/* Store Filter */}
      {stores.length > 1 && (
        <div className="mb-4">
          <select
            value={selectedStoreId}
            onChange={(e) => setSelectedStoreId(e.target.value === 'all' ? 'all' : Number(e.target.value))}
            className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
          >
            <option value="all">전체 가게</option>
            {stores.map((store) => (
              <option key={store.id} value={store.id}>{store.name}</option>
            ))}
          </select>
        </div>
      )}

      {requests.length === 0 ? (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">가입 요청이 없습니다.</p>
        </div>
      ) : (
        <div className="space-y-3">
          {requests.map((request) => (
            <div key={request.id} className="p-4 bg-white border border-slate-200 rounded-xl">
              <div className="flex gap-4">
                <div className="w-14 h-14 rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-lg font-bold text-white overflow-hidden flex-shrink-0">
                  {request.staff?.profile_photo_url ? (
                    <img src={request.staff.profile_photo_url} alt={request.staff.name} className="w-full h-full object-cover" />
                  ) : (
                    request.staff?.name?.charAt(0) || '?'
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2 mb-1 flex-wrap">
                    <h3 className="font-semibold text-slate-900">{request.staff?.name}</h3>
                    {getStatusBadge(request.status)}
                    {selectedStoreId === 'all' && request.store && (
                      <span className="px-2 py-0.5 bg-slate-100 text-slate-600 text-xs font-medium rounded">{request.store.name}</span>
                    )}
                  </div>
                  <p className="text-sm text-slate-500 mb-1">{request.staff?.email}</p>
                  {request.staff?.phone && (
                    <p className="text-sm text-slate-500 mb-1">{request.staff.phone}</p>
                  )}
                  {request.message && (
                    <p className="text-sm text-slate-600 bg-slate-50 rounded-lg p-2 mt-2">"{request.message}"</p>
                  )}
                  {request.staff?.specialties && request.staff.specialties.length > 0 && (
                    <div className="flex flex-wrap gap-1 mt-2">
                      {request.staff.specialties.map((s) => (
                        <span key={s} className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">{s}</span>
                      ))}
                    </div>
                  )}
                  <p className="text-xs text-slate-400 mt-2">{formatDate(request.created_at)}</p>
                </div>
                {request.status === 'pending' && (
                  <div className="flex flex-col gap-2 flex-shrink-0">
                    <button
                      onClick={() => handleApprove(request)}
                      disabled={processing === request.id}
                      className="px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-lg hover:bg-green-700 transition-colors disabled:bg-slate-400 whitespace-nowrap"
                    >
                      승인
                    </button>
                    <button
                      onClick={() => handleReject(request)}
                      disabled={processing === request.id}
                      className="px-4 py-2 bg-slate-100 text-slate-600 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors disabled:bg-slate-300 whitespace-nowrap"
                    >
                      거절
                    </button>
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
