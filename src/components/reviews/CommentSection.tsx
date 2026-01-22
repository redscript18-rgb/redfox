import { useState, useEffect } from 'react';
import { supabase } from '../../lib/supabase';

interface Comment {
  id: number;
  review_id: number;
  author_id: string;
  content: string;
  is_anonymous: boolean;
  created_at: string;
  author?: { name: string };
  like_count?: number;
  is_liked?: boolean;
}

interface CommentSectionProps {
  reviewId: number;
  currentUserId?: string;
}

export default function CommentSection({ reviewId, currentUserId }: CommentSectionProps) {
  const [comments, setComments] = useState<Comment[]>([]);
  const [newComment, setNewComment] = useState('');
  const [isAnonymous, setIsAnonymous] = useState(false);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    fetchComments();
  }, [reviewId]);

  const fetchComments = async () => {
    const { data } = await supabase
      .from('store_review_comments')
      .select(`
        *,
        author:profiles!store_review_comments_author_id_fkey(name)
      `)
      .eq('review_id', reviewId)
      .order('created_at', { ascending: true });

    if (data && data.length > 0) {
      const commentIds = data.map(c => c.id);

      // Get like counts
      const { data: likeCounts } = await supabase
        .from('store_review_comment_likes')
        .select('comment_id')
        .in('comment_id', commentIds);

      const likeMap: Record<number, number> = {};
      likeCounts?.forEach(l => {
        likeMap[l.comment_id] = (likeMap[l.comment_id] || 0) + 1;
      });

      // Get user's likes
      let userLikes: number[] = [];
      if (currentUserId) {
        const { data: userLikeData } = await supabase
          .from('store_review_comment_likes')
          .select('comment_id')
          .eq('user_id', currentUserId)
          .in('comment_id', commentIds);
        userLikes = userLikeData?.map(l => l.comment_id) || [];
      }

      const commentsWithLikes = data.map(c => ({
        ...c,
        like_count: likeMap[c.id] || 0,
        is_liked: userLikes.includes(c.id)
      }));

      setComments(commentsWithLikes);
    } else {
      setComments([]);
    }

    setLoading(false);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!currentUserId || !newComment.trim()) return;

    setSubmitting(true);

    const { error } = await supabase
      .from('store_review_comments')
      .insert({
        review_id: reviewId,
        author_id: currentUserId,
        content: newComment.trim(),
        is_anonymous: isAnonymous
      });

    if (error) {
      alert('댓글 작성 중 오류가 발생했습니다.');
    } else {
      setNewComment('');
      fetchComments();
    }

    setSubmitting(false);
  };

  const handleDelete = async (commentId: number) => {
    if (!confirm('이 댓글을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('store_review_comments')
      .delete()
      .eq('id', commentId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchComments();
    }
  };

  const handleLike = async (commentId: number, isLiked: boolean) => {
    if (!currentUserId) return;

    if (isLiked) {
      await supabase
        .from('store_review_comment_likes')
        .delete()
        .eq('comment_id', commentId)
        .eq('user_id', currentUserId);
    } else {
      await supabase
        .from('store_review_comment_likes')
        .insert({ comment_id: commentId, user_id: currentUserId });
    }

    setComments(prev => prev.map(c => {
      if (c.id === commentId) {
        return {
          ...c,
          like_count: isLiked ? (c.like_count || 1) - 1 : (c.like_count || 0) + 1,
          is_liked: !isLiked
        };
      }
      return c;
    }));
  };

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

  if (loading) {
    return <div className="text-sm text-slate-500">댓글 로딩 중...</div>;
  }

  return (
    <div className="mt-6">
      <h3 className="text-lg font-semibold text-slate-900 mb-4">
        댓글 {comments.length > 0 && `(${comments.length})`}
      </h3>

      {/* Comment List */}
      {comments.length > 0 ? (
        <div className="flex flex-col gap-3 mb-6">
          {comments.map((comment) => (
            <div key={comment.id} className="p-3 bg-slate-50 rounded-lg">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-medium text-slate-700">
                  {comment.is_anonymous ? '익명' : comment.author?.name || '알 수 없음'}
                </span>
                <div className="flex items-center gap-2">
                  <span className="text-xs text-slate-400">{formatDate(comment.created_at)}</span>
                  {currentUserId === comment.author_id && (
                    <button
                      onClick={() => handleDelete(comment.id)}
                      className="text-xs text-red-500 hover:text-red-700"
                    >
                      삭제
                    </button>
                  )}
                </div>
              </div>
              <p className="text-sm text-slate-600 whitespace-pre-wrap mb-2">{comment.content}</p>
              <button
                onClick={() => handleLike(comment.id, comment.is_liked || false)}
                className={`text-xs ${comment.is_liked ? 'text-red-500' : 'text-slate-400 hover:text-red-500'}`}
              >
                {comment.is_liked ? '♥' : '♡'} {comment.like_count || 0}
              </button>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-sm text-slate-500 mb-6">아직 댓글이 없습니다.</p>
      )}

      {/* Comment Form */}
      {currentUserId && (
        <form onSubmit={handleSubmit} className="flex flex-col gap-3">
          <textarea
            value={newComment}
            onChange={(e) => setNewComment(e.target.value)}
            placeholder="댓글을 입력하세요..."
            className="w-full px-4 py-3 border border-slate-200 rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-red-500"
            rows={3}
          />

          <div className="flex items-center justify-between">
            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                checked={isAnonymous}
                onChange={(e) => setIsAnonymous(e.target.checked)}
                className="w-4 h-4 text-red-600 rounded focus:ring-red-500"
              />
              <span className="text-sm text-slate-600">익명으로 작성</span>
            </label>

            <button
              type="submit"
              disabled={submitting || !newComment.trim()}
              className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-300 disabled:cursor-not-allowed"
            >
              {submitting ? '작성 중...' : '댓글 작성'}
            </button>
          </div>
        </form>
      )}
    </div>
  );
}
