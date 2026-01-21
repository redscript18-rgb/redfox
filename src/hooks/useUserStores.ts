import { useState, useEffect, useCallback } from 'react';
import { supabase } from '../lib/supabase';

// 사용자의 가게 ID 목록을 가져오는 훅
export function useUserStores(userId: string | undefined, role: string | undefined) {
  const [storeIds, setStoreIds] = useState<number[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchStoreIds = useCallback(async () => {
    if (!userId || !role) {
      setLoading(false);
      return;
    }
    setLoading(true);
    setError(null);

    try {
      let data: { id?: number; store_id?: number }[] | null = null;
      let fetchError = null;

      if (role === 'owner') {
        // 사장: 소유한 가게
        const result = await supabase
          .from('stores')
          .select('id')
          .eq('owner_id', userId);
        data = result.data;
        fetchError = result.error;
      } else if (role === 'staff') {
        // 실장: 관리하는 가게
        const result = await supabase
          .from('store_admins')
          .select('store_id')
          .eq('admin_id', userId);
        data = result.data;
        fetchError = result.error;
      } else if (role === 'manager') {
        // 프리 매니저: 소속된 가게
        const result = await supabase
          .from('store_staff')
          .select('store_id')
          .eq('staff_id', userId);
        data = result.data;
        fetchError = result.error;
      }

      if (fetchError) {
        console.error('가게 목록 조회 실패:', fetchError);
        setError('가게 목록을 불러오는데 실패했습니다.');
        setStoreIds([]);
      } else {
        setStoreIds(data?.map(s => s.id ?? s.store_id).filter((id): id is number => id !== undefined) || []);
      }
    } catch (err) {
      console.error('가게 목록 조회 예외:', err);
      setError('가게 목록을 불러오는 중 오류가 발생했습니다.');
      setStoreIds([]);
    }
    setLoading(false);
  }, [userId, role]);

  useEffect(() => {
    fetchStoreIds();
  }, [fetchStoreIds]);

  return { storeIds, loading, error, refetch: fetchStoreIds };
}
