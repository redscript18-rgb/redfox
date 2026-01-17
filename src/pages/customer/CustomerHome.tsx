import { useState } from 'react';
import StaffSearch from './StaffSearch';
import StoreList from '../../components/StoreList';
import './CustomerHome.css';

type Tab = 'staff' | 'store';

export default function CustomerHome() {
  const [activeTab, setActiveTab] = useState<Tab>('staff');

  return (
    <div className="customer-home">
      <h1 className="page-title">
        {activeTab === 'staff' ? '직원 찾기' : '가게 목록'}
      </h1>
      <p className="page-subtitle">
        {activeTab === 'staff'
          ? '원하는 직원을 찾아 예약하세요'
          : '가게를 둘러보고 방문하세요'}
      </p>

      <div className="tabs">
        <button
          className={`tab ${activeTab === 'staff' ? 'active' : ''}`}
          onClick={() => setActiveTab('staff')}
        >
          직원
        </button>
        <button
          className={`tab ${activeTab === 'store' ? 'active' : ''}`}
          onClick={() => setActiveTab('store')}
        >
          가게
        </button>
      </div>

      <div className="tab-content">
        {activeTab === 'staff' ? <StaffSearch /> : <StoreList />}
      </div>
    </div>
  );
}
