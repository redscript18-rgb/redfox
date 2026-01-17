import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface WorkRequest {
  id: number;
  store_id: number;
  staff_id: string;
  date: string;
  start_time: string;
  end_time: string;
  message: string | null;
  status: string;
  schedule_id: number | null;
  created_at: string;
  responded_at: string | null;
  store?: { name: string };
  staff?: { name: string; email: string };
}

const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

export default function WorkRequestsSent() {
  const { user } = useAuth();
  const [requests, setRequests] = useState<WorkRequest[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'all' | 'pending' | 'accepted' | 'rejected'>('all');

  useEffect(() => { if (user) fetchRequests(); }, [user]);

  const fetchRequests = async () => {
    if (!user) return;
    const { data: adminStores } = await supabase.from('store_admins').select('store_id').eq('admin_id', user.id);
    const storeIds = adminStores?.map((s) => s.store_id) || [];
    if (storeIds.length === 0) { setLoading(false); return; }

    const { data } = await supabase.from('work_requests').select(`*, store:stores(name), staff:profiles!work_requests_staff_id_fkey(name, email)`).in('store_id', storeIds).order('created_at', { ascending: false });
    setRequests(data || []);
    setLoading(false);
  };

  const handleCancel = async (request: WorkRequest) => {
    if (!confirm('이 출근 요청을 취소하시겠습니까?')) return;
    const { error } = await supabase.from('work_requests').update({ status: 'cancelled' }).eq('id', request.id);
    if (error) alert('취소 중 오류가 발생했습니다.');
    else fetchRequests();
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const today = new Date();
    const tomorrow = new Date(); tomorrow.setDate(tomorrow.getDate() + 1);
    let prefix = '';
    if (dateStr === today.toISOString().split('T')[0]) prefix = '오늘 ';
    else if (dateStr === tomorrow.toISOString().split('T')[0]) prefix = '내일 ';
    return `${prefix}${date.getMonth() + 1}/${date.getDate()} (${DAY_NAMES[date.getDay()]})`;
  };

  const formatDateTime = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getMonth() + 1}/${date.getDate()} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
  };

  const getStatusText = (status: string) => {
    switch (status) { case 'pending': return '대기중'; case 'accepted': return '수락됨'; case 'rejected': return '거절됨'; case 'cancelled': return '취소됨'; default: return status; }
  };

  const filteredRequests = filter === 'all' ? requests : requests.filter((r) => r.status === filter);
  const statusCounts = { all: requests.length, pending: requests.filter((r) => r.status === 'pending').length, accepted: requests.filter((r) => r.status === 'accepted').length, rejected: requests.filter((r) => r.status === 'rejected').length };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-blue-600 text-sm hover:underline">← 대시보드</Link>

      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">보낸 출근 요청</h1>
        <Link to="/admin/find-staff" className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">+ 새 요청</Link>
      </div>

      <div className="flex gap-2 mb-6 flex-wrap">
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'all' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('all')}>전체 ({statusCounts.all})</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'pending' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('pending')}>대기중 ({statusCounts.pending})</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'accepted' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('accepted')}>수락됨 ({statusCounts.accepted})</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'rejected' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('rejected')}>거절됨 ({statusCounts.rejected})</button>
      </div>

      {filteredRequests.length > 0 ? (
        <div className="flex flex-col gap-3">
          {filteredRequests.map((request) => (
            <div key={request.id} className={`p-4 bg-white border rounded-xl ${request.status === 'pending' ? 'border-blue-300' : request.status === 'accepted' ? 'border-green-300' : request.status === 'rejected' ? 'border-red-200 opacity-60' : 'border-slate-200 opacity-60'}`}>
              <div className="flex items-start justify-between mb-3">
                <div>
                  <span className="font-semibold text-slate-900">{request.staff?.name}</span>
                  <span className="text-sm text-slate-500 ml-2">{request.staff?.email}</span>
                </div>
                <span className={`px-2 py-1 text-xs font-semibold rounded-full ${request.status === 'pending' ? 'bg-blue-100 text-blue-600' : request.status === 'accepted' ? 'bg-green-100 text-green-600' : request.status === 'rejected' ? 'bg-red-100 text-red-600' : 'bg-slate-100 text-slate-500'}`}>{getStatusText(request.status)}</span>
              </div>

              <div className="grid grid-cols-3 gap-4 text-sm mb-3 max-sm:grid-cols-1">
                <div><span className="text-slate-500">가게</span><span className="ml-2 text-slate-900">{request.store?.name}</span></div>
                <div><span className="text-slate-500">날짜</span><span className="ml-2 text-slate-900">{formatDate(request.date)}</span></div>
                <div><span className="text-slate-500">시간</span><span className="ml-2 text-slate-900">{request.start_time.slice(0, 5)} - {request.end_time.slice(0, 5)}</span></div>
              </div>

              {request.message && <div className="p-3 bg-slate-50 rounded-lg text-sm text-slate-700 mb-3">{request.message}</div>}

              <div className="flex items-center justify-between text-xs text-slate-500">
                <span>요청일: {formatDateTime(request.created_at)}</span>
                {request.responded_at && <span>응답일: {formatDateTime(request.responded_at)}</span>}
              </div>

              {request.status === 'pending' && (
                <div className="mt-4 pt-4 border-t border-slate-200">
                  <button className="px-4 py-2 text-sm text-red-500 hover:bg-red-50 rounded-lg transition-colors" onClick={() => handleCancel(request)}>요청 취소</button>
                </div>
              )}
            </div>
          ))}
        </div>
      ) : (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500 mb-4">{filter === 'all' ? '보낸 출근 요청이 없습니다.' : `${getStatusText(filter)} 상태의 요청이 없습니다.`}</p>
          <Link to="/admin/find-staff" className="inline-block px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">가용 직원 찾기</Link>
        </div>
      )}
    </div>
  );
}
