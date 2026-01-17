import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store {
  id: number;
  name: string;
}

interface StaffWithAvailability {
  id: string;
  name: string;
  email: string;
  profile_image: string | null;
  availabilities: { id: number; start_time: string; end_time: string; }[];
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

  useEffect(() => { if (user) fetchStores(); }, [user]);

  const fetchStores = async () => {
    if (!user) return;
    const { data: adminStores } = await supabase.from('store_admins').select('store_id').eq('admin_id', user.id);
    const storeIds = adminStores?.map((s) => s.store_id) || [];
    if (storeIds.length > 0) {
      const { data: storesData } = await supabase.from('stores').select('id, name').in('id', storeIds);
      setStores(storesData || []);
      if (storesData && storesData.length > 0) setSelectedStoreId(storesData[0].id);
    }
    setLoading(false);
  };

  const handleSearch = async () => {
    if (!selectedStoreId || !selectedDate) { alert('가게와 날짜를 선택해주세요.'); return; }
    setSearching(true);
    const date = new Date(selectedDate);
    const dayOfWeek = date.getDay();

    const { data: storeStaff } = await supabase.from('store_staff').select('staff_id').eq('store_id', selectedStoreId);
    const staffIds = storeStaff?.map((s) => s.staff_id) || [];
    if (staffIds.length === 0) { setAvailableStaff([]); setSearching(false); return; }

    const { data: availabilities } = await supabase.from('staff_availability').select('*').in('staff_id', staffIds).eq('day_of_week', dayOfWeek).eq('is_active', true);
    if (!availabilities || availabilities.length === 0) { setAvailableStaff([]); setSearching(false); return; }

    const availableStaffIds = [...new Set(availabilities.map((a) => a.staff_id))];
    const { data: profiles } = await supabase.from('profiles').select('id, name, email, profile_image').in('id', availableStaffIds);

    const staffWithAvail: StaffWithAvailability[] = (profiles || []).map((profile) => ({
      id: profile.id, name: profile.name, email: profile.email, profile_image: profile.profile_image,
      availabilities: availabilities.filter((a) => a.staff_id === profile.id).map((a) => ({ id: a.id, start_time: a.start_time, end_time: a.end_time })),
    }));

    setAvailableStaff(staffWithAvail);
    setSearching(false);
  };

