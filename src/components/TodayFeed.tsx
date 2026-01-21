import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

interface WorkingManager {
  id: string;
  name: string;
  profile_photo_url: string | null;
  isVirtual: boolean;
  store_name: string;
  store_id: number;
  start_time: string;
  end_time: string;
  isFavorite: boolean;
}

interface DailyPhoto {
  id: number;
  staff_id: string;
  staff_name: string;
  staff_photo: string | null;
  photo_url: string;
  caption: string | null;
  date: string;
  created_at: string;
  isVirtual: boolean;
  isFavorite: boolean;
}

export default function TodayFeed() {
  const { user } = useAuth();
  const [workingManagers, setWorkingManagers] = useState<WorkingManager[]>([]);
  const [dailyPhotos, setDailyPhotos] = useState<DailyPhoto[]>([]);
  const [, setFavoriteIds] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [showAllManagers, setShowAllManagers] = useState(false);

  useEffect(() => {
    fetchData();
  }, [user]);

  const fetchData = async () => {
    const now = new Date();
    const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

    // Fetch favorites
    let favIds = new Set<string>();
    if (user) {
      const { data: favData } = await supabase
        .from('favorites')
        .select('target_staff_id, target_virtual_staff_id')
        .eq('user_id', user.id)
        .in('target_type', ['staff', 'virtual_staff']);

      if (favData) {
        favData.forEach(f => {
          if (f.target_staff_id) favIds.add(f.target_staff_id);
          if (f.target_virtual_staff_id) favIds.add(f.target_virtual_staff_id);
        });
      }
      setFavoriteIds(favIds);
    }

    // Fetch real manager schedules for today
    const { data: realSchedules } = await supabase
      .from('schedules')
      .select(`
        staff_id,
        start_time,
        end_time,
        store:stores(id, name),
        staff:profiles(id, name, profile_photo_url)
      `)
      .eq('date', today)
      .eq('status', 'approved');

    // Fetch virtual staff schedules for today
    const { data: virtualSchedules } = await supabase
      .from('virtual_staff_schedules')
      .select(`
        virtual_staff_id,
        start_time,
        end_time,
        store:stores(id, name),
        virtual_staff:virtual_staff(id, name, profile_photo_url)
      `)
      .eq('date', today);

    const managers: WorkingManager[] = [];

    // Process real managers
    realSchedules?.forEach(s => {
      const staff = Array.isArray(s.staff) ? s.staff[0] : s.staff;
      const store = Array.isArray(s.store) ? s.store[0] : s.store;
      if (staff && store) {
        managers.push({
          id: (staff as { id: string }).id,
          name: (staff as { name: string }).name,
          profile_photo_url: (staff as { profile_photo_url: string | null }).profile_photo_url,
          isVirtual: false,
          store_name: (store as { name: string }).name,
          store_id: (store as { id: number }).id,
          start_time: s.start_time,
          end_time: s.end_time,
          isFavorite: favIds.has((staff as { id: string }).id),
        });
      }
    });

    // Process virtual managers
    virtualSchedules?.forEach(s => {
      const vs = Array.isArray(s.virtual_staff) ? s.virtual_staff[0] : s.virtual_staff;
      const store = Array.isArray(s.store) ? s.store[0] : s.store;
      if (vs && store) {
        managers.push({
          id: (vs as { id: string }).id,
          name: (vs as { name: string }).name,
          profile_photo_url: (vs as { profile_photo_url: string | null }).profile_photo_url,
          isVirtual: true,
          store_name: (store as { name: string }).name,
          store_id: (store as { id: number }).id,
          start_time: s.start_time,
          end_time: s.end_time,
          isFavorite: favIds.has((vs as { id: string }).id),
        });
      }
    });

    // Sort: favorites first, then by start time
    managers.sort((a, b) => {
      if (a.isFavorite !== b.isFavorite) return b.isFavorite ? 1 : -1;
      return a.start_time.localeCompare(b.start_time);
    });

    setWorkingManagers(managers);

    // Fetch photos (real staff) - 테스트 기간: 날짜 필터 제거
    const { data: photosData } = await supabase
      .from('staff_photos')
      .select(`
        id,
        staff_id,
        photo_url,
        caption,
        date,
        created_at,
        staff:profiles(id, name, profile_photo_url)
      `)
      // .eq('date', today) // 테스트 기간 동안 비활성화
      .order('created_at', { ascending: false })
      .limit(20);

    // Fetch photos (virtual staff) - 테스트 기간: 날짜 필터 제거
    const { data: virtualPhotosData } = await supabase
      .from('virtual_staff_photos')
      .select(`
        id,
        virtual_staff_id,
        photo_url,
        caption,
        date,
        created_at,
        virtual_staff:virtual_staff(id, name, profile_photo_url)
      `)
      // .eq('date', today) // 테스트 기간 동안 비활성화
      .order('created_at', { ascending: false })
      .limit(20);

    const photos: DailyPhoto[] = [];

    // Process real staff photos
    photosData?.forEach(p => {
      const staff = Array.isArray(p.staff) ? p.staff[0] : p.staff;
      if (staff) {
        photos.push({
          id: p.id,
          staff_id: p.staff_id,
          staff_name: (staff as { name: string }).name,
          staff_photo: (staff as { profile_photo_url: string | null }).profile_photo_url,
          photo_url: p.photo_url,
          caption: p.caption,
          date: p.date,
          created_at: p.created_at,
          isVirtual: false,
          isFavorite: favIds.has(p.staff_id),
        });
      }
    });

    // Process virtual staff photos
    virtualPhotosData?.forEach(p => {
      const vs = Array.isArray(p.virtual_staff) ? p.virtual_staff[0] : p.virtual_staff;
      if (vs) {
        photos.push({
          id: p.id + 100000, // Offset to avoid ID collision
          staff_id: p.virtual_staff_id,
          staff_name: (vs as { name: string }).name,
          staff_photo: (vs as { profile_photo_url: string | null }).profile_photo_url,
          photo_url: p.photo_url,
          caption: p.caption,
          date: p.date,
          created_at: p.created_at,
          isVirtual: true,
          isFavorite: favIds.has(p.virtual_staff_id),
        });
      }
    });

    // Sort: favorites first, then by created_at
    photos.sort((a, b) => {
      if (a.isFavorite !== b.isFavorite) return b.isFavorite ? 1 : -1;
      return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
    });

    setDailyPhotos(photos);
    setLoading(false);
  };

  const formatTime = (time: string) => time.slice(0, 5);

  if (loading) {
    return <div className="text-slate-500 py-4">로딩 중...</div>;
  }

  const displayManagers = showAllManagers ? workingManagers : workingManagers.slice(0, 6);
  const hasMoreManagers = workingManagers.length > 6;

  return (
    <div className="space-y-6">
      {/* 오늘 출근 매니저 */}
      {workingManagers.length > 0 && (
        <section>
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-lg font-bold text-slate-900 flex items-center gap-2">
              <span className="w-2 h-2 bg-green-500 rounded-full animate-pulse" />
              오늘 출근 중
              <span className="text-sm font-normal text-slate-500">({workingManagers.length}명)</span>
            </h2>
          </div>
          <div className="flex gap-3 overflow-x-auto pb-2 -mx-4 px-4 md:mx-0 md:px-0">
            {displayManagers.map((manager) => (
              <Link
                key={`${manager.isVirtual ? 'v' : 'r'}-${manager.id}`}
                to={manager.isVirtual ? `/virtual-staff/${manager.id}` : `/staff/${manager.id}`}
                className={`flex-shrink-0 w-[140px] p-3 bg-white border rounded-xl hover:border-red-600 hover:shadow-md transition-all ${
                  manager.isFavorite ? 'border-red-300 bg-red-50/30' : 'border-slate-200'
                }`}
              >
                <div className="relative mb-2">
                  <div className="w-16 h-16 mx-auto rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold text-lg overflow-hidden">
                    {manager.profile_photo_url ? (
                      <img src={manager.profile_photo_url} alt={manager.name} className="w-full h-full object-cover" />
                    ) : (
                      manager.name.charAt(0)
                    )}
                  </div>
                  {manager.isFavorite && (
                    <span className="absolute -top-1 -right-1 text-red-500 text-lg">♥</span>
                  )}
                </div>
                <div className="text-center">
                  <p className="font-semibold text-slate-900 text-sm truncate">{manager.name}</p>
                  <p className="text-xs text-slate-500 truncate">{manager.store_name}</p>
                  <p className="text-xs text-green-600 font-medium mt-1">
                    {formatTime(manager.start_time)} - {formatTime(manager.end_time)}
                  </p>
                </div>
              </Link>
            ))}
            {hasMoreManagers && !showAllManagers && (
              <button
                onClick={() => setShowAllManagers(true)}
                className="flex-shrink-0 w-[140px] p-3 bg-slate-50 border border-slate-200 rounded-xl hover:bg-slate-100 transition-colors flex items-center justify-center"
              >
                <span className="text-sm text-slate-600 font-medium">
                  +{workingManagers.length - 6}명 더보기
                </span>
              </button>
            )}
          </div>
        </section>
      )}

      {/* 오늘의 사진 */}
      {dailyPhotos.length > 0 && (
        <section>
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-lg font-bold text-slate-900 flex items-center gap-2">
              📸 오늘의 사진
              <span className="text-sm font-normal text-slate-500">({dailyPhotos.length}장)</span>
            </h2>
            <Link
              to="/today-photos"
              className="text-sm text-orange-600 hover:text-orange-700 font-medium"
            >
              전체보기 →
            </Link>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {dailyPhotos.slice(0, 8).map((photo) => (
              <Link
                key={`${photo.isVirtual ? 'v' : 'r'}-${photo.id}`}
                to={photo.isVirtual ? `/virtual-staff/${photo.staff_id}` : `/staff/${photo.staff_id}`}
                className={`relative group rounded-xl overflow-hidden border hover:border-red-600 transition-all ${
                  photo.isFavorite ? 'border-red-300' : 'border-slate-200'
                }`}
              >
                <img
                  src={photo.photo_url}
                  alt={photo.caption || '오늘의 사진'}
                  className="w-full aspect-square object-cover group-hover:scale-105 transition-transform"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent" />
                <div className="absolute bottom-0 left-0 right-0 p-2">
                  <div className="flex items-center gap-2">
                    <div className="w-6 h-6 rounded-full bg-white overflow-hidden flex-shrink-0">
                      {photo.staff_photo ? (
                        <img src={photo.staff_photo} alt={photo.staff_name} className="w-full h-full object-cover" />
                      ) : (
                        <div className="w-full h-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white text-xs font-bold">
                          {photo.staff_name.charAt(0)}
                        </div>
                      )}
                    </div>
                    <span className="text-white text-xs font-medium truncate">{photo.staff_name}</span>
                    {photo.isFavorite && <span className="text-red-400 text-xs">♥</span>}
                  </div>
                  {photo.caption && (
                    <p className="text-white/80 text-xs mt-1 truncate">{photo.caption}</p>
                  )}
                </div>
              </Link>
            ))}
          </div>
          {dailyPhotos.length > 8 && (
            <div className="text-center mt-3">
              <span className="text-sm text-slate-500">+{dailyPhotos.length - 8}장 더 있음</span>
            </div>
          )}
        </section>
      )}

      {/* 출근/사진 없을 때 */}
      {workingManagers.length === 0 && dailyPhotos.length === 0 && (
        <div className="py-8 text-center bg-slate-50 rounded-xl">
          <p className="text-slate-500">오늘 출근 중인 매니저가 없습니다.</p>
          <p className="text-sm text-slate-400 mt-1">아래에서 가게나 매니저를 찾아보세요!</p>
        </div>
      )}
    </div>
  );
}
