import { useState, useEffect } from 'react';
import { useParams, Link, useLocation } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Staff {
  id: string;
  name: string;
  bio: string | null;
  specialties: string[] | null;
  profile_photo_url: string | null;
  age: number | null;
  height: number | null;
  weight: number | null;
  body_size: string | null;
  is_smoker: boolean | null;
  personality: string | null;
  style: string | null;
  skin_tone: string | null;
  hair_length: string | null;
  hair_style: string | null;
  hair_color: string | null;
  is_waxed: boolean | null;
  job: string | null;
  mbti: string | null;
  created_by_admin_id: string | null;
  nationalities: string[] | null;
  languages: string[] | null;
}

interface DailyPhoto {
  id: number;
  photo_url: string;
  date: string;
  caption: string | null;
}

interface GalleryPhoto {
  id: number;
  photo_url: string;
  sort_order: number;
}

interface Store {
  id: number;
  name: string;
  address: string;
  store_type?: string;
}

interface Menu {
  id: number;
  name: string;
  price: number;
  description: string | null;
}

interface Schedule {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  store?: Store;
}

interface StaffRating {
  customerAvgRating: number | null;
  customerAvgServiceRating: number | null;
  customerCount: number;
  adminAvgRating: number | null;
  adminAvgServiceRating: number | null;
  adminCount: number;
}

const getLocalToday = () => {
  const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
};

