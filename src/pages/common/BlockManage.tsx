import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface BlockedCustomer {
  id: number;
  blocked_id: string;
  reason: string | null;
  created_at: string;
  customer: {
    name: string;
    email: string;
  } | null;
}

export default function BlockManage() {
  const { user } = useAuth();
  const [blockedCustomers, setBlockedCustomers] = useState<BlockedCustomer[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => { if (user) fetchBlockedCustomers(); }, [user]);

  const fetchBlockedCustomers = async () => {
    if (!user) return;

    const { data: blocksData } = await supabase.from('blocks').select('id, blocked_id, reason, created_at').eq('blocker_id', user.id).order('created_at', { ascending: false });

    if (blocksData && blocksData.length > 0) {
      const customerIds = blocksData.map(b => b.blocked_id);
      const { data: customersData } = await supabase.from('profiles').select('id, name, email').in('id', customerIds);

      const mapped = blocksData.map(block => ({
        ...block,
        customer: customersData?.find(c => c.id === block.blocked_id) || null,
      }));

      setBlockedCustomers(mapped);
    }

    setLoading(false);
  };

  const handleUnblock = async (blockId: number, customerName: string) => {
    if (!confirm(`${customerName}님의 차단을 해제하시겠습니까?`)) return;

    const { error } = await supabase.from('blocks').delete().eq('id', blockId);
    if (error) alert('차단 해제 중 오류가 발생했습니다.');
    else setBlockedCustomers(prev => prev.filter(b => b.id !== blockId));
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getFullYear()}.${date.getMonth() + 1}.${date.getDate()}`;
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-1">차단 관리</h1>
      <p className="text-sm text-slate-500 mb-6">차단한 손님은 당신의 프로필과 스케줄을 볼 수 없습니다.</p>

      {blockedCustomers.length > 0 ? (
        <div className="flex flex-col gap-3">
          {blockedCustomers.map((block) => (
            <div key={block.id} className="flex items-center justify-between p-4 bg-white border border-slate-200 rounded-xl">
              <div className="flex items-center gap-4">
                <div className="w-12 h-12 rounded-full bg-slate-200 flex items-center justify-center text-slate-600 font-semibold">
                  {block.customer?.name?.charAt(0) || '?'}
                </div>
                <div>
                  <h3 className="font-semibold text-slate-900">{block.customer?.name || '알 수 없음'}</h3>
                  <p className="text-sm text-slate-500">{block.customer?.email}</p>
                  <p className="text-xs text-slate-400">차단일: {formatDate(block.created_at)}</p>
                  {block.reason && <p className="text-xs text-red-500 mt-1">사유: {block.reason}</p>}
                </div>
              </div>
              <button className="px-4 py-2 bg-red-50 text-red-600 text-sm font-medium rounded-lg hover:bg-red-100 transition-colors" onClick={() => handleUnblock(block.id, block.customer?.name || '손님')}>
                차단 해제
              </button>
            </div>
          ))}
        </div>
      ) : (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">차단한 손님이 없습니다.</p>
        </div>
      )}
    </div>
  );
}
