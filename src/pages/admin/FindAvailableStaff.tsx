import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './FindAvailableStaff.css';

interface Store {
  id: number;
  name: string;
}

interface StaffWithAvailability {
  id: string;
  name: string;
  email: string;
  profile_image: string | null;
  availabilities: {
    id: number;
    start_time: string;
    end_time: string;
  }[];
}

const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

export default function FindAvailableStaff() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [selectedStoreId, setSelectedStoreId] = useState<number | ''>('');
  const [selectedDate, setSelectedDate] = useState('');
  const [availableStaff, setAvailableStaff] = useState<StaffWithAvailability[]>([]);
  const [loading, setLoading] = useState(true);
  const [searching, setSearching] = useState(false);
  const [showRequestModal, setShowRequestModal] = useState(false);
  const [selectedStaff, setSelectedStaff] = useState<StaffWithAvailability | null>(null);

  useEffect(() => {
    if (user) {
      fetchStores();
    }
  }, [user]);

  const fetchStores = async () => {
    if (!user) return;

    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map((s) => s.store_id) || [];

    if (storeIds.length > 0) {
      const { data: storesData } = await supabase
        .from('stores')
        .select('id, name')
        .in('id', storeIds);

      setStores(storesData || []);
      if (storesData && storesData.length > 0) {
        setSelectedStoreId(storesData[0].id);
      }
    }

    setLoading(false);
  };

  const handleSearch = async () => {
    if (!selectedStoreId || !selectedDate) {
      alert('가게와 날짜를 선택해주세요.');
      return;
    }

    setSearching(true);

    const date = new Date(selectedDate);
    const dayOfWeek = date.getDay();

    // 해당 가게의 직원 목록
    const { data: storeStaff } = await supabase
      .from('store_staff')
      .select('staff_id')
      .eq('store_id', selectedStoreId);

    const staffIds = storeStaff?.map((s) => s.staff_id) || [];

    if (staffIds.length === 0) {
      setAvailableStaff([]);
      setSearching(false);
      return;
    }

    // 해당 요일에 가용한 직원의 가용성 조회
    const { data: availabilities } = await supabase
      .from('staff_availability')
      .select('*')
      .in('staff_id', staffIds)
      .eq('day_of_week', dayOfWeek)
      .eq('is_active', true);

    if (!availabilities || availabilities.length === 0) {
      setAvailableStaff([]);
      setSearching(false);
      return;
    }

    // 가용성이 있는 직원들의 ID
    const availableStaffIds = [...new Set(availabilities.map((a) => a.staff_id))];

    // 직원 정보 조회
    const { data: profiles } = await supabase
      .from('profiles')
      .select('id, name, email, profile_image')
      .in('id', availableStaffIds);

    // 직원별 가용성 그룹화
    const staffWithAvail: StaffWithAvailability[] = (profiles || []).map((profile) => ({
      id: profile.id,
      name: profile.name,
      email: profile.email,
      profile_image: profile.profile_image,
      availabilities: availabilities
        .filter((a) => a.staff_id === profile.id)
        .map((a) => ({
          id: a.id,
          start_time: a.start_time,
          end_time: a.end_time,
        })),
    }));

    setAvailableStaff(staffWithAvail);
    setSearching(false);
  };

  const handleRequestClick = (staff: StaffWithAvailability) => {
    setSelectedStaff(staff);
    setShowRequestModal(true);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = DAY_NAMES;
    return `${date.getFullYear()}.${(date.getMonth() + 1).toString().padStart(2, '0')}.${date.getDate().toString().padStart(2, '0')} (${days[date.getDay()]})`;
  };

  // 오늘부터 14일간의 날짜 옵션
  const dateOptions = Array.from({ length: 14 }, (_, i) => {
    const d = new Date();
    d.setDate(d.getDate() + i);
    return d.toISOString().split('T')[0];
  });

  if (loading) {
    return <div className="find-staff"><p>로딩 중...</p></div>;
  }

  return (
    <div className="find-staff">
      <Link to="/" className="back-link">← 대시보드</Link>

      <h1>가용 직원 찾기</h1>
      <p className="page-desc">
        날짜를 선택하면 해당 요일에 근무 가능한 직원을 찾을 수 있습니다.
      </p>

      <div className="search-form">
        <div className="form-group">
          <label>가게 선택</label>
          <select
            value={selectedStoreId}
            onChange={(e) => setSelectedStoreId(Number(e.target.value))}
          >
            <option value="">가게를 선택하세요</option>
            {stores.map((store) => (
              <option key={store.id} value={store.id}>
                {store.name}
              </option>
            ))}
          </select>
        </div>

        <div className="form-group">
          <label>날짜 선택</label>
          <select
            value={selectedDate}
            onChange={(e) => setSelectedDate(e.target.value)}
          >
            <option value="">날짜를 선택하세요</option>
            {dateOptions.map((d) => (
              <option key={d} value={d}>
                {formatDate(d)}
              </option>
            ))}
          </select>
        </div>

        <button
          className="search-btn"
          onClick={handleSearch}
          disabled={!selectedStoreId || !selectedDate || searching}
        >
          {searching ? '검색 중...' : '검색'}
        </button>
      </div>

      {availableStaff.length > 0 && (
        <section className="results-section">
          <h2>
            가용 직원 ({availableStaff.length}명)
            {selectedDate && <span className="selected-date">{formatDate(selectedDate)}</span>}
          </h2>
          <div className="staff-list">
            {availableStaff.map((staff) => (
              <div key={staff.id} className="staff-card">
                <div className="staff-avatar">
                  {staff.profile_image ? (
                    <img src={staff.profile_image} alt={staff.name} />
                  ) : (
                    <div className="avatar-placeholder">{staff.name[0]}</div>
                  )}
                </div>
                <div className="staff-info">
                  <h3>{staff.name}</h3>
                  <p className="email">{staff.email}</p>
                  <div className="availability-times">
                    {staff.availabilities.map((avail, idx) => (
                      <span key={idx} className="time-badge">
                        {avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}
                      </span>
                    ))}
                  </div>
                </div>
                <button
                  className="request-btn"
                  onClick={() => handleRequestClick(staff)}
                >
                  출근 요청
                </button>
              </div>
            ))}
          </div>
        </section>
      )}

      {!searching && availableStaff.length === 0 && selectedDate && (
        <div className="empty-state">
          <p>해당 날짜에 가용한 직원이 없습니다.</p>
        </div>
      )}

      {showRequestModal && selectedStaff && selectedStoreId && selectedDate && (
        <SendRequestModal
          staff={selectedStaff}
          storeId={selectedStoreId}
          storeName={stores.find((s) => s.id === selectedStoreId)?.name || ''}
          date={selectedDate}
          adminId={user?.id || ''}
          onClose={() => {
            setShowRequestModal(false);
            setSelectedStaff(null);
          }}
          onSuccess={() => {
            setShowRequestModal(false);
            setSelectedStaff(null);
            alert('출근 요청을 보냈습니다.');
          }}
        />
      )}
    </div>
  );
}

