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

// 사장용 페이지
import OwnerDashboard from './pages/owner/OwnerDashboard';
import StoreStats from './pages/owner/StoreStats';
import StoreManage from './pages/owner/StoreManage';

// 공통 페이지
import InviteAccept from './pages/common/InviteAccept';

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