  const handleRequestClick = (staff: StaffWithAvailability) => { setSelectedStaff(staff); setShowRequestModal(true); };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getFullYear()}.${(date.getMonth() + 1).toString().padStart(2, '0')}.${date.getDate().toString().padStart(2, '0')} (${DAY_NAMES[date.getDay()]})`;
  };

  const dateOptions = Array.from({ length: 14 }, (_, i) => { const d = new Date(); d.setDate(d.getDate() + i); return d.toISOString().split('T')[0]; });

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-blue-600 text-sm hover:underline">← 대시보드</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-1">가용 직원 찾기</h1>
      <p className="text-sm text-slate-500 mb-6">날짜를 선택하면 해당 요일에 근무 가능한 직원을 찾을 수 있습니다.</p>

      <div className="p-4 bg-slate-50 rounded-xl mb-6">
        <div className="grid grid-cols-3 gap-4 max-md:grid-cols-1">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">가게 선택</label>
            <select value={selectedStoreId} onChange={(e) => setSelectedStoreId(Number(e.target.value))} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600">
              <option value="">가게를 선택하세요</option>
              {stores.map((store) => (<option key={store.id} value={store.id}>{store.name}</option>))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">날짜 선택</label>
            <select value={selectedDate} onChange={(e) => setSelectedDate(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600">
              <option value="">날짜를 선택하세요</option>
              {dateOptions.map((d) => (<option key={d} value={d}>{formatDate(d)}</option>))}
            </select>
          </div>
          <div className="flex items-end">
            <button className="w-full h-11 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors disabled:bg-slate-400" onClick={handleSearch} disabled={!selectedStoreId || !selectedDate || searching}>
              {searching ? '검색 중...' : '검색'}
            </button>
          </div>
        </div>
      </div>

      {availableStaff.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-slate-900 mb-3">
            가용 직원 ({availableStaff.length}명)
            {selectedDate && <span className="ml-2 text-sm font-normal text-slate-500">{formatDate(selectedDate)}</span>}
          </h2>
          <div className="flex flex-col gap-3">
            {availableStaff.map((staff) => (
              <div key={staff.id} className="flex items-center gap-4 p-4 bg-white border border-slate-200 rounded-xl">
                <div className="w-12 h-12 rounded-full bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-white font-bold overflow-hidden">
                  {staff.profile_image ? (<img src={staff.profile_image} alt={staff.name} className="w-full h-full object-cover" />) : (staff.name[0])}
                </div>
                <div className="flex-1 min-w-0">
                  <h3 className="font-semibold text-slate-900">{staff.name}</h3>
                  <p className="text-sm text-slate-500">{staff.email}</p>
                  <div className="flex flex-wrap gap-1 mt-1">
                    {staff.availabilities.map((avail, idx) => (
                      <span key={idx} className="px-2 py-0.5 bg-green-50 text-green-600 text-xs rounded">{avail.start_time.slice(0, 5)} - {avail.end_time.slice(0, 5)}</span>
                    ))}
                  </div>
                </div>
                <button className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors" onClick={() => handleRequestClick(staff)}>출근 요청</button>
              </div>
            ))}
          </div>
        </section>
      )}

      {!searching && availableStaff.length === 0 && selectedDate && (
        <div className="p-8 bg-slate-50 rounded-xl text-center"><p className="text-slate-500">해당 날짜에 가용한 직원이 없습니다.</p></div>
      )}

      {showRequestModal && selectedStaff && selectedStoreId && selectedDate && (
        <SendRequestModal staff={selectedStaff} storeId={selectedStoreId} storeName={stores.find((s) => s.id === selectedStoreId)?.name || ''} date={selectedDate} adminId={user?.id || ''}
          onClose={() => { setShowRequestModal(false); setSelectedStaff(null); }}
          onSuccess={() => { setShowRequestModal(false); setSelectedStaff(null); alert('출근 요청을 보냈습니다.'); }}
        />
      )}
    </div>
  );
}

function SendRequestModal({ staff, storeId, storeName, date, adminId, onClose, onSuccess }: { staff: StaffWithAvailability; storeId: number; storeName: string; date: string; adminId: string; onClose: () => void; onSuccess: () => void; }) {
  const [startTime, setStartTime] = useState(staff.availabilities[0]?.start_time?.slice(0, 5) || '10:00');
  const [endTime, setEndTime] = useState(staff.availabilities[0]?.end_time?.slice(0, 5) || '18:00');
  const [message, setMessage] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async () => {
    setSubmitting(true);
    const { error } = await supabase.from('work_requests').insert({ store_id: storeId, staff_id: staff.id, admin_id: adminId, date, start_time: startTime, end_time: endTime, message: message || null, status: 'pending' });
    setSubmitting(false);
    if (error) alert('요청 중 오류가 발생했습니다.');
    else onSuccess();
  };

  const formatDate = (dateStr: string) => { const d = new Date(dateStr); return `${d.getMonth() + 1}/${d.getDate()} (${DAY_NAMES[d.getDay()]})`; };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">출근 요청 보내기</h2>

        <div className="p-4 bg-slate-50 rounded-lg mb-4 space-y-2">
          <div className="flex justify-between"><span className="text-sm text-slate-500">직원</span><span className="text-sm font-medium text-slate-900">{staff.name}</span></div>
          <div className="flex justify-between"><span className="text-sm text-slate-500">가게</span><span className="text-sm font-medium text-slate-900">{storeName}</span></div>
          <div className="flex justify-between"><span className="text-sm text-slate-500">날짜</span><span className="text-sm font-medium text-slate-900">{formatDate(date)}</span></div>
        </div>

        <div className="grid grid-cols-2 gap-4 mb-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">시작 시간</label>
            <select value={startTime} onChange={(e) => setStartTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600">
              {Array.from({ length: 15 }, (_, i) => i + 7).map((h) => (<option key={h} value={`${h.toString().padStart(2, '0')}:00`}>{h.toString().padStart(2, '0')}:00</option>))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">종료 시간</label>
            <select value={endTime} onChange={(e) => setEndTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600">
              {Array.from({ length: 15 }, (_, i) => i + 8).map((h) => (<option key={h} value={`${h.toString().padStart(2, '0')}:00`}>{h.toString().padStart(2, '0')}:00</option>))}
            </select>
          </div>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">메시지 (선택)</label>
          <textarea value={message} onChange={(e) => setMessage(e.target.value)} placeholder="직원에게 전달할 메시지를 입력하세요..." rows={3} className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-600" />
        </div>

        <div className="flex gap-3">
          <button onClick={onClose} className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors">취소</button>
          <button onClick={handleSubmit} disabled={submitting} className="flex-1 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 transition-colors disabled:bg-slate-400">{submitting ? '전송 중...' : '요청 보내기'}</button>
        </div>
      </div>
    </div>
  );
}
