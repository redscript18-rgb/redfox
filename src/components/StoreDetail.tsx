import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import './StoreDetail.css';

interface Store {
  id: number;
  name: string;
  address: string;
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
  avgRating: number | null;
  totalCount: number;
}

export default function StoreDetail() {
  const { id } = useParams<{ id: string }>();
  const storeId = Number(id);

  const [store, setStore] = useState<Store | null>(null);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [todaySchedules, setTodaySchedules] = useState<Schedule[]>([]);
  const [storeRating, setStoreRating] = useState<StoreRating>({ avgRating: null, totalCount: 0 });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, [storeId]);

  const fetchData = async () => {
    const today = new Date().toISOString().split('T')[0];

    // 가게 정보 조회
    const { data: storeData } = await supabase
      .from('stores')
      .select('*')
      .eq('id', storeId)
      .single();

    if (!storeData) {
      setLoading(false);
      return;
    }

    setStore(storeData);

    // 메뉴 조회
    const { data: menusData } = await supabase
      .from('menus')
      .select('*')
      .eq('store_id', storeId);

    setMenus(menusData || []);

    // 가게 소속 직원 조회
    const { data: storeStaffData } = await supabase
      .from('store_staff')
      .select('staff_id')
      .eq('store_id', storeId);

    if (storeStaffData && storeStaffData.length > 0) {
      const staffIds = storeStaffData.map(s => s.staff_id);
      const { data: staffData } = await supabase
        .from('profiles')
        .select('*')
        .in('id', staffIds);

      setStaffList(staffData || []);
    }

    // 오늘 출근 스케줄 조회
    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`
        *,
        staff:profiles(name)
      `)
      .eq('store_id', storeId)
      .eq('date', today)
      .eq('status', 'approved');

    setTodaySchedules(schedulesData || []);

    // 가게 평균 별점 조회
    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('rating')
      .eq('target_store_id', storeId)
      .eq('target_type', 'store');

    if (ratingsData && ratingsData.length > 0) {
      const ratings = ratingsData.map(r => r.rating).filter(r => r !== null);
      setStoreRating({
        avgRating: ratings.length > 0 ? ratings.reduce((a, b) => a + b, 0) / ratings.length : null,
        totalCount: ratingsData.length,
      });
    }

    setLoading(false);
  };

  if (loading) {
    return <div className="store-detail"><p>로딩 중...</p></div>;
  }

  if (!store) {
    return (
      <div className="store-detail">
        <p>가게를 찾을 수 없습니다.</p>
        <Link to="/">← 목록으로</Link>
      </div>
    );
  }

  return (
    <div className="store-detail">
      <Link to="/" className="back-link">
        ← 목록으로
      </Link>

      <header className="store-header">
        <div className="store-title">
          <h1>{store.name}</h1>
          {storeRating.totalCount > 0 && (
            <div className="store-rating">
              <span className="rating-star">★</span>
              <span className="rating-value">{storeRating.avgRating?.toFixed(1)}</span>
              <span className="rating-count">({storeRating.totalCount}개 평가)</span>
            </div>
          )}
        </div>
        <p className="address">{store.address}</p>
      </header>

      <section className="section">
        <h2>오늘의 출근부</h2>
        {todaySchedules.length > 0 ? (
          <div className="schedule-list">
            {todaySchedules.map((schedule) => (
              <div key={schedule.id} className="schedule-item">
                <div className="schedule-staff">
                  <span className="staff-name">{schedule.staff?.name}</span>
                  <span className="schedule-type">
                    {schedule.type === 'assigned'
                      ? '배정'
                      : schedule.type === 'requested'
                      ? '신청'
                      : '자율'}
                  </span>
                </div>
                <span className="schedule-time">
                  {schedule.start_time} - {schedule.end_time}
                </span>
              </div>
            ))}
          </div>
        ) : (
          <p className="empty">오늘 출근 예정인 직원이 없습니다.</p>
        )}
      </section>

      <section className="section">
        <h2>직원</h2>
        <div className="staff-list">
          {staffList.map((staff) => (
            <div key={staff.id} className="staff-item">
              <div className="staff-info">
                <h3>{staff.name}</h3>
                {staff.bio && <p className="bio">{staff.bio}</p>}
                {staff.specialties && (
                  <div className="specialties">
                    {staff.specialties.map((s) => (
                      <span key={s} className="specialty">
                        {s}
                      </span>
                    ))}
                  </div>
                )}
              </div>
              {staff.phone && <span className="phone">{staff.phone}</span>}
            </div>
          ))}
        </div>
      </section>

      <section className="section">
        <h2>메뉴</h2>
        <div className="menu-list">
          {menus.map((menu) => (
            <div key={menu.id} className="menu-item">
              <div className="menu-info">
                <h3>{menu.name}</h3>
                {menu.description && <p>{menu.description}</p>}
              </div>
              <span className="price">{menu.price.toLocaleString()}원</span>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
