import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './AvailabilityManage.css';

interface Availability {
  id: number;
  day_of_week: number;
  start_time: string;
  end_time: string;
  is_active: boolean;
}

const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

export default function AvailabilityManage() {
  const { user } = useAuth();
  const [availabilities, setAvailabilities] = useState<Availability[]>([]);
  const [loading, setLoading] = useState(true);
  const [showAddModal, setShowAddModal] = useState(false);

  useEffect(() => {
    if (user) {
      fetchAvailabilities();
    }
  }, [user]);

  const fetchAvailabilities = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('staff_availability')
      .select('*')
      .eq('staff_id', user.id)
      .eq('is_active', true)
      .order('day_of_week', { ascending: true })
      .order('start_time', { ascending: true });

    setAvailabilities(data || []);
    setLoading(false);
  };

  const handleDelete = async (id: number) => {
    if (!confirm('이 가용 시간을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('staff_availability')
      .delete()
      .eq('id', id);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchAvailabilities();
    }
  };

  const groupedByDay = availabilities.reduce((acc, item) => {
    if (!acc[item.day_of_week]) {
      acc[item.day_of_week] = [];
    }
    acc[item.day_of_week].push(item);
    return acc;
  }, {} as Record<number, Availability[]>);

  if (loading) {
    return <div className="availability-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="availability-manage">
      <Link to="/" className="back-link">← 대시보드</Link>

      <div className="page-header">
        <h1>가용 시간 관리</h1>
        <button className="add-btn" onClick={() => setShowAddModal(true)}>
          + 시간 추가
        </button>
      </div>

      <p className="page-desc">
        출근 가능한 요일과 시간대를 등록하면, 관리자가 해당 시간에 출근 요청을 보낼 수 있습니다.
      </p>

      <div className="week-grid">
        {[0, 1, 2, 3, 4, 5, 6].map((day) => (
          <div key={day} className="day-column">
            <div className="day-header">{DAY_NAMES[day]}요일</div>
            <div className="time-slots">
              {groupedByDay[day]?.length > 0 ? (
                groupedByDay[day].map((avail) => (
                  <div key={avail.id} className="time-slot">
                    <span className="time">
                      {avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}
                    </span>
                    <button
                      className="delete-btn"
                      onClick={() => handleDelete(avail.id)}
                    >
                      ×
                    </button>
                  </div>
                ))
              ) : (
                <div className="empty-slot">등록된 시간 없음</div>
              )}
            </div>
          </div>
        ))}
      </div>

      <section className="section">
        <h2>전체 가용 시간 목록</h2>
        {availabilities.length > 0 ? (
          <div className="availability-list">
            {availabilities.map((avail) => (
              <div key={avail.id} className="availability-item">
                <span className="day-badge">{DAY_NAMES[avail.day_of_week]}</span>
                <span className="time-range">
                  {avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}
                </span>
                <button
                  className="delete-btn-text"
                  onClick={() => handleDelete(avail.id)}
                >
                  삭제
                </button>
              </div>
            ))}
          </div>
        ) : (
          <div className="empty-state">
            <p>등록된 가용 시간이 없습니다.</p>
            <button className="action-btn" onClick={() => setShowAddModal(true)}>
              시간 추가하기
            </button>
          </div>
        )}
      </section>

      {showAddModal && (
        <AddAvailabilityModal
          staffId={user?.id || ''}
          onClose={() => setShowAddModal(false)}
          onSuccess={() => {
            setShowAddModal(false);
            fetchAvailabilities();
          }}
        />
      )}
    </div>
  );
}

function AddAvailabilityModal({
  staffId,
  onClose,
  onSuccess,
}: {
  staffId: string;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [selectedDays, setSelectedDays] = useState<number[]>([]);
  const [startTime, setStartTime] = useState('10:00');
  const [endTime, setEndTime] = useState('18:00');
  const [submitting, setSubmitting] = useState(false);

  const toggleDay = (day: number) => {
    setSelectedDays((prev) =>
      prev.includes(day) ? prev.filter((d) => d !== day) : [...prev, day]
    );
  };

  const handleSubmit = async () => {
    if (selectedDays.length === 0) {
      alert('요일을 선택해주세요.');
      return;
    }

    if (startTime >= endTime) {
      alert('종료 시간은 시작 시간보다 늦어야 합니다.');
      return;
    }

    setSubmitting(true);

    const insertData = selectedDays.map((day) => ({
      staff_id: staffId,
      day_of_week: day,
      start_time: startTime,
      end_time: endTime,
      is_active: true,
    }));

    const { error } = await supabase
      .from('staff_availability')
      .insert(insertData);

    setSubmitting(false);

    if (error) {
      if (error.code === '23505') {
        alert('이미 등록된 시간대가 있습니다.');
      } else {
        alert('등록 중 오류가 발생했습니다.');
      }
    } else {
      onSuccess();
    }
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={(e) => e.stopPropagation()}>
        <h2>가용 시간 추가</h2>

        <div className="form-group">
          <label>요일 선택 (복수 선택 가능)</label>
          <div className="day-buttons">
            {[1, 2, 3, 4, 5, 6, 0].map((day) => (
              <button
                key={day}
                type="button"
                className={`day-btn ${selectedDays.includes(day) ? 'selected' : ''}`}
                onClick={() => toggleDay(day)}
              >
                {DAY_NAMES[day]}
              </button>
            ))}
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

        <div className="modal-actions">
          <button onClick={onClose} className="cancel-btn">취소</button>
          <button
            onClick={handleSubmit}
            className="submit-btn"
            disabled={selectedDays.length === 0 || submitting}
          >
            {submitting ? '등록 중...' : '등록하기'}
          </button>
        </div>
      </div>
    </div>
  );
}
