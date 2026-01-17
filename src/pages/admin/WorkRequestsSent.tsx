import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './WorkRequestsSent.css';

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

  useEffect(() => {
    if (user) {
      fetchRequests();
    }
  }, [user]);

  const fetchRequests = async () => {
    if (!user) return;

    // 관리하는 가게 목록
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map((s) => s.store_id) || [];

    if (storeIds.length === 0) {
      setLoading(false);
      return;
    }

    const { data } = await supabase
      .from('work_requests')
      .select(`
        *,
        store:stores(name),
        staff:profiles!work_requests_staff_id_fkey(name, email)
      `)
      .in('store_id', storeIds)
      .order('created_at', { ascending: false });

    setRequests(data || []);
    setLoading(false);
  };

  const handleCancel = async (request: WorkRequest) => {
    if (!confirm('이 출근 요청을 취소하시겠습니까?')) return;

    const { error } = await supabase
      .from('work_requests')
      .update({
        status: 'cancelled',
      })
      .eq('id', request.id);

    if (error) {
      alert('취소 중 오류가 발생했습니다.');
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

  const filteredRequests = filter === 'all'
    ? requests
    : requests.filter((r) => r.status === filter);

  const statusCounts = {
    all: requests.length,
    pending: requests.filter((r) => r.status === 'pending').length,
    accepted: requests.filter((r) => r.status === 'accepted').length,
    rejected: requests.filter((r) => r.status === 'rejected').length,
  };

  if (loading) {
    return <div className="work-requests-sent"><p>로딩 중...</p></div>;
  }

  return (
    <div className="work-requests-sent">
      <Link to="/" className="back-link">← 대시보드</Link>

      <div className="page-header">
        <h1>보낸 출근 요청</h1>
        <Link to="/admin/find-staff" className="new-request-btn">
          + 새 요청
        </Link>
      </div>

      <div className="filter-tabs">
        <button
          className={`filter-tab ${filter === 'all' ? 'active' : ''}`}
          onClick={() => setFilter('all')}
        >
          전체 ({statusCounts.all})
        </button>
        <button
          className={`filter-tab ${filter === 'pending' ? 'active' : ''}`}
          onClick={() => setFilter('pending')}
        >
          대기중 ({statusCounts.pending})
        </button>
        <button
          className={`filter-tab ${filter === 'accepted' ? 'active' : ''}`}
          onClick={() => setFilter('accepted')}
        >
          수락됨 ({statusCounts.accepted})
        </button>
        <button
          className={`filter-tab ${filter === 'rejected' ? 'active' : ''}`}
          onClick={() => setFilter('rejected')}
        >
          거절됨 ({statusCounts.rejected})
        </button>
      </div>

      {filteredRequests.length > 0 ? (
        <div className="request-list">
          {filteredRequests.map((request) => (
            <div key={request.id} className={`request-card status-${request.status}`}>
              <div className="request-header">
                <div className="staff-info">
                  <span className="staff-name">{request.staff?.name}</span>
                  <span className="staff-email">{request.staff?.email}</span>
                </div>
                <span className={`status-badge ${request.status}`}>
                  {getStatusText(request.status)}
                </span>
              </div>

              <div className="request-details">
                <div className="detail-item">
                  <span className="label">가게</span>
                  <span className="value">{request.store?.name}</span>
                </div>
                <div className="detail-item">
                  <span className="label">날짜</span>
                  <span className="value">{formatDate(request.date)}</span>
                </div>
                <div className="detail-item">
                  <span className="label">시간</span>
                  <span className="value">
                    {request.start_time.slice(0, 5)} - {request.end_time.slice(0, 5)}
                  </span>
                </div>
              </div>

              {request.message && (
                <div className="request-message">
                  {request.message}
                </div>
              )}

              <div className="request-footer">
                <span className="created-at">요청일: {formatDateTime(request.created_at)}</span>
                {request.responded_at && (
                  <span className="responded-at">응답일: {formatDateTime(request.responded_at)}</span>
                )}
              </div>

              {request.status === 'pending' && (
                <div className="request-actions">
                  <button
                    className="cancel-btn"
                    onClick={() => handleCancel(request)}
                  >
                    요청 취소
                  </button>
                </div>
              )}
            </div>
          ))}
        </div>
      ) : (
        <div className="empty-state">
          <p>
            {filter === 'all'
              ? '보낸 출근 요청이 없습니다.'
              : `${getStatusText(filter)} 상태의 요청이 없습니다.`}
          </p>
          <Link to="/admin/find-staff" className="action-btn">
            가용 직원 찾기
          </Link>
        </div>
      )}
    </div>
  );
}
