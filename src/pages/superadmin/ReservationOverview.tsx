import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Reservation {
  id: number;
  date: string;
  start_time: string;
  end_time: string;
  status: string;
  created_at: string;
  customer?: { name: string; email: string };
  staff?: { name: string };
  store?: { name: string };
  menu?: { name: string; price: number };
}

type StatusFilter = 'all' | 'pending' | 'confirmed' | 'cancelled' | 'completed';

export default function ReservationOverview() {
  const { user } = useAuth();
  const [searchParams, setSearchParams] = useSearchParams();
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);
  const initialStatus = searchParams.get('status') as StatusFilter || 'all';
  const [statusFilter, setStatusFilter] = useState<StatusFilter>(initialStatus);
  const [dateFilter, setDateFilter] = useState('');
  const [searchQuery, setSearchQuery] = useState('');

  useEffect(() => {
    if (user?.role === 'superadmin') {
      fetchReservations();
    }
  }, [user]);

  const fetchReservations = async () => {
    const { data: reservationsData } = await supabase
      .from('reservations')
      .select('*')
      .order('date', { ascending: false })
      .order('start_time', { ascending: false })
      .limit(200);

    if (!reservationsData || reservationsData.length === 0) {
      setReservations([]);
      setLoading(false);
      return;
    }

    // Fetch related data
    const customerIds = [...new Set(reservationsData.map(r => r.customer_id))];
    const staffIds = [...new Set(reservationsData.map(r => r.staff_id))];
    const storeIds = [...new Set(reservationsData.map(r => r.store_id))];
    const menuIds = [...new Set(reservationsData.map(r => r.menu_id))];

    const [customersRes, staffRes, storesRes, menusRes] = await Promise.all([
      supabase.from('profiles').select('id, name, email').in('id', customerIds),
      supabase.from('profiles').select('id, name').in('id', staffIds),
      supabase.from('stores').select('id, name').in('id', storeIds),
      supabase.from('menus').select('id, name, price').in('id', menuIds)
    ]);

    const customersMap = new Map(customersRes.data?.map(c => [c.id, c]) || []);
    const staffMap = new Map(staffRes.data?.map(s => [s.id, s]) || []);
    const storesMap = new Map(storesRes.data?.map(s => [s.id, s]) || []);
    const menusMap = new Map(menusRes.data?.map(m => [m.id, m]) || []);

    const reservationsWithDetails = reservationsData.map(r => ({
      ...r,
      customer: customersMap.get(r.customer_id),
      staff: staffMap.get(r.staff_id),
      store: storesMap.get(r.store_id),
      menu: menusMap.get(r.menu_id)
    }));

    setReservations(reservationsWithDetails);
    setLoading(false);
  };

  const filteredReservations = reservations.filter(r => {
    const matchesStatus = statusFilter === 'all' || r.status === statusFilter;
    const matchesDate = dateFilter === '' || r.date === dateFilter;
    const matchesSearch = searchQuery === '' ||
      r.customer?.name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      r.store?.name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      r.staff?.name?.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesStatus && matchesDate && matchesSearch;
  });

  const getStatusName = (status: string) => {
    switch (status) {
      case 'pending': return '대기';
      case 'confirmed': return '확정';
      case 'cancelled': return '취소';
      case 'completed': return '완료';
      default: return status;
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pending': return 'bg-yellow-100 text-yellow-700';
      case 'confirmed': return 'bg-green-100 text-green-700';
      case 'cancelled': return 'bg-red-100 text-red-700';
      case 'completed': return 'bg-blue-100 text-blue-700';
      default: return 'bg-slate-100 text-slate-700';
    }
  };

  if (user?.role !== 'superadmin') {
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
        <Link to="/superadmin" className="text-slate-400 hover:text-slate-600">←</Link>
        <h1 className="text-2xl font-bold text-slate-900">예약 현황</h1>
        <span className="text-slate-400">({filteredReservations.length}건)</span>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap gap-4 mb-6">
        <input
          type="text"
          placeholder="손님, 가게, 매니저 검색..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="flex-1 min-w-[200px] px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        <input
          type="date"
          value={dateFilter}
          onChange={(e) => setDateFilter(e.target.value)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        <select
          value={statusFilter}
          onChange={(e) => setStatusFilter(e.target.value as StatusFilter)}
          className="px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-600"
        >
          <option value="all">전체 상태</option>
          <option value="pending">대기</option>
          <option value="confirmed">확정</option>
          <option value="cancelled">취소</option>
          <option value="completed">완료</option>
        </select>
        {(dateFilter || statusFilter !== 'all' || searchQuery) && (
          <button
            onClick={() => { setDateFilter(''); setStatusFilter('all'); setSearchQuery(''); setSearchParams({}); }}
            className="px-4 py-2 text-sm text-slate-500 hover:text-slate-700"
          >
            필터 초기화
          </button>
        )}
      </div>

      {/* Reservations Table */}
      <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-slate-50">
              <tr>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">날짜</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">시간</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">상태</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">손님</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">가게</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">매니저</th>
                <th className="text-left py-3 px-4 text-sm font-medium text-slate-600">메뉴</th>
                <th className="text-right py-3 px-4 text-sm font-medium text-slate-600">금액</th>
              </tr>
            </thead>
            <tbody>
              {filteredReservations.map((r) => (
                <tr key={r.id} className="border-t border-slate-100 hover:bg-slate-50">
                  <td className="py-3 px-4 text-slate-900">
                    {new Date(r.date).toLocaleDateString('ko-KR', { month: 'short', day: 'numeric', weekday: 'short' })}
                  </td>
                  <td className="py-3 px-4 text-slate-600 text-sm">
                    {r.start_time.slice(0, 5)} - {r.end_time.slice(0, 5)}
                  </td>
                  <td className="py-3 px-4">
                    <span className={`px-2 py-1 text-xs font-medium rounded ${getStatusColor(r.status)}`}>
                      {getStatusName(r.status)}
                    </span>
                  </td>
                  <td className="py-3 px-4">
                    <div>
                      <p className="text-slate-900 text-sm">{r.customer?.name || '-'}</p>
                      <p className="text-slate-400 text-xs">{r.customer?.email}</p>
                    </div>
                  </td>
                  <td className="py-3 px-4 text-slate-700 text-sm">{r.store?.name || '-'}</td>
                  <td className="py-3 px-4 text-slate-700 text-sm">{r.staff?.name || '-'}</td>
                  <td className="py-3 px-4 text-slate-700 text-sm">{r.menu?.name || '-'}</td>
                  <td className="py-3 px-4 text-right text-slate-900 font-medium">
                    {r.menu?.price?.toLocaleString()}원
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {filteredReservations.length === 0 && (
        <div className="p-8 text-center text-slate-500">
          {reservations.length === 0 ? '예약 데이터가 없습니다.' : '검색 결과가 없습니다.'}
        </div>
      )}
    </div>
  );
}
