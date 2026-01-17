import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';
import './Layout.css';

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

    // 30초 폴링
    const interval = setInterval(() => {
      fetchUnreadCount();
      fetchPendingWorkRequests();
    }, 30000);
    return () => clearInterval(interval);
  }, [fetchUnreadCount, fetchPendingWorkRequests]);

  const getRoleName = (role: string) => {
    switch (role) {
      case 'owner':
        return '사장';
      case 'admin':
        return '관리자';
      case 'staff':
        return '직원';
      case 'customer':
        return '손님';
      default:
        return role;
    }
  };

  return (
    <div className="layout">
      <header className="header">
        <Link to="/" className="logo">
          Red Fox
        </Link>
        <nav className="nav-links">
          {user?.role === 'customer' && (
            <>
              <Link to="/customer/reservations" className="nav-link">
                내 예약
                {unreadCount > 0 && (
                  <span className="notification-badge">{unreadCount}</span>
                )}
              </Link>
              <Link to="/customer/favorites" className="nav-link">
                즐겨찾기
              </Link>
            </>
          )}
          {user?.role === 'staff' && (
            <>
              <Link to="/staff/work-requests" className="nav-link">
                출근 요청
                {pendingWorkRequests > 0 && (
                  <span className="notification-badge">{pendingWorkRequests}</span>
                )}
              </Link>
              <Link to="/staff/availability" className="nav-link">
                가용 시간
              </Link>
              <Link to="/favorites" className="nav-link">
                즐겨찾기
              </Link>
            </>
          )}
          {user?.role === 'admin' && (
            <>
              <Link to="/admin/find-staff" className="nav-link">
                직원 찾기
              </Link>
              <Link to="/admin/work-requests" className="nav-link">
                보낸 요청
              </Link>
              <Link to="/favorites" className="nav-link">
                즐겨찾기
              </Link>
            </>
          )}
        </nav>
        <div className="user-info">
          <span className="user-name">{user?.name}</span>
          <span className="user-role">{getRoleName(user?.role || '')}</span>
          <button onClick={logout} className="logout-btn">
            로그아웃
          </button>
        </div>
      </header>
      <main className="main">{children}</main>
    </div>
  );
}
