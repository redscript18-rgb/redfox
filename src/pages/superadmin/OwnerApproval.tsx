import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../contexts/AuthContext';

interface PendingOwner {
  id: string;
  username: string;
  nickname: string;
  email: string;
  phone: string | null;
  created_at: string;
}

export default function OwnerApproval() {
  const { user } = useAuth();
  const [pendingOwners, setPendingOwners] = useState<PendingOwner[]>([]);
  const [loading, setLoading] = useState(true);
  const [processing, setProcessing] = useState<string | null>(null);

  const fetchPendingOwners = useCallback(async () => {
    const { data, error } = await supabase.rpc('get_pending_owners');
    if (error) {
      console.error('Error fetching pending owners:', error);
    } else {
      setPendingOwners(data || []);
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchPendingOwners();
  }, [fetchPendingOwners]);

  const handleApprove = async (ownerId: string) => {
    if (!user) return;
    setProcessing(ownerId);

    const { data, error } = await supabase.rpc('approve_owner', {
      p_owner_id: ownerId,
      p_approver_id: user.id
    });

    if (error) {
      console.error('Error approving owner:', error);
      alert('승인 중 오류가 발생했습니다.');
    } else if (data) {
      // 목록에서 제거
      setPendingOwners(prev => prev.filter(o => o.id !== ownerId));
    }

    setProcessing(null);
  };

  const handleReject = async (ownerId: string) => {
    if (!user) return;
    if (!confirm('정말로 이 가입 신청을 거절하시겠습니까? 계정이 삭제됩니다.')) return;

    setProcessing(ownerId);

    const { data, error } = await supabase.rpc('reject_owner', {
      p_owner_id: ownerId,
      p_approver_id: user.id
    });

    if (error) {
      console.error('Error rejecting owner:', error);
      alert('거절 중 오류가 발생했습니다.');
    } else if (data) {
      // 목록에서 제거
      setPendingOwners(prev => prev.filter(o => o.id !== ownerId));
    }

    setProcessing(null);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('ko-KR', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/superadmin" className="inline-block mb-4 text-red-600 text-sm hover:underline">
        ← 대시보드
      </Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-6">사장 가입 승인</h1>

      {pendingOwners.length === 0 ? (
        <div className="p-8 text-center text-slate-500 bg-slate-50 rounded-xl">
          <p>대기 중인 가입 신청이 없습니다.</p>
        </div>
      ) : (
        <div className="space-y-4">
          {pendingOwners.map((owner) => (
            <div
              key={owner.id}
              className="p-4 bg-white border border-slate-200 rounded-xl"
            >
              <div className="flex items-start justify-between gap-4">
                <div className="flex-1">
                  <div className="flex items-center gap-2 mb-1">
                    <span className="font-bold text-slate-900">{owner.nickname}</span>
                    <span className="text-sm text-slate-500">@{owner.username}</span>
                  </div>
                  <div className="text-sm text-slate-600 space-y-1">
                    {owner.email && !owner.email.includes('@redfox.local') && (
                      <p>이메일: {owner.email}</p>
                    )}
                    {owner.phone && <p>연락처: {owner.phone}</p>}
                    <p className="text-slate-400">신청일: {formatDate(owner.created_at)}</p>
                  </div>
                </div>

                <div className="flex gap-2">
                  <button
                    onClick={() => handleApprove(owner.id)}
                    disabled={processing === owner.id}
                    className="px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-lg hover:bg-green-700 transition-colors disabled:opacity-50"
                  >
                    {processing === owner.id ? '...' : '승인'}
                  </button>
                  <button
                    onClick={() => handleReject(owner.id)}
                    disabled={processing === owner.id}
                    className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:opacity-50"
                  >
                    {processing === owner.id ? '...' : '거절'}
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
