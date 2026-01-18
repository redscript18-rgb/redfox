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
  const [blockedByStaff, setBlockedByStaff] = useState<Set<string>>(new Set());
  const [allSpecialties, setAllSpecialties] = useState<string[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedSpecialty, setSelectedSpecialty] = useState<string>('');
  const [sortBy, setSortBy] = useState<'name' | 'rating' | 'reviewCount'>('name');

  useEffect(() => {
    fetchData();
    if (user) {
      fetchBlockedByStaff();
    }
  }, [user]);

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

    const { data: staffData } = await supabase
      .from('profiles')
      .select('id, name, bio, specialties, profile_photo_url, age, height, weight, body_size')
      .eq('role', 'staff');

    setStaffList(staffData || []);

    const specialties = new Set<string>();
    staffData?.forEach(s => {
      s.specialties?.forEach((spec: string) => specialties.add(spec));
    });
    setAllSpecialties(Array.from(specialties));

    if (staffData && staffData.length > 0) {
      const { data: schedulesData } = await supabase
        .from('schedules')
        .select(`*, store:stores(name)`)
        .in('staff_id', staffData.map(s => s.id))
        .eq('date', today)
        .eq('status', 'approved');

      const scheduleByStaff: Record<string, Schedule> = {};
      schedulesData?.forEach(s => {
        scheduleByStaff[s.staff_id] = s;
      });
      setScheduleMap(scheduleByStaff);

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

  const filteredStaffs = staffList
    .filter((staff) => {
      if (blockedByStaff.has(staff.id)) return false;
      const matchesSearch = staff.name.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesSpecialty = !selectedSpecialty || staff.specialties?.includes(selectedSpecialty);
      return matchesSearch && matchesSpecialty;
    })
    .sort((a, b) => {
      if (sortBy === 'rating') {
        const ratingA = ratingMap[a.id]?.avgRating ?? 0;
        const ratingB = ratingMap[b.id]?.avgRating ?? 0;
        return ratingB - ratingA;
      } else if (sortBy === 'reviewCount') {
        const countA = ratingMap[a.id]?.totalCount ?? 0;
        const countB = ratingMap[b.id]?.totalCount ?? 0;
        return countB - countA;
      }
      return a.name.localeCompare(b.name, 'ko');
    });

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-1">직원 찾기</h1>
      <p className="text-sm text-slate-500 mb-6">원하는 직원을 찾아 예약하세요</p>

      {/* Filters */}
      <div className="flex items-center gap-3 mb-6 p-4 bg-slate-50 rounded-xl max-md:flex-col">
        <input
          type="text"
          placeholder="이름으로 검색"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="flex-1 min-w-[160px] h-[42px] px-4 bg-white border border-slate-200 rounded-lg text-sm text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors max-md:w-full"
        />
        <select
          value={selectedSpecialty}
          onChange={(e) => setSelectedSpecialty(e.target.value)}
          className="min-w-[130px] h-[42px] px-4 pr-9 bg-white border border-slate-200 rounded-lg text-sm text-slate-900 cursor-pointer appearance-none focus:outline-none focus:border-red-600 transition-colors bg-[url('data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%20fill%3D%22%2394a3b8%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cpath%20d%3D%22M8%2011L3%206h10l-5%205z%22%2F%3E%3C%2Fsvg%3E')] bg-no-repeat bg-[right_12px_center] max-md:w-full"
        >
          <option value="">전체 분야</option>
          {allSpecialties.map((specialty) => (
            <option key={specialty} value={specialty}>{specialty}</option>
          ))}
        </select>
        <select
          value={sortBy}
          onChange={(e) => setSortBy(e.target.value as 'name' | 'rating' | 'reviewCount')}
          className="min-w-[130px] h-[42px] px-4 pr-9 bg-white border border-slate-200 rounded-lg text-sm text-slate-900 cursor-pointer appearance-none focus:outline-none focus:border-red-600 transition-colors bg-[url('data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%20fill%3D%22%2394a3b8%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cpath%20d%3D%22M8%2011L3%206h10l-5%205z%22%2F%3E%3C%2Fsvg%3E')] bg-no-repeat bg-[right_12px_center] max-md:w-full"
        >
          <option value="name">이름순</option>
          <option value="rating">별점순</option>
          <option value="reviewCount">리뷰 많은순</option>
        </select>
      </div>

      {/* Staff Grid */}
      <div className="grid grid-cols-[repeat(auto-fill,minmax(380px,1fr))] gap-4 max-md:grid-cols-1">
        {filteredStaffs.map((staff) => {
          const todaySchedule = scheduleMap[staff.id];
          const staffRating = ratingMap[staff.id];
          return (
            <Link
              to={`/staff/${staff.id}`}
              key={staff.id}
              className="flex gap-4 p-4 bg-white border border-slate-200 rounded-xl no-underline text-inherit transition-all hover:border-red-600 hover:shadow-lg hover:-translate-y-0.5 relative overflow-hidden group"
            >
              {/* Left accent bar on hover */}
              <div className="absolute top-0 left-0 w-1 h-full bg-red-600 opacity-0 group-hover:opacity-100 transition-opacity" />

              {/* Avatar */}
              <div className="w-[72px] h-[72px] rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-xl font-bold text-white overflow-hidden flex-shrink-0 max-md:w-14 max-md:h-14">
                {staff.profile_photo_url ? (
                  <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
                ) : (
                  staff.name.charAt(0)
                )}
              </div>

              {/* Info */}
              <div className="flex-1 min-w-0 flex flex-col gap-2">
                <div className="flex items-center gap-2">
                  <h3 className="text-lg font-bold text-slate-900">{staff.name}</h3>
                  {staffRating && staffRating.totalCount > 0 && (
                    <span className="inline-flex items-center gap-1 px-2.5 py-1 bg-gradient-to-r from-amber-50 to-yellow-50 border border-amber-300 rounded-full text-xs font-bold text-amber-700">
                      <span className="text-amber-500">★</span>
                      {staffRating.avgRating?.toFixed(1)}
                    </span>
                  )}
                </div>

                {(staff.age || staff.height || staff.weight || staff.body_size) && (
                  <div className="flex gap-1.5 flex-wrap">
                    {staff.age && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.age}세</span>}
                    {staff.height && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.height}cm</span>}
                    {staff.weight && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.weight}kg</span>}
                    {staff.body_size && <span className="text-xs font-semibold text-slate-600 px-2.5 py-1 bg-slate-100 rounded-md">{staff.body_size}컵</span>}
                  </div>
                )}

                {staff.bio && (
                  <p className="text-sm text-slate-600 leading-relaxed line-clamp-2">{staff.bio}</p>
                )}

                {staff.specialties && staff.specialties.length > 0 && (
                  <div className="flex flex-wrap gap-1.5">
                    {staff.specialties.map((s) => (
                      <span key={s} className="px-3 py-1 bg-orange-50 rounded-full text-xs font-semibold text-orange-600 border border-transparent group-hover:border-red-600 transition-colors">
                        {s}
                      </span>
                    ))}
                  </div>
                )}
              </div>

              {/* Schedule Info */}
              <div className="flex flex-col items-end justify-center flex-shrink-0 min-w-[100px] max-md:absolute max-md:top-4 max-md:right-4 max-md:min-w-0">
                {todaySchedule ? (
                  <div className="flex flex-col items-end gap-1 px-3 py-2 bg-green-50 rounded-lg text-xs text-green-600 font-semibold max-md:px-2 max-md:py-1 max-md:text-[10px]">
                    <span className="inline-block w-2 h-2 bg-green-600 rounded-full animate-pulse" />
                    오늘 출근
                    <span className="text-slate-600 font-medium">{todaySchedule.store?.name}</span>
                    <span className="text-slate-400 text-[11px]">{todaySchedule.start_time} - {todaySchedule.end_time}</span>
                  </div>
                ) : (
                  <div className="px-3 py-2 bg-slate-100 rounded-lg text-xs text-slate-400 font-medium max-md:px-2 max-md:py-1 max-md:text-[10px]">
                    오늘 출근 없음
                  </div>
                )}
              </div>
            </Link>
          );
        })}
      </div>

      {filteredStaffs.length === 0 && (
        <p className="text-center py-12 text-slate-400 bg-slate-50 rounded-xl">
          검색 결과가 없습니다.
        </p>
      )}
    </div>
  );
}
