import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './ScheduleApproval.css';

interface Schedule {
  id: number;
  store_id: number;
  staff_id: string;
  date: string;
  start_time: string;
  end_time: string;
  type: string;
  status: string;
  store?: { name: string };
  staff?: { name: string };
}

export default function ScheduleApproval() {
  const { user } = useAuth();
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'pending' | 'approved' | 'all'>('pending');

  useEffect(() => {
    if (user) {
      fetchSchedules();
    }
  }, [user]);

  const fetchSchedules = async () => {
    if (!user) return;

    // 관리하는 가게 목록 조회
    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map(s => s.store_id) || [];

    if (storeIds.length > 0) {
      // 스케줄과 관련 정보 조회
      const { data: schedulesData } = await supabase
        .from('schedules')
        .select(`
          *,
          store:stores(name),
          staff:profiles(name)
        `)
        .in('store_id', storeIds)
        .order('date', { ascending: true });

      setSchedules(schedulesData || []);
    }

    setLoading(false);
  };

  // 필터링
  const filteredSchedules =
    filter === 'all'
      ? schedules
      : schedules.filter((s) => s.status === filter);

  // 대기 중인 것 개수
  const pendingCount = schedules.filter((s) => s.status === 'pending').length;

  // 날짜 포맷
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const today = new Date().toISOString().split('T')[0];
    const isToday = dateStr === today;
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})${isToday ? ' 오늘' : ''}`;
  };

  const handleApprove = async (scheduleId: number) => {
    const { error } = await supabase
      .from('schedules')
      .update({ status: 'approved' })
      .eq('id', scheduleId);

    if (error) {
      alert('승인 처리 중 오류가 발생했습니다.');
    } else {
      alert('승인되었습니다.');
      fetchSchedules();
    }
  };

  const handleReject = async (scheduleId: number) => {
    const { error } = await supabase
      .from('schedules')
      .update({ status: 'rejected' })
      .eq('id', scheduleId);

    if (error) {
      alert('거절 처리 중 오류가 발생했습니다.');
    } else {
      alert('거절되었습니다.');
      fetchSchedules();
    }
  };

  if (loading) {
    return <div className="schedule-approval"><p>로딩 중...</p></div>;
  }

  return (
    <div className="schedule-approval">
      <Link to="/" className="back-link">← 대시보드</Link>

      <h1>출근 관리</h1>

      <div className="filter-tabs">
        <button
          className={`tab ${filter === 'pending' ? 'active' : ''}`}
          onClick={() => setFilter('pending')}
        >
          승인 대기 {pendingCount > 0 && <span className="count">{pendingCount}</span>}
        </button>
        <button
          className={`tab ${filter === 'approved' ? 'active' : ''}`}
          onClick={() => setFilter('approved')}
        >
          승인됨
        </button>
        <button
          className={`tab ${filter === 'all' ? 'active' : ''}`}
          onClick={() => setFilter('all')}
        >
          전체
        </button>
      </div>

      <div className="schedule-list">
        {filteredSchedules.map((schedule) => (
          <div key={schedule.id} className={`schedule-card ${schedule.status}`}>
            <div className="schedule-card-header">
              <div className="schedule-info">
                <div className="staff-name">{schedule.staff?.name}</div>
                <div className="store-name">{schedule.store?.name}</div>
              </div>
              <div className="schedule-date">
                <div>{formatDate(schedule.date)}</div>
                <div className="time">
                  {schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}
                </div>
              </div>
            </div>
            <div className="schedule-card-footer">
              <div className="schedule-type">
                {schedule.type === 'requested' && <span className="type-badge request">신청</span>}
                {schedule.type === 'self' && <span className="type-badge self">자율</span>}
                {schedule.type === 'assigned' && <span className="type-badge assigned">배정</span>}
              </div>
              <div className="schedule-status">
                {schedule.status === 'pending' ? (
                  <div className="action-buttons">
                    <button
                      className="approve-btn"
                      onClick={() => handleApprove(schedule.id)}
                    >
                      승인
                    </button>
                    <button
                      className="reject-btn"
                      onClick={() => handleReject(schedule.id)}
                    >
                      거절
                    </button>
                  </div>
                ) : (
                  <span className={`status-badge ${schedule.status}`}>
                    {schedule.status === 'approved' ? '승인됨' : '거절됨'}
                  </span>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      {filteredSchedules.length === 0 && (
        <div className="empty-state">
          <p>
            {filter === 'pending'
              ? '승인 대기 중인 출근 신청이 없습니다.'
              : '스케줄이 없습니다.'}
          </p>
        </div>
      )}
    </div>
  );
}
