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

  useEffect(() => {
    fetchUnreadCount();

    // 30초 폴링
    const interval = setInterval(fetchUnreadCount, 30000);
    return () => clearInterval(interval);
  }, [fetchUnreadCount]);

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
            <Link to="/customer/reservations" className="nav-link">
              내 예약
              {unreadCount > 0 && (
                <span className="notification-badge">{unreadCount}</span>
              )}
            </Link>
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
