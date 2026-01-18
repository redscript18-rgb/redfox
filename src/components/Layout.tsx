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
  const [unreadMessages, setUnreadMessages] = useState(0);
  const [showProfileMenu, setShowProfileMenu] = useState(false);

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

  const fetchUnreadMessages = useCallback(async () => {
    if (!user || (user.role !== 'customer' && user.role !== 'admin' && user.role !== 'owner' && user.role !== 'staff')) return;

    // Get conversations where user is a participant
    const { data: conversations } = await supabase
      .from('conversations')
      .select('id')
      .or(`admin_id.eq.${user.id},customer_id.eq.${user.id},staff_id.eq.${user.id}`);

    if (!conversations || conversations.length === 0) {
      setUnreadMessages(0);
      return;
    }

    const conversationIds = conversations.map(c => c.id);
    const { count } = await supabase
      .from('messages')
      .select('*', { count: 'exact', head: true })
      .in('conversation_id', conversationIds)
      .neq('sender_id', user.id)
      .is('read_at', null);

    setUnreadMessages(count || 0);
  }, [user]);

  useEffect(() => {
    fetchUnreadCount();
    fetchPendingWorkRequests();
    fetchUnreadMessages();

    const interval = setInterval(() => {
      fetchUnreadCount();
      fetchPendingWorkRequests();
      fetchUnreadMessages();
    }, 30000);
    return () => clearInterval(interval);
  }, [fetchUnreadCount, fetchPendingWorkRequests, fetchUnreadMessages]);

  const getRoleName = (role: string) => {
    switch (role) {
      case 'superadmin': return '서비스관리자';
      case 'owner': return '사장';
      case 'admin': return '관리자';
      case 'staff': return '매니저';
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
          {user?.role === 'superadmin' && (
            <>
              <Link to="/superadmin/users" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                사용자
              </Link>
              <Link to="/superadmin/stores" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                가게
              </Link>
              <Link to="/superadmin/virtual-staff" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                매니저
              </Link>
              <Link to="/superadmin/users?role=customer" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                손님
              </Link>
              <Link to="/superadmin/reservations" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                예약
              </Link>
            </>
          )}
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
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
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
              <Link to="/staff/reservations" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                내 예약
              </Link>
              <Link to="/staff/stores" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                가게 탐색
              </Link>
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
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
                  </span>
                )}
              </Link>
              <Link to="/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                즐겨찾기
              </Link>
              <Link to="/blocks" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                차단 관리
              </Link>
            </>
          )}
          {(user?.role === 'admin' || user?.role === 'owner') && (
            <>
              <Link to="/admin/find-staff" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                매니저 찾기
              </Link>
              <Link to="/admin/work-requests" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                보낸 요청
              </Link>
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-2 max-md:text-xs">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
                  </span>
                )}
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

        {/* Profile Dropdown */}
        <div className="relative">
          <button
            onClick={() => setShowProfileMenu(!showProfileMenu)}
            className="flex items-center gap-2 p-1 rounded-full hover:bg-slate-100 transition-colors"
          >
            <div className="w-9 h-9 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold text-sm overflow-hidden">
              {(user?.profile_photo_url || user?.profile_image) ? (
                <img src={user?.profile_photo_url || user?.profile_image} alt={user?.name} className="w-full h-full object-cover" />
              ) : (
                user?.name?.charAt(0) || '?'
              )}
            </div>
          </button>

          {showProfileMenu && (
            <>
              <div
                className="fixed inset-0 z-40"
                onClick={() => setShowProfileMenu(false)}
              />
              <div className="absolute right-0 top-12 w-64 bg-white border border-slate-200 rounded-xl shadow-lg z-50 overflow-hidden">
                {/* User Info */}
                <div className="p-4 border-b border-slate-100">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold overflow-hidden flex-shrink-0">
                      {(user?.profile_photo_url || user?.profile_image) ? (
                        <img src={user?.profile_photo_url || user?.profile_image} alt={user?.name} className="w-full h-full object-cover" />
                      ) : (
                        user?.name?.charAt(0) || '?'
                      )}
                    </div>
                    <div className="min-w-0">
                      <div className="flex items-center gap-2">
                        <p className="font-medium text-slate-900 truncate">{user?.name}</p>
                        <span className="px-1.5 py-0.5 bg-orange-50 rounded text-[10px] font-medium text-orange-600 flex-shrink-0">
                          {getRoleName(user?.role || '')}
                        </span>
                      </div>
                      <p className="text-xs text-slate-500 truncate">{user?.email}</p>
                    </div>
                  </div>
                </div>

                {/* Menu Items */}
                <div className="py-2">
                  {user?.role === 'staff' && (
                    <Link
                      to="/staff/profile"
                      onClick={() => setShowProfileMenu(false)}
                      className="flex items-center gap-3 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50 transition-colors"
                    >
                      <span className="w-5 text-center">👤</span>
                      내 프로필
                    </Link>
                  )}
                  <Link
                    to="/settings"
                    onClick={() => setShowProfileMenu(false)}
                    className="flex items-center gap-3 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50 transition-colors"
                  >
                    <span className="w-5 text-center">⚙️</span>
                    계정 설정
                  </Link>
                </div>

                {/* Logout */}
                <div className="border-t border-slate-100 py-2">
                  <button
                    onClick={() => { setShowProfileMenu(false); logout(); }}
                    className="flex items-center gap-3 w-full px-4 py-2 text-sm text-red-600 hover:bg-red-50 transition-colors"
                  >
                    <span className="w-5 text-center">🚪</span>
                    로그아웃
                  </button>
                </div>
              </div>
            </>
          )}
        </div>
      </header>

      {/* Main Content */}
      <main className="flex-1 p-8 max-w-[1200px] w-full mx-auto max-md:p-4">
        {children}
      </main>
    </div>
  );
}
