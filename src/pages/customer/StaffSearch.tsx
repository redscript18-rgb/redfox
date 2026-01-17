import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { supabase } from '../../lib/supabase';
import './StaffSearch.css';

interface Staff {
  id: string;
  name: string;
  bio: string | null;
  specialties: string[] | null;
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
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [scheduleMap, setScheduleMap] = useState<Record<string, Schedule>>({});
  const [ratingMap, setRatingMap] = useState<Record<string, StaffRating>>({});
  const [allSpecialties, setAllSpecialties] = useState<string[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedSpecialty, setSelectedSpecialty] = useState<string>('');

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const today = new Date().toISOString().split('T')[0];

    // 직원 목록 조회 (staff role)
    const { data: staffData } = await supabase
      .from('profiles')
      .select('id, name, bio, specialties')
      .eq('role', 'staff');

    setStaffList(staffData || []);

    // 모든 전문 분야 추출
    const specialties = new Set<string>();
    staffData?.forEach(s => {
      s.specialties?.forEach((spec: string) => specialties.add(spec));
    });
    setAllSpecialties(Array.from(specialties));

    // 오늘 출근 스케줄 조회
    if (staffData && staffData.length > 0) {
      const { data: schedulesData } = await supabase
        .from('schedules')
        .select(`
          *,
          store:stores(name)
        `)
        .in('staff_id', staffData.map(s => s.id))
        .eq('date', today)
        .eq('status', 'approved');

      const scheduleByStaff: Record<string, Schedule> = {};
      schedulesData?.forEach(s => {
        scheduleByStaff[s.staff_id] = s;
      });
      setScheduleMap(scheduleByStaff);

      // 직원별 평균 별점 조회
      const { data: ratingsData } = await supabase
        .from('ratings')
        .select('target_profile_id, rating, service_rating')
        .in('target_profile_id', staffData.map(s => s.id))
        .eq('target_type', 'staff');

      const ratingsByStaff: Record<string, StaffRating> = {};
      if (ratingsData) {
        // 직원별로 그룹화
        const grouped: Record<string, { ratings: number[]; serviceRatings: number[] }> = {};
        ratingsData.forEach(r => {
          if (!r.target_profile_id) return;
          if (!grouped[r.target_profile_id]) {
            grouped[r.target_profile_id] = { ratings: [], serviceRatings: [] };
          }
          if (r.rating) grouped[r.target_profile_id].ratings.push(r.rating);
          if (r.service_rating) grouped[r.target_profile_id].serviceRatings.push(r.service_rating);
        });

        // 평균 계산
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

  // 필터링된 직원
  const filteredStaffs = staffList.filter((staff) => {
    const matchesSearch = staff.name
      .toLowerCase()
      .includes(searchTerm.toLowerCase());
    const matchesSpecialty =
      !selectedSpecialty ||
      staff.specialties?.includes(selectedSpecialty);
    return matchesSearch && matchesSpecialty;
  });

  if (loading) {
    return <div className="staff-search"><p>로딩 중...</p></div>;
  }

  return (
    <div className="staff-search">
      <h1>직원 찾기</h1>
      <p className="subtitle">원하는 직원을 찾아 예약하세요</p>

      <div className="filters">
        <input
          type="text"
          placeholder="이름으로 검색"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="search-input"
        />
        <select
          value={selectedSpecialty}
          onChange={(e) => setSelectedSpecialty(e.target.value)}
          className="specialty-select"
        >
          <option value="">전체 분야</option>
          {allSpecialties.map((specialty) => (
            <option key={specialty} value={specialty}>
              {specialty}
            </option>
          ))}
        </select>
      </div>

      <div className="staff-grid">
        {filteredStaffs.map((staff) => {
          const todaySchedule = scheduleMap[staff.id];
          const staffRating = ratingMap[staff.id];
          return (
            <Link
              to={`/staff/${staff.id}`}
              key={staff.id}
              className="staff-card"
            >
              <div className="staff-avatar">
                {staff.name.charAt(0)}
              </div>
              <div className="staff-info">
                <div className="name-rating">
                  <h3>{staff.name}</h3>
                  {staffRating && staffRating.totalCount > 0 && (
                    <span className="rating-badge">
                      <span className="star">★</span>
                      {staffRating.avgRating?.toFixed(1)}
                    </span>
                  )}
                </div>
                {staff.bio && <p className="bio">{staff.bio}</p>}
                {staff.specialties && (
                  <div className="specialties">
                    {staff.specialties.map((s) => (
                      <span key={s} className="specialty-tag">
                        {s}
                      </span>
                    ))}
                  </div>
                )}
              </div>
              <div className="schedule-info">
                {todaySchedule ? (
                  <div className="today-available">
                    <span className="dot"></span>
                    오늘 출근
                    <span className="store-name">
                      {todaySchedule.store?.name}
                    </span>
                    <span className="time">
                      {todaySchedule.start_time} - {todaySchedule.end_time}
                    </span>
                  </div>
                ) : (
                  <div className="today-unavailable">오늘 출근 없음</div>
                )}
              </div>
            </Link>
          );
        })}
      </div>

      {filteredStaffs.length === 0 && (
        <p className="no-results">검색 결과가 없습니다.</p>
      )}
    </div>
  );
}
