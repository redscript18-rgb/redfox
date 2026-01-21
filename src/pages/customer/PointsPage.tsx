import { useEffect } from 'react';
import { Link } from 'react-router-dom';
import { usePoints } from '../../contexts/PointsContext';

export default function PointsPage() {
  const { points, history, loading, fetchHistory } = usePoints();

  useEffect(() => {
    fetchHistory(50);
  }, [fetchHistory]);

  const getTypeLabel = (type: string) => {
    switch (type) {
      case 'checkin': return '출석체크';
      case 'streak_bonus': return '연속 출석 보너스';
      case 'review': return '리뷰 작성';
      case 'referral': return '추천인 보너스';
      case 'gift_sent': return '선물 보내기';
      case 'gift_received': return '선물 받기';
      case 'redemption': return '포인트 사용';
      case 'admin': return '관리자 지급';
      default: return type;
    }
  };

  const getTypeColor = (type: string, amount: number) => {
    if (amount < 0) return 'text-red-600';
    switch (type) {
      case 'checkin': return 'text-green-600';
      case 'streak_bonus': return 'text-orange-600';
      case 'review': return 'text-blue-600';
      case 'gift_received': return 'text-pink-600';
      default: return 'text-slate-600';
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const days = Math.floor(diff / (1000 * 60 * 60 * 24));

    if (days === 0) {
      return `오늘 ${date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' })}`;
    } else if (days === 1) {
      return '어제';
    } else if (days < 7) {
      return `${days}일 전`;
    } else {
      return date.toLocaleDateString('ko-KR', { month: 'short', day: 'numeric' });
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 홈</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-6">내 포인트</h1>

      {/* 포인트 요약 */}
      <div className="p-6 bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl text-white mb-6">
        <p className="text-amber-100 text-sm mb-1">보유 포인트</p>
        <p className="text-4xl font-bold mb-4">{points?.balance?.toLocaleString() || 0}P</p>
        <div className="flex gap-6 text-sm">
          <div>
            <p className="text-amber-200">총 적립</p>
            <p className="font-semibold">{points?.totalEarned?.toLocaleString() || 0}P</p>
          </div>
          <div>
            <p className="text-amber-200">총 사용</p>
            <p className="font-semibold">{points?.totalSpent?.toLocaleString() || 0}P</p>
          </div>
          <div>
            <p className="text-amber-200">연속 출석</p>
            <p className="font-semibold">{points?.streakDays || 0}일</p>
          </div>
        </div>
      </div>

      {/* 포인트 적립 안내 */}
      <div className="p-4 bg-slate-50 rounded-xl mb-6">
        <h2 className="font-semibold text-slate-900 mb-3">포인트 적립 방법</h2>
        <div className="space-y-2 text-sm">
          <div className="flex items-center justify-between">
            <span className="text-slate-600">📅 매일 출석체크</span>
            <span className="font-medium text-green-600">+100P</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-slate-600">🔥 3일 연속 출석 보너스</span>
            <span className="font-medium text-orange-600">+200P</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-slate-600">🎉 7일 연속 출석 보너스</span>
            <span className="font-medium text-orange-600">+500P</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-slate-600">⭐ 리뷰 작성</span>
            <span className="font-medium text-blue-600">+30P</span>
          </div>
        </div>
      </div>

      {/* 포인트 내역 */}
      <div>
        <h2 className="font-semibold text-slate-900 mb-3">포인트 내역</h2>
        {history.length === 0 ? (
          <div className="p-8 text-center text-slate-500 bg-slate-50 rounded-xl">
            <p>포인트 내역이 없습니다.</p>
            <p className="text-sm mt-1">출석체크로 포인트를 적립해보세요!</p>
          </div>
        ) : (
          <div className="space-y-2">
            {history.map((item) => (
              <div
                key={item.id}
                className="flex items-center justify-between p-3 bg-white border border-slate-200 rounded-lg"
              >
                <div>
                  <p className="font-medium text-slate-900">{getTypeLabel(item.type)}</p>
                  {item.description && (
                    <p className="text-sm text-slate-500">{item.description}</p>
                  )}
                  <p className="text-xs text-slate-400 mt-1">{formatDate(item.createdAt)}</p>
                </div>
                <span className={`font-bold ${getTypeColor(item.type, item.amount)}`}>
                  {item.amount > 0 ? '+' : ''}{item.amount.toLocaleString()}P
                </span>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
