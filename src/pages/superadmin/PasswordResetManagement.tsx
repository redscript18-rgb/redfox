import { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../contexts/AuthContext';

interface ResetRequest {
  id: number;
  username: string;
  reason: string | null;
  status: 'pending' | 'approved' | 'rejected';
  temp_password: string | null;
  created_at: string;
  processed_at: string | null;
}

export default function PasswordResetManagement() {
  const { user } = useAuth();
  const [requests, setRequests] = useState<ResetRequest[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'all' | 'pending' | 'approved' | 'rejected'>('pending');
  const [processing, setProcessing] = useState<number | null>(null);
  const [showTempPasswordModal, setShowTempPasswordModal] = useState<ResetRequest | null>(null);
  const [tempPassword, setTempPassword] = useState('');

  const fetchRequests = useCallback(async () => {
    let query = supabase
      .from('password_reset_requests')
      .select('*')
      .order('created_at', { ascending: false });

    if (filter !== 'all') {
      query = query.eq('status', filter);
    }

    const { data, error } = await query;

    if (error) {
      console.error('Error fetching reset requests:', error);
    } else {
      setRequests(data || []);
    }
    setLoading(false);
  }, [filter]);

  useEffect(() => {
    fetchRequests();
  }, [fetchRequests]);

  const generateTempPassword = () => {
    const chars = 'abcdefghijkmnpqrstuvwxyz23456789';
    let password = '';
    for (let i = 0; i < 8; i++) {
      password += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return password;
  };

  const handleApprove = async (request: ResetRequest) => {
    // 임시 비밀번호 입력 모달 표시
    const generated = generateTempPassword();
    setTempPassword(generated);
    setShowTempPasswordModal(request);
  };

  const confirmApprove = async () => {
    if (!showTempPasswordModal || !user || !tempPassword.trim()) return;

    setProcessing(showTempPasswordModal.id);

    // 요청 승인 및 임시 비밀번호 저장
    const { error } = await supabase
      .from('password_reset_requests')
      .update({
        status: 'approved',
        temp_password: tempPassword,
        processed_by: user.id,
        processed_at: new Date().toISOString()
      })
      .eq('id', showTempPasswordModal.id);

    if (error) {
      console.error('Error approving request:', error);
      alert('승인 중 오류가 발생했습니다.');
    } else {
      // 목록 새로고침
      fetchRequests();
      setShowTempPasswordModal(null);
      setTempPassword('');
      alert(`승인 완료!\n\n아이디: ${showTempPasswordModal.username}\n임시 비밀번호: ${tempPassword}\n\n이 정보를 사용자에게 전달해주세요.`);
    }

    setProcessing(null);
  };

  const handleReject = async (requestId: number) => {
    if (!user) return;
    if (!confirm('이 요청을 거절하시겠습니까?')) return;

    setProcessing(requestId);

    const { error } = await supabase
      .from('password_reset_requests')
      .update({
        status: 'rejected',
        processed_by: user.id,
        processed_at: new Date().toISOString()
      })
      .eq('id', requestId);

    if (error) {
      console.error('Error rejecting request:', error);
      alert('거절 중 오류가 발생했습니다.');
    } else {
      fetchRequests();
    }

    setProcessing(null);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('ko-KR', {
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'pending':
        return <span className="px-2 py-1 bg-amber-100 text-amber-700 text-xs rounded">대기</span>;
      case 'approved':
        return <span className="px-2 py-1 bg-green-100 text-green-700 text-xs rounded">승인</span>;
      case 'rejected':
        return <span className="px-2 py-1 bg-red-100 text-red-700 text-xs rounded">거절</span>;
      default:
        return null;
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/superadmin" className="inline-block mb-4 text-red-600 text-sm hover:underline">
        ← 대시보드
      </Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-6">비밀번호 초기화 요청</h1>

      {/* 필터 */}
      <div className="flex gap-2 mb-6">
        {(['pending', 'approved', 'rejected', 'all'] as const).map((f) => (
          <button
            key={f}
            onClick={() => setFilter(f)}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
              filter === f
                ? 'bg-red-600 text-white'
                : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
            }`}
          >
            {f === 'all' ? '전체' : f === 'pending' ? '대기' : f === 'approved' ? '승인' : '거절'}
          </button>
        ))}
      </div>

      {requests.length === 0 ? (
        <div className="p-8 text-center text-slate-500 bg-slate-50 rounded-xl">
          <p>{filter === 'pending' ? '대기 중인 요청이 없습니다.' : '요청이 없습니다.'}</p>
        </div>
      ) : (
        <div className="space-y-3">
          {requests.map((request) => (
            <div
              key={request.id}
              className="p-4 bg-white border border-slate-200 rounded-xl"
            >
              <div className="flex items-start justify-between gap-4">
                <div className="flex-1">
                  <div className="flex items-center gap-2 mb-1">
                    <span className="font-bold text-slate-900">@{request.username}</span>
                    {getStatusBadge(request.status)}
                  </div>
                  {request.reason && (
                    <p className="text-sm text-slate-600 mb-2">{request.reason}</p>
                  )}
                  <p className="text-xs text-slate-400">요청일: {formatDate(request.created_at)}</p>
                  {request.processed_at && (
                    <p className="text-xs text-slate-400">처리일: {formatDate(request.processed_at)}</p>
                  )}
                  {request.status === 'approved' && request.temp_password && (
                    <p className="text-sm text-green-600 mt-2">
                      임시 비밀번호: <span className="font-mono font-bold">{request.temp_password}</span>
                    </p>
                  )}
                </div>

                {request.status === 'pending' && (
                  <div className="flex gap-2">
                    <button
                      onClick={() => handleApprove(request)}
                      disabled={processing === request.id}
                      className="px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-lg hover:bg-green-700 transition-colors disabled:opacity-50"
                    >
                      승인
                    </button>
                    <button
                      onClick={() => handleReject(request.id)}
                      disabled={processing === request.id}
                      className="px-4 py-2 bg-slate-200 text-slate-700 text-sm font-medium rounded-lg hover:bg-slate-300 transition-colors disabled:opacity-50"
                    >
                      거절
                    </button>
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>
      )}

      {/* 안내 */}
      <div className="mt-8 p-4 bg-blue-50 border border-blue-200 rounded-xl">
        <h3 className="font-semibold text-blue-800 mb-2">비밀번호 초기화 방법</h3>
        <ol className="text-sm text-blue-700 space-y-1 list-decimal list-inside">
          <li>요청을 승인하면 임시 비밀번호가 생성됩니다.</li>
          <li>임시 비밀번호를 사용자에게 채팅 등으로 전달합니다.</li>
          <li>Supabase 대시보드에서 해당 사용자의 비밀번호를 임시 비밀번호로 변경합니다.</li>
          <li>사용자는 임시 비밀번호로 로그인 후 비밀번호를 변경합니다.</li>
        </ol>
      </div>

      {/* 임시 비밀번호 입력 모달 */}
      {showTempPasswordModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-sm p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">비밀번호 초기화 승인</h2>

            <p className="text-sm text-slate-600 mb-4">
              <span className="font-bold">@{showTempPasswordModal.username}</span> 사용자의 임시 비밀번호를 설정합니다.
            </p>

            <div className="mb-4">
              <label className="block mb-2 text-sm font-medium text-slate-600">
                임시 비밀번호
              </label>
              <div className="flex gap-2">
                <input
                  type="text"
                  value={tempPassword}
                  onChange={(e) => setTempPassword(e.target.value)}
                  className="flex-1 px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 font-mono focus:outline-none focus:border-red-600"
                />
                <button
                  onClick={() => setTempPassword(generateTempPassword())}
                  className="px-3 py-2 bg-slate-200 text-slate-700 rounded-lg hover:bg-slate-300 transition-colors text-sm"
                >
                  생성
                </button>
              </div>
            </div>

            <div className="flex gap-2">
              <button
                onClick={() => {
                  setShowTempPasswordModal(null);
                  setTempPassword('');
                }}
                className="flex-1 px-4 py-3 border border-slate-300 rounded-lg text-slate-600 font-medium hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={confirmApprove}
                disabled={processing !== null || !tempPassword.trim()}
                className="flex-1 px-4 py-3 bg-green-600 text-white rounded-lg font-medium hover:bg-green-700 transition-colors disabled:bg-slate-400"
              >
                승인
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
