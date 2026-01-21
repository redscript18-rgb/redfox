import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';

// 사용자의 가게 ID 목록을 가져오는 훅
export function useUserStores(userId: string | undefined, role: string | undefined) {
  const [storeIds, setStoreIds] = useState<number[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (userId && role) {
      fetchStoreIds();
    }
  }, [userId, role]);

  const fetchStoreIds = async () => {
    if (!userId || !role) return;
    setLoading(true);

    try {
      if (role === 'owner') {
        // 사장: 소유한 가게
        const { data } = await supabase
          .from('stores')
          .select('id')
          .eq('owner_id', userId);
        setStoreIds(data?.map(s => s.id) || []);
      } else if (role === 'staff') {
        // 실장: 관리하는 가게
        const { data } = await supabase
          .from('store_admins')
          .select('store_id')
          .eq('admin_id', userId);
        setStoreIds(data?.map(s => s.store_id) || []);
      } else if (role === 'manager') {
        // 프리 매니저: 소속된 가게
        const { data } = await supabase
          .from('store_staff')
          .select('store_id')
          .eq('staff_id', userId);
        setStoreIds(data?.map(s => s.store_id) || []);
      }
    } catch (error) {
      console.error('가게 목록 조회 실패:', error);
    }
    setLoading(false);
  };

  return { storeIds, loading, refetch: fetchStoreIds };
}