function SendRequestModal({
  staff,
  storeId,
  storeName,
  date,
  adminId,
  onClose,
  onSuccess,
}: {
  staff: StaffWithAvailability;
  storeId: number;
  storeName: string;
  date: string;
  adminId: string;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [startTime, setStartTime] = useState(staff.availabilities[0]?.start_time?.slice(0, 5) || '10:00');
  const [endTime, setEndTime] = useState(staff.availabilities[0]?.end_time?.slice(0, 5) || '18:00');
  const [message, setMessage] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);

    // 중복 요청 체크 (같은 직원, 같은 날짜, 대기중인 요청)
    const { data: existingRequests } = await supabase
      .from('work_requests')
      .select('id')
      .eq('staff_id', staff.id)
      .eq('date', date)
      .eq('status', 'pending');

    if (existingRequests && existingRequests.length > 0) {
      setSubmitting(false);
      alert('이미 해당 직원에게 같은 날짜로 대기중인 요청이 있습니다.');
      return;
    }

    const { error } = await supabase
      .from('work_requests')
      .insert({
        store_id: storeId,
        staff_id: staff.id,
        admin_id: adminId,
        date,
        start_time: startTime,
        end_time: endTime,
        message: message || null,
        status: 'pending',
      });

    setSubmitting(false);

    if (error) {
      alert('요청 중 오류가 발생했습니다.');
    } else {
      onSuccess();
    }
  };

  const formatDate = (dateStr: string) => {
    const d = new Date(dateStr);
    const days = DAY_NAMES;
    return `${d.getMonth() + 1}/${d.getDate()} (${days[d.getDay()]})`;
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <h2>출근 요청 보내기</h2>

        <div className="request-summary">
          <div className="summary-item">
            <span className="label">직원</span>
            <span className="value">{staff.name}</span>
          </div>
          <div className="summary-item">
            <span className="label">가게</span>
            <span className="value">{storeName}</span>
          </div>
          <div className="summary-item">
            <span className="label">날짜</span>
            <span className="value">{formatDate(date)}</span>
          </div>
        </div>

        <div className="form-row">
          <div className="form-group">
            <label>시작 시간</label>
            <select value={startTime} onChange={(e) => setStartTime(e.target.value)}>
              {Array.from({ length: 15 }, (_, i) => i + 7).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
          <div className="form-group">
            <label>종료 시간</label>
            <select value={endTime} onChange={(e) => setEndTime(e.target.value)}>
              {Array.from({ length: 15 }, (_, i) => i + 8).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="form-group">
          <label>메시지 (선택)</label>
          <textarea
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder="직원에게 전달할 메시지를 입력하세요..."
            rows={3}
          />
        </div>

        <div className="modal-actions">
          <button onClick={onClose} className="cancel-btn">취소</button>
          <button
            onClick={handleSubmit}
            className="submit-btn"
            disabled={submitting}
          >
            {submitting ? '전송 중...' : '요청 보내기'}
          </button>
        </div>
      </div>
    </div>
  );
}
