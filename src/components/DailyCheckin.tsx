import { useState } from 'react';
import { Link } from 'react-router-dom';
import { usePoints } from '../contexts/PointsContext';

export default function DailyCheckin() {
  const { points, loading, doCheckin } = usePoints();
  const [checking, setChecking] = useState(false);
  const [showSuccess, setShowSuccess] = useState(false);
  const [earnedPoints, setEarnedPoints] = useState(0);

  const handleCheckin = async () => {
    if (checking || !points?.canCheckinToday) return;

    setChecking(true);
    const res = await doCheckin();
    setChecking(false);

    if (res.success) {
      setEarnedPoints(res.pointsEarned);
      setShowSuccess(true);
      // 2초 후 성공 메시지 숨기기
      setTimeout(() => setShowSuccess(false), 2000);
    }
  };

  // 성공 메시지 표시 중
  if (showSuccess) {
    return (
      <div className="p-4 bg-gradient-to-r from-green-50 to-emerald-50 border border-green-200 rounded-xl">
        <div className="flex items-center justify-center gap-3">
          <div className="w-12 h-12 bg-gradient-to-br from-green-400 to-emerald-500 rounded-full flex items-center justify-center text-2xl shadow-lg">
            ✓
          </div>
          <div className="text-center">
            <p className="font-bold text-green-700">출석체크 완료!</p>
            <p className="text-sm text-green-600">+{earnedPoints}P 적립되었습니다</p>
          </div>
        </div>
      </div>
    );
  }

  // 로딩 중이거나 이미 출석 완료했으면 숨김
  if (loading || !points?.canCheckinToday) {
    return null;
  }

  return (
    <div className="p-4 bg-gradient-to-r from-amber-50 to-orange-50 border border-amber-200 rounded-xl">
      <div className="flex items-center justify-between gap-4">
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 bg-gradient-to-br from-amber-400 to-orange-500 rounded-full flex items-center justify-center text-2xl shadow-lg">
            🎁
          </div>
          <div>
            <div className="flex items-center gap-2">
              <span className="font-bold text-slate-900">출석체크</span>
              {points && points.streakDays > 0 && (
                <span className="px-2 py-0.5 bg-orange-100 text-orange-600 text-xs font-semibold rounded-full">
                  🔥 {points.streakDays}일 연속
                </span>
              )}
            </div>
            <p className="text-sm text-slate-600">
              오늘의 포인트를 받아가세요!
            </p>
          </div>
        </div>

        <div className="flex items-center gap-3">
          <Link
            to="/points"
            className="text-sm font-bold text-amber-600 hover:text-amber-700"
          >
            {points?.balance?.toLocaleString() || 0}P
          </Link>

          <button
            onClick={handleCheckin}
            disabled={checking}
            className="px-4 py-2 bg-gradient-to-r from-amber-500 to-orange-500 text-white font-semibold rounded-lg hover:from-amber-600 hover:to-orange-600 transition-all disabled:opacity-50 shadow-md hover:shadow-lg"
          >
            {checking ? '...' : '출석'}
          </button>
        </div>
      </div>
    </div>
  );
}
