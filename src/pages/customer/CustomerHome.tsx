import { useState } from 'react';
import StaffSearch from './StaffSearch';
import StoreList from '../../components/StoreList';
import './CustomerHome.css';

type View = 'staff' | 'store';

export default function CustomerHome() {
  const [activeView, setActiveView] = useState<View>('staff');

  return (
    <div className="customer-home">
      <div className="view-header">
        <div className="view-tabs">
          <button
            className={`view-tab ${activeView === 'staff' ? 'active' : ''}`}
            onClick={() => setActiveView('staff')}
          >
            직원 찾기
          </button>
          <button
            className={`view-tab ${activeView === 'store' ? 'active' : ''}`}
            onClick={() => setActiveView('store')}
          >
            가게 목록
          </button>
        </div>
      </div>

      <div className="view-content">
        {activeView === 'staff' ? <StaffSearch /> : <StoreList />}
      </div>
    </div>
  );
}
