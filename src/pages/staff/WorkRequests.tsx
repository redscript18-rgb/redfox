import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface WorkRequest {
  id: number;
  store_id: number;
  admin_id: string;
  date: string;
  start_time: string;
  end_time: string;
  message: string | null;
  status: string;
  schedule_id: number | null;
  created_at: string;
  responded_at: string | null;
  store?: { name: string };
  admin?: { name: string };
}

const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

export default function WorkRequests() {
  const { user } = useAuth();
  const [requests, setRequests] = useState<WorkRequest[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'pending' | 'all'>('pending');

  useEffect(() => {
    if (user) {
      fetchRequests();
    }
  }, [user, filter]);

  const fetchRequests = async () => {
    if (!user) return;

    let query = supabase
      .from('work_requests')
      .select(`*, store:stores(name), admin:profiles!work_requests_admin_id_fkey(name)`)
      .eq('staff_id', user.id)
      .order('created_at', { ascending: false });

    if (filter === 'pending') {
      query = query.eq('status', 'pending');
    }

    const { data } = await query;
    setRequests(data || []);
    setLoading(false);
  };

  const handleAccept = async (request: WorkRequest) => {
    if (!user) return;

    const { data: existingSchedules } = await supabase
      .from('schedules')
      .select('id, start_time, end_time')
      .eq('staff_id', user.id)
      .eq('date', request.date)
      .in('status', ['approved', 'pending']);

    if (existingSchedules && existingSchedules.length > 0) {
      const hasConflict = existingSchedules.some((s) => {
        return request.start_time < s.end_time && request.end_time > s.start_time;
      });

      if (hasConflict) {
        alert('해당 시간에 이미 등록된 스케줄이 있습니다.');
        return;
      }
    }

    const { data: schedule, error: scheduleError } = await supabase
      .from('schedules')
      .insert({
        store_id: request.store_id,
        staff_id: user.id,
        date: request.date,
        start_time: request.start_time,
        end_time: request.end_time,
        status: 'approved',
        type: 'assigned',
      })
      .select()
      .single();

    if (scheduleError) {
      alert('스케줄 생성 중 오류가 발생했습니다.');
      return;
    }

    const { error: updateError } = await supabase
      .from('work_requests')
      .update({
        status: 'accepted',
        schedule_id: schedule.id,
        responded_at: new Date().toISOString(),
      })
      .eq('id', request.id);

    if (updateError) {
      alert('요청 업데이트 중 오류가 발생했습니다.');
      return;
    }

    alert('출근 요청을 수락했습니다. 스케줄이 자동으로 등록되었습니다.');
    fetchRequests();
  };

  const handleReject = async (request: WorkRequest) => {
    if (!confirm('이 출근 요청을 거절하시겠습니까?')) return;

    const { error } = await supabase
      .from('work_requests')
      .update({
        status: 'rejected',
        responded_at: new Date().toISOString(),
      })
      .eq('id', request.id);

    if (error) {
      alert('요청 처리 중 오류가 발생했습니다.');
    } else {
      fetchRequests();
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const today = new Date();
    const todayStr = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`;
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const tomorrowStr = `${tomorrow.getFullYear()}-${String(tomorrow.getMonth() + 1).padStart(2, '0')}-${String(tomorrow.getDate()).padStart(2, '0')}`;

    let prefix = '';
    if (dateStr === todayStr) {
      prefix = '오늘 ';
    } else if (dateStr === tomorrowStr) {
      prefix = '내일 ';
    }

    return `${prefix}${date.getMonth() + 1}/${date.getDate()} (${DAY_NAMES[date.getDay()]})`;
  };

  const formatDateTime = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getMonth() + 1}/${date.getDate()} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
  };

  const getStatusText = (status: string) => {
    switch (status) {
      case 'pending': return '대기중';
      case 'accepted': return '수락됨';
      case 'rejected': return '거절됨';
      case 'cancelled': return '취소됨';
      default: return status;
    }
  };

  const pendingCount = requests.filter((r) => r.status === 'pending').length;

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <Link to="/" className="text-pink-500 text-sm hover:text-pink-600 mb-1 inline-block">← 대시보드</Link>
        <div className="flex items-center gap-3">
          <h1 className="text-2xl font-bold text-slate-800">
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">출근 요청</span>
          </h1>
          {pendingCount > 0 && filter !== 'pending' && (
            <span className="px-2.5 py-1 bg-gradient-to-r from-pink-500 to-rose-500 text-white text-xs font-semibold rounded-full shadow-md shadow-pink-200">
              {pendingCount}건 대기중
            </span>
          )}
        </div>
      </div>

      {/* Filter Tabs */}
      <div className="flex bg-gradient-to-r from-pink-50 to-purple-50 p-1.5 rounded-2xl border border-pink-100">
        <button
          className={`flex-1 py-2.5 px-4 text-sm font-semibold rounded-xl transition-all ${
            filter === 'pending'
              ? 'bg-gradient-to-r from-pink-500 to-rose-500 text-white shadow-md shadow-pink-200'
              : 'text-slate-500 hover:text-pink-600'
          }`}
          onClick={() => setFilter('pending')}
        >
          📩 대기중 ({requests.filter((r) => r.status === 'pending').length})
        </button>
        <button
          className={`flex-1 py-2.5 px-4 text-sm font-semibold rounded-xl transition-all ${
            filter === 'all'
              ? 'bg-gradient-to-r from-pink-500 to-rose-500 text-white shadow-md shadow-pink-200'
              : 'text-slate-500 hover:text-pink-600'
          }`}
          onClick={() => setFilter('all')}
        >
          📋 전체
        </button>
      </div>

      {requests.length > 0 ? (
        <div className="flex flex-col gap-4">
          {requests.map((request) => (
            <div
              key={request.id}
              className={`p-5 bg-white rounded-2xl border transition-all ${
                request.status === 'pending' ? 'border-amber-200 bg-gradient-to-br from-white to-amber-50' :
                request.status === 'accepted' ? 'border-green-200' :
                request.status === 'rejected' ? 'border-slate-200 opacity-60' : 'border-slate-200'
              }`}
            >
              <div className="flex items-start justify-between mb-3">
                <span className="font-semibold text-slate-800">{request.store?.name}</span>
                <span className={`px-2.5 py-1 text-xs font-semibold rounded-full ${
                  request.status === 'pending' ? 'bg-amber-100 text-amber-600' :
                  request.status === 'accepted' ? 'bg-green-100 text-green-600' :
                  request.status === 'rejected' ? 'bg-red-100 text-red-600' : 'bg-slate-100 text-slate-500'
                }`}>
                  {getStatusText(request.status)}
                </span>
              </div>

              <div className="flex items-center gap-3 mb-3">
                <div className="w-14 h-14 bg-gradient-to-br from-pink-100 to-rose-100 rounded-xl flex flex-col items-center justify-center flex-shrink-0">
                  <span className="text-lg font-bold text-pink-600">{new Date(request.date).getDate()}</span>
                  <span className="text-[10px] text-pink-500">{DAY_NAMES[new Date(request.date).getDay()]}</span>
                </div>
                <div>
                  <div className="text-lg font-bold text-slate-800">{formatDate(request.date)}</div>
                  <div className="text-slate-500">{request.start_time.slice(0, 5)} - {request.end_time.slice(0, 5)}</div>
                </div>
              </div>

              {request.message && (
                <div className="p-3 bg-gradient-to-r from-slate-50 to-pink-50 rounded-xl mb-3">
                  <span className="text-xs text-pink-500 font-medium">💬 메시지</span>
                  <p className="text-sm text-slate-700 mt-1">{request.message}</p>
                </div>
              )}

              <div className="flex items-center justify-between text-xs text-slate-400 pt-3 border-t border-slate-100">
                <span>요청자: {request.admin?.name}</span>
                <span>{formatDateTime(request.created_at)}</span>
              </div>

              {request.status === 'pending' && (
                <div className="flex gap-3 mt-4">
                  <button
                    className="flex-1 py-2.5 bg-slate-100 text-slate-600 rounded-xl font-medium hover:bg-slate-200 transition-colors"
                    onClick={() => handleReject(request)}
                  >
                    거절
                  </button>
                  <button
                    className="flex-1 py-2.5 bg-gradient-to-r from-pink-500 to-rose-500 text-white rounded-xl font-medium shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all"
                    onClick={() => handleAccept(request)}
                  >
                    수락
                  </button>
                </div>
              )}

              {request.status === 'accepted' && request.schedule_id && (
                <Link
                  to="/staff/schedule"
                  className="block mt-4 text-center text-sm text-pink-500 hover:text-pink-600 font-medium"
                >
                  스케줄 확인 →
                </Link>
              )}
            </div>
          ))}
        </div>
      ) : (
        <div className="py-12 bg-gradient-to-br from-slate-50 to-pink-50 rounded-3xl text-center">
          <div className="w-16 h-16 bg-pink-100 rounded-full flex items-center justify-center mx-auto mb-4 text-2xl">📩</div>
          <p className="text-slate-500">
            {filter === 'pending'
              ? '대기 중인 출근 요청이 없습니다.'
              : '받은 출근 요청이 없습니다.'}
          </p>
        </div>
      )}
    </div>
  );
}
