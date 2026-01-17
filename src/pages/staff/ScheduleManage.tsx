import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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

    const currentTodayStr = today.toISOString().split('T')[0];
    const nextWeek = new Date();
    nextWeek.setDate(nextWeek.getDate() + 7);
    const nextWeekStr = nextWeek.toISOString().split('T')[0];

    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`*, store:stores(name)`)
      .eq('staff_id', user.id)
      .gte('date', currentTodayStr)
      .lte('date', nextWeekStr)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setMySchedules(schedulesData || []);

    const pastMonth = new Date();
    pastMonth.setDate(pastMonth.getDate() - 30);
    const pastMonthStr = pastMonth.toISOString().split('T')[0];

    const { data: pastData } = await supabase
      .from('schedules')
      .select(`*, store:stores(name)`)
      .eq('staff_id', user.id)
      .eq('status', 'approved')
      .lt('date', currentTodayStr)
      .gte('date', pastMonthStr)
      .order('date', { ascending: false });

    setPastSchedules(pastData || []);

    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, schedule_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);
    setLoading(false);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const isToday = dateStr === today.toISOString().split('T')[0];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})${isToday ? ' 오늘' : ''}`;
  };

  const getStatusText = (status: string) => {
    switch (status) {
      case 'approved': return '승인됨';
      case 'pending': return '대기중';
      case 'rejected': return '거절됨';
      default: return status;
    }
  };

  const getTypeText = (type: string) => {
    switch (type) {
      case 'assigned': return '배정';
      case 'requested': return '신청';
      case 'self': return '자율';
      default: return type;
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
    return myRatings.some((r) => r.schedule_id === scheduleId && r.target_type === 'store');
  };

  const openRatingModal = (schedule: Schedule) => {
    setSelectedSchedule(schedule);
    setShowRatingModal(true);
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-blue-600 text-sm hover:underline">← 대시보드</Link>

      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">출근 스케줄 관리</h1>
        <button
          className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors"
          onClick={() => setShowAddModal(true)}
        >
          + 출근 등록
        </button>
      </div>

      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">이번 주 스케줄</h2>
        {mySchedules.length > 0 ? (
          <div className="flex flex-col gap-3">
            {mySchedules.map((schedule) => (
              <div
                key={schedule.id}
                className={`flex items-center gap-4 p-4 bg-white border rounded-xl ${
                  schedule.status === 'approved' ? 'border-green-300' :
                  schedule.status === 'pending' ? 'border-blue-300' :
                  'border-red-300'
                }`}
              >
                <div className="text-center min-w-[80px]">
                  <span className="block text-sm font-medium text-slate-900">{formatDate(schedule.date)}</span>
                </div>
                <div className="flex-1">
                  <div className="font-semibold text-slate-900">{schedule.store?.name}</div>
                  <div className="text-sm text-slate-600">{schedule.start_time} - {schedule.end_time}</div>
                </div>
                <div className="flex items-center gap-2">
                  <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                    schedule.status === 'approved' ? 'bg-green-100 text-green-600' :
                    schedule.status === 'pending' ? 'bg-blue-100 text-blue-600' :
                    'bg-red-100 text-red-600'
                  }`}>
                    {getStatusText(schedule.status)}
                  </span>
                  <span className="px-2 py-1 bg-slate-100 text-slate-600 text-xs font-medium rounded-full">
                    {getTypeText(schedule.type)}
                  </span>
                </div>
                {schedule.status === 'pending' && (
                  <button
                    className="px-3 py-1.5 text-xs text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                    onClick={() => handleCancelSchedule(schedule.id)}
                  >
                    취소
                  </button>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="p-6 bg-slate-50 rounded-xl text-center">
            <p className="text-slate-500 mb-3">등록된 스케줄이 없습니다.</p>
            <button
              className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors"
              onClick={() => setShowAddModal(true)}
            >
              출근 등록하기
            </button>
          </div>
        )}
      </section>

      {pastSchedules.length > 0 && (
        <section className="mb-8">
          <h2 className="text-lg font-semibold text-slate-900 mb-3">지난 출근</h2>
          <div className="flex flex-col gap-2 opacity-80">
            {pastSchedules.slice(0, 5).map((schedule) => (
              <div key={schedule.id} className="flex items-center gap-4 p-4 bg-white border border-slate-200 rounded-xl">
                <div className="text-center min-w-[80px]">
                  <span className="block text-sm text-slate-600">{formatDate(schedule.date)}</span>
                </div>
                <div className="flex-1">
                  <div className="font-medium text-slate-700">{schedule.store?.name}</div>
                  <div className="text-sm text-slate-500">{schedule.start_time} - {schedule.end_time}</div>
                </div>
                <div className="flex items-center gap-2">
                  {!hasRated(schedule.id) ? (
                    <button
                      className="px-3 py-1.5 bg-amber-100 text-amber-700 text-xs font-medium rounded-lg hover:bg-amber-200 transition-colors"
                      onClick={() => openRatingModal(schedule)}
                    >
                      가게 별점
                    </button>
                  ) : (
                    <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded-full">평가완료</span>
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
          onClose={() => { setShowRatingModal(false); setSelectedSchedule(null); }}
          onSuccess={() => { setShowRatingModal(false); setSelectedSchedule(null); fetchData(); }}
        />
      )}

      {showAddModal && (
        <AddScheduleModal
          stores={myStores}
          staffId={user?.id || ''}
          preselectedStoreId={selectedStoreId}
          onClose={() => { setShowAddModal(false); setSelectedStoreId(null); }}
          onSuccess={() => { setShowAddModal(false); setSelectedStoreId(null); fetchData(); }}
        />
      )}
    </div>
  );
}

function AddScheduleModal({
  stores, staffId, preselectedStoreId, onClose, onSuccess,
}: {
  stores: Store[]; staffId: string; preselectedStoreId: number | null; onClose: () => void; onSuccess: () => void;
}) {
  const [storeId, setStoreId] = useState<number | ''>(preselectedStoreId || '');
  const [date, setDate] = useState('');
  const [startTime, setStartTime] = useState('10:00');
  const [endTime, setEndTime] = useState('18:00');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

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
      <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
        <div className="bg-white rounded-2xl p-6 max-w-md w-full text-center" onClick={(e) => e.stopPropagation()}>
          <h2 className="text-xl font-bold text-slate-900 mb-2">출근 신청 완료!</h2>
          <p className="text-slate-600 mb-4">관리자 승인 후 확정됩니다.</p>
          <button onClick={onSuccess} className="px-6 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 transition-colors">
            확인
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full max-h-[90vh] overflow-y-auto" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">출근 등록</h2>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">가게 선택</label>
          <select
            value={storeId}
            onChange={(e) => setStoreId(Number(e.target.value))}
            className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600"
          >
            <option value="">가게를 선택하세요</option>
            {stores.map((store) => (
              <option key={store.id} value={store.id}>{store.name}</option>
            ))}
          </select>
        </div>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">날짜 선택</label>
          <div className="grid grid-cols-4 gap-2 max-sm:grid-cols-3">
            {dateOptions.map((d) => (
              <button
                key={d}
                type="button"
                className={`px-3 py-2 text-sm rounded-lg border transition-colors ${
                  date === d
                    ? 'bg-blue-600 text-white border-blue-600'
                    : 'bg-white text-slate-700 border-slate-200 hover:border-blue-600'
                }`}
                onClick={() => setDate(d)}
              >
                {formatDateOption(d)}
              </button>
            ))}
          </div>
        </div>

        <div className="grid grid-cols-2 gap-4 mb-6">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">시작 시간</label>
            <select
              value={startTime}
              onChange={(e) => setStartTime(e.target.value)}
              className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600"
            >
              {Array.from({ length: 14 }, (_, i) => i + 8).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">종료 시간</label>
            <select
              value={endTime}
              onChange={(e) => setEndTime(e.target.value)}
              className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600"
            >
              {Array.from({ length: 14 }, (_, i) => i + 9).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">
            취소
          </button>
          <button
            onClick={handleSubmit}
            disabled={!storeId || !date || submitting}
            className="flex-1 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 transition-colors disabled:bg-slate-400"
          >
            {submitting ? '신청 중...' : '신청하기'}
          </button>
        </div>
      </div>
    </div>
  );
}

function RatingModal({
  schedule, raterId, onClose, onSuccess,
}: {
  schedule: Schedule; raterId: string; onClose: () => void; onSuccess: () => void;
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

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-2">가게 별점</h2>
        <p className="text-slate-600 mb-4">{schedule.store?.name}에 별점을 주세요</p>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">
              {[1, 2, 3, 4, 5].map((star) => (
                <span
                  key={star}
                  className={`text-2xl cursor-pointer ${rating >= star ? 'text-amber-400' : 'text-slate-300'}`}
                  onClick={() => setRating(star)}
                >
                  ★
                </span>
              ))}
            </div>
            <span className="text-sm text-slate-600">{rating}점</span>
          </div>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">코멘트 (선택)</label>
          <textarea
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            placeholder="코멘트를 남겨주세요..."
            rows={3}
            className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600"
          />
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">
            취소
          </button>
          <button
            onClick={handleSubmit}
            disabled={submitting}
            className="flex-1 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 transition-colors disabled:bg-slate-400"
          >
            {submitting ? '등록 중...' : '별점 등록'}
          </button>
        </div>
      </div>
    </div>
  );
}
