import { useState } from 'react';
import StaffSearch from './StaffSearch';
import StoreList from '../../components/StoreList';

type View = 'staff' | 'store';

export default function CustomerHome() {
  const [activeView, setActiveView] = useState<View>('staff');

  return (
    <div>
      {/* View Tabs */}
      <div className="flex gap-2 mb-6">
        <button
          className={`px-6 py-2.5 rounded-lg text-sm font-semibold transition-colors ${
            activeView === 'staff'
              ? 'bg-blue-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setActiveView('staff')}
        >
          직원 찾기
        </button>
        <button
          className={`px-6 py-2.5 rounded-lg text-sm font-semibold transition-colors ${
            activeView === 'store'
              ? 'bg-blue-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setActiveView('store')}
        >
          가게 목록
        </button>
      </div>

      {/* Content */}
      <div>
        {activeView === 'staff' ? <StaffSearch /> : <StoreList />}
      </div>
    </div>
  );
}
