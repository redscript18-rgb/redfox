import { useState } from 'react';
import { Link } from 'react-router-dom';
import { usePoints } from '../contexts/PointsContext';

export default function DailyCheckin() {
  const { points, loading, doCheckin } = usePoints();
  const [checking, setChecking] = useState(false);
  const [result, setResult] = useState<{ success: boolean; message: string } | null>(null);

  const handleCheckin = async () => {
    if (checking || !points?.canCheckinToday) return;

    setChecking(true);
    const res = await doCheckin();
    setResult({ success: res.success, message: res.message });
    setChecking(false);

    // 3초 후 결과 메시지 숨기기
    if (res.success) {
      setTimeout(() => setResult(null), 3000);
    }
  };

  if (loading) {
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
              {points?.canCheckinToday ? (
                '오늘의 포인트를 받아가세요!'
              ) : (
                <span className="text-green-600">✓ 오늘 출석 완료!</span>
              )}
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

          {points?.canCheckinToday ? (
            <button
              onClick={handleCheckin}
              disabled={checking}
              className="px-4 py-2 bg-gradient-to-r from-amber-500 to-orange-500 text-white font-semibold rounded-lg hover:from-amber-600 hover:to-orange-600 transition-all disabled:opacity-50 shadow-md hover:shadow-lg"
            >
              {checking ? '...' : '출석'}
            </button>
          ) : (
            <span className="px-4 py-2 bg-slate-200 text-slate-500 font-medium rounded-lg text-sm">
              완료
            </span>
          )}
        </div>
      </div>

      {/* 결과 메시지 */}
      {result && (
        <div className={`mt-3 p-3 rounded-lg text-sm font-medium text-center ${
          result.success
            ? 'bg-green-100 text-green-700'
            : 'bg-red-100 text-red-700'
        }`}>
          {result.message}
        </div>
      )}
    </div>
  );
}
