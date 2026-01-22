import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import StarRating from '../../components/reviews/StarRating';

interface RecentReview {
  id: number;
  rating: number;
  content: string;
  is_anonymous: boolean;
  created_at: string;
  store?: { name: string };
  author?: { name: string };
}

interface RecentPost {
  id: number;
  title: string;
  category: string;
  is_anonymous: boolean;
  view_count: number;
  created_at: string;
  author?: { name: string };
  comment_count?: number;
}

const CATEGORY_MAP: Record<string, { label: string; color: string }> = {
  general: { label: '일반', color: 'bg-slate-100 text-slate-600' },
  tip: { label: '팁/노하우', color: 'bg-green-100 text-green-600' },
  question: { label: '질문', color: 'bg-blue-100 text-blue-600' },
  review: { label: '후기', color: 'bg-orange-100 text-orange-600' }
};

export default function CommunityHome() {
  const { user } = useAuth();
  const [recentReviews, setRecentReviews] = useState<RecentReview[]>([]);
  const [recentPosts, setRecentPosts] = useState<RecentPost[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    // Fetch recent reviews
    const { data: reviewsData } = await supabase
      .from('store_reviews')
      .select(`
        id, rating, content, is_anonymous, created_at,
        store:stores(name),
        author:profiles!store_reviews_author_id_fkey(name)
      `)
      .order('created_at', { ascending: false })
      .limit(3);

    setRecentReviews((reviewsData as unknown as RecentReview[]) || []);

    // Fetch recent posts
    const { data: postsData } = await supabase
      .from('info_posts')
      .select(`
        id, title, category, is_anonymous, view_count, created_at,
        author:profiles!info_posts_author_id_fkey(name)
      `)
      .order('created_at', { ascending: false })
      .limit(5);

    // Get comment counts for posts
    if (postsData && postsData.length > 0) {
      const postIds = postsData.map(p => p.id);
      const { data: commentCounts } = await supabase
        .from('info_post_comments')
        .select('post_id')
        .in('post_id', postIds);

      const countMap: Record<number, number> = {};
      commentCounts?.forEach(c => {
        countMap[c.post_id] = (countMap[c.post_id] || 0) + 1;
      });

      const postsWithCounts = postsData.map(p => ({
        ...p,
        comment_count: countMap[p.id] || 0
      }));

      setRecentPosts(postsWithCounts as unknown as RecentPost[]);
    } else {
      setRecentPosts([]);
    }

    setLoading(false);
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
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <Link to="/" className="text-pink-500 text-sm hover:text-pink-600 mb-1 inline-block">← 대시보드</Link>
        <h1 className="text-2xl font-bold text-slate-800">
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">라운지</span>
        </h1>
      </div>

      {/* Menu Cards */}
      <div className="grid grid-cols-2 gap-3">
        <Link
          to="/staff/reviews"
          className="flex items-center gap-3 p-4 bg-gradient-to-br from-amber-50 to-orange-50 border border-amber-200 rounded-2xl hover:shadow-md transition-all group"
        >
          <div className="w-10 h-10 bg-amber-100 rounded-xl flex items-center justify-center text-lg group-hover:scale-110 transition-transform">⭐</div>
          <div>
            <span className="font-semibold text-slate-800 text-sm">가게 리뷰</span>
            <p className="text-xs text-slate-400">솔직한 출근 후기 공유</p>
          </div>
        </Link>

        <Link
          to="/staff/community/board"
          className="flex items-center gap-3 p-4 bg-gradient-to-br from-blue-50 to-indigo-50 border border-blue-200 rounded-2xl hover:shadow-md transition-all group"
        >
          <div className="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center text-lg group-hover:scale-110 transition-transform">💬</div>
          <div>
            <span className="font-semibold text-slate-800 text-sm">자유게시판</span>
            <p className="text-xs text-slate-400">소통과 정보공유</p>
          </div>
        </Link>
      </div>

      {/* Recent Store Reviews */}
      <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-3xl border border-amber-100 p-5">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span className="w-8 h-8 bg-amber-100 rounded-lg flex items-center justify-center text-base">⭐</span>
            최근 가게 리뷰
          </h2>
          <Link to="/staff/reviews" className="text-sm text-pink-500 hover:text-pink-600 font-medium">더보기 →</Link>
        </div>

        {recentReviews.length > 0 ? (
          <div className="flex flex-col gap-3">
            {recentReviews.map((review) => (
              <Link
                key={review.id}
                to={`/staff/reviews/${review.id}`}
                className="p-4 bg-white/80 backdrop-blur rounded-2xl border border-amber-100 hover:shadow-md transition-all"
              >
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-slate-800">{review.store?.name}</span>
                  <StarRating rating={review.rating} readonly size="sm" />
                </div>
                <p className="text-sm text-slate-500 line-clamp-2">{review.content}</p>
                <div className="flex items-center justify-between mt-2 text-xs text-slate-400">
                  <span>{review.is_anonymous ? '익명' : review.author?.name}</span>
                  <span>{formatDate(review.created_at)}</span>
                </div>
              </Link>
            ))}
          </div>
        ) : (
          <div className="py-8 text-center">
            <div className="w-14 h-14 bg-amber-100 rounded-full flex items-center justify-center mx-auto mb-3 text-xl">⭐</div>
            <p className="text-slate-500 text-sm">아직 작성된 리뷰가 없습니다.</p>
          </div>
        )}
      </div>

      {/* Recent Info Posts */}
      <div className="bg-white rounded-3xl border border-slate-100 p-5 shadow-sm">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span className="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center text-base">💬</span>
            최근 게시글
          </h2>
          <Link to="/staff/community/board" className="text-sm text-pink-500 hover:text-pink-600 font-medium">더보기 →</Link>
        </div>

        {recentPosts.length > 0 ? (
          <div className="flex flex-col gap-2">
            {recentPosts.map((post) => {
              const category = CATEGORY_MAP[post.category] || CATEGORY_MAP.general;
              return (
                <Link
                  key={post.id}
                  to={`/staff/community/board/${post.id}`}
                  className="flex items-center gap-3 p-3 bg-slate-50 rounded-xl hover:bg-slate-100 transition-colors"
                >
                  <span className={`px-2.5 py-0.5 text-xs font-medium rounded-full flex-shrink-0 ${category.color}`}>
                    {category.label}
                  </span>
                  <span className="flex-1 text-sm text-slate-700 truncate">{post.title}</span>
                  <div className="flex items-center gap-2 text-xs text-slate-400 flex-shrink-0">
                    {post.comment_count !== undefined && post.comment_count > 0 && (
                      <span className="text-pink-500 font-medium">[{post.comment_count}]</span>
                    )}
                    <span>{formatDate(post.created_at)}</span>
                  </div>
                </Link>
              );
            })}
          </div>
        ) : (
          <div className="py-8 text-center">
            <div className="w-14 h-14 bg-slate-100 rounded-full flex items-center justify-center mx-auto mb-3 text-xl">💬</div>
            <p className="text-slate-500 text-sm">아직 작성된 글이 없습니다.</p>
          </div>
        )}
      </div>
    </div>
  );
}
