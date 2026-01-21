import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
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

interface Reservation {
  id: number;
  store_id: number;
  customer_id: string;
  menu_id: number;
  date: string;
  start_time: string;
  end_time: string;
  status: string;
  store?: { name: string };
  menu?: { name: string; price: number };
  customer?: { name: string };
}

interface WorkRequest {
  id: number;
  store_id: number;
  admin_id: string;
  date: string;
  start_time: string;
  end_time: string;
  message: string | null;
  status: string;
  created_at: string;
  store?: { name: string };
  admin?: { name: string };
}

interface Availability {
  id: number;
  day_of_week: number;
  start_time: string;
  end_time: string;
}

interface Rating {
  id: number;
  reservation_id: number | null;
  schedule_id: number | null;
  target_type: string;
}

interface CustomerRating {
  avgRating: number | null;
  totalCount: number;
}

const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

type TabType = 'schedule' | 'reservation' | 'request' | 'availability';

export default function MySchedule() {
  const { user } = useAuth();
  const [activeTab, setActiveTab] = useState<TabType>('schedule');
  const [loading, setLoading] = useState(true);

  // Schedule data
  const [myStores, setMyStores] = useState<Store[]>([]);
  const [mySchedules, setMySchedules] = useState<Schedule[]>([]);
  const [pastSchedules, setPastSchedules] = useState<Schedule[]>([]);

  // Reservation data
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [customerRatings, setCustomerRatings] = useState<Record<string, CustomerRating>>({});
  const [blockedCustomers, setBlockedCustomers] = useState<Set<string>>(new Set());

  // Work request data
  const [workRequests, setWorkRequests] = useState<WorkRequest[]>([]);

  // Availability data
  const [availabilities, setAvailabilities] = useState<Availability[]>([]);

  // Rating data
  const [myRatings, setMyRatings] = useState<Rating[]>([]);

  // Modals
  const [showAddScheduleModal, setShowAddScheduleModal] = useState(false);
  const [showAddAvailabilityModal, setShowAddAvailabilityModal] = useState(false);
  const [showScheduleRatingModal, setShowScheduleRatingModal] = useState(false);
  const [showReservationRatingModal, setShowReservationRatingModal] = useState(false);
  const [selectedSchedule, setSelectedSchedule] = useState<Schedule | null>(null);
  const [selectedReservation, setSelectedReservation] = useState<Reservation | null>(null);

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchAllData();
    }
  }, [user]);

  const fetchAllData = async () => {
    if (!user) return;
    setLoading(true);

    await Promise.all([
      fetchScheduleData(),
      fetchReservationData(),
      fetchWorkRequestData(),
      fetchAvailabilityData(),
      fetchRatingsData(),
      fetchBlockedCustomers(),
    ]);

    setLoading(false);
  };

  const fetchScheduleData = async () => {
    if (!user) return;

    // Get stores where staff is registered
    const { data: storeStaff } = await supabase.from('store_staff').select('store_id').eq('staff_id', user.id);
    const myStoreIds = storeStaff?.map(s => s.store_id) || [];

    if (myStoreIds.length > 0) {
      const { data: storesData } = await supabase.from('stores').select('id, name').in('id', myStoreIds);
      setMyStores(storesData || []);
    }

    // This week schedules
    const nextWeek = new Date();
    nextWeek.setDate(nextWeek.getDate() + 7);
    const nextWeekStr = `${nextWeek.getFullYear()}-${String(nextWeek.getMonth() + 1).padStart(2, '0')}-${String(nextWeek.getDate()).padStart(2, '0')}`;

    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`*, store:stores(name)`)
      .eq('staff_id', user.id)
      .gte('date', today)
      .lte('date', nextWeekStr)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setMySchedules(schedulesData || []);

    // Past schedules (last 30 days)
    const pastMonth = new Date();
    pastMonth.setDate(pastMonth.getDate() - 30);
    const pastMonthStr = `${pastMonth.getFullYear()}-${String(pastMonth.getMonth() + 1).padStart(2, '0')}-${String(pastMonth.getDate()).padStart(2, '0')}`;

    const { data: pastData } = await supabase
      .from('schedules')
      .select(`*, store:stores(name)`)
      .eq('staff_id', user.id)
      .eq('status', 'approved')
      .lt('date', today)
      .gte('date', pastMonthStr)
      .order('date', { ascending: false });

    setPastSchedules(pastData || []);
  };

  const fetchReservationData = async () => {
    if (!user) return;

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`*, store:stores(name), menu:menus(name, price), customer:profiles!reservations_customer_id_fkey(name)`)
      .eq('staff_id', user.id)
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    setReservations(reservationsData || []);

    // Fetch customer ratings
    if (reservationsData && reservationsData.length > 0) {
      const customerIds = [...new Set(reservationsData.map(r => r.customer_id))];
      const { data: customerRatingsData } = await supabase
        .from('ratings')
        .select('target_profile_id, rating')
        .in('target_profile_id', customerIds)
        .eq('target_type', 'customer');

      if (customerRatingsData) {
        const ratingsByCustomer: Record<string, CustomerRating> = {};
        const grouped: Record<string, number[]> = {};

        customerRatingsData.forEach(r => {
          if (!r.target_profile_id) return;
          if (!grouped[r.target_profile_id]) grouped[r.target_profile_id] = [];
          if (r.rating) grouped[r.target_profile_id].push(r.rating);
        });

        Object.entries(grouped).forEach(([customerId, ratings]) => {
          ratingsByCustomer[customerId] = {
            avgRating: ratings.length > 0 ? ratings.reduce((a, b) => a + b, 0) / ratings.length : null,
            totalCount: ratings.length,
          };
        });

        setCustomerRatings(ratingsByCustomer);
      }
    }
  };

  const fetchWorkRequestData = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('work_requests')
      .select(`*, store:stores(name), admin:profiles!work_requests_admin_id_fkey(name)`)
      .eq('staff_id', user.id)
      .order('created_at', { ascending: false });

    setWorkRequests(data || []);
  };

  const fetchAvailabilityData = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('staff_availability')
      .select('*')
      .eq('staff_id', user.id)
      .eq('is_active', true)
      .order('day_of_week', { ascending: true })
      .order('start_time', { ascending: true });

    setAvailabilities(data || []);
  };

  const fetchRatingsData = async () => {
    if (!user) return;

    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('id, reservation_id, schedule_id, target_type')
      .eq('rater_id', user.id);

    setMyRatings(ratingsData || []);
  };

  const fetchBlockedCustomers = async () => {
    if (!user) return;
    const { data } = await supabase.from('blocks').select('blocked_id').eq('blocker_id', user.id);
    if (data) setBlockedCustomers(new Set(data.map(b => b.blocked_id)));
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const isToday = dateStr === today;
    return `${date.getMonth() + 1}/${date.getDate()} (${DAY_NAMES[date.getDay()]})${isToday ? ' 오늘' : ''}`;
  };

  // Schedule handlers
  const handleCancelSchedule = async (scheduleId: number) => {
    if (!confirm('이 스케줄을 취소하시겠습니까?')) return;
    const { error } = await supabase.from('schedules').delete().eq('id', scheduleId);
    if (error) alert('취소 중 오류가 발생했습니다.');
    else fetchScheduleData();
  };

  const hasScheduleRated = (scheduleId: number) => myRatings.some(r => r.schedule_id === scheduleId && r.target_type === 'store');

  // Reservation handlers
  const handleConfirmReservation = async (reservationId: number) => {
    const { error } = await supabase.from('reservations').update({ status: 'confirmed' }).eq('id', reservationId);
    if (error) alert('확정 처리 중 오류가 발생했습니다.');
    else fetchReservationData();
  };

  const handleRejectReservation = async (reservationId: number) => {
    const { error } = await supabase.from('reservations').update({ status: 'cancelled' }).eq('id', reservationId);
    if (error) alert('거절 처리 중 오류가 발생했습니다.');
    else fetchReservationData();
  };

  const handleCompleteReservation = async (reservationId: number) => {
    const { error } = await supabase.from('reservations').update({ status: 'completed' }).eq('id', reservationId);
    if (error) alert('완료 처리 중 오류가 발생했습니다.');
    else fetchReservationData();
  };

  const hasReservationRated = (reservationId: number) => myRatings.some(r => r.reservation_id === reservationId && r.target_type === 'customer');

  const handleBlockCustomer = async (customerId: string, customerName: string) => {
    if (!user) return;
    const isBlocked = blockedCustomers.has(customerId);

    if (isBlocked) {
      await supabase.from('blocks').delete().eq('blocker_id', user.id).eq('blocked_id', customerId);
      setBlockedCustomers(prev => { const next = new Set(prev); next.delete(customerId); return next; });
    } else {
      if (!confirm(`${customerName}님을 차단하시겠습니까?\n차단하면 이 손님은 당신을 볼 수 없습니다.`)) return;
      await supabase.from('blocks').insert({ blocker_id: user.id, blocked_id: customerId });
      setBlockedCustomers(prev => new Set([...prev, customerId]));
    }
  };

  // Work request handlers
  const handleAcceptRequest = async (request: WorkRequest) => {
    if (!user) return;

    const { data: existingSchedules } = await supabase
      .from('schedules')
      .select('id, start_time, end_time')
      .eq('staff_id', user.id)
      .eq('date', request.date)
      .in('status', ['approved', 'pending']);

    if (existingSchedules && existingSchedules.length > 0) {
      const hasConflict = existingSchedules.some(s => request.start_time < s.end_time && request.end_time > s.start_time);
      if (hasConflict) {
        alert('해당 시간에 이미 등록된 스케줄이 있습니다.');
        return;
      }
    }

    const { data: schedule, error: scheduleError } = await supabase
      .from('schedules')
      .insert({ store_id: request.store_id, staff_id: user.id, date: request.date, start_time: request.start_time, end_time: request.end_time, status: 'approved', type: 'assigned' })
      .select()
      .single();

    if (scheduleError) { alert('스케줄 생성 중 오류가 발생했습니다.'); return; }

    const { error: updateError } = await supabase
      .from('work_requests')
      .update({ status: 'accepted', schedule_id: schedule.id, responded_at: new Date().toISOString() })
      .eq('id', request.id);

    if (updateError) { alert('요청 업데이트 중 오류가 발생했습니다.'); return; }

    alert('출근 요청을 수락했습니다.');
    fetchWorkRequestData();
    fetchScheduleData();
  };

  const handleRejectRequest = async (requestId: number) => {
    if (!confirm('이 출근 요청을 거절하시겠습니까?')) return;
    const { error } = await supabase
      .from('work_requests')
      .update({ status: 'rejected', responded_at: new Date().toISOString() })
      .eq('id', requestId);
    if (error) alert('요청 처리 중 오류가 발생했습니다.');
    else fetchWorkRequestData();
  };

  // Availability handlers
  const handleDeleteAvailability = async (id: number) => {
    if (!confirm('이 가용 시간을 삭제하시겠습니까?')) return;
    const { error } = await supabase.from('staff_availability').delete().eq('id', id);
    if (error) alert('삭제 중 오류가 발생했습니다.');
    else fetchAvailabilityData();
  };

  // Computed values
  const pendingRequests = workRequests.filter(r => r.status === 'pending');
  const todayReservations = reservations.filter(r => r.date === today);
  const upcomingReservations = reservations.filter(r => r.date > today && r.status !== 'cancelled');
  const pendingReservations = reservations.filter(r => r.status === 'pending');

  const groupedAvailabilities = availabilities.reduce((acc, item) => {
    if (!acc[item.day_of_week]) acc[item.day_of_week] = [];
    acc[item.day_of_week].push(item);
    return acc;
  }, {} as Record<number, Availability[]>);

  if (loading) {
    return <div className="text-slate-500 p-4">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-4">내 스케줄</h1>

      {/* Tab Navigation */}
      <div className="flex bg-slate-100 p-1 rounded-xl mb-6 overflow-x-auto">
        <button
          className={`flex-1 py-2.5 px-3 rounded-lg text-sm font-semibold transition-colors whitespace-nowrap flex items-center justify-center gap-1 ${activeTab === 'schedule' ? 'bg-red-600 text-white' : 'text-slate-500'}`}
          onClick={() => setActiveTab('schedule')}
        >
          출근
          {mySchedules.length > 0 && <span className={`text-xs px-1.5 py-0.5 rounded ${activeTab === 'schedule' ? 'bg-white/30' : 'bg-slate-200'}`}>{mySchedules.length}</span>}
        </button>
        <button
          className={`flex-1 py-2.5 px-3 rounded-lg text-sm font-semibold transition-colors whitespace-nowrap flex items-center justify-center gap-1 ${activeTab === 'reservation' ? 'bg-red-600 text-white' : 'text-slate-500'}`}
          onClick={() => setActiveTab('reservation')}
        >
          예약
          {pendingReservations.length > 0 && <span className={`text-xs px-1.5 py-0.5 rounded ${activeTab === 'reservation' ? 'bg-white/30' : 'bg-orange-100 text-orange-600'}`}>{pendingReservations.length}</span>}
        </button>
        <button
          className={`flex-1 py-2.5 px-3 rounded-lg text-sm font-semibold transition-colors whitespace-nowrap flex items-center justify-center gap-1 ${activeTab === 'request' ? 'bg-red-600 text-white' : 'text-slate-500'}`}
          onClick={() => setActiveTab('request')}
        >
          출근요청
          {pendingRequests.length > 0 && <span className={`text-xs px-1.5 py-0.5 rounded ${activeTab === 'request' ? 'bg-white/30' : 'bg-orange-100 text-orange-600'}`}>{pendingRequests.length}</span>}
        </button>
        <button
          className={`flex-1 py-2.5 px-3 rounded-lg text-sm font-semibold transition-colors whitespace-nowrap ${activeTab === 'availability' ? 'bg-red-600 text-white' : 'text-slate-500'}`}
          onClick={() => setActiveTab('availability')}
        >
          가용시간
        </button>
      </div>

      {/* Schedule Tab */}
      {activeTab === 'schedule' && (
        <div>
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-900">이번 주 출근</h2>
            <button className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors" onClick={() => setShowAddScheduleModal(true)}>
              + 출근 등록
            </button>
          </div>

          {mySchedules.length > 0 ? (
            <div className="flex flex-col gap-3 mb-8">
              {mySchedules.map(schedule => (
                <div key={schedule.id} className={`flex items-center gap-4 p-4 bg-white border rounded-xl ${schedule.status === 'approved' ? 'border-green-300' : schedule.status === 'pending' ? 'border-orange-300' : 'border-red-300'}`}>
                  <div className="text-center min-w-[70px]">
                    <span className="block text-sm font-medium text-slate-900">{formatDate(schedule.date)}</span>
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="font-semibold text-slate-900 truncate">{schedule.store?.name}</div>
                    <div className="text-sm text-slate-600">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</div>
                  </div>
                  <div className="flex items-center gap-2 flex-shrink-0">
                    <span className={`px-2 py-1 text-xs font-semibold rounded-full ${schedule.status === 'approved' ? 'bg-green-100 text-green-600' : schedule.status === 'pending' ? 'bg-orange-100 text-orange-600' : 'bg-red-100 text-red-600'}`}>
                      {schedule.status === 'approved' ? '승인됨' : schedule.status === 'pending' ? '대기중' : '거절됨'}
                    </span>
                    <span className="px-2 py-1 bg-slate-100 text-slate-600 text-xs font-medium rounded-full">
                      {schedule.type === 'assigned' ? '배정' : schedule.type === 'requested' ? '신청' : '자율'}
                    </span>
                  </div>
                  {schedule.status === 'pending' && (
                    <button className="px-3 py-1.5 text-xs text-red-500 hover:bg-red-50 rounded-lg transition-colors" onClick={() => handleCancelSchedule(schedule.id)}>취소</button>
                  )}
                </div>
              ))}
            </div>
          ) : (
            <div className="p-6 bg-slate-50 rounded-xl text-center mb-8">
              <p className="text-slate-500 mb-3">등록된 스케줄이 없습니다.</p>
              <button className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors" onClick={() => setShowAddScheduleModal(true)}>
                출근 등록하기
              </button>
            </div>
          )}

          {pastSchedules.length > 0 && (
            <section>
              <h2 className="text-lg font-semibold text-slate-900 mb-3">지난 출근</h2>
              <div className="flex flex-col gap-2 opacity-80">
                {pastSchedules.slice(0, 5).map(schedule => (
                  <div key={schedule.id} className="flex items-center gap-4 p-4 bg-white border border-slate-200 rounded-xl">
                    <div className="text-center min-w-[70px]">
                      <span className="block text-sm text-slate-600">{formatDate(schedule.date)}</span>
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="font-medium text-slate-700 truncate">{schedule.store?.name}</div>
                      <div className="text-sm text-slate-500">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</div>
                    </div>
                    {!hasScheduleRated(schedule.id) ? (
                      <button className="px-3 py-1.5 bg-amber-100 text-amber-700 text-xs font-medium rounded-lg hover:bg-amber-200 transition-colors" onClick={() => { setSelectedSchedule(schedule); setShowScheduleRatingModal(true); }}>
                        가게 별점
                      </button>
                    ) : (
                      <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded-full">평가완료</span>
                    )}
                  </div>
                ))}
              </div>
            </section>
          )}
        </div>
      )}

      {/* Reservation Tab */}
      {activeTab === 'reservation' && (
        <div>
          <h2 className="text-lg font-semibold text-slate-900 mb-3">오늘 예약 ({todayReservations.length}건)</h2>
          {todayReservations.length > 0 ? (
            <div className="flex flex-col gap-3 mb-8">
              {todayReservations.map(r => <ReservationCard key={r.id} reservation={r} customerRatings={customerRatings} blockedCustomers={blockedCustomers} onConfirm={handleConfirmReservation} onReject={handleRejectReservation} onComplete={handleCompleteReservation} onBlock={handleBlockCustomer} hasRated={hasReservationRated} onRate={() => { setSelectedReservation(r); setShowReservationRatingModal(true); }} />)}
            </div>
          ) : (
            <p className="text-slate-400 text-sm py-4 mb-8">오늘 예약이 없습니다.</p>
          )}

          <h2 className="text-lg font-semibold text-slate-900 mb-3">예정된 예약 ({upcomingReservations.length}건)</h2>
          {upcomingReservations.length > 0 ? (
            <div className="flex flex-col gap-3">
              {upcomingReservations.map(r => <ReservationCard key={r.id} reservation={r} customerRatings={customerRatings} blockedCustomers={blockedCustomers} onConfirm={handleConfirmReservation} onReject={handleRejectReservation} onComplete={handleCompleteReservation} onBlock={handleBlockCustomer} hasRated={hasReservationRated} onRate={() => { setSelectedReservation(r); setShowReservationRatingModal(true); }} />)}
            </div>
          ) : (
            <p className="text-slate-400 text-sm py-4">예정된 예약이 없습니다.</p>
          )}
        </div>
      )}

      {/* Work Request Tab */}
      {activeTab === 'request' && (
        <div>
          <h2 className="text-lg font-semibold text-slate-900 mb-3">대기 중인 출근 요청 ({pendingRequests.length}건)</h2>
          {pendingRequests.length > 0 ? (
            <div className="flex flex-col gap-3 mb-8">
              {pendingRequests.map(request => (
                <div key={request.id} className="p-4 bg-white border border-orange-300 rounded-xl">
                  <div className="flex items-start justify-between mb-3">
                    <span className="font-semibold text-slate-900">{request.store?.name}</span>
                    <span className="px-2 py-1 text-xs font-semibold rounded-full bg-orange-100 text-orange-600">대기중</span>
                  </div>
                  <div className="text-lg font-bold text-slate-900 mb-1">{formatDate(request.date)}</div>
                  <div className="text-slate-600 mb-3">{request.start_time.slice(0, 5)} - {request.end_time.slice(0, 5)}</div>
                  {request.message && (
                    <div className="p-3 bg-slate-50 rounded-lg mb-3">
                      <span className="text-xs text-slate-500">메시지:</span>
                      <p className="text-sm text-slate-700 mt-1">{request.message}</p>
                    </div>
                  )}
                  <div className="text-xs text-slate-500 mb-4">요청자: {request.admin?.name}</div>
                  <div className="flex gap-2">
                    <button className="flex-1 py-2.5 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors" onClick={() => handleRejectRequest(request.id)}>거절</button>
                    <button className="flex-1 py-2.5 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors" onClick={() => handleAcceptRequest(request)}>수락</button>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <p className="text-slate-400 text-sm py-4 mb-8">대기 중인 출근 요청이 없습니다.</p>
          )}

          {workRequests.filter(r => r.status !== 'pending').length > 0 && (
            <section>
              <h2 className="text-lg font-semibold text-slate-900 mb-3">지난 요청</h2>
              <div className="flex flex-col gap-2 opacity-80">
                {workRequests.filter(r => r.status !== 'pending').slice(0, 5).map(request => (
                  <div key={request.id} className={`p-4 bg-white border rounded-xl ${request.status === 'accepted' ? 'border-green-300' : 'border-slate-200'}`}>
                    <div className="flex items-center justify-between mb-2">
                      <span className="font-medium text-slate-700">{request.store?.name}</span>
                      <span className={`px-2 py-1 text-xs font-semibold rounded-full ${request.status === 'accepted' ? 'bg-green-100 text-green-600' : 'bg-red-100 text-red-600'}`}>
                        {request.status === 'accepted' ? '수락됨' : '거절됨'}
                      </span>
                    </div>
                    <div className="text-sm text-slate-600">{formatDate(request.date)} · {request.start_time.slice(0, 5)} - {request.end_time.slice(0, 5)}</div>
                  </div>
                ))}
              </div>
            </section>
          )}
        </div>
      )}

      {/* Availability Tab */}
      {activeTab === 'availability' && (
        <div>
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-900">가용 시간 관리</h2>
            <button className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors" onClick={() => setShowAddAvailabilityModal(true)}>
              + 시간 추가
            </button>
          </div>
          <p className="text-sm text-slate-500 mb-6">출근 가능한 요일과 시간대를 등록하면, 관리자가 해당 시간에 출근 요청을 보낼 수 있습니다.</p>

          <div className="grid grid-cols-7 gap-2 mb-8 max-md:grid-cols-4 max-sm:grid-cols-2">
            {[0, 1, 2, 3, 4, 5, 6].map(day => (
              <div key={day} className="bg-white border border-slate-200 rounded-xl overflow-hidden">
                <div className="p-3 bg-slate-50 border-b border-slate-200 text-center">
                  <span className="font-semibold text-slate-900">{DAY_NAMES[day]}요일</span>
                </div>
                <div className="p-2 min-h-[80px]">
                  {groupedAvailabilities[day]?.length > 0 ? (
                    <div className="flex flex-col gap-1">
                      {groupedAvailabilities[day].map(avail => (
                        <div key={avail.id} className="flex items-center justify-between p-2 bg-orange-50 rounded-lg text-xs">
                          <span className="text-orange-700 font-medium">{avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}</span>
                          <button className="w-5 h-5 flex items-center justify-center text-slate-400 hover:text-red-500 hover:bg-red-50 rounded" onClick={() => handleDeleteAvailability(avail.id)}>×</button>
                        </div>
                      ))}
                    </div>
                  ) : (
                    <p className="text-xs text-slate-400 text-center py-4">없음</p>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Modals */}
      {showAddScheduleModal && (
        <AddScheduleModal stores={myStores} staffId={user?.id || ''} onClose={() => setShowAddScheduleModal(false)} onSuccess={() => { setShowAddScheduleModal(false); fetchScheduleData(); }} />
      )}

      {showAddAvailabilityModal && (
        <AddAvailabilityModal staffId={user?.id || ''} onClose={() => setShowAddAvailabilityModal(false)} onSuccess={() => { setShowAddAvailabilityModal(false); fetchAvailabilityData(); }} />
      )}

      {showScheduleRatingModal && selectedSchedule && (
        <ScheduleRatingModal schedule={selectedSchedule} raterId={user?.id || ''} onClose={() => { setShowScheduleRatingModal(false); setSelectedSchedule(null); }} onSuccess={() => { setShowScheduleRatingModal(false); setSelectedSchedule(null); fetchRatingsData(); }} />
      )}

      {showReservationRatingModal && selectedReservation && (
        <ReservationRatingModal reservation={selectedReservation} raterId={user?.id || ''} onClose={() => { setShowReservationRatingModal(false); setSelectedReservation(null); }} onSuccess={() => { setShowReservationRatingModal(false); setSelectedReservation(null); fetchRatingsData(); fetchReservationData(); }} />
      )}
    </div>
  );
}

function ReservationCard({ reservation, customerRatings, blockedCustomers, onConfirm, onReject, onComplete, onBlock, hasRated, onRate }: {
  reservation: Reservation;
  customerRatings: Record<string, CustomerRating>;
  blockedCustomers: Set<string>;
  onConfirm: (id: number) => void;
  onReject: (id: number) => void;
  onComplete: (id: number) => void;
  onBlock: (id: string, name: string) => void;
  hasRated: (id: number) => boolean;
  onRate: () => void;
}) {
  const customerRating = customerRatings[reservation.customer_id];
  const isBlocked = blockedCustomers.has(reservation.customer_id);
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  return (
    <div className={`p-4 bg-white border rounded-xl ${reservation.status === 'confirmed' ? 'border-green-300' : reservation.status === 'pending' ? 'border-orange-300' : 'border-slate-200 opacity-60'}`}>
      <div className="flex gap-4">
        <div className="text-center min-w-[60px]">
          <span className="block text-lg font-bold text-slate-900">{reservation.start_time.slice(0, 5)}</span>
          <span className="text-xs text-slate-500">{formatDate(reservation.date)}</span>
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-baseline gap-2 mb-1">
            <span className="font-semibold text-slate-900 truncate">{reservation.menu?.name}</span>
            <span className="text-sm font-medium text-orange-600 flex-shrink-0">{reservation.menu?.price?.toLocaleString()}원</span>
          </div>
          <div className="text-sm text-slate-600 truncate">{reservation.store?.name}</div>
          <div className="flex items-center gap-2 text-xs text-slate-500 mt-1 flex-wrap">
            <span>손님: {reservation.customer?.name || '고객'}</span>
            {customerRating && customerRating.totalCount > 0 && (
              <span className="inline-flex items-center gap-0.5 px-1.5 py-0.5 bg-amber-50 text-amber-600 rounded">★ {customerRating.avgRating?.toFixed(1)}</span>
            )}
            <button className={`px-2 py-0.5 text-xs rounded ${isBlocked ? 'bg-red-100 text-red-600' : 'bg-slate-100 text-slate-500 hover:bg-slate-200'}`} onClick={() => onBlock(reservation.customer_id, reservation.customer?.name || '고객')}>
              {isBlocked ? '차단됨' : '차단'}
            </button>
          </div>
        </div>
        <div className="flex flex-col items-end gap-2 flex-shrink-0">
          <span className={`px-2 py-1 text-xs font-semibold rounded-full ${reservation.status === 'confirmed' ? 'bg-green-100 text-green-600' : reservation.status === 'pending' ? 'bg-orange-100 text-orange-600' : 'bg-slate-100 text-slate-500'}`}>
            {reservation.status === 'confirmed' ? '확정' : reservation.status === 'pending' ? '대기' : reservation.status === 'completed' ? '완료' : '취소'}
          </span>
          {reservation.status === 'pending' && (
            <div className="flex gap-1">
              <button className="px-2 py-1 bg-green-600 text-white text-xs font-medium rounded hover:bg-green-700" onClick={() => onConfirm(reservation.id)}>확정</button>
              <button className="px-2 py-1 bg-red-100 text-red-600 text-xs font-medium rounded hover:bg-red-200" onClick={() => onReject(reservation.id)}>거절</button>
            </div>
          )}
          {reservation.status === 'confirmed' && (
            <button className="px-2 py-1 bg-red-600 text-white text-xs font-medium rounded hover:bg-red-700" onClick={() => onComplete(reservation.id)}>완료</button>
          )}
          {reservation.status === 'completed' && !hasRated(reservation.id) && (
            <button className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-medium rounded hover:bg-amber-200" onClick={onRate}>별점</button>
          )}
          {reservation.status === 'completed' && hasRated(reservation.id) && (
            <span className="px-2 py-1 bg-slate-100 text-slate-500 text-xs rounded">평가완료</span>
          )}
        </div>
      </div>
    </div>
  );
}

function AddScheduleModal({ stores, staffId, onClose, onSuccess }: { stores: Store[]; staffId: string; onClose: () => void; onSuccess: () => void; }) {
  const [storeId, setStoreId] = useState<number | ''>('');
  const [date, setDate] = useState('');
  const [startTime, setStartTime] = useState('10:00');
  const [endTime, setEndTime] = useState('18:00');
  const [submitting, setSubmitting] = useState(false);

  const dateOptions = Array.from({ length: 7 }, (_, i) => {
    const d = new Date();
    d.setDate(d.getDate() + i);
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
  });

  const formatDateOption = (dateStr: string) => {
    const d = new Date(dateStr);
    return `${d.getMonth() + 1}/${d.getDate()} (${DAY_NAMES[d.getDay()]})`;
  };

  const handleSubmit = async () => {
    if (!storeId || !date) return;
    setSubmitting(true);
    const { error } = await supabase.from('schedules').insert({ store_id: storeId, staff_id: staffId, date, start_time: startTime, end_time: endTime, type: 'requested', status: 'pending' });
    setSubmitting(false);
    if (error) alert('등록 중 오류가 발생했습니다.');
    else { alert('출근 신청이 완료되었습니다. 관리자 승인 후 확정됩니다.'); onSuccess(); }
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full max-h-[90vh] overflow-y-auto" onClick={e => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">출근 등록</h2>
        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">가게 선택</label>
          <select value={storeId} onChange={e => setStoreId(Number(e.target.value))} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
            <option value="">가게를 선택하세요</option>
            {stores.map(store => <option key={store.id} value={store.id}>{store.name}</option>)}
          </select>
        </div>
        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">날짜 선택</label>
          <div className="grid grid-cols-4 gap-2 max-sm:grid-cols-3">
            {dateOptions.map(d => (
              <button key={d} type="button" className={`px-3 py-2 text-sm rounded-lg border transition-colors ${date === d ? 'bg-red-600 text-white border-red-600' : 'bg-white text-slate-700 border-slate-200 hover:border-red-600'}`} onClick={() => setDate(d)}>
                {formatDateOption(d)}
              </button>
            ))}
          </div>
        </div>
        <div className="grid grid-cols-2 gap-4 mb-6">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">시작 시간</label>
            <select value={startTime} onChange={e => setStartTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
              {Array.from({ length: 24 }, (_, i) => i).map(h => <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>{h.toString().padStart(2, '0')}:00</option>)}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">종료 시간</label>
            <select value={endTime} onChange={e => setEndTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
              {Array.from({ length: 24 }, (_, i) => i).map(h => <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>{h.toString().padStart(2, '0')}:00</option>)}
            </select>
          </div>
        </div>
        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={!storeId || !date || submitting} className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400">
            {submitting ? '신청 중...' : '신청하기'}
          </button>
        </div>
      </div>
    </div>
  );
}

function AddAvailabilityModal({ staffId, onClose, onSuccess }: { staffId: string; onClose: () => void; onSuccess: () => void; }) {
  const [selectedDays, setSelectedDays] = useState<number[]>([]);
  const [startTime, setStartTime] = useState('10:00');
  const [endTime, setEndTime] = useState('18:00');
  const [submitting, setSubmitting] = useState(false);

  const toggleDay = (day: number) => setSelectedDays(prev => prev.includes(day) ? prev.filter(d => d !== day) : [...prev, day]);

  const handleSubmit = async () => {
    if (selectedDays.length === 0) { alert('요일을 선택해주세요.'); return; }
    if (startTime >= endTime) { alert('종료 시간은 시작 시간보다 늦어야 합니다.'); return; }
    setSubmitting(true);
    const insertData = selectedDays.map(day => ({ staff_id: staffId, day_of_week: day, start_time: startTime, end_time: endTime, is_active: true }));
    const { error } = await supabase.from('staff_availability').insert(insertData);
    setSubmitting(false);
    if (error) {
      if (error.code === '23505') alert('이미 등록된 시간대가 있습니다.');
      else alert('등록 중 오류가 발생했습니다.');
    } else onSuccess();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={e => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">가용 시간 추가</h2>
        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">요일 선택 (복수 선택 가능)</label>
          <div className="flex gap-2 flex-wrap">
            {[1, 2, 3, 4, 5, 6, 0].map(day => (
              <button key={day} type="button" className={`w-10 h-10 rounded-full text-sm font-medium transition-colors ${selectedDays.includes(day) ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'}`} onClick={() => toggleDay(day)}>
                {DAY_NAMES[day]}
              </button>
            ))}
          </div>
        </div>
        <div className="grid grid-cols-2 gap-4 mb-6">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">시작 시간</label>
            <select value={startTime} onChange={e => setStartTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
              {Array.from({ length: 24 }, (_, i) => i).map(h => <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>{h.toString().padStart(2, '0')}:00</option>)}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">종료 시간</label>
            <select value={endTime} onChange={e => setEndTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
              {Array.from({ length: 24 }, (_, i) => i).map(h => <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>{h.toString().padStart(2, '0')}:00</option>)}
            </select>
          </div>
        </div>
        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={selectedDays.length === 0 || submitting} className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400">
            {submitting ? '등록 중...' : '등록하기'}
          </button>
        </div>
      </div>
    </div>
  );
}

function ScheduleRatingModal({ schedule, raterId, onClose, onSuccess }: { schedule: Schedule; raterId: string; onClose: () => void; onSuccess: () => void; }) {
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);
    const { error } = await supabase.from('ratings').insert({ schedule_id: schedule.id, rater_id: raterId, target_type: 'store', target_store_id: schedule.store_id, rating, comment: comment || null });
    setSubmitting(false);
    if (error) alert('별점 등록 중 오류가 발생했습니다.');
    else onSuccess();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={e => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-2">가게 별점</h2>
        <p className="text-slate-600 mb-4">{schedule.store?.name}에 별점을 주세요</p>
        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">{[1, 2, 3, 4, 5].map(star => <span key={star} className={`text-2xl cursor-pointer ${rating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setRating(star)}>★</span>)}</div>
            <span className="text-sm text-slate-600">{rating}점</span>
          </div>
        </div>
        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">코멘트 (선택)</label>
          <textarea value={comment} onChange={e => setComment(e.target.value)} placeholder="코멘트를 남겨주세요..." rows={3} className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
        </div>
        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={submitting} className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400">{submitting ? '등록 중...' : '별점 등록'}</button>
        </div>
      </div>
    </div>
  );
}

function ReservationRatingModal({ reservation, raterId, onClose, onSuccess }: { reservation: Reservation; raterId: string; onClose: () => void; onSuccess: () => void; }) {
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);
    const { error } = await supabase.from('ratings').insert({ reservation_id: reservation.id, rater_id: raterId, target_type: 'customer', target_profile_id: reservation.customer_id, rating, comment: comment || null });
    setSubmitting(false);
    if (error) alert('별점 등록 중 오류가 발생했습니다.');
    else onSuccess();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={e => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-2">손님 별점</h2>
        <p className="text-slate-600 mb-4">{reservation.customer?.name || '손님'}님에게 별점을 주세요</p>
        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">별점</label>
          <div className="flex items-center gap-2">
            <div className="flex">{[1, 2, 3, 4, 5].map(star => <span key={star} className={`text-2xl cursor-pointer ${rating >= star ? 'text-amber-400' : 'text-slate-300'}`} onClick={() => setRating(star)}>★</span>)}</div>
            <span className="text-sm text-slate-600">{rating}점</span>
          </div>
        </div>
        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">코멘트 (선택)</label>
          <textarea value={comment} onChange={e => setComment(e.target.value)} placeholder="코멘트를 남겨주세요..." rows={3} className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
        </div>
        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={submitting} className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400">{submitting ? '등록 중...' : '별점 등록'}</button>
        </div>
      </div>
    </div>
  );
}
