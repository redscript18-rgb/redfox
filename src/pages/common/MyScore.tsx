import { useEffect, useState } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { useUserScore, getReasonLabel } from '../../hooks/useUserScore';

export default function MyScore() {
  const { user } = useAuth();
  const {
    totalScore,
    history,
    loading,
    historyLoading,
    canClaimDaily,
    fetchHistory,
    claimDailyReward,
    initializeScore
  } = useUserScore(user?.id);

  const [claiming, setClaiming] = useState(false);
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  useEffect(() => {
    if (user?.id) {
      initializeScore();
      fetchHistory();
    }
  }, [user?.id, initializeScore, fetchHistory]);

  const handleClaimDaily = async () => {
    setClaiming(true);
    setMessage(null);

    const result = await claimDailyReward();

    if (result.success) {
      setMessage({ type: 'success', text: '100점을 획득했습니다!' });
    } else {
      setMessage({ type: 'error', text: result.error || '오류가 발생했습니다.' });
    }

    setClaiming(false);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('ko-KR', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-[400px]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-orange-500"></div>
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto">
      <h1 className="text-2xl font-bold text-slate-900 mb-6">내 점수</h1>

      {/* 총 점수 카드 */}
      <div className="bg-gradient-to-br from-amber-400 to-orange-500 rounded-2xl p-6 mb-6 text-white shadow-lg">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-amber-100 text-sm font-medium mb-1">보유 점수</p>
            <p className="text-4xl font-bold">{totalScore.toLocaleString()}</p>
          </div>
          <div className="w-16 h-16 bg-white/20 rounded-full flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-10 h-10">
              <path fillRule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.006 5.404.434c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.434 2.082-5.005Z" clipRule="evenodd" />
            </svg>
          </div>
        </div>
      </div>

      {/* 일일 보상 */}
      <div className="bg-white border border-slate-200 rounded-xl p-5 mb-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="font-semibold text-slate-900 mb-1">일일 로그인 보상</h2>
            <p className="text-sm text-slate-500">
              {canClaimDaily ? '오늘의 보상을 받아가세요!' : '내일 다시 방문해주세요'}
            </p>
          </div>
          <button
            onClick={handleClaimDaily}
            disabled={!canClaimDaily || claiming}
            className={`px-5 py-2.5 rounded-lg font-medium transition-colors ${
              canClaimDaily && !claiming
                ? 'bg-orange-500 text-white hover:bg-orange-600'
                : 'bg-slate-100 text-slate-400 cursor-not-allowed'
            }`}
          >
            {claiming ? (
              <span className="flex items-center gap-2">
                <svg className="animate-spin h-4 w-4" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                </svg>
                처리중...
              </span>
            ) : canClaimDaily ? (
              '+100점 받기'
            ) : (
              '받기 완료'
            )}
          </button>
        </div>

        {message && (
          <div className={`mt-4 p-3 rounded-lg text-sm ${
            message.type === 'success'
              ? 'bg-green-50 text-green-700 border border-green-200'
              : 'bg-red-50 text-red-700 border border-red-200'
          }`}>
            {message.text}
          </div>
        )}
      </div>

      {/* 점수 내역 */}
      <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
        <div className="px-5 py-4 border-b border-slate-200">
          <h2 className="font-semibold text-slate-900">점수 내역</h2>
        </div>

        {historyLoading ? (
          <div className="p-8 text-center">
            <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-orange-500 mx-auto"></div>
          </div>
        ) : history.length === 0 ? (
          <div className="p-8 text-center text-slate-500">
            아직 점수 내역이 없습니다.
          </div>
        ) : (
          <ul className="divide-y divide-slate-100">
            {history.map((item) => (
              <li key={item.id} className="px-5 py-4 flex items-center justify-between">
                <div>
                  <p className="font-medium text-slate-900">{item.description || getReasonLabel(item.reason)}</p>
                  <p className="text-xs text-slate-500 mt-0.5">{formatDate(item.created_at)}</p>
                </div>
                <span className={`font-semibold ${item.amount >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                  {item.amount >= 0 ? '+' : ''}{item.amount.toLocaleString()}
                </span>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}
