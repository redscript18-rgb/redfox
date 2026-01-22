import { useState, useEffect } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import StarRating from '../../components/reviews/StarRating';

interface ReviewableStore {
  store_id: number;
  store_name: string;
  store_address: string;
  work_count: number;
  has_review: boolean;
  is_worked: boolean;
}

interface Review {
  id: number;
  store_id: number;
  rating: number;
  content: string;
  is_anonymous: boolean;
}

interface SearchStore {
  id: number;
  name: string;
}

export default function WriteStoreReview() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const isEditMode = !!id;

  const [stores, setStores] = useState<ReviewableStore[]>([]);
  const [selectedStoreId, setSelectedStoreId] = useState<number | null>(null);
  const [selectedStoreName, setSelectedStoreName] = useState<string>('');
  const [isVerifiedReview, setIsVerifiedReview] = useState(false);
  const [rating, setRating] = useState(5);
  const [content, setContent] = useState('');
  const [isAnonymous, setIsAnonymous] = useState(false);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [existingReview, setExistingReview] = useState<Review | null>(null);

  // 일반 리뷰용 검색 상태
  const [storeSearch, setStoreSearch] = useState('');
  const [searchResults, setSearchResults] = useState<SearchStore[]>([]);
  const [showSearchResults, setShowSearchResults] = useState(false);
  const [reviewedStoreIds, setReviewedStoreIds] = useState<Set<number>>(new Set());

  useEffect(() => {
    if (user) {
      if (isEditMode) {
        fetchReview();
      } else {
        fetchWorkedStores();
      }
    }
  }, [user, id]);

  // 일반 리뷰용 가게 검색
  useEffect(() => {
    const searchStores = async () => {
      if (storeSearch.length < 2) {
        setSearchResults([]);
        return;
      }

      const { data } = await supabase
        .from('stores')
        .select('id, name')
        .ilike('name', `%${storeSearch}%`)
        .limit(10);

      // 이미 리뷰 작성한 가게는 제외
      const filtered = (data || []).filter(s => !reviewedStoreIds.has(s.id));
      setSearchResults(filtered);
    };

    const debounce = setTimeout(searchStores, 300);
    return () => clearTimeout(debounce);
  }, [storeSearch, reviewedStoreIds]);

  const fetchWorkedStores = async () => {
    if (!user) return;

    // 출근 이력 있는 가게 조회
    const { data: schedules } = await supabase
      .from('schedules')
      .select('store_id, stores(id, name, address)')
      .eq('staff_id', user.id)
      .eq('status', 'approved');

    // 기존 리뷰 조회 (중복 방지용)
    const { data: reviews } = await supabase
      .from('store_reviews')
      .select('store_id')
      .eq('author_id', user.id);

    const reviewedIds = new Set(reviews?.map(r => r.store_id) || []);
    setReviewedStoreIds(reviewedIds);

    // 출근 이력 있는 가게 정리
    const storeMap = new Map<number, ReviewableStore>();
    schedules?.forEach(s => {
      const store = s.stores as unknown as { id: number; name: string; address: string } | null;
      if (store && !storeMap.has(store.id)) {
        storeMap.set(store.id, {
          store_id: store.id,
          store_name: store.name,
          store_address: store.address || '',
          work_count: 1,
          has_review: reviewedIds.has(store.id),
          is_worked: true
        });
      } else if (store && storeMap.has(store.id)) {
        const existing = storeMap.get(store.id)!;
        existing.work_count++;
      }
    });

    const storeList = Array.from(storeMap.values()).sort((a, b) => b.work_count - a.work_count);
    setStores(storeList);
    setLoading(false);
  };

  const selectWorkedStore = (store: ReviewableStore) => {
    setSelectedStoreId(store.store_id);
    setSelectedStoreName(store.store_name);
    setIsVerifiedReview(true);
    // 검색 초기화
    setStoreSearch('');
    setSearchResults([]);
  };

  const selectSearchedStore = (store: SearchStore) => {
    setSelectedStoreId(store.id);
    setSelectedStoreName(store.name);
    setIsVerifiedReview(false);
    setStoreSearch('');
    setShowSearchResults(false);
  };

  const clearSelectedStore = () => {
    setSelectedStoreId(null);
    setSelectedStoreName('');
    setIsVerifiedReview(false);
  };

  const fetchReview = async () => {
    if (!user || !id) return;

    const { data: review, error } = await supabase
      .from('store_reviews')
      .select('*')
      .eq('id', parseInt(id))
      .eq('author_id', user.id)
      .single();

    if (error || !review) {
      alert('리뷰를 찾을 수 없습니다.');
      navigate('/staff/reviews');
      return;
    }

    setExistingReview(review);
    setSelectedStoreId(review.store_id);
    setRating(review.rating);
    setContent(review.content);
    setIsAnonymous(review.is_anonymous);
    setLoading(false);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!user) return;

    if (!selectedStoreId) {
      alert('가게를 선택해주세요.');
      return;
    }

    if (content.length < 10) {
      alert('리뷰는 최소 10자 이상 작성해주세요.');
      return;
    }

    setSubmitting(true);

    if (isEditMode && existingReview) {
      // Update
      const { error } = await supabase
        .from('store_reviews')
        .update({
          rating,
          content,
          is_anonymous: isAnonymous
        })
        .eq('id', existingReview.id);

      if (error) {
        alert('수정 중 오류가 발생했습니다.');
        setSubmitting(false);
        return;
      }

      alert('리뷰가 수정되었습니다.');
      navigate(`/staff/reviews/${existingReview.id}`);
    } else {
      // Insert
      const { data, error } = await supabase
        .from('store_reviews')
        .insert({
          store_id: selectedStoreId,
          author_id: user.id,
          rating,
          content,
          is_anonymous: isAnonymous
        })
        .select()
        .single();

      if (error) {
        if (error.code === '23505') {
          alert('이미 이 가게에 리뷰를 작성했습니다.');
        } else {
          alert('작성 중 오류가 발생했습니다.');
        }
        setSubmitting(false);
        return;
      }

      // 포인트 지급
      const { data: pointResult } = await supabase.rpc('award_writing_points', {
        p_user_id: user.id,
        p_type: 'review'
      });

      const pointMessage = pointResult?.[0]?.message || '';
      alert(`리뷰가 작성되었습니다.${pointMessage ? '\n' + pointMessage : ''}`);
      navigate(`/staff/reviews/${data.id}`);
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  const workedStores = stores.filter(s => !s.has_review);

  return (
    <div>
      <Link to="/staff/reviews" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 리뷰 목록</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-6">
        {isEditMode ? '리뷰 수정' : '리뷰 작성'}
      </h1>

      <form onSubmit={handleSubmit} className="flex flex-col gap-6">
        {/* Store Selection */}
        {isEditMode ? (
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">가게</label>
            <div className="p-4 bg-slate-50 rounded-lg">
              <span className="text-slate-900">
                {stores.find(s => s.store_id === selectedStoreId)?.store_name ||
                 existingReview?.store_id}
              </span>
            </div>
          </div>
        ) : selectedStoreId ? (
          /* 선택된 가게 표시 */
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">선택한 가게</label>
            <div className="flex items-center gap-3 p-4 bg-slate-50 rounded-lg border border-slate-200">
              <div className="flex-1">
                <span className="font-medium text-slate-900">{selectedStoreName}</span>
                {isVerifiedReview && (
                  <span className="ml-2 px-2 py-0.5 bg-green-100 text-green-700 text-xs font-medium rounded">
                    ✓ 인증 리뷰
                  </span>
                )}
                {!isVerifiedReview && (
                  <span className="ml-2 px-2 py-0.5 bg-slate-200 text-slate-600 text-xs font-medium rounded">
                    일반 리뷰
                  </span>
                )}
              </div>
              <button
                type="button"
                onClick={clearSelectedStore}
                className="text-slate-400 hover:text-slate-600 text-lg"
              >
                ×
              </button>
            </div>
          </div>
        ) : (
          /* 가게 선택 UI */
          <div className="space-y-4">
            {/* 인증 리뷰 - 출근 이력 있는 가게 */}
            {workedStores.length > 0 && (
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-2">
                  ✓ 인증 리뷰 <span className="text-slate-400 font-normal">(출근 이력 있는 가게)</span>
                </label>
                <div className="grid grid-cols-1 gap-2">
                  {workedStores.map((store) => (
                    <button
                      key={store.store_id}
                      type="button"
                      onClick={() => selectWorkedStore(store)}
                      className="flex items-center justify-between p-3 bg-green-50 border border-green-200 rounded-lg hover:bg-green-100 transition-colors text-left"
                    >
                      <span className="font-medium text-slate-800">{store.store_name}</span>
                      <span className="text-xs text-green-600">출근 {store.work_count}회</span>
                    </button>
                  ))}
                </div>
              </div>
            )}

            {/* 일반 리뷰 - 가게 검색 */}
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-2">
                일반 리뷰 <span className="text-slate-400 font-normal">(가게 검색)</span>
              </label>
              <div className="relative">
                <input
                  type="text"
                  value={storeSearch}
                  onChange={(e) => {
                    setStoreSearch(e.target.value);
                    setShowSearchResults(true);
                  }}
                  onFocus={() => setShowSearchResults(true)}
                  onBlur={() => setTimeout(() => setShowSearchResults(false), 200)}
                  placeholder="가게 이름 검색 (2글자 이상)"
                  className="w-full px-4 py-3 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500"
                />
                {showSearchResults && searchResults.length > 0 && (
                  <div className="absolute z-10 w-full mt-1 bg-white border border-slate-200 rounded-lg shadow-lg max-h-48 overflow-y-auto">
                    {searchResults.map((store) => (
                      <button
                        key={store.id}
                        type="button"
                        onClick={() => selectSearchedStore(store)}
                        className="w-full px-4 py-3 text-left text-sm hover:bg-slate-50 border-b border-slate-100 last:border-b-0"
                      >
                        {store.name}
                      </button>
                    ))}
                  </div>
                )}
                {showSearchResults && storeSearch.length >= 2 && searchResults.length === 0 && (
                  <div className="absolute z-10 w-full mt-1 bg-white border border-slate-200 rounded-lg shadow-lg p-4 text-center text-sm text-slate-500">
                    검색 결과가 없습니다
                  </div>
                )}
              </div>
              <p className="text-xs text-slate-500 mt-1">출근 이력이 없는 가게는 검색해서 선택하세요</p>
            </div>
          </div>
        )}

          {/* Rating */}
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">별점</label>
            <div className="flex items-center gap-3">
              <StarRating rating={rating} onChange={setRating} size="lg" />
              <span className="text-lg font-semibold text-slate-900">{rating}점</span>
            </div>
          </div>

          {/* Content */}
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">리뷰 내용</label>
            <textarea
              value={content}
              onChange={(e) => setContent(e.target.value)}
              placeholder="이 가게에서의 경험을 솔직하게 작성해주세요. (최소 10자)"
              className="w-full px-4 py-3 border border-slate-200 rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-red-500"
              rows={6}
              required
              minLength={10}
            />
            <p className="text-xs text-slate-500 mt-1">{content.length}/10 (최소 10자)</p>
          </div>

          {/* Anonymous Toggle */}
          <label className="flex items-center gap-3 cursor-pointer">
            <input
              type="checkbox"
              checked={isAnonymous}
              onChange={(e) => setIsAnonymous(e.target.checked)}
              className="w-4 h-4 text-red-600 rounded focus:ring-red-500"
            />
            <span className="text-sm text-slate-700">익명으로 작성</span>
          </label>
          <p className="text-xs text-slate-500 -mt-4">
            {isAnonymous
              ? '작성자 이름이 "익명"으로 표시됩니다.'
              : `작성자 이름이 "${user?.name}"으로 표시됩니다.`}
          </p>

          {/* Submit */}
          <button
            type="submit"
            disabled={submitting || (!isEditMode && !selectedStoreId)}
            className="w-full py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-300 disabled:cursor-not-allowed"
          >
            {submitting
              ? '처리 중...'
              : isEditMode ? '리뷰 수정' : '리뷰 작성'}
          </button>
        </form>
    </div>
  );
}
