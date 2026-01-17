import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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

interface Rating {
  id: number;
  schedule_id: number;
  target_type: string;
}

export default function ScheduleApproval() {
  const { user } = useAuth();
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [myRatings, setMyRatings] = useState<Rating[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'pending' | 'approved' | 'all'>('pending');
  const [showRatingModal, setShowRatingModal] = useState(false);
  const [selectedSchedule, setSelectedSchedule] = useState<Schedule | null>(null);
  const today = new Date().toISOString().split('T')[0];

  useEffect(() => {
    if (user) fetchSchedules();
  }, [user]);

  const fetchSchedules = async () => {
    if (!user) return;

    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map(s => s.store_id) || [];

    if (storeIds.length > 0) {
      const { data: schedulesData } = await supabase
        .from('schedules')
        .select(`*, store:stores(name), staff:profiles(name)`)
        .in('store_id', storeIds)
        .order('date', { ascending: false });

      setSchedules(schedulesData || []);

      const { data: ratingsData } = await supabase
        .from('ratings')
        .select('id, schedule_id, target_type')
        .eq('rater_id', user.id);

      setMyRatings(ratingsData || []);
    }

    setLoading(false);
  };

  const filteredSchedules = filter === 'all' ? schedules : schedules.filter((s) => s.status === filter);
  const pendingCount = schedules.filter((s) => s.status === 'pending').length;

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const isToday = dateStr === today;
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})${isToday ? ' 오늘' : ''}`;
  };

  const handleApprove = async (scheduleId: number) => {
    const { error } = await supabase.from('schedules').update({ status: 'approved' }).eq('id', scheduleId);
    if (error) alert('승인 처리 중 오류가 발생했습니다.');
    else { alert('승인되었습니다.'); fetchSchedules(); }
  };

  const handleReject = async (scheduleId: number) => {
    const { error } = await supabase.from('schedules').update({ status: 'rejected' }).eq('id', scheduleId);
    if (error) alert('거절 처리 중 오류가 발생했습니다.');
    else { alert('거절되었습니다.'); fetchSchedules(); }
  };

  const hasRated = (scheduleId: number) => myRatings.some((r) => r.schedule_id === scheduleId && r.target_type === 'staff');
  const openRatingModal = (schedule: Schedule) => { setSelectedSchedule(schedule); setShowRatingModal(true); };
  const isPastSchedule = (dateStr: string) => dateStr < today;

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-blue-600 text-sm hover:underline">← 대시보드</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">출근 관리</h1>

      <div className="flex gap-2 mb-6">
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'pending' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('pending')}>
          승인 대기 {pendingCount > 0 && <span className="ml-1 px-1.5 py-0.5 bg-white/20 rounded-full text-xs">{pendingCount}</span>}
        </button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'approved' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('approved')}>승인됨</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${filter === 'all' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setFilter('all')}>전체</button>
      </div>

      <div className="flex flex-col gap-3">
        {filteredSchedules.map((schedule) => (
          <div key={schedule.id} className={`p-4 bg-white border rounded-xl ${schedule.status === 'approved' ? 'border-green-300' : schedule.status === 'pending' ? 'border-blue-300' : 'border-red-200 opacity-60'}`}>
            <div className="flex items-start justify-between mb-3">
              <div>
                <div className="font-semibold text-slate-900">{schedule.staff?.name}</div>
                <div className="text-sm text-slate-500">{schedule.store?.name}</div>
              </div>
              <div className="text-right">
                <div className="text-sm font-medium text-slate-900">{formatDate(schedule.date)}</div>
                <div className="text-xs text-slate-500">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</div>
              </div>
            </div>
            <div className="flex items-center justify-between">
              <div>
                {schedule.type === 'requested' && <span className="px-2 py-1 bg-blue-100 text-blue-600 text-xs font-medium rounded-full">신청</span>}
                {schedule.type === 'self' && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-xs font-medium rounded-full">자율</span>}
                {schedule.type === 'assigned' && <span className="px-2 py-1 bg-green-100 text-green-600 text-xs font-medium rounded-full">배정</span>}
              </div>
              <div className="flex items-center gap-2">
                {schedule.status === 'pending' ? (
                  <>
                    <button className="px-3 py-1.5 bg-green-600 text-white text-xs font-medium rounded-lg hover:bg-green-700" onClick={() => handleApprove(schedule.id)}>승인</button>
                    <button className="px-3 py-1.5 bg-red-100 text-red-600 text-xs font-medium rounded-lg hover:bg-red-200" onClick={() => handleReject(schedule.id)}>거절</button>
                  </>
                ) : (
                  <div className="flex items-center gap-2">
                    <span className={`px-2 py-1 text-xs font-semibold rounded-full ${schedule.status === 'approved' ? 'bg-green-100 text-green-600' : 'bg-red-100 text-red-600'}`}>
                      {schedule.status === 'approved' ? '승인됨' : '거절됨'}
                    </span>
                    {schedule.status === 'approved' && isPastSchedule(schedule.date) && (
                      !hasRated(schedule.id) ? (
                        <button className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-medium rounded hover:bg-amber-200" onClick={() => openRatingModal(schedule)}>직원 별점</button>
                      ) : (
                        <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded">평가완료</span>
                      )
                    )}
                  </div>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      {filteredSchedules.length === 0 && (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">{filter === 'pending' ? '승인 대기 중인 출근 신청이 없습니다.' : '스케줄이 없습니다.'}</p>
        </div>
      )}

      {showRatingModal && selectedSchedule && (
        <RatingModal
          schedule={selectedSchedule}
          raterId={user?.id || ''}
          onClose={() => { setShowRatingModal(false); setSelectedSchedule(null); }}
          onSuccess={() => { setShowRatingModal(false); setSelectedSchedule(null); fetchSchedules(); }}
        />
      )}
    </div>
  );
}

function RatingModal({ schedule, raterId, onClose, onSuccess }: { schedule: Schedule; raterId: string; onClose: () => void; onSuccess: () => void; }) {
  const [rating, setRating] = useState(5);
  const [serviceRating, setServiceRating] = useState(5);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);
    const { error } = await supabase.from('ratings').insert({
      schedule_id: schedule.id, rater_id: raterId, target_type: 'staff', target_profile_id: schedule.staff_id,
      rating, service_rating: serviceRating, comment: comment || null,
    });
    setSubmitting(false);
    if (error) alert('별점 등록 중 오류가 발생했습니다.');
    else onSuccess();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-2">직원 별점</h2>
        <p className="text-slate-600 mb-4">{schedule.staff?.name}에게 별점을 주세요</p>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">기본 별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">{[1,2,3,4,5].map((star) => (<span key={star} className={`text-2xl cursor-pointer ${rating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setRating(star)}>★</span>))}</div>
            <span className="text-sm text-slate-600">{rating}점</span>
          </div>
        </div>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">서비스 별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">{[1,2,3,4,5].map((star) => (<span key={star} className={`text-2xl cursor-pointer ${serviceRating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setServiceRating(star)}>★</span>))}</div>
            <span className="text-sm text-slate-600">{serviceRating}점</span>
          </div>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">코멘트 (선택)</label>
          <textarea value={comment} onChange={(e) => setComment(e.target.value)} placeholder="코멘트를 남겨주세요..." rows={3} className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600" />
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={submitting} className="flex-1 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 transition-colors disabled:bg-slate-400">{submitting ? '등록 중...' : '별점 등록'}</button>
        </div>
      </div>
    </div>
  );
}
