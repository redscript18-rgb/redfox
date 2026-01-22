import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';
import ScoreBadge from './ScoreBadge';
import { useNotifications } from '../hooks/useNotifications';
import { usePageTracking } from '../hooks/usePageTracking';

interface LayoutProps {
  children: React.ReactNode;
}

export default function Layout({ children }: LayoutProps) {
  const { user, logout } = useAuth();
  usePageTracking();
  const [unreadCount, setUnreadCount] = useState(0);
  const [pendingWorkRequests, setPendingWorkRequests] = useState(0);
  const [unreadMessages, setUnreadMessages] = useState(0);
  const [showProfileMenu, setShowProfileMenu] = useState(false);
  const [showNotifications, setShowNotifications] = useState(false);

  const {
    notifications,
    unreadCount: notificationUnreadCount,
    markAsRead,
    markAllAsRead
  } = useNotifications(user?.id);

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
    if (!user || user.role !== 'manager') return;

    const { count } = await supabase
      .from('work_requests')
      .select('*', { count: 'exact', head: true })
      .eq('staff_id', user.id)
      .eq('status', 'pending');

    setPendingWorkRequests(count || 0);
  }, [user]);

  const fetchUnreadMessages = useCallback(async () => {
    if (!user || (user.role !== 'customer' && user.role !== 'staff' && user.role !== 'owner' && user.role !== 'manager' && user.role !== 'agency')) return;

    // Get conversations where user is a participant
    const { data: conversations } = await supabase
      .from('conversations')
      .select('id')
      .or(`admin_id.eq.${user.id},customer_id.eq.${user.id},staff_id.eq.${user.id},agency_id.eq.${user.id}`);

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
      case 'agency': return '에이전시';
      case 'owner': return '사장';
      case 'staff': return '실장';
      case 'manager': return '매니저';
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
        <nav className="flex items-center gap-1 max-md:order-3 max-md:w-full max-md:pt-2 max-md:border-t max-md:border-slate-200 max-md:mt-2 max-md:overflow-x-auto max-md:justify-start max-md:-mx-4 max-md:px-4">
          {user?.role === 'superadmin' && (
            <>
              <Link to="/superadmin/users" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                사용자
              </Link>
              <Link to="/superadmin/stores" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                가게
              </Link>
              <Link to="/superadmin/virtual-staff" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                매니저
              </Link>
              <Link to="/superadmin/users?role=customer" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                손님
              </Link>
              <Link to="/superadmin/reservations" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                예약
              </Link>
            </>
          )}
          {user?.role === 'customer' && (
            <>
              <Link to="/customer/reservations" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                내 예약
                {unreadCount > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadCount}
                  </span>
                )}
              </Link>
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
                  </span>
                )}
              </Link>
              <Link to="/customer/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                고정
              </Link>
            </>
          )}
          {user?.role === 'manager' && (
            <>
              <Link to="/staff/my-schedule" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                스케줄
                {pendingWorkRequests > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {pendingWorkRequests}
                  </span>
                )}
              </Link>
              <Link to="/staff/stores" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                가게
              </Link>
              <Link to="/staff/agencies" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                에이전시
              </Link>
              <Link to="/staff/community" className="px-4 py-2 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-medium text-sm rounded-lg hover:from-pink-600 hover:to-rose-600 transition-all shadow-sm shadow-pink-200 max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                라운지
              </Link>
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
                  </span>
                )}
              </Link>
              <Link to="/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                고정
              </Link>
              <Link to="/blocks" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                차단
              </Link>
            </>
          )}
          {(user?.role === 'staff' || user?.role === 'owner') && (
            <>
              <Link to="/admin/find-staff" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                매니저
              </Link>
              <Link to="/admin/agencies" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                에이전시
              </Link>
              <Link to="/admin/join-requests" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                가입요청
              </Link>
              <Link to="/admin/work-requests" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                보낸요청
              </Link>
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
                  </span>
                )}
              </Link>
              <Link to="/favorites" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                고정
              </Link>
              <Link to="/blocks" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                차단
              </Link>
            </>
          )}
          {user?.role === 'agency' && (
            <>
              <Link to="/agency/managers" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                매니저
              </Link>
              <Link to="/agency/store-requests" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                가게요청
              </Link>
              <Link to="/agency/dispatches" className="px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                파견
              </Link>
              <Link to="/chat" className="relative px-4 py-2 text-slate-600 font-medium text-sm rounded-lg hover:text-slate-900 hover:bg-slate-50 transition-colors max-md:px-3 max-md:py-2.5 max-md:text-xs max-md:min-h-[44px] max-md:flex max-md:items-center flex-shrink-0 whitespace-nowrap">
                메시지
                {unreadMessages > 0 && (
                  <span className="inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 ml-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                    {unreadMessages}
                  </span>
                )}
              </Link>
            </>
          )}
        </nav>

        {/* Score Badge, Notifications & Profile Dropdown */}
        <div className="flex items-center gap-3">
          <ScoreBadge />

          {/* Notification Bell */}
          <div className="relative">
            <button
              onClick={() => { setShowNotifications(!showNotifications); setShowProfileMenu(false); }}
              className="relative p-2 text-slate-500 hover:text-slate-700 hover:bg-slate-100 rounded-full transition-colors"
            >
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                <path strokeLinecap="round" strokeLinejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
              </svg>
              {notificationUnreadCount > 0 && (
                <span className="absolute -top-0.5 -right-0.5 min-w-[18px] h-[18px] px-1 bg-red-500 text-white text-[10px] font-semibold rounded-full flex items-center justify-center">
                  {notificationUnreadCount > 9 ? '9+' : notificationUnreadCount}
                </span>
              )}
            </button>

            {showNotifications && (
              <>
                <div
                  className="fixed inset-0 z-40"
                  onClick={() => setShowNotifications(false)}
                />
                <div className="absolute right-0 top-12 w-80 bg-white border border-slate-200 rounded-xl shadow-lg z-50 overflow-hidden max-md:right-[-60px]">
                  <div className="flex items-center justify-between p-3 border-b border-slate-100">
                    <h3 className="font-semibold text-slate-900">알림</h3>
                    {notificationUnreadCount > 0 && (
                      <button
                        onClick={markAllAsRead}
                        className="text-xs text-orange-600 hover:underline"
                      >
                        모두 읽음
                      </button>
                    )}
                  </div>
                  <div className="max-h-80 overflow-y-auto">
                    {notifications.length === 0 ? (
                      <div className="p-6 text-center text-slate-400 text-sm">
                        알림이 없습니다
                      </div>
                    ) : (
                      notifications.map((notification) => (
                        <div
                          key={notification.id}
                          onClick={() => { markAsRead(notification.id); }}
                          className={`p-3 border-b border-slate-50 cursor-pointer hover:bg-slate-50 transition-colors ${
                            !notification.is_read ? 'bg-orange-50' : ''
                          }`}
                        >
                          <div className="flex items-start gap-3">
                            <div className={`w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0 ${
                              notification.type === 'gift_received'
                                ? 'bg-amber-100 text-amber-600'
                                : 'bg-slate-100 text-slate-600'
                            }`}>
                              {notification.type === 'gift_received' ? (
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-4 h-4">
                                  <path d="M9.375 3a1.875 1.875 0 0 0 0 3.75h1.875v4.5H3.375A1.875 1.875 0 0 1 1.5 9.375v-.75c0-1.036.84-1.875 1.875-1.875h3.193A3.375 3.375 0 0 1 12 2.753a3.375 3.375 0 0 1 5.432 3.997h3.193c1.035 0 1.875.84 1.875 1.875v.75c0 1.036-.84 1.875-1.875 1.875H12.75v-4.5h1.875a1.875 1.875 0 1 0-1.875-1.875V6.75h-1.5V4.875C11.25 3.839 10.41 3 9.375 3Z" />
                                  <path d="M11.25 12.75H3v6.75a2.25 2.25 0 0 0 2.25 2.25h6v-9ZM12.75 12.75v9h6a2.25 2.25 0 0 0 2.25-2.25v-6.75h-8.25Z" />
                                </svg>
                              ) : (
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-4 h-4">
                                  <path fillRule="evenodd" d="M5.25 9a6.75 6.75 0 0 1 13.5 0v.75c0 2.123.8 4.057 2.118 5.52a.75.75 0 0 1-.297 1.206c-1.544.57-3.16.99-4.831 1.243a3.75 3.75 0 1 1-7.48 0 24.585 24.585 0 0 1-4.831-1.244.75.75 0 0 1-.298-1.205A8.217 8.217 0 0 0 5.25 9.75V9Z" clipRule="evenodd" />
                                </svg>
                              )}
                            </div>
                            <div className="flex-1 min-w-0">
                              <p className="font-medium text-sm text-slate-900">{notification.title}</p>
                              {notification.message && (
                                <p className="text-xs text-slate-500 mt-0.5">{notification.message}</p>
                              )}
                              <p className="text-[10px] text-slate-400 mt-1">
                                {new Date(notification.created_at).toLocaleDateString('ko-KR', {
                                  month: 'short',
                                  day: 'numeric',
                                  hour: '2-digit',
                                  minute: '2-digit'
                                })}
                              </p>
                            </div>
                            {!notification.is_read && (
                              <div className="w-2 h-2 bg-orange-500 rounded-full flex-shrink-0 mt-1.5"></div>
                            )}
                          </div>
                        </div>
                      ))
                    )}
                  </div>
                </div>
              </>
            )}
          </div>

          <div className="relative">
            <button
              onClick={() => { setShowProfileMenu(!showProfileMenu); setShowNotifications(false); }}
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
                  {user?.role === 'manager' && (
                    <>
                      <Link
                        to="/staff/profile"
                        onClick={() => setShowProfileMenu(false)}
                        className="flex items-center gap-3 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50 transition-colors"
                      >
                        <span className="w-5 text-center">👤</span>
                        내 프로필
                      </Link>
                      <Link
                        to="/staff/today-photos"
                        onClick={() => setShowProfileMenu(false)}
                        className="flex items-center gap-3 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50 transition-colors"
                      >
                        <span className="w-5 text-center">📸</span>
                        오늘의 사진
                      </Link>
                    </>
                  )}
                  <Link
                    to="/my-score"
                    onClick={() => setShowProfileMenu(false)}
                    className="flex items-center gap-3 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50 transition-colors"
                  >
                    <span className="w-5 text-center">⭐</span>
                    내 점수
                  </Link>
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
        </div>
      </header>

      {/* Main Content */}
      <main className="flex-1 p-8 max-w-[1200px] w-full mx-auto max-md:p-4">
        {children}
      </main>
    </div>
  );
}
