import { Link } from 'react-router-dom';
import StarRating from './StarRating';

interface ReviewCardProps {
  review: {
    id: number;
    store_id: number;
    author_id: string;
    rating: number;
    content: string;
    is_anonymous: boolean;
    view_count?: number;
    created_at: string;
    updated_at: string;
    store?: { name: string; address: string };
    author?: { name: string };
    comment_count?: number;
    like_count?: number;
  };
  currentUserId?: string;
  onDelete?: (id: number) => void;
  showStoreName?: boolean;
}

export default function ReviewCard({
  review,
  currentUserId,
  onDelete,
  showStoreName = true
}: ReviewCardProps) {
  const isAuthor = currentUserId === review.author_id;

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const minutes = Math.floor(diff / 60000);
    const hours = Math.floor(minutes / 60);
    const days = Math.floor(hours / 24);

    if (minutes < 1) return '방금 전';
    if (minutes < 60) return `${minutes}분 전`;
    if (hours < 24) return `${hours}시간 전`;
    if (days < 7) return `${days}일 전`;

    return `${date.getMonth() + 1}/${date.getDate()}`;
  };

  const handleDelete = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (confirm('이 리뷰를 삭제하시겠습니까?')) {
      onDelete?.(review.id);
    }
  };

  return (
    <Link
      to={`/staff/reviews/${review.id}`}
      className="block p-4 bg-white border border-slate-200 rounded-xl hover:border-slate-300 transition-colors"
    >
      {showStoreName && review.store && (
        <div className="mb-2">
          <span className="font-semibold text-slate-900">{review.store.name}</span>
        </div>
      )}

      <div className="flex items-center gap-3 mb-2">
        <StarRating rating={review.rating} readonly size="sm" />
        <span className="text-xs text-slate-400">{formatDate(review.created_at)}</span>
      </div>

      <p className="text-slate-700 text-sm mb-3 whitespace-pre-wrap line-clamp-1">
        {review.content}
      </p>

      <div className="flex items-center justify-between text-xs text-slate-400">
        <div className="flex items-center gap-3">
          <span>{review.is_anonymous ? '익명' : review.author?.name || '알 수 없음'}</span>
          <span>조회 {review.view_count || 0}</span>
          {review.like_count !== undefined && review.like_count > 0 && (
            <span className="text-red-500">♥ {review.like_count}</span>
          )}
          {review.comment_count !== undefined && review.comment_count > 0 && (
            <span className="text-orange-500">댓글 {review.comment_count}</span>
          )}
        </div>

        {isAuthor && (
          <div className="flex gap-2" onClick={(e) => e.stopPropagation()}>
            <Link
              to={`/staff/reviews/${review.id}/edit`}
              className="text-slate-500 hover:text-slate-700"
              onClick={(e) => e.stopPropagation()}
            >
              수정
            </Link>
            <button
              onClick={handleDelete}
              className="text-red-500 hover:text-red-700"
            >
              삭제
            </button>
          </div>
        )}
      </div>
    </Link>
  );
}
