import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

interface LayoutProps {
  children: React.ReactNode;
}

export default function Layout({ children }: LayoutProps) {
  const { user, logout } = useAuth();
  const [unreadCount, setUnreadCount] = useState(0);
  const [pendingWorkRequests, setPendingWorkRequests] = useState(0);

  const fetchUnreadCount = useCallback(async () => {
    if (!user || user.role !== 'customer') return;

    const { count } = await supabase
      .from('reservations')
      .select('*', { count: 'exact', head: true })
      .eq('customer_id', user.id)
      .neq('status', 'pending')
      .is('status_read_at', null);

    setUnreadCount(count || 0);
  }, [user]);

  const fetchPendingWorkRequests = useCallback(async () => {
    if (!user || user.role !== 'staff') return;

    const { count } = await supabase
      .from('work_requests')
      .select('*', { count: 'exact', head: true })
      .eq('staff_id', user.id)
      .eq('status', 'pending');

    setPendingWorkRequests(count || 0);
  }, [user]);

  useEffect(() => {
    fetchUnreadCount();
    fetchPendingWorkRequests();

    const interval = setInterval(() => {
      fetchUnreadCount();
      fetchPendingWorkRequests();
    }, 30000);
    return () => clearInterval(interval);
  }, [fetchUnreadCount, fetchPendingWorkRequests]);

  const getRoleName = (role: string) => {
    switch (role) {
      case 'owner': return '사장';
      case 'admin': return '관리자';
      case 'staff': return '직원';
      case 'customer': return '손님';
      default: return role;
    }
  };

  return (
    <div className="min-h-screen flex flex-col bg-white">
      {/* Header */}
      <header className="flex justify-between items-center px-8 py-4 bg-white border-b border-slate-200 sticky top-0 z-50 max-md:px-4 max-md:flex-wrap max-md:gap-2">
        <Link to="/" className="text-xl font-bold text-slate-900 hover:text-orange-600 transition-colors tracking-tight">
          Red Fox
        </Link>

        {/* Navigation */}
        <nav className="flex items-center gap-1 max-md:order-3 max-md:w-full max-md:justify-center max-md:pt-2 max-md:border-t max-md:border-slate-200 max-md:mt-2">
          {user?.role === 'customer' && (
            <>
              <Link to="/customer/reservations" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                내 예약
                {unreadCount > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadCount}
                  </span>
                )}
              </Link>
              <Link to="/customer/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                즐겨찾기
              </Link>
            </>
          )}
          {user?.role === 'staff' && (
            <>
              <Link to="/staff/work-requests" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                출근 요청
                {pendingWorkRequests > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {pendingWorkRequests}
                  </span>
                )}
              </Link>
              <Link to="/staff/availability" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                가용 시간
              </Link>
              <Link to="/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                즐겨찾기
              </Link>
              <Link to="/blocks" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                차단 관리
              </Link>
            </>
          )}
          {user?.role === 'admin' && (
            <>
              <Link to="/admin/find-staff" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                직원 찾기
              </Link>
              <Link to="/admin/work-requests" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                보낸 요청
              </Link>
              <Link to="/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                즐겨찾기
              </Link>
              <Link to="/blocks" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                차단 관리
              </Link>
            </>
          )}
        </nav>

        {/* User Info */}
        <div className="flex items-center gap-4">
          <span className="font-medium text-slate-900 text-sm max-md:hidden">{user?.name}</span>
          <span className="px-2.5 py-1 bg-orange-50 rounded-full text-xs font-medium text-orange-600">
            {getRoleName(user?.role || '')}
          </span>
          <button
            onClick={logout}
            className="px-4 py-2 bg-transparent border border-slate-300 rounded-lg text-sm text-slate-600 hover:text-slate-900 hover:border-slate-400 transition-colors"
          >
            로그아웃
          </button>
        </div>
      </header>

      {/* Main Content */}
      <main className="flex-1 p-8 max-w-[1200px] w-full mx-auto max-md:p-4">
        {children}
      </main>
    </div>
  );
}
