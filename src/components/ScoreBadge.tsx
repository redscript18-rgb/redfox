import { Link } from 'react-router-dom';
import { useUserScore } from '../hooks/useUserScore';
import { useAuth } from '../contexts/AuthContext';

export default function ScoreBadge() {
  const { user } = useAuth();
  const { totalScore, loading, canClaimDaily } = useUserScore(user?.id);

  if (loading) {
    return (
      <div className="flex items-center gap-1.5 px-3 py-1.5 bg-slate-100 rounded-full animate-pulse">
        <span className="w-4 h-4 bg-slate-200 rounded"></span>
        <span className="w-8 h-4 bg-slate-200 rounded"></span>
      </div>
    );
  }

  return (
    <Link
      to="/my-score"
      className="relative flex items-center gap-1.5 px-3 py-1.5 bg-gradient-to-r from-amber-50 to-orange-50 border border-amber-200 rounded-full hover:from-amber-100 hover:to-orange-100 transition-colors"
    >
      <span className="text-amber-500">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-4 h-4">
          <path fillRule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.006 5.404.434c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.434 2.082-5.005Z" clipRule="evenodd" />
        </svg>
      </span>
      <span className="text-sm font-semibold text-amber-700">
        {totalScore.toLocaleString()}
      </span>
      {canClaimDaily && (
        <span className="absolute -top-1 -right-1 w-2.5 h-2.5 bg-red-500 rounded-full animate-pulse"></span>
      )}
    </Link>
  );
}
