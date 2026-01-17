import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './BlockManage.css';

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

  useEffect(() => {
    if (user) {
      fetchBlockedCustomers();
    }
  }, [user]);

  const fetchBlockedCustomers = async () => {
    if (!user) return;

    // 내가 차단한 손님 목록 조회
    const { data: blocksData } = await supabase
      .from('blocks')
      .select('id, blocked_id, reason, created_at')
      .eq('blocker_id', user.id)
      .order('created_at', { ascending: false });

    if (blocksData && blocksData.length > 0) {
      const customerIds = blocksData.map(b => b.blocked_id);
      const { data: customersData } = await supabase
        .from('profiles')
        .select('id, name, email')
        .in('id', customerIds);

      const mapped = blocksData.map(block => ({
        ...block,
        customer: customersData?.find(c => c.id === block.blocked_id) || null,
      }));

      setBlockedCustomers(mapped);
    }

    setLoading(false);
  };

  const handleUnblock = async (blockId: number, customerName: string) => {
    if (!confirm(`${customerName}님의 차단을 해제하시겠습니까?`)) {
      return;
    }

    const { error } = await supabase
      .from('blocks')
      .delete()
      .eq('id', blockId);

    if (error) {
      alert('차단 해제 중 오류가 발생했습니다.');
    } else {
      setBlockedCustomers(prev => prev.filter(b => b.id !== blockId));
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getFullYear()}.${date.getMonth() + 1}.${date.getDate()}`;
  };

  if (loading) {
    return <div className="block-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="block-manage">
      <Link to="/" className="back-link">← 대시보드</Link>

      <h1>차단 관리</h1>
      <p className="page-desc">차단한 손님은 당신의 프로필과 스케줄을 볼 수 없습니다.</p>

      {blockedCustomers.length > 0 ? (
        <div className="blocked-list">
          {blockedCustomers.map((block) => (
            <div key={block.id} className="blocked-card">
              <div className="customer-info">
                <div className="customer-avatar">
                  {block.customer?.name?.charAt(0) || '?'}
                </div>
                <div className="customer-details">
                  <h3>{block.customer?.name || '알 수 없음'}</h3>
                  <p className="email">{block.customer?.email}</p>
                  <p className="blocked-date">차단일: {formatDate(block.created_at)}</p>
                  {block.reason && <p className="reason">사유: {block.reason}</p>}
                </div>
              </div>
              <button
                className="unblock-btn"
                onClick={() => handleUnblock(block.id, block.customer?.name || '손님')}
              >
                차단 해제
              </button>
            </div>
          ))}
        </div>
      ) : (
        <div className="empty-state">
          <p>차단한 손님이 없습니다.</p>
        </div>
      )}
    </div>
  );
}
