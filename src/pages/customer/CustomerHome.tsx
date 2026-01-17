import { useState } from 'react';
import StaffSearch from './StaffSearch';
import StoreList from '../../components/StoreList';
import './CustomerHome.css';

type View = 'staff' | 'store';

export default function CustomerHome() {
  const [activeView, setActiveView] = useState<View>('staff');

  return (
    <div className="customer-home">
      <aside className="sidebar">
        <nav className="sidebar-nav">
          <button
            className={`sidebar-item ${activeView === 'staff' ? 'active' : ''}`}
            onClick={() => setActiveView('staff')}
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
              <circle cx="9" cy="7" r="4" />
              <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
              <path d="M16 3.13a4 4 0 0 1 0 7.75" />
            </svg>
            <span>직원 찾기</span>
          </button>
          <button
            className={`sidebar-item ${activeView === 'store' ? 'active' : ''}`}
            onClick={() => setActiveView('store')}
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
              <polyline points="9,22 9,12 15,12 15,22" />
            </svg>
            <span>가게 목록</span>
          </button>
        </nav>
      </aside>

      <main className="main-content">
        <div className="content-header">
          <h1>{activeView === 'staff' ? '직원 찾기' : '가게 목록'}</h1>
          <p>
            {activeView === 'staff'
              ? '원하는 직원을 찾아 예약하세요'
              : '가게를 둘러보고 방문하세요'}
          </p>
        </div>
        <div className="content-body">
          {activeView === 'staff' ? <StaffSearch /> : <StoreList />}
        </div>
      </main>
    </div>
  );
}
