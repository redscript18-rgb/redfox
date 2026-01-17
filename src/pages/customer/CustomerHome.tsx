import { useState } from 'react';
import StaffSearch from './StaffSearch';
import StoreList from '../../components/StoreList';
import './CustomerHome.css';

type Tab = 'staff' | 'store';

export default function CustomerHome() {
  const [activeTab, setActiveTab] = useState<Tab>('staff');

  return (
    <div className="customer-home">
      <div className="tabs">
        <button
          className={`tab ${activeTab === 'staff' ? 'active' : ''}`}
          onClick={() => setActiveTab('staff')}
        >
          직원 찾기
        </button>
        <button
          className={`tab ${activeTab === 'store' ? 'active' : ''}`}
          onClick={() => setActiveTab('store')}
        >
          가게 목록
        </button>
      </div>

      <div className="tab-content">
        {activeTab === 'staff' ? <StaffSearch /> : <StoreList />}
      </div>
    </div>
  );
}
