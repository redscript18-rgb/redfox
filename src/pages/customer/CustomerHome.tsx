import { useState, useEffect } from 'react';
import StaffSearch from './StaffSearch';
import StoreList from '../../components/StoreList';
import TodayFeed from '../../components/TodayFeed';
import { supabase } from '../../lib/supabase';

type View = 'staff' | 'store';

export default function CustomerHome() {
  const [activeView, setActiveView] = useState<View>('store');
  const [storeCount, setStoreCount] = useState<number>(0);
  const [managerCount, setManagerCount] = useState<number>(0);

  useEffect(() => {
    fetchCounts();
  }, []);

  const fetchCounts = async () => {
    const [storesResult, managersResult] = await Promise.all([
      supabase.from('stores').select('*', { count: 'exact', head: true }).eq('is_visible', true),
      supabase.from('virtual_staff').select('*', { count: 'exact', head: true }).eq('is_visible', true)
    ]);
    setStoreCount(storesResult.count || 0);
    setManagerCount(managersResult.count || 0);
  };

  return (
    <div>
      {/* 오늘의 피드 */}
      <div className="mb-8">
        <TodayFeed />
      </div>

      {/* 구분선 */}
      <div className="border-t border-slate-200 pt-6 mb-6">
        <h2 className="text-lg font-bold text-slate-900 mb-4">전체 둘러보기</h2>
      </div>

      {/* View Tabs */}
      <div className="flex gap-2 mb-6">
        <button
          className={`px-6 py-2.5 rounded-lg text-sm font-semibold transition-colors ${
            activeView === 'store'
              ? 'bg-red-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setActiveView('store')}
        >
          가게 {storeCount > 0 && <span className="ml-1">({storeCount})</span>}
        </button>
        <button
          className={`px-6 py-2.5 rounded-lg text-sm font-semibold transition-colors ${
            activeView === 'staff'
              ? 'bg-red-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
          onClick={() => setActiveView('staff')}
        >
          매니저 {managerCount > 0 && <span className="ml-1">({managerCount})</span>}
        </button>
      </div>

      {/* Content */}
      <div>
        {activeView === 'store' ? <StoreList /> : <StaffSearch />}
      </div>
    </div>
  );
}
