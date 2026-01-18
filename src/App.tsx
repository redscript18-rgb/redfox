import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from './contexts/AuthContext';
import Login from './components/Login';
import Layout from './components/Layout';

// 공통
import StoreList from './components/StoreList';
import StoreDetail from './components/StoreDetail';

// 손님용 페이지
import CustomerHome from './pages/customer/CustomerHome';
import StaffDetailPage from './pages/customer/StaffDetail';
import CustomerReservations from './pages/customer/CustomerReservations';
import Favorites from './pages/customer/Favorites';

// 직원용 페이지
import StaffDashboard from './pages/staff/StaffDashboard';
import ScheduleManage from './pages/staff/ScheduleManage';
import MyReservations from './pages/staff/MyReservations';
import StoreSearch from './pages/staff/StoreSearch';
import AvailabilityManage from './pages/staff/AvailabilityManage';
import WorkRequests from './pages/staff/WorkRequests';
import ProfileManage from './pages/staff/ProfileManage';

// 관리자용 페이지
import AdminDashboard from './pages/admin/AdminDashboard';
import StaffManage from './pages/admin/StaffManage';
import ScheduleApproval from './pages/admin/ScheduleApproval';
import ReservationManage from './pages/admin/ReservationManage';
import FindAvailableStaff from './pages/admin/FindAvailableStaff';
import WorkRequestsSent from './pages/admin/WorkRequestsSent';
import StoreSettings from './pages/admin/StoreSettings';
import VirtualStaffDetail from './pages/VirtualStaffDetail';

// 사장용 페이지
import OwnerDashboard from './pages/owner/OwnerDashboard';
import StoreStats from './pages/owner/StoreStats';
import StoreManage from './pages/owner/StoreManage';

// 공통 페이지
import InviteAccept from './pages/common/InviteAccept';
import BlockManage from './pages/common/BlockManage';
import AccountSettings from './pages/common/AccountSettings';

// 채팅 페이지
import ChatList from './pages/chat/ChatList';
import ChatRoom from './pages/chat/ChatRoom';

// 서비스 관리자 페이지
import SuperAdminDashboard from './pages/superadmin/SuperAdminDashboard';
import UserManagement from './pages/superadmin/UserManagement';
import SuperAdminStoreManagement from './pages/superadmin/StoreManagement';
import ReservationOverview from './pages/superadmin/ReservationOverview';
import VirtualStaffManagement from './pages/superadmin/VirtualStaffManagement';

import './App.css';

function ProtectedRoute({ children }: { children: React.ReactNode }) {
  const { isAuthenticated, loading } = useAuth();

  if (loading) {
    return <div className="loading">로딩 중...</div>;
  }

  return isAuthenticated ? <>{children}</> : <Navigate to="/login" />;
}

// 역할별 홈 라우트
function RoleBasedHome() {
  const { user } = useAuth();

  switch (user?.role) {
    case 'superadmin':
      return <SuperAdminDashboard />;
    case 'customer':
      return <CustomerHome />;
    case 'staff':
      return <StaffDashboard />;
    case 'admin':
      return <AdminDashboard />;
    case 'owner':
      return <OwnerDashboard />;
    default:
      return <StoreList />;
  }
}

