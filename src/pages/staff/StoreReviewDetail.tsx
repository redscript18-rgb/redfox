import { useState, useEffect } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import StarRating from '../../components/reviews/StarRating';
import CommentSection from '../../components/reviews/CommentSection';

interface Review {
  id: number;
  store_id: number;
  author_id: string;
  rating: number;
  content: string;
  is_anonymous: boolean;
  is_verified?: boolean;
  view_count: number;
  created_at: string;
  updated_at: string;
  store?: { name: string; address: string };
  author?: { name: string };
}

export default function StoreReviewDetail() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const [review, setReview] = useState<Review | null>(null);
  const [loading, setLoading] = useState(true);
  const [likeCount, setLikeCount] = useState(0);
  const [isLiked, setIsLiked] = useState(false);

  useEffect(() => {
    if (id) {
      fetchReview();
      fetchLikeStatus();
      incrementViewCount();
    }
  }, [id]);

  const incrementViewCount = async () => {
    if (!id) return;
    await supabase.rpc('increment_review_view_count', { p_review_id: parseInt(id) });
  };

  const fetchReview = async () => {
    if (!id) return;

    const { data, error } = await supabase
      .from('store_reviews')
      .select(`
        *,
        store:stores(name, address),
        author:profiles!store_reviews_author_id_fkey(name)
      `)
      .eq('id', parseInt(id))
      .single();

    if (error || !data) {
      alert('리뷰를 찾을 수 없습니다.');
      navigate('/staff/reviews');
      return;
    }

    setReview(data);
    setLoading(false);
  };

  const fetchLikeStatus = async () => {
    if (!id || !user) return;

    // Get like count
    const { count } = await supabase
      .from('store_review_likes')
      .select('*', { count: 'exact', head: true })
      .eq('review_id', parseInt(id));
    setLikeCount(count || 0);

    // Check if user liked
    const { data } = await supabase
      .from('store_review_likes')
      .select('id')
      .eq('review_id', parseInt(id))
      .eq('user_id', user.id)
      .single();
    setIsLiked(!!data);
  };

  const handleLike = async () => {
    if (!id || !user) return;

    if (isLiked) {
      await supabase
        .from('store_review_likes')
        .delete()
        .eq('review_id', parseInt(id))
        .eq('user_id', user.id);
      setIsLiked(false);
      setLikeCount(prev => prev - 1);
    } else {
      await supabase
        .from('store_review_likes')
        .insert({ review_id: parseInt(id), user_id: user.id });
      setIsLiked(true);
      setLikeCount(prev => prev + 1);
    }
  };

  const handleDelete = async () => {
    if (!review || !user) return;
    if (!confirm('이 리뷰를 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('store_reviews')
      .delete()
      .eq('id', review.id);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      alert('리뷰가 삭제되었습니다.');
      navigate('/staff/reviews');
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getFullYear()}.${(date.getMonth() + 1).toString().padStart(2, '0')}.${date.getDate().toString().padStart(2, '0')} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  if (!review) {
    return null;
  }

  const isAuthor = user?.id === review.author_id;

  return (
    <div>
      <Link to="/staff/reviews" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 리뷰 목록</Link>

      {/* Store Info */}
      <div className="mb-4">
        <div className="flex items-center gap-2">
          <h1 className="text-xl font-bold text-slate-900">{review.store?.name}</h1>
          {review.is_verified && (
            <span className="px-2 py-0.5 bg-green-100 text-green-700 text-xs font-medium rounded">
              ✓ 인증 리뷰
            </span>
          )}
        </div>
        {review.store?.address && (
          <p className="text-sm text-slate-500">{review.store.address}</p>
        )}
      </div>

      {/* Review Card */}
      <div className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-3">
            <StarRating rating={review.rating} readonly size="md" />
            <span className="text-lg font-semibold text-slate-900">{review.rating}점</span>
          </div>
        </div>

        <p className="text-slate-700 whitespace-pre-wrap mb-4">{review.content}</p>

        <div className="flex items-center justify-between text-sm text-slate-500 mb-4">
          <span>
            작성자: {review.is_anonymous ? '익명' : review.author?.name || '알 수 없음'}
          </span>
          <span>{formatDate(review.created_at)}</span>
        </div>

        {/* Like Button */}
        <div className="flex items-center gap-4 py-3 border-t border-slate-100">
          <button
            onClick={handleLike}
            className={`flex items-center gap-1 px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
              isLiked
                ? 'bg-red-100 text-red-600'
                : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
            }`}
          >
            <span>{isLiked ? '♥' : '♡'}</span>
            <span>좋아요 {likeCount}</span>
          </button>
        </div>

        {review.updated_at !== review.created_at && (
          <p className="text-xs text-slate-400 mt-2">
            수정됨: {formatDate(review.updated_at)}
          </p>
        )}

        {isAuthor && (
          <div className="flex gap-2 mt-4 pt-4 border-t border-slate-100">
            <Link
              to={`/staff/reviews/${review.id}/edit`}
              className="px-3 py-1 text-xs text-slate-500 hover:text-slate-700 hover:underline"
            >
              수정
            </Link>
            <button
              onClick={handleDelete}
              className="px-3 py-1 text-xs text-red-500 hover:text-red-700 hover:underline"
            >
              삭제
            </button>
          </div>
        )}
      </div>

      {/* Comments */}
      <CommentSection reviewId={review.id} currentUserId={user?.id} />
    </div>
  );
}
