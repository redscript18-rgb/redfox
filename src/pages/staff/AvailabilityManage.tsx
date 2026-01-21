import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <div className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-bold text-slate-900">가용 시간 관리</h1>
        <button
          className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
          onClick={() => setShowAddModal(true)}
        >
          + 시간 추가
        </button>
      </div>

      <p className="text-sm text-slate-500 mb-6">
        출근 가능한 요일과 시간대를 등록하면, 관리자가 해당 시간에 출근 요청을 보낼 수 있습니다.
      </p>

      <div className="grid grid-cols-7 gap-2 mb-8 max-md:grid-cols-4 max-sm:grid-cols-2">
        {[0, 1, 2, 3, 4, 5, 6].map((day) => (
          <div key={day} className="bg-white border border-slate-200 rounded-xl overflow-hidden">
            <div className="p-3 bg-slate-50 border-b border-slate-200 text-center">
              <span className="font-semibold text-slate-900">{DAY_NAMES[day]}요일</span>
            </div>
            <div className="p-2 min-h-[100px]">
              {groupedByDay[day]?.length > 0 ? (
                <div className="flex flex-col gap-1">
                  {groupedByDay[day].map((avail) => (
                    <div key={avail.id} className="flex items-center justify-between p-2 bg-orange-50 rounded-lg text-xs">
                      <span className="text-orange-700 font-medium">
                        {avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}
                      </span>
                      <button
                        className="w-5 h-5 flex items-center justify-center text-slate-400 hover:text-red-500 hover:bg-red-50 rounded"
                        onClick={() => handleDelete(avail.id)}
                      >
                        ×
                      </button>
                    </div>
                  ))}
                </div>
              ) : (
                <p className="text-xs text-slate-400 text-center py-4">등록된 시간 없음</p>
              )}
            </div>
          </div>
        ))}
      </div>

      <section className="mb-8">
        <h2 className="text-lg font-semibold text-slate-900 mb-3">전체 가용 시간 목록</h2>
        {availabilities.length > 0 ? (
          <div className="flex flex-col gap-2">
            {availabilities.map((avail) => (
              <div key={avail.id} className="flex items-center gap-3 p-3 bg-white border border-slate-200 rounded-xl">
                <span className="px-3 py-1 bg-orange-100 text-orange-600 text-sm font-semibold rounded-full">
                  {DAY_NAMES[avail.day_of_week]}
                </span>
                <span className="text-slate-900">
                  {avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}
                </span>
                <button
                  className="ml-auto px-3 py-1 text-sm text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                  onClick={() => handleDelete(avail.id)}
                >
                  삭제
                </button>
              </div>
            ))}
          </div>
        ) : (
          <div className="p-6 bg-slate-50 rounded-xl text-center">
            <p className="text-slate-500 mb-3">등록된 가용 시간이 없습니다.</p>
            <button
              className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
              onClick={() => setShowAddModal(true)}
            >
              시간 추가하기
            </button>
          </div>
        )}
      </section>

      {showAddModal && (
        <AddAvailabilityModal
          staffId={user?.id || ''}
          onClose={() => setShowAddModal(false)}
          onSuccess={() => { setShowAddModal(false); fetchAvailabilities(); }}
        />
      )}
    </div>
  );
}

function AddAvailabilityModal({
  staffId, onClose, onSuccess,
}: {
  staffId: string; onClose: () => void; onSuccess: () => void;
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
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">가용 시간 추가</h2>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">요일 선택 (복수 선택 가능)</label>
          <div className="flex gap-2 flex-wrap">
            {[1, 2, 3, 4, 5, 6, 0].map((day) => (
              <button
                key={day}
                type="button"
                className={`w-10 h-10 rounded-full text-sm font-medium transition-colors ${
                  selectedDays.includes(day)
                    ? 'bg-red-600 text-white'
                    : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                }`}
                onClick={() => toggleDay(day)}
              >
                {DAY_NAMES[day]}
              </button>
            ))}
          </div>
        </div>

        <div className="grid grid-cols-2 gap-4 mb-6">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">시작 시간</label>
            <select
              value={startTime}
              onChange={(e) => setStartTime(e.target.value)}
              className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            >
              {Array.from({ length: 24 }, (_, i) => i).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">종료 시간</label>
            <select
              value={endTime}
              onChange={(e) => setEndTime(e.target.value)}
              className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            >
              {Array.from({ length: 24 }, (_, i) => i).map((h) => (
                <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                  {h.toString().padStart(2, '0')}:00
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">
            취소
          </button>
          <button
            onClick={handleSubmit}
            disabled={selectedDays.length === 0 || submitting}
            className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400"
          >
            {submitting ? '등록 중...' : '등록하기'}
          </button>
        </div>
      </div>
    </div>
  );
}