function AppRoutes() {
  const { isAuthenticated } = useAuth();

  return (
    <Routes>
      <Route
        path="/login"
        element={isAuthenticated ? <Navigate to="/" /> : <Login />}
      />

      {/* 초대 링크 수락 페이지 */}
      <Route path="/invite/:code" element={<InviteAccept />} />

      {/* 홈 - 역할별 다른 화면 */}
      <Route
        path="/"
        element={
          <ProtectedRoute>
            <Layout>
              <RoleBasedHome />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 손님용: 직원 상세 */}
      <Route
        path="/staff/:id"
        element={
          <ProtectedRoute>
            <Layout>
              <StaffDetailPage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 손님용: 내 예약 */}
      <Route
        path="/customer/reservations"
        element={
          <ProtectedRoute>
            <Layout>
              <CustomerReservations />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 손님용: 즐겨찾기 */}
      <Route
        path="/customer/favorites"
        element={
          <ProtectedRoute>
            <Layout>
              <Favorites />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 즐겨찾기 (모든 역할) */}
      <Route
        path="/favorites"
        element={
          <ProtectedRoute>
            <Layout>
              <Favorites />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 직원용: 스케줄 관리 */}
      <Route
        path="/staff/schedule"
        element={
          <ProtectedRoute>
            <Layout>
              <ScheduleManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 직원용: 내 예약 */}
      <Route
        path="/staff/reservations"
        element={
          <ProtectedRoute>
            <Layout>
              <MyReservations />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 직원용: 가게 탐색 */}
      <Route
        path="/staff/stores"
        element={
          <ProtectedRoute>
            <Layout>
              <StoreSearch />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 직원용: 가용 시간 관리 */}
      <Route
        path="/staff/availability"
        element={
          <ProtectedRoute>
            <Layout>
              <AvailabilityManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 직원용: 출근 요청 */}
      <Route
        path="/staff/work-requests"
        element={
          <ProtectedRoute>
            <Layout>
              <WorkRequests />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 직원용: 프로필 관리 */}
      <Route
        path="/staff/profile"
        element={
          <ProtectedRoute>
            <Layout>
              <ProfileManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 직원 관리 */}
      <Route
        path="/admin/staff"
        element={
          <ProtectedRoute>
            <Layout>
              <StaffManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 출근 관리 */}
      <Route
        path="/admin/schedules"
        element={
          <ProtectedRoute>
            <Layout>
              <ScheduleApproval />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 예약 관리 */}
      <Route
        path="/admin/reservations"
        element={
          <ProtectedRoute>
            <Layout>
              <ReservationManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 가용 직원 찾기 */}
      <Route
        path="/admin/find-staff"
        element={
          <ProtectedRoute>
            <Layout>
              <FindAvailableStaff />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 보낸 출근 요청 */}
      <Route
        path="/admin/work-requests"
        element={
          <ProtectedRoute>
            <Layout>
              <WorkRequestsSent />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 가게 설정 */}
      <Route
        path="/admin/store/:id/settings"
        element={
          <ProtectedRoute>
            <Layout>
              <StoreSettings />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 관리자용: 가상 매니저 상세 */}
      <Route
        path="/virtual-staff/:id"
        element={
          <ProtectedRoute>
            <Layout>
              <VirtualStaffDetail />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 사장용: 가게 관리 */}
      <Route
        path="/owner/stores"
        element={
          <ProtectedRoute>
            <Layout>
              <StoreManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 사장용: 가게 상세 통계 */}
      <Route
        path="/owner/store/:id"
        element={
          <ProtectedRoute>
            <Layout>
              <StoreStats />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 차단 관리 (직원/관리자용) */}
      <Route
        path="/blocks"
        element={
          <ProtectedRoute>
            <Layout>
              <BlockManage />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 계정 설정 */}
      <Route
        path="/settings"
        element={
          <ProtectedRoute>
            <Layout>
              <AccountSettings />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 채팅 목록 */}
      <Route
        path="/chat"
        element={
          <ProtectedRoute>
            <Layout>
              <ChatList />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 채팅방 */}
      <Route
        path="/chat/:id"
        element={
          <ProtectedRoute>
            <Layout>
              <ChatRoom />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 서비스 관리자: 대시보드 */}
      <Route
        path="/superadmin"
        element={
          <ProtectedRoute>
            <Layout>
              <SuperAdminDashboard />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 서비스 관리자: 사용자 관리 */}
      <Route
        path="/superadmin/users"
        element={
          <ProtectedRoute>
            <Layout>
              <UserManagement />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 서비스 관리자: 가게 관리 */}
      <Route
        path="/superadmin/stores"
        element={
          <ProtectedRoute>
            <Layout>
              <SuperAdminStoreManagement />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 서비스 관리자: 예약 현황 */}
      <Route
        path="/superadmin/reservations"
        element={
          <ProtectedRoute>
            <Layout>
              <ReservationOverview />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 서비스 관리자: 등록 매니저 관리 */}
      <Route
        path="/superadmin/virtual-staff"
        element={
          <ProtectedRoute>
            <Layout>
              <VirtualStaffManagement />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 가게 목록 */}
      <Route
        path="/stores"
        element={
          <ProtectedRoute>
            <Layout>
              <StoreList />
            </Layout>
          </ProtectedRoute>
        }
      />

      {/* 공통: 가게 상세 */}
      <Route
        path="/store/:id"
        element={
          <ProtectedRoute>
            <Layout>
              <StoreDetail />
            </Layout>
          </ProtectedRoute>
        }
      />
    </Routes>
  );
}

function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <AppRoutes />
      </AuthProvider>
    </BrowserRouter>
  );
}

export default App;