export default function StaffDetail() {
  const { id } = useParams<{ id: string }>();
  const { user } = useAuth();
  const location = useLocation();
  const [staff, setStaff] = useState<Staff | null>(null);
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [affiliatedStores, setAffiliatedStores] = useState<Store[]>([]);
  const [dailyPhotos, setDailyPhotos] = useState<DailyPhoto[]>([]);
  const [galleryPhotos, setGalleryPhotos] = useState<GalleryPhoto[]>([]);
  const [reservationCounts, setReservationCounts] = useState<Record<number, number>>({});
  const [loading, setLoading] = useState(true);
  const [selectedSchedule, setSelectedSchedule] = useState<number | null>(null);
  const [showReservationModal, setShowReservationModal] = useState(false);
  const [selectedPhotoIndex, setSelectedPhotoIndex] = useState<number | null>(null);
  const [selectedPhotoList, setSelectedPhotoList] = useState<{ id: number; photo_url: string; caption: string | null }[]>([]);
  const [staffRating, setStaffRating] = useState<StaffRating>({ customerAvgRating: null, customerAvgServiceRating: null, customerCount: 0, adminAvgRating: null, adminAvgServiceRating: null, adminCount: 0 });
  const [isFavorite, setIsFavorite] = useState(false);
  const [isBlocked, setIsBlocked] = useState(false);

  useEffect(() => {
    if (id) {
      fetchData();
      if (user) { checkFavorite(); checkBlocked(); }
    }
  }, [id, user, location.key]);

  const checkBlocked = async () => {
    if (!user || !id) return;
    try {
      const { data, error } = await supabase.from('blocks').select('id').eq('blocker_id', id).eq('blocked_id', user.id).maybeSingle();
      if (!error && data) setIsBlocked(true);
    } catch { /* ignore */ }
  };

  const checkFavorite = async () => {
    if (!user || !id) return;
    const { data } = await supabase.from('favorites').select('id').eq('user_id', user.id).eq('target_type', 'staff').eq('target_staff_id', id).maybeSingle();
    setIsFavorite(!!data);
  };

  const toggleFavorite = async () => {
    if (!user || !id) return;
    if (isFavorite) {
      await supabase.from('favorites').delete().eq('user_id', user.id).eq('target_type', 'staff').eq('target_staff_id', id);
      setIsFavorite(false);
    } else {
      await supabase.from('favorites').insert({ user_id: user.id, target_type: 'staff', target_staff_id: id });
      setIsFavorite(true);
    }
  };

  const fetchData = async () => {
    if (!id) return;

    const { data: staffData } = await supabase.from('profiles').select('*').eq('id', id).single();
    if (!staffData) { setLoading(false); return; }

    // Check if staff is hidden (for customer view)
    if (user?.role === 'customer' && staffData.is_visible === false) {
      setLoading(false);
      return;
    }

    // Fetch hidden store types
    const { data: visibilityData } = await supabase
      .from('store_type_visibility')
      .select('store_type')
      .eq('is_visible', false);
    const hiddenStoreTypes = new Set(visibilityData?.map(v => v.store_type) || []);

    // Check if staff is affiliated with any visible store type
    const { data: storeStaffData } = await supabase.from('store_staff').select('store_id').eq('staff_id', id);
    let affiliatedStoresList: Store[] = [];
    if (storeStaffData && storeStaffData.length > 0) {
      const storeIds = storeStaffData.map(s => s.store_id);
      const { data: storesData } = await supabase.from('stores').select('*').in('id', storeIds);
      affiliatedStoresList = storesData || [];

      // If staff has stores, check if at least one store type is visible
      if (affiliatedStoresList.length > 0) {
        const hasVisibleStore = affiliatedStoresList.some(store =>
          !store.store_type || !hiddenStoreTypes.has(store.store_type)
        );
        if (!hasVisibleStore) {
          // All affiliated stores have hidden store types - block access
          setLoading(false);
          return;
        }
      }
    }

    setStaff(staffData);
    setAffiliatedStores(affiliatedStoresList);

    const today = getLocalToday();

    const { data: schedulesData } = await supabase.from('schedules').select(`*, store:stores(*)`).eq('staff_id', id).eq('status', 'approved').gte('date', today).order('date', { ascending: true });
    setSchedules(schedulesData || []);

    if (schedulesData && schedulesData.length > 0) {
      const counts: Record<number, number> = {};
      for (const schedule of schedulesData) {
        const { count } = await supabase.from('reservations').select('*', { count: 'exact', head: true }).eq('staff_id', id).eq('store_id', schedule.store_id).eq('date', schedule.date).neq('status', 'cancelled');
        counts[schedule.id] = count || 0;
      }
      setReservationCounts(counts);
    }

    const { data: photosData } = await supabase.from('staff_photos').select('*').eq('staff_id', id).order('date', { ascending: false }).limit(20);
    setDailyPhotos(photosData || []);

    // Fetch gallery photos
    const { data: galleryData } = await supabase.from('staff_gallery').select('*').eq('staff_id', id).order('sort_order', { ascending: true });
    setGalleryPhotos(galleryData || []);

    const { data: ratingsData } = await supabase.from('ratings').select('rating, service_rating, reservation_id, schedule_id').eq('target_profile_id', id).eq('target_type', 'staff');

    if (ratingsData && ratingsData.length > 0) {
      const customerRatings = ratingsData.filter(r => r.reservation_id !== null);
      const customerRatingValues = customerRatings.map(r => r.rating).filter(r => r !== null);
      const customerServiceValues = customerRatings.map(r => r.service_rating).filter(r => r !== null);
      const adminRatings = ratingsData.filter(r => r.schedule_id !== null);
      const adminRatingValues = adminRatings.map(r => r.rating).filter(r => r !== null);
      const adminServiceValues = adminRatings.map(r => r.service_rating).filter(r => r !== null);

      setStaffRating({
        customerAvgRating: customerRatingValues.length > 0 ? customerRatingValues.reduce((a, b) => a + b, 0) / customerRatingValues.length : null,
        customerAvgServiceRating: customerServiceValues.length > 0 ? customerServiceValues.reduce((a, b) => a + b, 0) / customerServiceValues.length : null,
        customerCount: customerRatings.length,
        adminAvgRating: adminRatingValues.length > 0 ? adminRatingValues.reduce((a, b) => a + b, 0) / adminRatingValues.length : null,
        adminAvgServiceRating: adminServiceValues.length > 0 ? adminServiceValues.reduce((a, b) => a + b, 0) / adminServiceValues.length : null,
        adminCount: adminRatings.length,
      });
    }

    setLoading(false);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  const handleReserve = (scheduleId: number) => { setSelectedSchedule(scheduleId); setShowReservationModal(true); };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  if (!staff || isBlocked) {
    return (
      <div>
        <p className="text-slate-500 mb-4">매니저를 찾을 수 없습니다.</p>
        <Link to="/" className="text-orange-600 text-sm hover:underline">← 돌아가기</Link>
      </div>
    );
  }

  const today = getLocalToday();

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 매니저 목록</Link>

      {/* Profile Header */}
      <div className="flex gap-5 p-5 bg-white border border-slate-200 rounded-xl mb-6 max-sm:flex-col max-sm:items-center max-sm:text-center">
        <div className="w-28 h-28 rounded-2xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-3xl font-bold text-white overflow-hidden flex-shrink-0">
          {staff.profile_photo_url ? (
            <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
          ) : (
            staff.name.charAt(0)
          )}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-3 mb-2 max-sm:justify-center">
            <h1 className="text-2xl font-bold text-slate-900">{staff.name}</h1>
            {staff.created_by_admin_id ? (
              <span className="px-2 py-1 bg-purple-50 text-purple-600 text-xs font-medium rounded">실장 등록</span>
            ) : (
              <span className="px-2 py-1 bg-green-50 text-green-600 text-xs font-medium rounded">본인 등록</span>
            )}
            <button className={`w-9 h-9 flex items-center justify-center text-xl rounded-full transition-colors ${isFavorite ? 'text-red-500 bg-red-50' : 'text-slate-300 hover:text-red-500 hover:bg-red-50'}`} onClick={toggleFavorite}>
              {isFavorite ? '♥' : '♡'}
            </button>
          </div>

          {(staff.age || staff.height || staff.weight || staff.body_size || staff.job || staff.mbti) && (
            <div className="flex flex-wrap gap-2 mb-3 max-sm:justify-center">
              {staff.job && <span className="px-2 py-1 bg-blue-50 text-blue-600 text-sm rounded">{staff.job}</span>}
              {staff.mbti && <span className="px-2 py-1 bg-purple-50 text-purple-600 text-sm rounded">{staff.mbti}</span>}
              {staff.age && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.age}세</span>}
              {staff.height && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.height}cm</span>}
              {staff.weight && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.weight}kg</span>}
              {staff.body_size && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.body_size}컵</span>}
            </div>
          )}

          {(staffRating.customerCount > 0 || staffRating.adminCount > 0) && (
            <div className="flex flex-wrap gap-4 mb-3 max-sm:justify-center">
              {staffRating.customerCount > 0 && (
                <div className="flex items-center gap-2 text-sm">
                  <span className="text-slate-500">손님</span>
                  <span className="text-amber-500">★</span>
                  <span className="font-medium text-slate-900">{staffRating.customerAvgRating?.toFixed(1)}</span>
                  {staffRating.customerAvgServiceRating && (
                    <span className="text-slate-400">서비스 {staffRating.customerAvgServiceRating?.toFixed(1)}</span>
                  )}
                  <span className="text-slate-400">({staffRating.customerCount})</span>
                </div>
              )}
              {staffRating.adminCount > 0 && (
                <div className="flex items-center gap-2 text-sm">
                  <span className="text-slate-500">실장</span>
                  <span className="text-amber-500">★</span>
                  <span className="font-medium text-slate-900">{staffRating.adminAvgRating?.toFixed(1)}</span>
                  <span className="text-slate-400">({staffRating.adminCount})</span>
                </div>
              )}
            </div>
          )}

          {staff.bio && <p className="text-slate-600 mb-3">{staff.bio}</p>}

          {staff.specialties && (
            <div className="flex flex-wrap gap-1 max-sm:justify-center">
              {staff.specialties.map((s) => (
                <span key={s} className="px-2 py-1 bg-orange-50 text-orange-600 text-sm rounded">{s}</span>
              ))}
            </div>
          )}

          {((staff.nationalities && staff.nationalities.length > 0) || (staff.languages && staff.languages.length > 0)) && (
            <div className="flex flex-wrap gap-2 mt-3 max-sm:justify-center">
              {staff.nationalities && staff.nationalities.map((n) => (
                <span key={n} className="px-2 py-1 bg-green-50 text-green-600 text-sm rounded">{n}</span>
              ))}
              {staff.languages && staff.languages.map((l) => (
                <span key={l} className="px-2 py-1 bg-indigo-50 text-indigo-600 text-sm rounded">{l}</span>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Profile Details */}
      {(staff.skin_tone || staff.hair_length || staff.hair_style || staff.hair_color || staff.is_waxed !== null || staff.is_smoker !== null || staff.personality || staff.style) && (
        <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">상세 프로필</h2>
          <div className="grid grid-cols-2 gap-6 max-sm:grid-cols-1">
            {(staff.skin_tone || staff.hair_length || staff.hair_style || staff.hair_color || staff.is_waxed !== null) && (
              <div>
                <h3 className="text-sm font-medium text-slate-500 mb-2">외모</h3>
                <div className="flex flex-col gap-2">
                  {staff.skin_tone && <div className="flex justify-between text-sm"><span className="text-slate-500">피부톤</span><span className="text-slate-900">{staff.skin_tone}</span></div>}
                  {staff.hair_length && <div className="flex justify-between text-sm"><span className="text-slate-500">머리길이</span><span className="text-slate-900">{staff.hair_length}</span></div>}
                  {staff.hair_style && <div className="flex justify-between text-sm"><span className="text-slate-500">헤어스타일</span><span className="text-slate-900">{staff.hair_style}</span></div>}
                  {staff.hair_color && <div className="flex justify-between text-sm"><span className="text-slate-500">머리색</span><span className="text-slate-900">{staff.hair_color}</span></div>}
                  {staff.is_waxed !== null && <div className="flex justify-between text-sm"><span className="text-slate-500">왁싱</span><span className="text-slate-900">{staff.is_waxed ? '함' : '안함'}</span></div>}
                </div>
              </div>
            )}
            {(staff.personality || staff.style || staff.is_smoker !== null) && (
              <div>
                <h3 className="text-sm font-medium text-slate-500 mb-2">성격 & 스타일</h3>
                <div className="flex flex-col gap-2">
                  {staff.personality && <div className="flex justify-between text-sm"><span className="text-slate-500">성격</span><span className="text-slate-900">{staff.personality}</span></div>}
                  {staff.style && <div className="flex justify-between text-sm"><span className="text-slate-500">스타일</span><span className="text-slate-900">{staff.style}</span></div>}
                  {staff.is_smoker !== null && <div className="flex justify-between text-sm"><span className="text-slate-500">흡연</span><span className="text-slate-900">{staff.is_smoker ? '흡연' : '비흡연'}</span></div>}
                </div>
              </div>
            )}
          </div>
        </section>
      )}

      {/* Profile Gallery Photos */}
      {galleryPhotos.length > 0 && (
        <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">프로필 사진</h2>
          <div className="grid grid-cols-3 gap-2 max-sm:grid-cols-2">
            {galleryPhotos.map((photo, index) => (
              <div
                key={photo.id}
                className="aspect-square rounded-lg overflow-hidden cursor-pointer hover:opacity-80 transition-opacity"
                onClick={() => {
                  setSelectedPhotoList(galleryPhotos.map(p => ({ id: p.id, photo_url: p.photo_url, caption: null })));
                  setSelectedPhotoIndex(index);
                }}
              >
                <img src={photo.photo_url} alt="프로필 사진" className="w-full h-full object-cover" />
              </div>
            ))}
          </div>
        </section>
      )}

      {/* Today's Photos */}
      {dailyPhotos.filter(p => p.date === today).length > 0 && (
        <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
          <h2 className="text-lg font-semibold text-slate-900 mb-1">오늘의 사진</h2>
          <p className="text-sm text-slate-500 mb-4">매일 0시 기준으로 리셋됩니다</p>
          <div className="grid grid-cols-4 gap-2 max-sm:grid-cols-3">
            {dailyPhotos.filter(p => p.date === today).map((photo, index) => (
              <div
                key={photo.id}
                className="aspect-square rounded-lg overflow-hidden cursor-pointer hover:opacity-80 transition-opacity"
                onClick={() => {
                  const todayPhotos = dailyPhotos.filter(p => p.date === today);
                  setSelectedPhotoList(todayPhotos.map(p => ({ id: p.id, photo_url: p.photo_url, caption: p.caption })));
                  setSelectedPhotoIndex(index);
                }}
              >
                <img src={photo.photo_url} alt={photo.caption || '작업 사진'} className="w-full h-full object-cover" />
              </div>
            ))}
          </div>
        </section>
      )}

      {/* Schedule */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">출근 스케줄</h2>
        {schedules.length > 0 ? (
          <div className="flex flex-col gap-3">
            {schedules.map((schedule) => {
              const isToday = schedule.date === today;
              return (
                <div key={schedule.id} className={`p-4 border rounded-xl ${isToday ? 'border-orange-300 bg-orange-50/50' : 'border-slate-200'}`}>
                  <div className="flex items-start justify-between mb-3 max-sm:flex-col max-sm:gap-2">
                    <div className="flex items-center gap-2">
                      <span className="font-medium text-slate-900">{formatDate(schedule.date)}</span>
                      {isToday && <span className="px-2 py-0.5 bg-red-600 text-white text-xs rounded-full">오늘</span>}
                    </div>
                    {user?.role === 'customer' && (
                      <button className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors" onClick={() => handleReserve(schedule.id)}>
                        예약하기
                      </button>
                    )}
                  </div>
                  <div className="grid grid-cols-3 gap-4 text-sm max-sm:grid-cols-1">
                    <div>
                      <span className="text-slate-500">가게</span>
                      <Link to={`/store/${schedule.store_id}`} className="block text-slate-900 hover:text-orange-600 transition-colors">{schedule.store?.name}</Link>
                      <div className="text-xs text-slate-400">{schedule.store?.address}</div>
                    </div>
                    <div>
                      <span className="text-slate-500">시간</span>
                      <div className="text-slate-900">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</div>
                    </div>
                    <div>
                      <span className="text-slate-500">예약</span>
                      <div className="text-slate-900">{reservationCounts[schedule.id] || 0}건</div>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        ) : (
          <p className="text-slate-500">예정된 출근 스케줄이 없습니다.</p>
        )}
      </section>

      {/* Affiliated Stores */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">활동 가게</h2>
        <div className="flex flex-col gap-2">
          {affiliatedStores.map((store) => (
            <Link key={store.id} to={`/store/${store.id}`} className="p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors">
              <h3 className="font-medium text-slate-900">{store.name}</h3>
              <p className="text-sm text-slate-500">{store.address}</p>
            </Link>
          ))}
        </div>
      </section>

      {showReservationModal && selectedSchedule && (
        <ReservationModal scheduleId={selectedSchedule} staffId={staff.id} customerId={user?.id} schedules={schedules} onClose={() => setShowReservationModal(false)} onSuccess={() => { setShowReservationModal(false); fetchData(); }} />
      )}

      {selectedPhotoIndex !== null && selectedPhotoList.length > 0 && (
        <SwipeablePhotoModal
          photos={selectedPhotoList}
          currentIndex={selectedPhotoIndex}
          onClose={() => { setSelectedPhotoIndex(null); setSelectedPhotoList([]); }}
          onNavigate={setSelectedPhotoIndex}
        />
      )}
    </div>
  );
}

function ReservationModal({ scheduleId, staffId, customerId, schedules, onClose, onSuccess }: { scheduleId: number; staffId: string; customerId?: string; schedules: Schedule[]; onClose: () => void; onSuccess: () => void; }) {
  const schedule = schedules.find((s) => s.id === scheduleId);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [staffName, setStaffName] = useState('');
  const [selectedMenu, setSelectedMenu] = useState<number | null>(null);
  const [selectedTime, setSelectedTime] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    if (schedule?.store_id) fetchMenus();
    fetchStaffName();
  }, [schedule?.store_id, staffId]);

  const fetchMenus = async () => {
    if (!schedule?.store_id) return;
    const { data } = await supabase.from('menus').select('*').eq('store_id', schedule.store_id);
    setMenus(data || []);
  };

  const fetchStaffName = async () => {
    const { data } = await supabase.from('profiles').select('name').eq('id', staffId).single();
    setStaffName(data?.name || '');
  };

  if (!schedule) return null;

  const generateTimeSlots = () => {
    const slots: string[] = [];
    const start = parseInt(schedule.start_time.split(':')[0]);
    const end = parseInt(schedule.end_time.split(':')[0]);
    const today = getLocalToday();
    const currentHour = new Date().getHours();

    for (let h = start; h < end; h++) {
      if (schedule.date === today && h <= currentHour) continue;
      slots.push(`${h.toString().padStart(2, '0')}:00`);
    }
    return slots;
  };

  const handleSubmit = async () => {
    if (!selectedMenu || !selectedTime || !customerId) return;
    setSubmitting(true);

    const startHour = parseInt(selectedTime.split(':')[0]);
    const endTime = `${(startHour + 1).toString().padStart(2, '0')}:00`;

    const { error } = await supabase.from('reservations').insert({ store_id: schedule.store_id, staff_id: staffId, customer_id: customerId, menu_id: selectedMenu, date: schedule.date, start_time: selectedTime, end_time: endTime, status: 'pending' });
    setSubmitting(false);

    if (error) alert('예약 중 오류가 발생했습니다.');
    else setSubmitted(true);
  };

  if (submitted) {
    return (
      <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
        <div className="bg-white rounded-2xl p-6 max-w-md w-full text-center" onClick={(e) => e.stopPropagation()}>
          <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-3xl text-green-600">✓</span>
          </div>
          <h2 className="text-xl font-bold text-slate-900 mb-2">예약 신청 완료!</h2>
          <p className="text-slate-600 mb-6">가게에서 확인 후 연락드릴 예정입니다.</p>
          <button onClick={onSuccess} className="w-full py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors">확인</button>
        </div>
      </div>
    );
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full max-h-[90vh] overflow-y-auto" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">예약하기</h2>

        <div className="p-4 bg-slate-50 rounded-lg mb-4 space-y-2">
          <div className="flex justify-between text-sm"><span className="text-slate-500">매니저</span><span className="font-medium text-slate-900">{staffName}</span></div>
          <div className="flex justify-between text-sm"><span className="text-slate-500">가게</span><span className="font-medium text-slate-900">{schedule.store?.name}</span></div>
          <div className="flex justify-between text-sm"><span className="text-slate-500">날짜</span><span className="font-medium text-slate-900">{schedule.date}</span></div>
        </div>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">서비스 선택</label>
          <div className="flex flex-col gap-2">
            {menus.map((menu) => (
              <label key={menu.id} className={`flex items-center justify-between p-3 border rounded-lg cursor-pointer transition-colors ${selectedMenu === menu.id ? 'border-red-600 bg-orange-50' : 'border-slate-200 hover:border-slate-300'}`}>
                <div className="flex items-center gap-3">
                  <input type="radio" name="menu" value={menu.id} checked={selectedMenu === menu.id} onChange={() => setSelectedMenu(menu.id)} className="w-4 h-4 text-orange-600" />
                  <span className="font-medium text-slate-900">{menu.name}</span>
                </div>
                <span className="text-orange-600 font-medium">{menu.price.toLocaleString()}원</span>
              </label>
            ))}
          </div>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">시간 선택</label>
          <div className="grid grid-cols-4 gap-2">
            {generateTimeSlots().map((time) => (
              <button key={time} type="button" className={`py-2 text-sm font-medium rounded-lg transition-colors ${selectedTime === time ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'}`} onClick={() => setSelectedTime(time)}>
                {time}
              </button>
            ))}
          </div>
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400" disabled={!selectedMenu || !selectedTime || submitting}>
            {submitting ? '예약 중...' : '예약 신청'}
          </button>
        </div>
      </div>
    </div>
  );
}

function SwipeablePhotoModal({
  photos,
  currentIndex,
  onClose,
  onNavigate,
}: {
  photos: { id: number; photo_url: string; caption: string | null }[];
  currentIndex: number;
  onClose: () => void;
  onNavigate: (index: number) => void;
}) {
  const [touchStart, setTouchStart] = useState<number | null>(null);
  const [touchEnd, setTouchEnd] = useState<number | null>(null);

  const currentPhoto = photos[currentIndex];
  const hasPrev = currentIndex > 0;
  const hasNext = currentIndex < photos.length - 1;

  const minSwipeDistance = 50;

  const onTouchStart = (e: React.TouchEvent) => {
    setTouchEnd(null);
    setTouchStart(e.targetTouches[0].clientX);
  };

  const onTouchMove = (e: React.TouchEvent) => {
    setTouchEnd(e.targetTouches[0].clientX);
  };

  const onTouchEnd = () => {
    if (!touchStart || !touchEnd) return;
    const distance = touchStart - touchEnd;
    const isLeftSwipe = distance > minSwipeDistance;
    const isRightSwipe = distance < -minSwipeDistance;

    if (isLeftSwipe && hasNext) {
      onNavigate(currentIndex + 1);
    }
    if (isRightSwipe && hasPrev) {
      onNavigate(currentIndex - 1);
    }
  };

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose();
      if (e.key === 'ArrowLeft' && hasPrev) onNavigate(currentIndex - 1);
      if (e.key === 'ArrowRight' && hasNext) onNavigate(currentIndex + 1);
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [currentIndex, hasPrev, hasNext, onClose, onNavigate]);

  if (!currentPhoto) return null;

  return (
    <div className="fixed inset-0 bg-black/90 flex items-center justify-center z-50" onClick={onClose}>
      <div
        className="relative w-full h-full flex items-center justify-center p-4"
        onClick={(e) => e.stopPropagation()}
        onTouchStart={onTouchStart}
        onTouchMove={onTouchMove}
        onTouchEnd={onTouchEnd}
      >
        {/* Close button */}
        <button
          className="absolute top-4 right-4 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors z-10"
          onClick={onClose}
        >
          ×
        </button>

        {/* Counter */}
        <div className="absolute top-4 left-4 px-3 py-1 bg-black/50 rounded-full text-white text-sm">
          {currentIndex + 1} / {photos.length}
        </div>

        {/* Previous button */}
        {hasPrev && (
          <button
            className="absolute left-2 md:left-4 w-12 h-12 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors"
            onClick={(e) => { e.stopPropagation(); onNavigate(currentIndex - 1); }}
          >
            ‹
          </button>
        )}

        {/* Image */}
        <div className="max-w-4xl max-h-[80vh] flex flex-col items-center">
          <img
            src={currentPhoto.photo_url}
            alt={currentPhoto.caption || '사진'}
            className="max-w-full max-h-[70vh] object-contain rounded-lg"
            draggable={false}
          />
          {currentPhoto.caption && (
            <p className="mt-4 text-center text-white text-sm">{currentPhoto.caption}</p>
          )}
        </div>

        {/* Next button */}
        {hasNext && (
          <button
            className="absolute right-2 md:right-4 w-12 h-12 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors"
            onClick={(e) => { e.stopPropagation(); onNavigate(currentIndex + 1); }}
          >
            ›
          </button>
        )}

        {/* Swipe hint for mobile */}
        <div className="absolute bottom-4 left-1/2 -translate-x-1/2 text-white/50 text-xs md:hidden">
          좌우로 스와이프하여 넘기기
        </div>
      </div>
    </div>
  );
}
