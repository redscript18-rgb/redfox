import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import PostCard from '../../components/community/PostCard';

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
  author?: { name: string };
  store?: { name: string };
  comment_count?: number;
  like_count?: number;
  score?: number;
}

type BestPeriod = 'daily' | 'weekly' | 'monthly';

export default function InfoBoard() {
  const { user } = useAuth();
  const [posts, setPosts] = useState<Post[]>([]);
  const [bestPosts, setBestPosts] = useState<Post[]>([]);
  const [bestPeriod, setBestPeriod] = useState<BestPeriod>('daily');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchPosts();
      fetchBestPosts();
    }
  }, [user]);

  useEffect(() => {
    if (user) {
      fetchBestPosts();
    }
  }, [bestPeriod]);

  const fetchPosts = async () => {
    setLoading(true);

    const { data: postsData } = await supabase
      .from('info_posts')
      .select(`
        *,
        author:profiles!info_posts_author_id_fkey(name),
        store:stores(name)
      `)
      .order('created_at', { ascending: false });

    // Get comment and like counts
    if (postsData && postsData.length > 0) {
      const postIds = postsData.map(p => p.id);

      const { data: commentCounts } = await supabase
        .from('info_post_comments')
        .select('post_id')
        .in('post_id', postIds);

      const { data: likeCounts } = await supabase
        .from('info_post_likes')
        .select('post_id')
        .in('post_id', postIds);

      const commentMap: Record<number, number> = {};
      commentCounts?.forEach(c => {
        commentMap[c.post_id] = (commentMap[c.post_id] || 0) + 1;
      });

      const likeMap: Record<number, number> = {};
      likeCounts?.forEach(l => {
        likeMap[l.post_id] = (likeMap[l.post_id] || 0) + 1;
      });

      const postsWithCounts = postsData.map(p => ({
        ...p,
        comment_count: commentMap[p.id] || 0,
        like_count: likeMap[p.id] || 0
      }));

      setPosts(postsWithCounts);
    } else {
      setPosts([]);
    }

    setLoading(false);
  };

  const fetchBestPosts = async () => {
    // Calculate date range based on period
    const now = new Date();
    let startDate: Date;

    switch (bestPeriod) {
      case 'daily':
        startDate = new Date(now.getTime() - 24 * 60 * 60 * 1000);
        break;
      case 'weekly':
        startDate = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
        break;
      case 'monthly':
        startDate = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
        break;
    }

    const { data: postsData } = await supabase
      .from('info_posts')
      .select(`
        *,
        author:profiles!info_posts_author_id_fkey(name),
        store:stores(name)
      `)
      .gte('created_at', startDate.toISOString())
      .order('created_at', { ascending: false });

    if (postsData && postsData.length > 0) {
      const postIds = postsData.map(p => p.id);

      const { data: likeCounts } = await supabase
        .from('info_post_likes')
        .select('post_id')
        .in('post_id', postIds);

      const likeMap: Record<number, number> = {};
      likeCounts?.forEach(l => {
        likeMap[l.post_id] = (likeMap[l.post_id] || 0) + 1;
      });

      // Calculate score: views + (likes * 3)
      const postsWithScore = postsData.map(p => ({
        ...p,
        like_count: likeMap[p.id] || 0,
        score: (p.view_count || 0) + ((likeMap[p.id] || 0) * 3)
      }));

      // Sort by score and take top 5
      const sorted = postsWithScore.sort((a, b) => (b.score || 0) - (a.score || 0));
      setBestPosts(sorted.slice(0, 5));
    } else {
      setBestPosts([]);
    }
  };

  const handleDelete = async (postId: number) => {
    const { error } = await supabase
      .from('info_posts')
      .delete()
      .eq('id', postId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchPosts();
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <Link to="/staff/community" className="text-pink-500 text-sm hover:text-pink-600 mb-1 inline-block">← 라운지</Link>
        <div className="flex items-center justify-between">
          <h1 className="text-2xl font-bold text-slate-800">
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">자유게시판</span>
          </h1>
          <Link
            to="/staff/community/board/write"
            className="px-4 py-2 bg-gradient-to-r from-pink-500 to-rose-500 text-white text-sm font-medium rounded-xl shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all"
          >
            글쓰기
          </Link>
        </div>
      </div>

      {/* Best Posts */}
      <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-3xl border border-amber-100 p-5">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span className="w-8 h-8 bg-amber-100 rounded-lg flex items-center justify-center text-base">🔥</span>
            베스트
          </h2>
          <div className="flex gap-1 bg-white/60 p-1 rounded-xl">
            {(['daily', 'weekly', 'monthly'] as BestPeriod[]).map((period) => (
              <button
                key={period}
                onClick={() => setBestPeriod(period)}
                className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition-all ${
                  bestPeriod === period
                    ? 'bg-gradient-to-r from-pink-500 to-rose-500 text-white shadow-md shadow-pink-200'
                    : 'text-slate-500 hover:text-pink-600'
                }`}
              >
                {period === 'daily' ? '일간' : period === 'weekly' ? '주간' : '월간'}
              </button>
            ))}
          </div>
        </div>

        {bestPosts.length > 0 ? (
          <div className="flex flex-col gap-2">
            {bestPosts.map((post, index) => (
              <Link
                key={post.id}
                to={`/staff/community/board/${post.id}`}
                className="flex items-center gap-3 p-3 bg-white/80 backdrop-blur rounded-xl hover:bg-white hover:shadow-sm transition-all"
              >
                <span className={`flex-shrink-0 w-7 h-7 flex items-center justify-center rounded-lg text-xs font-bold ${
                  index === 0 ? 'bg-gradient-to-br from-yellow-400 to-amber-400 text-yellow-900' :
                  index === 1 ? 'bg-gradient-to-br from-slate-300 to-slate-400 text-slate-700' :
                  index === 2 ? 'bg-gradient-to-br from-orange-300 to-amber-400 text-orange-800' :
                  'bg-slate-100 text-slate-500'
                }`}>
                  {index + 1}
                </span>
                <span className="flex-1 text-sm text-slate-700 truncate font-medium">{post.title}</span>
                <div className="flex items-center gap-2 text-xs text-slate-400 flex-shrink-0">
                  <span>👁 {post.view_count}</span>
                  <span className="text-pink-500 font-medium">♥ {post.like_count}</span>
                </div>
              </Link>
            ))}
          </div>
        ) : (
          <div className="py-8 text-center">
            <div className="w-14 h-14 bg-amber-100 rounded-full flex items-center justify-center mx-auto mb-3 text-xl">🔥</div>
            <p className="text-sm text-slate-500">
              {bestPeriod === 'daily' ? '오늘' : bestPeriod === 'weekly' ? '이번 주' : '이번 달'} 작성된 글이 없습니다.
            </p>
          </div>
        )}
      </div>

      {/* Posts List */}
      {posts.length > 0 ? (
        <div className="bg-white rounded-3xl border border-slate-100 p-5 shadow-sm">
          <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
            <span className="w-8 h-8 bg-slate-100 rounded-lg flex items-center justify-center text-base">📋</span>
            전체 게시글
          </h2>
          <div className="flex flex-col gap-3">
            {posts.map((post) => (
              <PostCard
                key={post.id}
                post={post}
                currentUserId={user?.id}
                onDelete={handleDelete}
              />
            ))}
          </div>
        </div>
      ) : (
        <div className="py-12 bg-gradient-to-br from-slate-50 to-pink-50 rounded-3xl text-center">
          <div className="w-16 h-16 bg-pink-100 rounded-full flex items-center justify-center mx-auto mb-4 text-2xl">✏️</div>
          <p className="text-slate-500 mb-4">아직 작성된 글이 없습니다.</p>
          <Link
            to="/staff/community/board/write"
            className="inline-block px-6 py-3 bg-gradient-to-r from-pink-500 to-rose-500 text-white text-sm font-medium rounded-full shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all"
          >
            첫 글 작성하기
          </Link>
        </div>
      )}
    </div>
  );
}
