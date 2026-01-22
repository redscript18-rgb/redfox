import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import ReviewCard from '../../components/reviews/ReviewCard';

interface Review {
  id: number;
  store_id: number;
  author_id: string;
  rating: number;
  content: string;
  is_anonymous: boolean;
  is_verified?: boolean;
  view_count?: number;
  created_at: string;
  updated_at: string;
  store?: { name: string; address: string };
  author?: { name: string };
  comment_count?: number;
  like_count?: number;
  score?: number;
}

type BestPeriod = 'daily' | 'weekly' | 'monthly';

interface Store {
  id: number;
  name: string;
}

export default function StoreReviews() {
  const { user } = useAuth();
  const [searchParams, setSearchParams] = useSearchParams();
  const [reviews, setReviews] = useState<Review[]>([]);
  const [bestReviews, setBestReviews] = useState<Review[]>([]);
  const [bestPeriod, setBestPeriod] = useState<BestPeriod>('daily');
  const [stores, setStores] = useState<Store[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<'all' | 'mine'>(
    (searchParams.get('filter') as 'all' | 'mine') || 'all'
  );
  const [storeFilter, setStoreFilter] = useState<number | null>(
    searchParams.get('store') ? parseInt(searchParams.get('store')!) : null
  );

  useEffect(() => {
    if (user) {
      fetchData();
      fetchBestReviews();
    }
  }, [user, filter, storeFilter]);

  useEffect(() => {
    if (user) {
      fetchBestReviews();
    }
  }, [bestPeriod]);

  const fetchData = async () => {
    if (!user) return;
    setLoading(true);

    // Fetch stores for filter dropdown
    const { data: storesData } = await supabase
      .from('stores')
      .select('id, name')
      .order('name');
    setStores(storesData || []);

    // Build review query
    let query = supabase
      .from('store_reviews')
      .select(`
        *,
        store:stores(name, address),
        author:profiles!store_reviews_author_id_fkey(name)
      `)
      .order('created_at', { ascending: false });

    if (filter === 'mine') {
      query = query.eq('author_id', user.id);
    }

    if (storeFilter) {
      query = query.eq('store_id', storeFilter);
    }

    const { data: reviewsData } = await query;

    // Get comment and like counts
    if (reviewsData && reviewsData.length > 0) {
      const reviewIds = reviewsData.map(r => r.id);

      const { data: commentCounts } = await supabase
        .from('store_review_comments')
        .select('review_id')
        .in('review_id', reviewIds);

      const { data: likeCounts } = await supabase
        .from('store_review_likes')
        .select('review_id')
        .in('review_id', reviewIds);

      const commentMap: Record<number, number> = {};
      commentCounts?.forEach(c => {
        commentMap[c.review_id] = (commentMap[c.review_id] || 0) + 1;
      });

      const likeMap: Record<number, number> = {};
      likeCounts?.forEach(l => {
        likeMap[l.review_id] = (likeMap[l.review_id] || 0) + 1;
      });

      const reviewsWithCounts = reviewsData.map(r => ({
        ...r,
        comment_count: commentMap[r.id] || 0,
        like_count: likeMap[r.id] || 0
      }));

      setReviews(reviewsWithCounts);
    } else {
      setReviews([]);
    }

    setLoading(false);
  };

  const fetchBestReviews = async () => {
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

    const { data: reviewsData } = await supabase
      .from('store_reviews')
      .select(`
        *,
        store:stores(name, address),
        author:profiles!store_reviews_author_id_fkey(name)
      `)
      .gte('created_at', startDate.toISOString())
      .order('created_at', { ascending: false });

    if (reviewsData && reviewsData.length > 0) {
      const reviewIds = reviewsData.map(r => r.id);

      const { data: likeCounts } = await supabase
        .from('store_review_likes')
        .select('review_id')
        .in('review_id', reviewIds);

      const likeMap: Record<number, number> = {};
      likeCounts?.forEach(l => {
        likeMap[l.review_id] = (likeMap[l.review_id] || 0) + 1;
      });

      // Score: views + (likes * 3)
      const reviewsWithScore = reviewsData.map(r => ({
        ...r,
        like_count: likeMap[r.id] || 0,
        score: (r.view_count || 0) + ((likeMap[r.id] || 0) * 3)
      }));

      const sorted = reviewsWithScore.sort((a, b) => (b.score || 0) - (a.score || 0));
      setBestReviews(sorted.slice(0, 5));
    } else {
      setBestReviews([]);
    }
  };

  const handleFilterChange = (newFilter: 'all' | 'mine') => {
    setFilter(newFilter);
    const params = new URLSearchParams(searchParams);
    params.set('filter', newFilter);
    setSearchParams(params);
  };

  const handleStoreFilterChange = (storeId: number | null) => {
    setStoreFilter(storeId);
    const params = new URLSearchParams(searchParams);
    if (storeId) {
      params.set('store', storeId.toString());
    } else {
      params.delete('store');
    }
    setSearchParams(params);
  };

  const handleDelete = async (reviewId: number) => {
    const { error } = await supabase
      .from('store_reviews')
      .delete()
      .eq('id', reviewId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchData();
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <Link to="/" className="text-pink-500 text-sm hover:text-pink-600 mb-1 inline-block">← 대시보드</Link>
        <div className="flex items-start justify-between gap-4">
          <div>
            <h1 className="text-2xl font-bold text-slate-800">
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">가게 리뷰</span>
            </h1>
            <p className="text-sm text-slate-500 mt-1">여우들의 블라인드, 출근 가게 솔직 리뷰</p>
          </div>
          <Link
            to="/staff/reviews/write"
            className="px-4 py-2 bg-gradient-to-r from-pink-500 to-rose-500 text-white text-sm font-medium rounded-xl shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all flex-shrink-0"
          >
            리뷰 작성
          </Link>
        </div>
      </div>

      {/* Best Reviews */}
      <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-3xl border border-amber-100 p-5">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span className="w-8 h-8 bg-amber-100 rounded-lg flex items-center justify-center text-base">🔥</span>
            베스트 리뷰
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

        {bestReviews.length > 0 ? (
          <div className="flex flex-col gap-2">
            {bestReviews.map((review, index) => (
              <Link
                key={review.id}
                to={`/staff/reviews/${review.id}`}
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
                <span className="flex-1 text-sm text-slate-700 truncate font-medium flex items-center gap-1.5">
                  <span className="text-amber-400">{'★'.repeat(review.rating)}</span> {review.store?.name}
                  {review.is_verified && (
                    <span className="px-1 py-0.5 bg-green-100 text-green-700 text-[10px] font-medium rounded">✓</span>
                  )}
                </span>
                <div className="flex items-center gap-2 text-xs text-slate-400 flex-shrink-0">
                  <span>👁 {review.view_count || 0}</span>
                  <span className="text-pink-500 font-medium">♥ {review.like_count}</span>
                </div>
              </Link>
            ))}
          </div>
        ) : (
          <div className="py-8 text-center">
            <div className="w-14 h-14 bg-amber-100 rounded-full flex items-center justify-center mx-auto mb-3 text-xl">⭐</div>
            <p className="text-sm text-slate-500">
              {bestPeriod === 'daily' ? '오늘' : bestPeriod === 'weekly' ? '이번 주' : '이번 달'} 작성된 리뷰가 없습니다.
            </p>
          </div>
        )}
      </div>

      {/* Filters */}
      <div className="flex flex-col gap-3">
        <div className="flex bg-gradient-to-r from-pink-50 to-purple-50 p-1.5 rounded-2xl border border-pink-100">
          <button
            className={`flex-1 py-2.5 px-4 text-sm font-semibold rounded-xl transition-all ${
              filter === 'all'
                ? 'bg-gradient-to-r from-pink-500 to-rose-500 text-white shadow-md shadow-pink-200'
                : 'text-slate-500 hover:text-pink-600'
            }`}
            onClick={() => handleFilterChange('all')}
          >
            전체 리뷰
          </button>
          <button
            className={`flex-1 py-2.5 px-4 text-sm font-semibold rounded-xl transition-all ${
              filter === 'mine'
                ? 'bg-gradient-to-r from-pink-500 to-rose-500 text-white shadow-md shadow-pink-200'
                : 'text-slate-500 hover:text-pink-600'
            }`}
            onClick={() => handleFilterChange('mine')}
          >
            내 리뷰
          </button>
        </div>

        <select
          value={storeFilter || ''}
          onChange={(e) => handleStoreFilterChange(e.target.value ? parseInt(e.target.value) : null)}
          className="w-full px-4 py-3 border border-slate-200 rounded-xl text-sm focus:outline-none focus:border-pink-400 focus:ring-2 focus:ring-pink-100 transition-all"
        >
          <option value="">모든 가게</option>
          {stores.map((store) => (
            <option key={store.id} value={store.id}>{store.name}</option>
          ))}
        </select>
      </div>

      {/* Reviews List */}
      {reviews.length > 0 ? (
        <div className="bg-white rounded-3xl border border-slate-100 p-5 shadow-sm">
          <div className="flex flex-col gap-3">
            {reviews.map((review) => (
              <ReviewCard
                key={review.id}
                review={review}
                currentUserId={user?.id}
                onDelete={handleDelete}
              />
            ))}
          </div>
        </div>
      ) : (
        <div className="py-12 bg-gradient-to-br from-slate-50 to-pink-50 rounded-3xl text-center">
          <div className="w-16 h-16 bg-pink-100 rounded-full flex items-center justify-center mx-auto mb-4 text-2xl">⭐</div>
          <p className="text-slate-500 mb-4">
            {filter === 'mine'
              ? '작성한 리뷰가 없습니다.'
              : '아직 작성된 리뷰가 없습니다.'}
          </p>
          <Link
            to="/staff/reviews/write"
            className="inline-block px-6 py-3 bg-gradient-to-r from-pink-500 to-rose-500 text-white text-sm font-medium rounded-full shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all"
          >
            첫 리뷰 작성하기
          </Link>
        </div>
      )}
    </div>
  );
}
