import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Manager {
  id: string;
  name: string;
  type: 'real' | 'virtual';
}

interface Dispatch {
  id: number;
  manager_id: string | null;
  virtual_staff_id: string | null;
  manager_name?: string;
  virtual_staff_name?: string;
  target_type: string;
  target_customer_id: string | null;
  target_store_id: number | null;
  target_name?: string;
  date: string;
  start_time: string;
  end_time: string;
  status: string;
  notes?: string;
  created_at: string;
}

interface Customer {
  id: string;
  name: string;
  email: string;
}

interface Store {
  id: number;
  name: string;
}

type StatusFilter = 'all' | 'pending' | 'confirmed' | 'completed' | 'cancelled';

export default function AgencyDispatchManagement() {
  const { user } = useAuth();
  const [searchParams] = useSearchParams();
  const [dispatches, setDispatches] = useState<Dispatch[]>([]);
  const [managers, setManagers] = useState<Manager[]>([]);
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [stores, setStores] = useState<Store[]>([]);
  const [loading, setLoading] = useState(true);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [editingDispatch, setEditingDispatch] = useState<Dispatch | null>(null);

  const [statusFilter, setStatusFilter] = useState<StatusFilter>(() => {
    const status = searchParams.get('status');
    if (status && ['pending', 'confirmed', 'completed', 'cancelled'].includes(status)) {
      return status as StatusFilter;
    }
    return 'all';
  });
  const [dateFilter, setDateFilter] = useState('');

  // Form state
  const [form, setForm] = useState({
    staffType: 'real' as 'real' | 'virtual',
    staffId: '',
    targetType: 'customer' as 'customer' | 'store',
    targetId: '',
    date: '',
    startTime: '',
    endTime: '',
    notes: ''
  });

  useEffect(() => {
    if (user?.role === 'agency') {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    // 파견 목록
    const { data: dispatchesData } = await supabase
      .from('agency_dispatches')
      .select(`
        id,
        manager_id,
        virtual_staff_id,
        target_type,
        target_customer_id,
        target_store_id,
        date,
        start_time,
        end_time,
        status,
        notes,
        created_at,
        manager:profiles!agency_dispatches_manager_id_fkey(name),
        virtual_staff:agency_virtual_staff(name),
        target_customer:profiles!agency_dispatches_target_customer_id_fkey(name),
        target_store:stores(name)
      `)
      .eq('agency_id', user.id)
      .order('date', { ascending: false })
      .order('start_time', { ascending: false });

    if (dispatchesData) {
      const formattedDispatches: Dispatch[] = dispatchesData.map(d => {
        const manager = Array.isArray(d.manager) ? d.manager[0] : d.manager;
        const virtualStaff = Array.isArray(d.virtual_staff) ? d.virtual_staff[0] : d.virtual_staff;
        const targetCustomer = Array.isArray(d.target_customer) ? d.target_customer[0] : d.target_customer;
        const targetStore = Array.isArray(d.target_store) ? d.target_store[0] : d.target_store;

        return {
          id: d.id,
          manager_id: d.manager_id,
          virtual_staff_id: d.virtual_staff_id,
          manager_name: (manager as { name: string } | null)?.name,
          virtual_staff_name: (virtualStaff as { name: string } | null)?.name,
          target_type: d.target_type,
          target_customer_id: d.target_customer_id,
          target_store_id: d.target_store_id,
          target_name: d.target_type === 'customer'
            ? (targetCustomer as { name: string } | null)?.name
            : (targetStore as { name: string } | null)?.name,
          date: d.date,
          start_time: d.start_time,
          end_time: d.end_time,
          status: d.status,
          notes: d.notes,
          created_at: d.created_at
        };
      });
      setDispatches(formattedDispatches);
    }

    // 소속 매니저 (실제 + 가상)
    const { data: realManagers } = await supabase
      .from('agency_managers')
      .select('manager:profiles!agency_managers_manager_id_fkey(id, name)')
      .eq('agency_id', user.id)
      .eq('status', 'active');

    const { data: virtualManagers } = await supabase
      .from('agency_virtual_staff')
      .select('id, name')
      .eq('agency_id', user.id)
      .eq('is_visible', true);

    const allManagers: Manager[] = [
      ...(realManagers || []).map(m => ({
        id: (m.manager as unknown as { id: string; name: string }).id,
        name: (m.manager as unknown as { id: string; name: string }).name,
        type: 'real' as const
      })),
      ...(virtualManagers || []).map(v => ({
        id: v.id,
        name: v.name,
        type: 'virtual' as const
      }))
    ];
    setManagers(allManagers);

    // 손님 목록 (customer 역할)
    const { data: customersData } = await supabase
      .from('profiles')
      .select('id, name, email')
      .eq('role', 'customer')
      .limit(100);

    setCustomers(customersData || []);

    // 가게 목록
    const { data: storesData } = await supabase
      .from('stores')
      .select('id, name')
      .limit(100);

    setStores(storesData || []);

    setLoading(false);
  };

  const resetForm = () => {
    setForm({
      staffType: 'real',
      staffId: '',
      targetType: 'customer',
      targetId: '',
      date: '',
      startTime: '',
      endTime: '',
      notes: ''
    });
  };

  const openCreateModal = () => {
    setEditingDispatch(null);
    resetForm();
    setShowCreateModal(true);
  };

  const openEditModal = (dispatch: Dispatch) => {
    setEditingDispatch(dispatch);
    setForm({
      staffType: dispatch.manager_id ? 'real' : 'virtual',
      staffId: dispatch.manager_id || dispatch.virtual_staff_id || '',
      targetType: dispatch.target_type as 'customer' | 'store',
      targetId: dispatch.target_type === 'customer'
        ? dispatch.target_customer_id || ''
        : dispatch.target_store_id?.toString() || '',
      date: dispatch.date,
      startTime: dispatch.start_time,
      endTime: dispatch.end_time,
      notes: dispatch.notes || ''
    });
    setShowCreateModal(true);
  };

  const saveDispatch = async () => {
    if (!user || !form.staffId || !form.targetId || !form.date || !form.startTime || !form.endTime) {
      alert('필수 항목을 모두 입력해주세요.');
      return;
    }

    const data = {
      agency_id: user.id,
      manager_id: form.staffType === 'real' ? form.staffId : null,
      virtual_staff_id: form.staffType === 'virtual' ? form.staffId : null,
      target_type: form.targetType,
      target_customer_id: form.targetType === 'customer' ? form.targetId : null,
      target_store_id: form.targetType === 'store' ? parseInt(form.targetId) : null,
      date: form.date,
      start_time: form.startTime,
      end_time: form.endTime,
      notes: form.notes || null,
      updated_at: new Date().toISOString()
    };

    if (editingDispatch) {
      const { error } = await supabase
        .from('agency_dispatches')
        .update(data)
        .eq('id', editingDispatch.id);

      if (!error) {
        setShowCreateModal(false);
        fetchData();
      } else {
        alert('파견 수정 중 오류가 발생했습니다.');
      }
    } else {
      const { error } = await supabase
        .from('agency_dispatches')
        .insert(data);

      if (!error) {
        setShowCreateModal(false);
        fetchData();
      } else {
        alert('파견 등록 중 오류가 발생했습니다.');
      }
    }
  };

  const updateDispatchStatus = async (id: number, newStatus: string) => {
    const { error } = await supabase
      .from('agency_dispatches')
      .update({ status: newStatus, updated_at: new Date().toISOString() })
      .eq('id', id);

    if (!error) {
      setDispatches(prev => prev.map(d =>
        d.id === id ? { ...d, status: newStatus } : d
      ));
    }
  };

  const deleteDispatch = async (id: number) => {
    if (!confirm('이 파견을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('agency_dispatches')
      .delete()
      .eq('id', id);

    if (!error) {
      setDispatches(prev => prev.filter(d => d.id !== id));
    }
  };

  const getStatusName = (status: string) => {
    switch (status) {
      case 'pending': return '대기';
      case 'confirmed': return '확정';
      case 'completed': return '완료';
      case 'cancelled': return '취소';
      default: return status;
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pending': return 'bg-yellow-100 text-yellow-700';
      case 'confirmed': return 'bg-blue-100 text-blue-700';
      case 'completed': return 'bg-green-100 text-green-700';
      case 'cancelled': return 'bg-red-100 text-red-700';
      default: return 'bg-slate-100 text-slate-700';
    }
  };

  const filteredDispatches = dispatches.filter(d => {
    if (statusFilter !== 'all' && d.status !== statusFilter) return false;
    if (dateFilter && d.date !== dateFilter) return false;
    return true;
  });

  if (user?.role !== 'agency') {
    return (
      <div className="p-8 text-center">
        <p className="text-red-600 font-semibold">접근 권한이 없습니다.</p>
      </div>
    );
  }

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <div className="flex items-center gap-2 mb-6">
        <Link to="/agency" className="text-slate-400 hover:text-slate-600">←</Link>
        <h1 className="text-2xl font-bold text-slate-900">파견 관리</h1>
        <span className="text-slate-400">({filteredDispatches.length}건)</span>
      </div>

      {/* Filters */}
      <div className="flex flex-col md:flex-row gap-3 md:gap-4 mb-6">
        <div className="flex gap-2 flex-wrap">
          <select
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value as StatusFilter)}
            className="px-3 md:px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-orange-500"
          >
            <option value="all">전체 상태</option>
            <option value="pending">대기</option>
            <option value="confirmed">확정</option>
            <option value="completed">완료</option>
            <option value="cancelled">취소</option>
          </select>
          <input
            type="date"
            value={dateFilter}
            onChange={(e) => setDateFilter(e.target.value)}
            className="px-3 md:px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
          {dateFilter && (
            <button
              onClick={() => setDateFilter('')}
              className="px-3 py-2 text-sm text-slate-500 hover:text-slate-700"
            >
              초기화
            </button>
          )}
        </div>
        <div className="md:flex-1"></div>
        <button
          onClick={openCreateModal}
          className="px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700 transition-colors font-medium text-sm md:text-base"
        >
          + 파견 등록
        </button>
      </div>

      {/* Dispatch List */}
      {filteredDispatches.length === 0 ? (
        <div className="p-8 text-center text-slate-500 bg-white border border-slate-200 rounded-xl">
          <p>파견 데이터가 없습니다.</p>
        </div>
      ) : (
        <div className="space-y-3">
          {filteredDispatches.map((dispatch) => (
            <div key={dispatch.id} className="p-3 md:p-4 bg-white border border-slate-200 rounded-xl">
              <div className="flex flex-col md:flex-row md:items-start gap-3 md:justify-between">
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2 mb-2 flex-wrap">
                    <span className="font-semibold text-slate-900">
                      {dispatch.manager_name || dispatch.virtual_staff_name}
                    </span>
                    {dispatch.virtual_staff_id && (
                      <span className="px-2 py-0.5 text-xs font-medium rounded bg-purple-100 text-purple-700">
                        가상
                      </span>
                    )}
                    <span className={`px-2 py-0.5 text-xs font-medium rounded ${getStatusColor(dispatch.status)}`}>
                      {getStatusName(dispatch.status)}
                    </span>
                  </div>
                  <div className="text-sm text-slate-600 mb-1">
                    <span className="text-orange-600 font-medium">
                      {dispatch.target_type === 'customer' ? '손님' : '가게'}
                    </span>
                    <span className="mx-2">→</span>
                    <span>{dispatch.target_name || '미정'}</span>
                  </div>
                  <div className="text-sm text-slate-500">
                    <span>{dispatch.date}</span>
                    <span className="mx-2">·</span>
                    <span>{dispatch.start_time.slice(0, 5)} - {dispatch.end_time.slice(0, 5)}</span>
                  </div>
                  {dispatch.notes && (
                    <p className="text-sm text-slate-400 mt-2 line-clamp-2">{dispatch.notes}</p>
                  )}
                </div>
                <div className="flex items-center gap-2 flex-wrap">
                  {dispatch.status === 'pending' && (
                    <>
                      <button
                        onClick={() => updateDispatchStatus(dispatch.id, 'confirmed')}
                        className="px-3 py-1.5 text-xs font-medium text-blue-600 bg-blue-50 rounded-lg hover:bg-blue-100"
                      >
                        확정
                      </button>
                      <button
                        onClick={() => updateDispatchStatus(dispatch.id, 'cancelled')}
                        className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100"
                      >
                        취소
                      </button>
                    </>
                  )}
                  {dispatch.status === 'confirmed' && (
                    <>
                      <button
                        onClick={() => updateDispatchStatus(dispatch.id, 'completed')}
                        className="px-3 py-1.5 text-xs font-medium text-green-600 bg-green-50 rounded-lg hover:bg-green-100"
                      >
                        완료
                      </button>
                      <button
                        onClick={() => updateDispatchStatus(dispatch.id, 'cancelled')}
                        className="px-3 py-1.5 text-xs font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100"
                      >
                        취소
                      </button>
                    </>
                  )}
                  <button
                    onClick={() => openEditModal(dispatch)}
                    className="px-3 py-1.5 text-xs font-medium text-orange-600 bg-orange-50 rounded-lg hover:bg-orange-100"
                  >
                    수정
                  </button>
                  <button
                    onClick={() => deleteDispatch(dispatch.id)}
                    className="px-3 py-1.5 text-xs font-medium text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200"
                  >
                    삭제
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Create/Edit Modal */}
      {showCreateModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg p-6 max-h-[90vh] overflow-y-auto">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">
              {editingDispatch ? '파견 수정' : '파견 등록'}
            </h2>
            <div className="space-y-4">
              {/* Staff Selection */}
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">매니저 유형</label>
                <div className="flex gap-2">
                  <button
                    onClick={() => setForm({ ...form, staffType: 'real', staffId: '' })}
                    className={`flex-1 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                      form.staffType === 'real'
                        ? 'bg-orange-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    소속 매니저
                  </button>
                  <button
                    onClick={() => setForm({ ...form, staffType: 'virtual', staffId: '' })}
                    className={`flex-1 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                      form.staffType === 'virtual'
                        ? 'bg-orange-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    가상 매니저
                  </button>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">매니저 선택 *</label>
                <select
                  value={form.staffId}
                  onChange={(e) => setForm({ ...form, staffId: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                >
                  <option value="">선택하세요</option>
                  {managers
                    .filter(m => m.type === form.staffType)
                    .map(m => (
                      <option key={m.id} value={m.id}>{m.name}</option>
                    ))}
                </select>
              </div>

              {/* Target Selection */}
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">파견 대상</label>
                <div className="flex gap-2">
                  <button
                    onClick={() => setForm({ ...form, targetType: 'customer', targetId: '' })}
                    className={`flex-1 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                      form.targetType === 'customer'
                        ? 'bg-orange-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    손님
                  </button>
                  <button
                    onClick={() => setForm({ ...form, targetType: 'store', targetId: '' })}
                    className={`flex-1 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                      form.targetType === 'store'
                        ? 'bg-orange-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    가게
                  </button>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">
                  {form.targetType === 'customer' ? '손님' : '가게'} 선택 *
                </label>
                <select
                  value={form.targetId}
                  onChange={(e) => setForm({ ...form, targetId: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                >
                  <option value="">선택하세요</option>
                  {form.targetType === 'customer'
                    ? customers.map(c => (
                        <option key={c.id} value={c.id}>{c.name} ({c.email})</option>
                      ))
                    : stores.map(s => (
                        <option key={s.id} value={s.id}>{s.name}</option>
                      ))}
                </select>
              </div>

              {/* Date & Time */}
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">날짜 *</label>
                <input
                  type="date"
                  value={form.date}
                  onChange={(e) => setForm({ ...form, date: e.target.value })}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-2">시작 시간 *</label>
                  <input
                    type="time"
                    value={form.startTime}
                    onChange={(e) => setForm({ ...form, startTime: e.target.value })}
                    className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-2">종료 시간 *</label>
                  <input
                    type="time"
                    value={form.endTime}
                    onChange={(e) => setForm({ ...form, endTime: e.target.value })}
                    className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">메모</label>
                <textarea
                  value={form.notes}
                  onChange={(e) => setForm({ ...form, notes: e.target.value })}
                  rows={2}
                  className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500 resize-none"
                  placeholder="메모를 입력하세요..."
                />
              </div>
            </div>

            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setShowCreateModal(false)}
                className="flex-1 px-4 py-2 border border-slate-300 rounded-lg text-slate-600 hover:bg-slate-50"
              >
                취소
              </button>
              <button
                onClick={saveDispatch}
                className="flex-1 px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700"
              >
                {editingDispatch ? '수정' : '등록'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
