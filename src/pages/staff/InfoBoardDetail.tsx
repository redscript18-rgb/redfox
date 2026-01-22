import { useState, useEffect } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import PostCommentSection from '../../components/community/PostCommentSection';

interface Post {
  id: number;
  author_id: string;
  title: string;
  content: string;
  tags?: string[];
  store_id?: number | null;
  is_anonymous: boolean;
  view_count: number;
  created_at: string;
  updated_at: string;
  author?: { name: string };
  store?: { name: string };
}

export default function InfoBoardDetail() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const [post, setPost] = useState<Post | null>(null);
  const [loading, setLoading] = useState(true);
  const [likeCount, setLikeCount] = useState(0);
  const [isLiked, setIsLiked] = useState(false);

  useEffect(() => {
    if (id) {
      fetchPost();
      fetchLikeStatus();
      incrementViewCount();
    }
  }, [id]);

  const fetchPost = async () => {
    if (!id) return;

    const { data, error } = await supabase
      .from('info_posts')
      .select(`
        *,
        author:profiles!info_posts_author_id_fkey(name),
        store:stores(name)
      `)
      .eq('id', parseInt(id))
      .single();

    if (error || !data) {
      alert('게시글을 찾을 수 없습니다.');
      navigate('/staff/community/board');
      return;
    }

    setPost(data);
    setLoading(false);
  };

  const incrementViewCount = async () => {
    if (!id) return;
    await supabase.rpc('increment_post_view_count', { p_post_id: parseInt(id) });
  };

  const fetchLikeStatus = async () => {
    if (!id || !user) return;

    // Get like count
    const { count } = await supabase
      .from('info_post_likes')
      .select('*', { count: 'exact', head: true })
      .eq('post_id', parseInt(id));
    setLikeCount(count || 0);

    // Check if user liked
    const { data } = await supabase
      .from('info_post_likes')
      .select('id')
      .eq('post_id', parseInt(id))
      .eq('user_id', user.id)
      .single();
    setIsLiked(!!data);
  };

  const handleLike = async () => {
    if (!id || !user) return;

    if (isLiked) {
      await supabase
        .from('info_post_likes')
        .delete()
        .eq('post_id', parseInt(id))
        .eq('user_id', user.id);
      setIsLiked(false);
      setLikeCount(prev => prev - 1);
    } else {
      await supabase
        .from('info_post_likes')
        .insert({ post_id: parseInt(id), user_id: user.id });
      setIsLiked(true);
      setLikeCount(prev => prev + 1);
    }
  };

  const handleDelete = async () => {
    if (!post || !user) return;
    if (!confirm('이 게시글을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('info_posts')
      .delete()
      .eq('id', post.id);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      alert('게시글이 삭제되었습니다.');
      navigate('/staff/community/board');
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getFullYear()}.${(date.getMonth() + 1).toString().padStart(2, '0')}.${date.getDate().toString().padStart(2, '0')} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  if (!post) {
    return null;
  }

  const isAuthor = user?.id === post.author_id;

  return (
    <div>
      <Link to="/staff/community/board" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 자유게시판</Link>

      {/* Post */}
      <div className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
        {((post.tags && post.tags.length > 0) || post.store) && (
          <div className="flex items-center gap-2 mb-3 flex-wrap">
            {post.tags && post.tags.map((tag) => (
              <span key={tag} className="px-2 py-0.5 text-xs font-medium rounded bg-red-100 text-red-600">
                #{tag}
              </span>
            ))}
            {post.store && (
              <span className="px-2 py-0.5 text-xs font-medium rounded bg-purple-100 text-purple-600">
                @{post.store.name}
              </span>
            )}
          </div>
        )}

        <h1 className="text-xl font-bold text-slate-900 mb-4">{post.title}</h1>

        <div className="flex items-center justify-between text-sm text-slate-500 mb-4 pb-4 border-b border-slate-100">
          <div className="flex items-center gap-3">
            <span>{post.is_anonymous ? '익명' : post.author?.name || '알 수 없음'}</span>
            <span>조회 {post.view_count}</span>
          </div>
          <span>{formatDate(post.created_at)}</span>
        </div>

        <div className="text-slate-700 whitespace-pre-wrap min-h-[100px]">
          {post.content}
        </div>

        {/* Like Button */}
        <div className="flex items-center gap-4 py-3 mt-4 border-t border-slate-100">
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

        {post.updated_at !== post.created_at && (
          <p className="text-xs text-slate-400 mt-4">
            수정됨: {formatDate(post.updated_at)}
          </p>
        )}

        {isAuthor && (
          <div className="flex gap-2 mt-4 pt-4 border-t border-slate-100">
            <Link
              to={`/staff/community/board/${post.id}/edit`}
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
      <PostCommentSection postId={post.id} currentUserId={user?.id} />
    </div>
  );
}
