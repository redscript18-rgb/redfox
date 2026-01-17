import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './ScheduleManage.css';

interface Store {
  id: number;
  name: string;
}

interface Schedule {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  type: string;
  status: string;
  store?: { name: string };
}

interface Rating {
  id: number;
  schedule_id: number;
  target_type: string;
}

export default function ScheduleManage() {
  const { user } = useAuth();
  const [searchParams] = useSearchParams();
  const preselectedStore = searchParams.get('store');

  const [myStores, setMyStores] = useState<Store[]>([]);
  const [mySchedules, setMySchedules] = useState<Schedule[]>([]);
  const [pastSchedules, setPastSchedules] = useState<Schedule[]>([]);
  const [myRatings, setMyRatings] = useState<Rating[]>([]);
  const [loading, setLoading] = useState(true);
  const [showAddModal, setShowAddModal] = useState(!!preselectedStore);
  const [showRatingModal, setShowRatingModal] = useState(false);
  const [selectedSchedule, setSelectedSchedule] = useState<Schedule | null>(null);
  const [selectedStoreId, setSelectedStoreId] = useState<number | null>(
    preselectedStore ? Number(preselectedStore) : null
  );

  const today = new Date();

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 소속 가게 조회
    const { data: storeStaff } = await supabase
      .from('store_staff')
      .select('store_id')
      .eq('staff_id', user.id);

    const myStoreIds = storeStaff?.map(s => s.store_id) || [];

    if (myStoreIds.length > 0) {
      const { data: storesData } = await supabase
        .from('stores')
        .select('id, name')
        .in('id', myStoreIds);

      setMyStores(storesData || []);
    }

    // 내 스케줄 (향후 7일)
    const currentTodayStr = today.toISOString().split('T')[0];
    const nextWeek = new Date();
    nextWeek.setDate(nextWeek.getDate() + 7);
    const nextWeekStr = nextWeek.toISOString().split('T')[0];

    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`
        *,
        store:stores(name)
      `)
      .eq('staff_id', user.id)
      .gte('date', currentTodayStr)
      .lte('date', nextWeekStr)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setMySchedules(schedulesData || []);

    // 지난 스케줄 (최근 30일)
    const pastMonth = new Date();
    pastMonth.setDate(pastMonth.getDate() - 30);
    const pastMonthStr = pastMonth.toISOString().split('T')[0];

    const { data: pastData } = await supabase
      .from('schedules')
      .select(`
        *,
        store:stores(name)
      `)
      .eq('staff_id', user.id)
      .eq('status', 'approved')
      .lt('date', currentTodayStr)
      .gte('date', pastMonthStr)
      .order('date', { ascending: false });

    setPastSchedules(pastData || []);

    // 내가 준 별점 조회
    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, schedule_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);
    setLoading(false);
  };

  // 날짜 포맷
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const isToday = dateStr === today.toISOString().split('T')[0];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})${isToday ? ' 오늘' : ''}`;
  };

  // 상태 텍스트
  const getStatusText = (status: string) => {
    switch (status) {
      case 'approved':
        return '승인됨';
      case 'pending':
        return '대기중';
      case 'rejected':
        return '거절됨';
      default:
        return status;
    }
  };

  // 타입 텍스트
  const getTypeText = (type: string) => {
    switch (type) {
      case 'assigned':
        return '배정';
      case 'requested':
        return '신청';
      case 'self':
        return '자율';
      default:
        return type;
    }
  };

  const handleCancelSchedule = async (scheduleId: number) => {
    const { error } = await supabase
      .from('schedules')
      .delete()
      .eq('id', scheduleId);

    if (error) {
      alert('취소 중 오류가 발생했습니다.');
    } else {
      alert('스케줄이 취소되었습니다.');
      fetchData();
    }
  };

  const hasRated = (scheduleId: number) => {
    return myRatings.some(
      (r) => r.schedule_id === scheduleId && r.target_type === 'store'
    );
  };

  const openRatingModal = (schedule: Schedule) => {
    setSelectedSchedule(schedule);
    setShowRatingModal(true);
  };

  if (loading) {
    return <div className="schedule-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="schedule-manage">
      <Link to="/" className="back-link">← 대시보드</Link>

      <div className="page-header">
        <h1>출근 스케줄 관리</h1>
        <button className="add-btn" onClick={() => setShowAddModal(true)}>
          + 출근 등록
        </button>
      </div>

      <section className="section">
        <h2>이번 주 스케줄</h2>
        {mySchedules.length > 0 ? (
          <div className="schedule-list">
            {mySchedules.map((schedule) => (
              <div key={schedule.id} className={`schedule-card status-${schedule.status}`}>
                <div className="schedule-date">{formatDate(schedule.date)}</div>
                <div className="schedule-details">
                  <div className="store-name">{schedule.store?.name}</div>
                  <div className="time">
                    {schedule.start_time} - {schedule.end_time}
                  </div>
                </div>
                <div className="schedule-meta">
                  <span className={`status-badge ${schedule.status}`}>
                    {getStatusText(schedule.status)}
                  </span>
                  <span className="type-badge">{getTypeText(schedule.type)}</span>
                </div>
                {schedule.status === 'pending' && (
                  <button
                    className="cancel-btn"
                    onClick={() => handleCancelSchedule(schedule.id)}
                  >
                    취소
                  </button>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="empty-state">
            <p>등록된 스케줄이 없습니다.</p>
            <button className="action-btn" onClick={() => setShowAddModal(true)}>
              출근 등록하기
            </button>
          </div>
        )}
      </section>

      {/* 지난 스케줄 */}
      {pastSchedules.length > 0 && (
        <section className="section past-section">
          <h2>지난 출근</h2>
          <div className="schedule-list past">
            {pastSchedules.slice(0, 5).map((schedule) => (
              <div key={schedule.id} className="schedule-card past">
                <div className="schedule-date">{formatDate(schedule.date)}</div>
                <div className="schedule-details">
                  <div className="store-name">{schedule.store?.name}</div>
                  <div className="time">
                    {schedule.start_time} - {schedule.end_time}
                  </div>
                </div>
                <div className="schedule-meta">
                  {!hasRated(schedule.id) ? (
                    <button className="rate-btn" onClick={() => openRatingModal(schedule)}>
                      가게 별점
                    </button>
                  ) : (
                    <span className="rated-badge">평가완료</span>
                  )}
                </div>
              </div>
            ))}
          </div>
        </section>
      )}

      {showRatingModal && selectedSchedule && (
        <RatingModal
          schedule={selectedSchedule}
          raterId={user?.id || ''}
          onClose={() => {
            setShowRatingModal(false);
            setSelectedSchedule(null);
          }}
          onSuccess={() => {
            setShowRatingModal(false);
            setSelectedSchedule(null);
            fetchData();
          }}
        />
      )}

      {showAddModal && (
        <AddScheduleModal
          stores={myStores}
          staffId={user?.id || ''}
          preselectedStoreId={selectedStoreId}
          onClose={() => {
            setShowAddModal(false);
            setSelectedStoreId(null);
          }}
          onSuccess={() => {
            setShowAddModal(false);
            setSelectedStoreId(null);
            fetchData();
          }}
        />
      )}
    </div>
  );
}

// 출근 등록 모달
function AddScheduleModal({
  stores,
  staffId,
  preselectedStoreId,
  onClose,
  onSuccess,
}: {
  stores: Store[];
  staffId: string;
  preselectedStoreId: number | null;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [storeId, setStoreId] = useState<number | ''>(preselectedStoreId || '');
  const [date, setDate] = useState('');
  const [startTime, setStartTime] = useState('10:00');
  const [endTime, setEndTime] = useState('18:00');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  // 오늘부터 7일간의 날짜 옵션
  const dateOptions = Array.from({ length: 7 }, (_, i) => {
    const d = new Date();
    d.setDate(d.getDate() + i);
    return d.toISOString().split('T')[0];
  });

  const formatDateOption = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  const handleSubmit = async () => {
    if (!storeId || !date) return;

    setSubmitting(true);

    const { error } = await supabase
      .from('schedules')
      .insert({
        store_id: storeId,
        staff_id: staffId,
        date,
        start_time: startTime,
        end_time: endTime,
        type: 'requested',
        status: 'pending',
      });

    setSubmitting(false);

    if (error) {
      alert('등록 중 오류가 발생했습니다.');
    } else {
      setSubmitted(true);
    }
  };

  if (submitted) {
    return (
      <div className="modal-overlay" onClick={onClose}>
        <div className="modal" onClick={(e) => e.stopPropagation()}>
          <div className="success-message">
            <h2>출근 신청 완료!</h2>
            <p>관리자 승인 후 확정됩니다.</p>
            <button onClick={onSuccess} className="close-btn">확인</button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <h2>출근 등록</h2>

        <div className="form-group">
          <label>가게 선택</label>
          <select
            value={storeId}
            onChange={(e) => setStoreId(Number(e.target.value))}
          >
            <option value="">가게를 선택하세요</option>
            {stores.map((store) => (
              <option key={store.id} value={store.id}>
                {store.name}
              </option>
            ))}
          </select>
        </div>

        <div className="form-group">
          <label>날짜 선택</label>
          <div className="date-options">
            {dateOptions.map((d) => (
              <button
                key={d}
                type="button"
                className={`date-option ${date === d ? 'selected' : ''}`}
                onClick={() => setDate(d)}
              >
                {formatDateOption(d)}
              </button>
            ))}
          </div>
        </div>

        <div className="form-row">
          <div className="form-group">
            <label>시작 시간</label>
            <select value={startTime} onChange={(e) => setStartTime(e.target.value)}>
              {Array.from({ length: 14 }, (_, i) => i + 8).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
          <div className="form-group">
            <label>종료 시간</label>
            <select value={endTime} onChange={(e) => setEndTime(e.target.value)}>
              {Array.from({ length: 14 }, (_, i) => i + 9).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="modal-actions">
          <button onClick={onClose} className="cancel-btn">취소</button>
          <button
            onClick={handleSubmit}
            className="submit-btn"
            disabled={!storeId || !date || submitting}
          >
            {submitting ? '신청 중...' : '신청하기'}
          </button>
        </div>
      </div>
    </div>
  );
}

// 가게 별점 모달
function RatingModal({
  schedule,
  raterId,
  onClose,
  onSuccess,
}: {
  schedule: Schedule;
  raterId: string;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);

    const { error } = await supabase.from('ratings').insert({
      schedule_id: schedule.id,
      rater_id: raterId,
      target_type: 'store',
      target_store_id: schedule.store_id,
      rating,
      comment: comment || null,
    });

    setSubmitting(false);

    if (error) {
      alert('별점 등록 중 오류가 발생했습니다.');
    } else {
      onSuccess();
    }
  };

  const ratingOptions = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5];

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <h2>가게 별점</h2>
        <p className="rating-target">{schedule.store?.name}에 별점을 주세요</p>

        <div className="rating-select">
          <div className="stars">
            {[1, 2, 3, 4, 5].map((star) => (
              <span
                key={star}
                className={`star ${rating >= star ? 'filled' : rating >= star - 0.5 ? 'half' : ''}`}
                onClick={() => setRating(star)}
              >
                ★
              </span>
            ))}
          </div>
          <select value={rating} onChange={(e) => setRating(Number(e.target.value))}>
            {ratingOptions.map((opt) => (
              <option key={opt} value={opt}>
                {opt}점
              </option>
            ))}
          </select>
        </div>

        <div className="form-group">
          <label>코멘트 (선택)</label>
          <textarea
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            placeholder="코멘트를 남겨주세요..."
            rows={3}
          />
        </div>

        <div className="modal-actions">
          <button onClick={onClose} className="cancel-btn">취소</button>
          <button onClick={handleSubmit} className="submit-btn" disabled={submitting}>
            {submitting ? '등록 중...' : '별점 등록'}
          </button>
        </div>
      </div>
    </div>
  );
}
