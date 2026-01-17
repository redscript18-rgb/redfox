import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './Layout.css';

interface LayoutProps {
  children: React.ReactNode;
}

export default function Layout({ children }: LayoutProps) {
  const { user, logout } = useAuth();

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
