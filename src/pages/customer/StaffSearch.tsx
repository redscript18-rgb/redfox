import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
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
  job: string | null;
  mbti: string | null;
  created_by_admin_id: string | null;
  isVirtual?: boolean;
  store_id?: number;
  store?: { id: number; name: string; store_type?: string };
}

interface StoreInfo {
  id: number;
  name: string;
  store_type?: string;
}

interface Schedule {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  store?: { name: string };
}

interface StaffRating {
  avgRating: number | null;
  avgServiceRating: number | null;
  totalCount: number;
}

export default function StaffSearch() {
  const { user } = useAuth();
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [scheduleMap, setScheduleMap] = useState<Record<string, Schedule>>({});
  const [ratingMap, setRatingMap] = useState<Record<string, StaffRating>>({});
  const [affiliatedStoresMap, setAffiliatedStoresMap] = useState<Record<string, StoreInfo[]>>({});
  const [blockedByStaff, setBlockedByStaff] = useState<Set<string>>(new Set());
  const [favoriteStaffIds, setFavoriteStaffIds] = useState<Set<string>>(new Set());
  const [allStoreTypes, setAllStoreTypes] = useState<string[]>([]);
  const [staffStoreTypesMap, setStaffStoreTypesMap] = useState<Record<string, string[]>>({});
  const [loading, setLoading] = useState(true);
  const [selectedStoreType, setSelectedStoreType] = useState<string>('');
  const [sortBy, setSortBy] = useState<'rating' | 'reviewCount'>('rating');

  useEffect(() => {
    fetchData();
    if (user) {
      fetchBlockedByStaff();
      fetchFavorites();
    }
  }, [user]);

  const fetchFavorites = async () => {
    if (!user) return;
    const { data } = await supabase
      .from('favorites')
      .select('target_staff_id, target_virtual_staff_id')
      .eq('user_id', user.id)
      .in('target_type', ['staff', 'virtual_staff']);
    if (data) {
      const ids = new Set<string>();
      data.forEach(f => {
        if (f.target_staff_id) ids.add(f.target_staff_id);
        if (f.target_virtual_staff_id) ids.add(f.target_virtual_staff_id);
      });
      setFavoriteStaffIds(ids);
    }
  };

  const fetchBlockedByStaff = async () => {
    if (!user) return;
    try {
      const { data } = await supabase
        .from('blocks')
        .select('blocker_id')
        .eq('blocked_id', user.id);

      if (data) {
        setBlockedByStaff(new Set(data.map(b => b.blocker_id)));
      }
    } catch {
      // ignore
    }
  };

  const fetchData = async () => {
    const now = new Date();
    const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

    // Fetch ALL store type visibility settings
    const { data: visibilityData } = await supabase
      .from('store_type_visibility')
      .select('store_type, is_visible');

    // Fetch role visibility settings
    const { data: roleVisibilityData } = await supabase
      .from('role_visibility')
      .select('role_type, is_visible');

    const roleVisibilityMap: Record<string, boolean> = {};
    roleVisibilityData?.forEach(r => {
      roleVisibilityMap[r.role_type] = r.is_visible;
    });

    // Check if manager and virtual_staff roles are visible
    const isStaffRoleVisible = roleVisibilityMap['manager'] !== false;
    const isVirtualStaffRoleVisible = roleVisibilityMap['virtual_staff'] !== false;

    // Create a map of store_type -> is_visible, and a set of hidden types
    const visibilityMap: Record<string, boolean> = {};
    const hiddenStoreTypes = new Set<string>();

    visibilityData?.forEach(v => {
      const storeType = v.store_type?.trim();
      if (storeType) {
        visibilityMap[storeType] = v.is_visible;
        if (!v.is_visible) {
          hiddenStoreTypes.add(storeType);
        }
      }
    });

    // Helper function to check if a store type is visible
    const isStoreTypeVisible = (storeType: string | null | undefined): boolean => {
      if (!storeType) return false; // No store type = treat as hidden for safety
      const trimmed = storeType.trim();
      if (!trimmed) return false;
      // If explicitly marked as hidden, return false
      if (hiddenStoreTypes.has(trimmed)) return false;
      if (visibilityMap[trimmed] === false) return false;
      // If in visibility map and visible, return true
      if (visibilityMap[trimmed] === true) return true;
      // If not in visibility map at all, treat as visible (default)
      return true;
    };

    // Fetch real staff (only if role is visible and individual is visible)
    let staffData: { id: string; name: string; bio: string | null; specialties: string[] | null; profile_photo_url: string | null; age: number | null; height: number | null; weight: number | null; body_size: string | null; job: string | null; mbti: string | null; created_by_admin_id: string | null; is_visible: boolean | null }[] = [];
    if (isStaffRoleVisible) {
      const { data } = await supabase
        .from('profiles')
        .select('id, name, bio, specialties, profile_photo_url, age, height, weight, body_size, job, mbti, created_by_admin_id, is_visible')
        .eq('role', 'manager')
        .neq('is_visible', false);
      staffData = data || [];
    }

    // Fetch virtual staff (admin-created) - only if role is visible
    let virtualStaffData: { id: string; name: string; bio: string | null; specialties: string[] | null; profile_photo_url: string | null; age: number | null; height: number | null; weight: number | null; body_size: string | null; job: string | null; mbti: string | null; created_by_admin_id: string | null; store_id: number; store: unknown }[] = [];
    if (isVirtualStaffRoleVisible) {
      const { data } = await supabase
        .from('virtual_staff')
        .select('id, name, bio, specialties, profile_photo_url, age, height, weight, body_size, job, mbti, created_by_admin_id, store_id, store:stores(id, name, store_type)')
        .eq('is_visible', true);
      virtualStaffData = data || [];
    }

    // Filter virtual staff by hidden store types
    const filteredVirtualStaff = virtualStaffData.filter(s => {
      const storeData = s.store as unknown as { id: number; name: string; store_type?: string } | null;
      // Must have a store with a visible store type
      return isStoreTypeVisible(storeData?.store_type);
    });

    const virtualStaff: Staff[] = filteredVirtualStaff.map(s => ({
      ...s,
      isVirtual: true,
      store: s.store as unknown as { id: number; name: string; store_type?: string } | undefined,
    }));

    // Fetch affiliated stores for regular staff (include store_type)
    let storesMap: Record<string, StoreInfo[]> = {};
    if (staffData && staffData.length > 0) {
      const { data: storeStaffData } = await supabase
        .from('store_staff')
        .select('staff_id, store:stores(id, name, store_type)')
        .in('staff_id', staffData.map(s => s.id));

      storeStaffData?.forEach(ss => {
        const store = ss.store as unknown as { id: number; name: string; store_type?: string } | null;
        if (store) {
          if (!storesMap[ss.staff_id]) {
            storesMap[ss.staff_id] = [];
          }
          storesMap[ss.staff_id].push(store);
        }
      });
    }

    // Filter real staff - must have at least one store with a visible store type
    const filteredRealStaff = (staffData || []).filter(s => {
      const staffStores = storesMap[s.id] || [];
      if (staffStores.length === 0) return false; // Hide if no store affiliation
      // Check if at least one store has a visible store type
      return staffStores.some(store => isStoreTypeVisible(store.store_type));
    });

    const realStaff: Staff[] = filteredRealStaff.map(s => ({ ...s, isVirtual: false }));

    setStaffList([...realStaff, ...virtualStaff]);
    setAffiliatedStoresMap(storesMap);

    // Collect store types and create staff-to-store-types mapping (exclude hidden store types)
    const storeTypes = new Set<string>();
    const staffStoreTypes: Record<string, string[]> = {};

    // For real staff: get store types from affiliated stores (only visible ones)
    filteredRealStaff.forEach(s => {
      const stores = storesMap[s.id] || [];
      const types = stores
        .map(store => store.store_type?.trim())
        .filter((t): t is string => !!t && isStoreTypeVisible(t));
      if (types.length > 0) {
        staffStoreTypes[s.id] = types;
        types.forEach(t => storeTypes.add(t));
      }
    });

    // For virtual staff: get store type from their store (only if visible)
    filteredVirtualStaff.forEach(s => {
      const storeData = s.store as unknown as { id: number; name: string; store_type?: string } | null;
      const storeType = storeData?.store_type?.trim();
      if (storeType && isStoreTypeVisible(storeType)) {
        staffStoreTypes[s.id] = [storeType];
        storeTypes.add(storeType);
      }
    });

    setStaffStoreTypesMap(staffStoreTypes);
    setAllStoreTypes(Array.from(storeTypes).sort());

    const scheduleByStaff: Record<string, Schedule> = {};

    // Fetch real staff schedules
    if (staffData && staffData.length > 0) {
      const { data: schedulesData } = await supabase
        .from('schedules')
        .select(`*, store:stores(name)`)
        .in('staff_id', staffData.map(s => s.id))
        .eq('date', today)
        .eq('status', 'approved');

      schedulesData?.forEach(s => {
        scheduleByStaff[s.staff_id] = s;
      });
    }

    // Fetch virtual staff schedules
    if (virtualStaffData && virtualStaffData.length > 0) {
      const { data: virtualSchedulesData } = await supabase
        .from('virtual_staff_schedules')
        .select(`*, store:stores(name)`)
        .in('virtual_staff_id', virtualStaffData.map(s => s.id))
        .eq('date', today);

      virtualSchedulesData?.forEach(s => {
        scheduleByStaff[s.virtual_staff_id] = s;
      });
    }

    setScheduleMap(scheduleByStaff);

    if (staffData && staffData.length > 0) {

      const { data: ratingsData } = await supabase
        .from('ratings')
        .select('target_profile_id, rating, service_rating, reservation_id')
        .in('target_profile_id', staffData.map(s => s.id))
        .eq('target_type', 'staff')
        .not('reservation_id', 'is', null);

      const ratingsByStaff: Record<string, StaffRating> = {};
      if (ratingsData) {
        const grouped: Record<string, { ratings: number[]; serviceRatings: number[] }> = {};
        ratingsData.forEach(r => {
          if (!r.target_profile_id) return;
          if (!grouped[r.target_profile_id]) {
            grouped[r.target_profile_id] = { ratings: [], serviceRatings: [] };
          }
          if (r.rating) grouped[r.target_profile_id].ratings.push(r.rating);
          if (r.service_rating) grouped[r.target_profile_id].serviceRatings.push(r.service_rating);
        });

        Object.entries(grouped).forEach(([staffId, data]) => {
          ratingsByStaff[staffId] = {
            avgRating: data.ratings.length > 0 ? data.ratings.reduce((a, b) => a + b, 0) / data.ratings.length : null,
            avgServiceRating: data.serviceRatings.length > 0 ? data.serviceRatings.reduce((a, b) => a + b, 0) / data.serviceRatings.length : null,
            totalCount: data.ratings.length,
          };
        });
      }
      setRatingMap(ratingsByStaff);
    }

    setLoading(false);
  };

  // 프로필 완성도 점수 계산 함수
  const getProfileScore = (staff: Staff): number => {
    let score = 0;
    if (staff.profile_photo_url) score += 3; // 사진은 가장 중요
    if (staff.bio) score += 2;
    if (staff.age) score += 1;
    if (staff.height) score += 1;
    if (staff.weight) score += 1;
    if (staff.body_size) score += 1;
    if (staff.job) score += 1;
    if (staff.mbti) score += 1;
    return score;
  };

  const filteredStaffs = staffList
    .filter((staff) => {
      if (blockedByStaff.has(staff.id)) return false;
      const matchesStoreType = !selectedStoreType || staffStoreTypesMap[staff.id]?.includes(selectedStoreType);
      return matchesStoreType;
    })
    .sort((a, b) => {
      // 1. 즐겨찾기 우선
      const aFav = favoriteStaffIds.has(a.id) ? 1 : 0;
      const bFav = favoriteStaffIds.has(b.id) ? 1 : 0;
      if (bFav !== aFav) return bFav - aFav;

      // 2. 오늘 출근 우선
      const aWorking = scheduleMap[a.id] ? 1 : 0;
      const bWorking = scheduleMap[b.id] ? 1 : 0;
      if (bWorking !== aWorking) return bWorking - aWorking;

      // 3. 프로필 완성도 점수순 (사진, 소개, 나이, 키, 몸무게 등)
      const aScore = getProfileScore(a);
      const bScore = getProfileScore(b);
      if (bScore !== aScore) return bScore - aScore;

      // 4. 선택한 정렬 기준
      if (sortBy === 'rating') {
        const ratingDiff = (ratingMap[b.id]?.avgRating ?? 0) - (ratingMap[a.id]?.avgRating ?? 0);
        if (ratingDiff !== 0) return ratingDiff;
      } else if (sortBy === 'reviewCount') {
        const countDiff = (ratingMap[b.id]?.totalCount ?? 0) - (ratingMap[a.id]?.totalCount ?? 0);
        if (countDiff !== 0) return countDiff;
      }

      // 5. 기본: 이름순
      return a.name.localeCompare(b.name, 'ko');
    });

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-1">매니저 찾기</h1>
      <p className="text-sm text-slate-500 mb-6">원하는 매니저를 찾아 예약하세요</p>

      {/* 업종 필터 - 가로 스크롤 */}
      <div className="flex gap-2 mb-4 overflow-x-auto pb-2 -mx-4 px-4 md:mx-0 md:px-0">
        <button
          onClick={() => setSelectedStoreType('')}
          className={`px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap flex-shrink-0 transition-colors ${
            selectedStoreType === ''
              ? 'bg-red-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
        >
          전체
        </button>
        {allStoreTypes.map((storeType) => (
          <button
            key={storeType}
            onClick={() => setSelectedStoreType(storeType)}
            className={`px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap flex-shrink-0 transition-colors ${
              selectedStoreType === storeType
                ? 'bg-red-600 text-white'
                : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
            }`}
          >
            {storeType}
          </button>
        ))}
      </div>

      {/* 정렬 필터 */}
      <div className="flex gap-2 mb-6 items-center">
        <select
          value={sortBy}
          onChange={(e) => setSortBy(e.target.value as 'rating' | 'reviewCount')}
          className="h-10 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 bg-white"
        >
          <option value="rating">별점순</option>
          <option value="reviewCount">리뷰 많은순</option>
        </select>
        <span className="text-sm text-slate-500 ml-auto">{filteredStaffs.length}명</span>
      </div>

      {/* Staff Grid */}
      <div className="grid grid-cols-[repeat(auto-fill,minmax(320px,1fr))] gap-4 max-sm:grid-cols-1">
        {filteredStaffs.map((staff) => {
          const todaySchedule = scheduleMap[staff.id];
          const staffRating = ratingMap[staff.id];
          return (
            <div
              key={staff.id}
              className="flex gap-4 p-4 bg-white border border-slate-200 rounded-xl transition-all hover:border-red-600 hover:shadow-lg hover:-translate-y-0.5 relative overflow-hidden group"
            >
              {/* Left accent bar on hover */}
              <div className="absolute top-0 left-0 w-1 h-full bg-red-600 opacity-0 group-hover:opacity-100 transition-opacity" />

              {/* Reservation Button */}
              <div className="absolute top-3 right-3 z-10">
                {todaySchedule ? (
                  <Link
                    to={staff.isVirtual ? `/virtual-staff/${staff.id}` : `/staff/${staff.id}`}
                    className="px-3 py-1.5 bg-red-600 text-white text-xs font-medium rounded-lg hover:bg-red-700 transition-colors"
                    onClick={(e) => e.stopPropagation()}
                  >
                    예약하기
                  </Link>
                ) : (
                  <span className="px-3 py-1.5 bg-slate-200 text-slate-400 text-xs font-medium rounded-lg cursor-not-allowed">
                    예약불가
                  </span>
                )}
              </div>

              {/* Avatar + Schedule Status */}
              <div className="flex flex-col items-center gap-2 flex-shrink-0">
                <div className="w-[72px] h-[72px] rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-xl font-bold text-white overflow-hidden max-md:w-14 max-md:h-14">
                  {staff.profile_photo_url ? (
                    <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
                  ) : (
                    staff.name.charAt(0)
                  )}
                </div>
                {todaySchedule ? (
                  <div className="flex items-center gap-1 px-2 py-1 bg-green-50 rounded text-[11px] text-green-600 font-semibold">
                    <span className="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse" />
                    오늘 출근
                  </div>
                ) : (
                  <div className="px-2 py-1 bg-slate-100 rounded text-[11px] text-slate-400 font-medium">
                    출근 없음
                  </div>
                )}
              </div>

              {/* Info */}
              <div className="flex-1 min-w-0 flex flex-col gap-2">
                <div className="flex items-center gap-2 flex-wrap">
                  <h3 className="text-lg font-bold text-slate-900">{staff.name}</h3>
                  {staff.isVirtual ? (
                    <span className="px-2 py-0.5 bg-purple-50 text-purple-600 text-xs font-medium rounded">실장 등록</span>
                  ) : (
                    <span className="px-2 py-0.5 bg-green-50 text-green-600 text-xs font-medium rounded">본인 등록</span>
                  )}
                  {staffRating && staffRating.totalCount > 0 && (
                    <span className="inline-flex items-center gap-1 px-2.5 py-1 bg-gradient-to-r from-amber-50 to-yellow-50 border border-amber-300 rounded-full text-xs font-bold text-amber-700">
                      <span className="text-amber-500">★</span>
                      {staffRating.avgRating?.toFixed(1)}
                    </span>
                  )}
                </div>

                {/* Affiliated Stores */}
                {staff.isVirtual ? (
                  staff.store && (
                    <div className="flex gap-1.5 flex-wrap">
                      <span className={`text-xs font-medium px-2 py-0.5 rounded ${todaySchedule && todaySchedule.store_id === staff.store.id ? 'bg-green-100 text-green-700 border border-green-300' : 'bg-slate-100 text-slate-600'}`}>
                        {staff.store.name}
                      </span>
                    </div>
                  )
                ) : (
                  affiliatedStoresMap[staff.id] && affiliatedStoresMap[staff.id].length > 0 && (
                    <div className="flex gap-1.5 flex-wrap">
                      {affiliatedStoresMap[staff.id].map(store => (
                        <span
                          key={store.id}
                          className={`text-xs font-medium px-2 py-0.5 rounded ${todaySchedule && todaySchedule.store_id === store.id ? 'bg-green-100 text-green-700 border border-green-300' : 'bg-slate-100 text-slate-600'}`}
                        >
                          {store.name}
                        </span>
                      ))}
                    </div>
                  )
                )}

                {(staff.age || staff.height || staff.weight || staff.body_size || staff.job) && (
                  <div className="flex gap-1.5 flex-wrap">
                    {staff.job && <span className="text-xs font-semibold text-blue-600 px-2.5 py-1 bg-blue-50 rounded-md">{staff.job}</span>}
                    {staff.age && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.age}세</span>}
                    {staff.height && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.height}cm</span>}
                    {staff.weight && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.weight}kg</span>}
                    {staff.body_size && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.body_size}컵</span>}
                  </div>
                )}

                {staff.bio && (
                  <p className="text-sm text-slate-600 leading-relaxed line-clamp-2">{staff.bio}</p>
                )}
              </div>

              {/* Clickable overlay for profile navigation */}
              <Link
                to={staff.isVirtual ? `/virtual-staff/${staff.id}` : `/staff/${staff.id}`}
                className="absolute inset-0 z-0"
              />
            </div>
          );
        })}
      </div>

      {filteredStaffs.length === 0 && (
        <p className="text-center py-12 text-slate-400 bg-slate-50 rounded-xl">
          해당 조건의 매니저가 없습니다.
        </p>
      )}
    </div>
  );
}
