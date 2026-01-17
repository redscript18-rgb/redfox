import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './StaffDetail.css';

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
}

interface DailyPhoto {
  id: number;
  photo_url: string;
  date: string;
  caption: string | null;
}

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

interface Schedule {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  store?: Store;
}

interface StaffRating {
  // 손님 평가 (reservation 기반)
  customerAvgRating: number | null;
  customerAvgServiceRating: number | null;
  customerCount: number;
  // 관리자 평가 (schedule 기반)
  adminAvgRating: number | null;
  adminAvgServiceRating: number | null;
  adminCount: number;
}

export default function StaffDetail() {
  const { id } = useParams<{ id: string }>();
  const { user } = useAuth();
  const [staff, setStaff] = useState<Staff | null>(null);
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [affiliatedStores, setAffiliatedStores] = useState<Store[]>([]);
  const [dailyPhotos, setDailyPhotos] = useState<DailyPhoto[]>([]);
  const [reservationCounts, setReservationCounts] = useState<Record<number, number>>({});
  const [loading, setLoading] = useState(true);
  const [selectedSchedule, setSelectedSchedule] = useState<number | null>(null);
  const [showReservationModal, setShowReservationModal] = useState(false);
  const [selectedPhoto, setSelectedPhoto] = useState<DailyPhoto | null>(null);
  const [staffRating, setStaffRating] = useState<StaffRating>({
    customerAvgRating: null, customerAvgServiceRating: null, customerCount: 0,
    adminAvgRating: null, adminAvgServiceRating: null, adminCount: 0,
  });

  useEffect(() => {
    if (id) {
      fetchData();
    }
  }, [id]);

  const fetchData = async () => {
    if (!id) return;

    // 직원 정보 조회
    const { data: staffData } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', id)
      .single();

    if (!staffData) {
      setLoading(false);
      return;
    }

    setStaff(staffData);

    const today = new Date().toISOString().split('T')[0];

    // 향후 출근 스케줄 조회
    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`
        *,
        store:stores(*)
      `)
      .eq('staff_id', id)
      .eq('status', 'approved')
      .gte('date', today)
      .order('date', { ascending: true });

    setSchedules(schedulesData || []);

    // 스케줄별 예약 수
    if (schedulesData && schedulesData.length > 0) {
      const counts: Record<number, number> = {};
      for (const schedule of schedulesData) {
        const { count } = await supabase
          .from('reservations')
          .select('*', { count: 'exact', head: true })
          .eq('staff_id', id)
          .eq('store_id', schedule.store_id)
          .eq('date', schedule.date)
          .neq('status', 'cancelled');

        counts[schedule.id] = count || 0;
      }
      setReservationCounts(counts);
    }

    // 소속 가게 조회
    const { data: storeStaffData } = await supabase
      .from('store_staff')
      .select('store_id')
      .eq('staff_id', id);

    if (storeStaffData && storeStaffData.length > 0) {
      const storeIds = storeStaffData.map(s => s.store_id);
      const { data: storesData } = await supabase
        .from('stores')
        .select('*')
        .in('id', storeIds);

      setAffiliatedStores(storesData || []);
    }

    // 직원 사진 조회 (최근 20개)
    const { data: photosData } = await supabase
      .from('staff_photos')
      .select('*')
      .eq('staff_id', id)
      .order('date', { ascending: false })
      .limit(20);

    setDailyPhotos(photosData || []);

    // 직원 평균 별점 조회 (손님/관리자 분리)
    const { data: ratingsData, error: ratingsError } = await supabase
      .from('ratings')
      .select('rating, service_rating, reservation_id, schedule_id')
      .eq('target_profile_id', id)
      .eq('target_type', 'staff');

    if (ratingsError) {
      console.warn('별점 조회 오류:', ratingsError.message);
    }

    if (ratingsData && ratingsData.length > 0) {
      // 손님 평가 (reservation_id가 있는 것)
      const customerRatings = ratingsData.filter(r => r.reservation_id !== null);
      const customerRatingValues = customerRatings.map(r => r.rating).filter(r => r !== null);
      const customerServiceValues = customerRatings.map(r => r.service_rating).filter(r => r !== null);

      // 관리자 평가 (schedule_id가 있는 것)
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

  // 날짜 포맷
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  const handleReserve = (scheduleId: number) => {
    setSelectedSchedule(scheduleId);
    setShowReservationModal(true);
  };

  if (loading) {
    return <div className="staff-detail"><p>로딩 중...</p></div>;
  }

  if (!staff) {
    return (
      <div className="staff-detail">
        <p>직원을 찾을 수 없습니다.</p>
        <Link to="/">← 돌아가기</Link>
      </div>
    );
  }

  const today = new Date().toISOString().split('T')[0];

  return (
    <div className="staff-detail">
      <Link to="/" className="back-link">
        ← 직원 목록
      </Link>

      <div className="profile-header">
        <div className="avatar">
          {staff.profile_photo_url ? (
            <img src={staff.profile_photo_url} alt={staff.name} />
          ) : (
            staff.name.charAt(0)
          )}
        </div>
        <div className="profile-info">
          <h1>{staff.name}</h1>
          {(staffRating.customerCount > 0 || staffRating.adminCount > 0) && (
            <div className="rating-display">
              {staffRating.customerCount > 0 && (
                <div className="rating-group">
                  <span className="rating-group-label">손님 평가</span>
                  <div className="rating-item">
                    <span className="rating-star">★</span>
                    <span className="rating-value">{staffRating.customerAvgRating?.toFixed(1)}</span>
                  </div>
                  {staffRating.customerAvgServiceRating && (
                    <div className="rating-item service">
                      <span className="rating-value">{staffRating.customerAvgServiceRating?.toFixed(1)}</span>
                      <span className="rating-label">서비스</span>
                    </div>
                  )}
                  <span className="rating-count">({staffRating.customerCount})</span>
                </div>
              )}
              {staffRating.adminCount > 0 && (
                <div className="rating-group">
                  <span className="rating-group-label">관리자 평가</span>
                  <div className="rating-item">
                    <span className="rating-star">★</span>
                    <span className="rating-value">{staffRating.adminAvgRating?.toFixed(1)}</span>
                  </div>
                  <span className="rating-count">({staffRating.adminCount})</span>
                </div>
              )}
            </div>
          )}
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
      </div>

      {/* 프로필 상세 정보 */}
      {(staff.age || staff.height || staff.weight || staff.body_size || staff.personality || staff.style || staff.skin_tone || staff.hair_length || staff.hair_style || staff.hair_color) && (
        <section className="section profile-details-section">
          <h2>프로필</h2>
          <div className="profile-details-info">
            {staff.age && (
              <div className="detail-item">
                <span className="detail-label">나이</span>
                <span className="detail-value">{staff.age}세</span>
              </div>
            )}
            {staff.height && (
              <div className="detail-item">
                <span className="detail-label">키</span>
                <span className="detail-value">{staff.height}cm</span>
              </div>
            )}
            {staff.weight && (
              <div className="detail-item">
                <span className="detail-label">몸무게</span>
                <span className="detail-value">{staff.weight}kg</span>
              </div>
            )}
            {staff.body_size && (
              <div className="detail-item">
                <span className="detail-label">B-Size</span>
                <span className="detail-value">{staff.body_size}</span>
              </div>
            )}
            {staff.skin_tone && (
              <div className="detail-item">
                <span className="detail-label">피부톤</span>
                <span className="detail-value">{staff.skin_tone}</span>
              </div>
            )}
            {staff.hair_length && (
              <div className="detail-item">
                <span className="detail-label">머리길이</span>
                <span className="detail-value">{staff.hair_length}</span>
              </div>
            )}
            {staff.hair_style && (
              <div className="detail-item">
                <span className="detail-label">헤어스타일</span>
                <span className="detail-value">{staff.hair_style}</span>
              </div>
            )}
            {staff.hair_color && (
              <div className="detail-item">
                <span className="detail-label">머리색</span>
                <span className="detail-value">{staff.hair_color}</span>
              </div>
            )}
            {staff.is_waxed !== null && (
              <div className="detail-item">
                <span className="detail-label">왁싱</span>
                <span className="detail-value">{staff.is_waxed ? '함' : '안함'}</span>
              </div>
            )}
            {staff.is_smoker !== null && (
              <div className="detail-item">
                <span className="detail-label">흡연</span>
                <span className="detail-value">{staff.is_smoker ? '흡연' : '비흡연'}</span>
              </div>
            )}
            {staff.personality && (
              <div className="detail-item">
                <span className="detail-label">성격</span>
                <span className="detail-value">{staff.personality}</span>
              </div>
            )}
            {staff.style && (
              <div className="detail-item">
                <span className="detail-label">스타일</span>
                <span className="detail-value">{staff.style}</span>
              </div>
            )}
          </div>
        </section>
      )}

      {dailyPhotos.filter(p => p.date === today).length > 0 && (
        <section className="section">
          <h2>오늘의 사진</h2>
          <p className="section-desc">매일 0시 기준으로 리셋됩니다</p>
          <div className="photo-gallery">
            {dailyPhotos.filter(p => p.date === today).map((photo) => (
              <div
                key={photo.id}
                className="photo-item"
                onClick={() => setSelectedPhoto(photo)}
              >
                <img src={photo.photo_url} alt={photo.caption || '작업 사진'} />
              </div>
            ))}
          </div>
        </section>
      )}

      <section className="section">
        <h2>출근 스케줄</h2>
        {schedules.length > 0 ? (
          <div className="schedule-list">
            {schedules.map((schedule) => {
              const isToday = schedule.date === today;
              return (
                <div
                  key={schedule.id}
                  className={`schedule-card ${isToday ? 'today' : ''}`}
                >
                  <div className="schedule-date">
                    <span className="date">{formatDate(schedule.date)}</span>
                    {isToday && <span className="today-badge">오늘</span>}
                  </div>
                  <div className="schedule-details">
                    <div className="store-info">
                      <span className="store-name">{schedule.store?.name}</span>
                      <span className="store-address">{schedule.store?.address}</span>
                    </div>
                    <div className="time-info">
                      {schedule.start_time} - {schedule.end_time}
                    </div>
                    <div className="reservation-count">
                      예약 {reservationCounts[schedule.id] || 0}건
                    </div>
                  </div>
                  <button
                    className="reserve-btn"
                    onClick={() => handleReserve(schedule.id)}
                  >
                    예약하기
                  </button>
                </div>
              );
            })}
          </div>
        ) : (
          <p className="empty">예정된 출근 스케줄이 없습니다.</p>
        )}
      </section>

      <section className="section">
        <h2>활동 가게</h2>
        <div className="affiliated-stores">
          {affiliatedStores.map((store) => (
            <div key={store.id} className="affiliated-store">
              <h3>{store.name}</h3>
              <p>{store.address}</p>
            </div>
          ))}
        </div>
      </section>

      {showReservationModal && selectedSchedule && (
        <ReservationModal
          scheduleId={selectedSchedule}
          staffId={staff.id}
          customerId={user?.id}
          schedules={schedules}
          onClose={() => setShowReservationModal(false)}
          onSuccess={() => {
            setShowReservationModal(false);
            fetchData();
          }}
        />
      )}

      {selectedPhoto && (
        <div className="photo-modal-overlay" onClick={() => setSelectedPhoto(null)}>
          <div className="photo-modal" onClick={(e) => e.stopPropagation()}>
            <img src={selectedPhoto.photo_url} alt={selectedPhoto.caption || '사진'} />
            {selectedPhoto.caption && (
              <p className="photo-modal-caption">{selectedPhoto.caption}</p>
            )}
            <button className="photo-modal-close" onClick={() => setSelectedPhoto(null)}>
              ×
            </button>
          </div>
        </div>
      )}
    </div>
  );
}

// 예약 모달 컴포넌트
function ReservationModal({
  scheduleId,
  staffId,
  customerId,
  schedules,
  onClose,
  onSuccess,
}: {
  scheduleId: number;
  staffId: string;
  customerId?: string;
  schedules: Schedule[];
  onClose: () => void;
  onSuccess: () => void;
}) {
  const schedule = schedules.find((s) => s.id === scheduleId);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [staffName, setStaffName] = useState('');
  const [selectedMenu, setSelectedMenu] = useState<number | null>(null);
  const [selectedTime, setSelectedTime] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    if (schedule?.store_id) {
      fetchMenus();
    }
    fetchStaffName();
  }, [schedule?.store_id, staffId]);

  const fetchMenus = async () => {
    if (!schedule?.store_id) return;

    const { data } = await supabase
      .from('menus')
      .select('*')
      .eq('store_id', schedule.store_id);

    setMenus(data || []);
  };

  const fetchStaffName = async () => {
    const { data } = await supabase
      .from('profiles')
      .select('name')
      .eq('id', staffId)
      .single();

    setStaffName(data?.name || '');
  };

  if (!schedule) return null;

  // 시간 슬롯 생성 (1시간 단위)
  const generateTimeSlots = () => {
    const slots: string[] = [];
    const start = parseInt(schedule.start_time.split(':')[0]);
    const end = parseInt(schedule.end_time.split(':')[0]);
    for (let h = start; h < end; h++) {
      slots.push(`${h.toString().padStart(2, '0')}:00`);
    }
    return slots;
  };

  const handleSubmit = async () => {
    if (!selectedMenu || !selectedTime || !customerId) return;

    setSubmitting(true);

    // end_time 계산 (1시간 후)
    const startHour = parseInt(selectedTime.split(':')[0]);
    const endTime = `${(startHour + 1).toString().padStart(2, '0')}:00`;

    const { error } = await supabase
      .from('reservations')
      .insert({
        store_id: schedule.store_id,
        staff_id: staffId,
        customer_id: customerId,
        menu_id: selectedMenu,
        date: schedule.date,
        start_time: selectedTime,
        end_time: endTime,
        status: 'pending',
      });

    setSubmitting(false);

    if (error) {
      alert('예약 중 오류가 발생했습니다.');
    } else {
      setSubmitted(true);
    }
  };

  if (submitted) {
    return (
      <div className="modal-overlay" onClick={onClose}>
        <div className="modal" onClick={(e) => e.stopPropagation()}>
          <div className="success-message">
            <h2>예약 신청 완료!</h2>
            <p>가게에서 확인 후 연락드릴 예정입니다.</p>
            <button onClick={onSuccess} className="close-btn">
              확인
            </button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <h2>예약하기</h2>
        <div className="reservation-info">
          <p>
            <strong>직원:</strong> {staffName}
          </p>
          <p>
            <strong>가게:</strong> {schedule.store?.name}
          </p>
          <p>
            <strong>날짜:</strong> {schedule.date}
          </p>
        </div>

        <div className="form-group">
          <label>서비스 선택</label>
          <div className="menu-options">
            {menus.map((menu) => (
              <label
                key={menu.id}
                className={`menu-option ${selectedMenu === menu.id ? 'selected' : ''}`}
              >
                <input
                  type="radio"
                  name="menu"
                  value={menu.id}
                  checked={selectedMenu === menu.id}
                  onChange={() => setSelectedMenu(menu.id)}
                />
                <span className="menu-name">{menu.name}</span>
                <span className="menu-price">
                  {menu.price.toLocaleString()}원
                </span>
              </label>
            ))}
          </div>
        </div>

        <div className="form-group">
          <label>시간 선택</label>
          <div className="time-options">
            {generateTimeSlots().map((time) => (
              <button
                key={time}
                type="button"
                className={`time-option ${selectedTime === time ? 'selected' : ''}`}
                onClick={() => setSelectedTime(time)}
              >
                {time}
              </button>
            ))}
          </div>
        </div>

        <div className="modal-actions">
          <button onClick={onClose} className="cancel-btn">
            취소
          </button>
          <button
            onClick={handleSubmit}
            className="submit-btn"
            disabled={!selectedMenu || !selectedTime || submitting}
          >
            {submitting ? '예약 중...' : '예약 신청'}
          </button>
        </div>
      </div>
    </div>
  );
}
