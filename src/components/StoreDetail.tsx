import { useState, useEffect } from 'react';
import { useParams, Link, useLocation } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

interface Store {
  id: number;
  name: string;
  address: string;
  store_type: string | null;
  phone: string | null;
  description: string | null;
  open_time: string | null;
  close_time: string | null;
}

interface Menu {
  id: number;
  name: string;
  price: number;
  description: string | null;
}

interface Staff {
  id: string;
  name: string;
  bio: string | null;
  phone: string | null;
  specialties: string[] | null;
}

interface Schedule {
  id: number;
  staff_id: string;
  date: string;
  start_time: string;
  end_time: string;
  type: string;
  staff?: { name: string };
}

interface StoreRating {
  customerAvgRating: number | null;
  customerCount: number;
  staffAvgRating: number | null;
  staffCount: number;
}

export default function StoreDetail() {
  const { id } = useParams<{ id: string }>();
  const storeId = Number(id);
  const { user } = useAuth();
  const location = useLocation();

  const [store, setStore] = useState<Store | null>(null);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [todaySchedules, setTodaySchedules] = useState<Schedule[]>([]);
  const [storeRating, setStoreRating] = useState<StoreRating>({ customerAvgRating: null, customerCount: 0, staffAvgRating: null, staffCount: 0 });
  const [blockedByStaff, setBlockedByStaff] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [isFavorite, setIsFavorite] = useState(false);

  useEffect(() => { fetchData(); if (user) { checkFavorite(); fetchBlockedByStaff(); } }, [storeId, user, location.key]);

  const fetchBlockedByStaff = async () => {
    if (!user) return;
    try {
      const { data, error } = await supabase.from('blocks').select('blocker_id').eq('blocked_id', user.id);
      if (!error && data) setBlockedByStaff(new Set(data.map(b => b.blocker_id)));
    } catch { /* ignore */ }
  };

  const checkFavorite = async () => {
    if (!user) return;
    const { data } = await supabase.from('favorites').select('id').eq('user_id', user.id).eq('target_type', 'store').eq('target_store_id', storeId).maybeSingle();
    setIsFavorite(!!data);
  };

  const toggleFavorite = async () => {
    if (!user) return;
    if (isFavorite) {
      await supabase.from('favorites').delete().eq('user_id', user.id).eq('target_type', 'store').eq('target_store_id', storeId);
      setIsFavorite(false);
    } else {
      await supabase.from('favorites').insert({ user_id: user.id, target_type: 'store', target_store_id: storeId });
      setIsFavorite(true);
    }
  };

  const fetchData = async () => {
    const today = new Date().toISOString().split('T')[0];

    const { data: storeData } = await supabase.from('stores').select('*').eq('id', storeId).single();
    if (!storeData) { setLoading(false); return; }
    setStore(storeData);

    const { data: menusData } = await supabase.from('menus').select('*').eq('store_id', storeId);
    setMenus(menusData || []);

    const { data: storeStaffData } = await supabase.from('store_staff').select('staff_id').eq('store_id', storeId);
    if (storeStaffData && storeStaffData.length > 0) {
      const staffIds = storeStaffData.map(s => s.staff_id);
      const { data: staffData } = await supabase.from('profiles').select('*').in('id', staffIds);
      setStaffList(staffData || []);
    }

    const { data: schedulesData } = await supabase.from('schedules').select(`*, staff:profiles(name)`).eq('store_id', storeId).eq('date', today).eq('status', 'approved');
    setTodaySchedules(schedulesData || []);

    const { data: ratingsData } = await supabase.from('ratings').select('rating, reservation_id, schedule_id').eq('target_store_id', storeId).eq('target_type', 'store');

    if (ratingsData && ratingsData.length > 0) {
      const customerRatings = ratingsData.filter(r => r.reservation_id !== null);
      const customerRatingValues = customerRatings.map(r => r.rating).filter(r => r !== null);
      const staffRatings = ratingsData.filter(r => r.schedule_id !== null);
      const staffRatingValues = staffRatings.map(r => r.rating).filter(r => r !== null);

      setStoreRating({
        customerAvgRating: customerRatingValues.length > 0 ? customerRatingValues.reduce((a, b) => a + b, 0) / customerRatingValues.length : null,
        customerCount: customerRatings.length,
        staffAvgRating: staffRatingValues.length > 0 ? staffRatingValues.reduce((a, b) => a + b, 0) / staffRatingValues.length : null,
        staffCount: staffRatings.length,
      });
    }

    setLoading(false);
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  if (!store) {
    return (
      <div>
        <p className="text-slate-500 mb-4">가게를 찾을 수 없습니다.</p>
        <Link to="/" className="text-blue-600 text-sm hover:underline">← 목록으로</Link>
      </div>
    );
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-blue-600 text-sm hover:underline">← 목록으로</Link>

      {/* Header */}
      <header className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <div className="flex items-start justify-between mb-3">
          <div className="flex items-center gap-3">
            <h1 className="text-2xl font-bold text-slate-900">{store.name}</h1>
            {store.store_type && <span className="px-2 py-1 bg-blue-50 text-blue-600 text-sm rounded">{store.store_type}</span>}
          </div>
          <button className={`w-9 h-9 flex items-center justify-center text-xl rounded-full transition-colors ${isFavorite ? 'text-red-500 bg-red-50' : 'text-slate-300 hover:text-red-500 hover:bg-red-50'}`} onClick={toggleFavorite}>
            {isFavorite ? '♥' : '♡'}
          </button>
        </div>

        {(storeRating.customerCount > 0 || storeRating.staffCount > 0) && (
          <div className="flex flex-wrap gap-4 mb-3">
            {storeRating.customerCount > 0 && (
              <div className="flex items-center gap-2 text-sm">
                <span className="text-slate-500">손님 평가</span>
                <span className="text-amber-500">★</span>
                <span className="font-medium text-slate-900">{storeRating.customerAvgRating?.toFixed(1)}</span>
                <span className="text-slate-400">({storeRating.customerCount})</span>
              </div>
            )}
            {storeRating.staffCount > 0 && (
              <div className="flex items-center gap-2 text-sm">
                <span className="text-slate-500">직원 평가</span>
                <span className="text-amber-500">★</span>
                <span className="font-medium text-slate-900">{storeRating.staffAvgRating?.toFixed(1)}</span>
                <span className="text-slate-400">({storeRating.staffCount})</span>
              </div>
            )}
          </div>
        )}

        <p className="text-slate-600 mb-1">{store.address}</p>
        {store.phone && <p className="text-slate-500 text-sm">{store.phone}</p>}
        {store.open_time && store.close_time && (
          <p className="text-slate-500 text-sm">영업시간: {store.open_time.slice(0, 5)} - {store.close_time.slice(0, 5)}</p>
        )}
        {store.description && <p className="text-slate-500 text-sm mt-2">{store.description}</p>}
      </header>

      {/* Today Schedule */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">오늘의 출근부</h2>
        {todaySchedules.length > 0 ? (
          <div className="flex flex-col gap-2">
            {todaySchedules.map((schedule) => (
              <div key={schedule.id} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                <div className="flex items-center gap-2">
                  <span className="font-medium text-slate-900">{schedule.staff?.name}</span>
                  <span className={`px-2 py-0.5 text-xs rounded-full ${schedule.type === 'assigned' ? 'bg-green-100 text-green-600' : schedule.type === 'requested' ? 'bg-blue-100 text-blue-600' : 'bg-slate-100 text-slate-600'}`}>
                    {schedule.type === 'assigned' ? '배정' : schedule.type === 'requested' ? '신청' : '자율'}
                  </span>
                </div>
                <span className="text-sm text-slate-500">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</span>
              </div>
            ))}
          </div>
        ) : (
          <p className="text-slate-500">오늘 출근 예정인 직원이 없습니다.</p>
        )}
      </section>

      {/* Staff */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">직원</h2>
        <div className="flex flex-col gap-2">
          {staffList.filter(staff => !blockedByStaff.has(staff.id)).map((staff) => (
            <Link key={staff.id} to={`/staff/${staff.id}`} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors">
              <div>
                <h3 className="font-medium text-slate-900">{staff.name}</h3>
                {staff.bio && <p className="text-sm text-slate-500 line-clamp-1">{staff.bio}</p>}
                {staff.specialties && (
                  <div className="flex flex-wrap gap-1 mt-1">
                    {staff.specialties.map((s) => (
                      <span key={s} className="px-2 py-0.5 bg-blue-50 text-blue-600 text-xs rounded">{s}</span>
                    ))}
                  </div>
                )}
              </div>
              <span className="text-sm text-blue-600">프로필 보기 →</span>
            </Link>
          ))}
        </div>
      </section>

      {/* Menu */}
      <section className="p-5 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">메뉴</h2>
        <div className="flex flex-col gap-2">
          {menus.map((menu) => (
            <div key={menu.id} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
              <div>
                <h3 className="font-medium text-slate-900">{menu.name}</h3>
                {menu.description && <p className="text-sm text-slate-500">{menu.description}</p>}
              </div>
              <span className="font-semibold text-blue-600">{menu.price.toLocaleString()}원</span>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
