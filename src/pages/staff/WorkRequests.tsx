import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './WorkRequests.css';

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
      .select(`
        *,
        store:stores(name),
        admin:profiles!work_requests_admin_id_fkey(name)
      `)
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

    // 스케줄 생성
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

    // 요청 상태 업데이트
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
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);

    let prefix = '';
    if (dateStr === today.toISOString().split('T')[0]) {
      prefix = '오늘 ';
    } else if (dateStr === tomorrow.toISOString().split('T')[0]) {
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
      case 'pending':
        return '대기중';
      case 'accepted':
        return '수락됨';
      case 'rejected':
        return '거절됨';
      case 'cancelled':
        return '취소됨';
      default:
        return status;
    }
  };

  const pendingCount = requests.filter((r) => r.status === 'pending').length;

  if (loading) {
    return <div className="work-requests"><p>로딩 중...</p></div>;
  }

  return (
    <div className="work-requests">
      <Link to="/" className="back-link">← 대시보드</Link>

      <div className="page-header">
        <h1>출근 요청</h1>
        {pendingCount > 0 && filter !== 'pending' && (
          <span className="pending-badge">{pendingCount}건 대기중</span>
        )}
      </div>

      <div className="filter-tabs">
        <button
          className={`filter-tab ${filter === 'pending' ? 'active' : ''}`}
          onClick={() => setFilter('pending')}
        >
          대기중 ({requests.filter((r) => r.status === 'pending').length})
        </button>
        <button
          className={`filter-tab ${filter === 'all' ? 'active' : ''}`}
          onClick={() => setFilter('all')}
        >
          전체
        </button>
      </div>

      {requests.length > 0 ? (
        <div className="request-list">
          {requests.map((request) => (
            <div key={request.id} className={`request-card status-${request.status}`}>
              <div className="request-header">
                <span className="store-name">{request.store?.name}</span>
                <span className={`status-badge ${request.status}`}>
                  {getStatusText(request.status)}
                </span>
              </div>

              <div className="request-date">{formatDate(request.date)}</div>
              <div className="request-time">
                {request.start_time.slice(0, 5)} - {request.end_time.slice(0, 5)}
              </div>

              {request.message && (
                <div className="request-message">
                  <span className="message-label">메시지:</span>
                  {request.message}
                </div>
              )}

              <div className="request-meta">
                <span className="admin-name">요청자: {request.admin?.name}</span>
                <span className="created-at">{formatDateTime(request.created_at)}</span>
              </div>

              {request.status === 'pending' && (
                <div className="request-actions">
                  <button
                    className="reject-btn"
                    onClick={() => handleReject(request)}
                  >
                    거절
                  </button>
                  <button
                    className="accept-btn"
                    onClick={() => handleAccept(request)}
                  >
                    수락
                  </button>
                </div>
              )}

              {request.status === 'accepted' && request.schedule_id && (
                <div className="schedule-link">
                  <Link to="/staff/schedule">스케줄 확인 →</Link>
                </div>
              )}
            </div>
          ))}
        </div>
      ) : (
        <div className="empty-state">
          <p>
            {filter === 'pending'
              ? '대기 중인 출근 요청이 없습니다.'
              : '받은 출근 요청이 없습니다.'}
          </p>
        </div>
      )}
    </div>
  );
}
