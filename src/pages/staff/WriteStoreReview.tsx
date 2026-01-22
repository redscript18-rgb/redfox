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
}

interface Review {
  id: number;
  store_id: number;
  rating: number;
  content: string;
  is_anonymous: boolean;
}

export default function WriteStoreReview() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const isEditMode = !!id;

  const [stores, setStores] = useState<ReviewableStore[]>([]);
  const [selectedStoreId, setSelectedStoreId] = useState<number | null>(null);
  const [rating, setRating] = useState(5);
  const [content, setContent] = useState('');
  const [isAnonymous, setIsAnonymous] = useState(false);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [existingReview, setExistingReview] = useState<Review | null>(null);

  useEffect(() => {
    if (user) {
      if (isEditMode) {
        fetchReview();
      } else {
        fetchReviewableStores();
      }
    }
  }, [user, id]);

  const fetchReviewableStores = async () => {
    if (!user) return;

    const { data, error } = await supabase.rpc('get_reviewable_stores', {
      p_user_id: user.id
    });

    if (error) {
      console.error('Error fetching reviewable stores:', error);
      // Fallback: fetch stores from schedules
      const { data: scheduleStores } = await supabase
        .from('schedules')
        .select('store_id, stores(id, name, address)')
        .eq('staff_id', user.id)
        .eq('status', 'approved');

      const storeMap = new Map<number, ReviewableStore>();
      scheduleStores?.forEach(s => {
        const storeData = s.stores as unknown as { id: number; name: string; address: string } | null;
        if (storeData && !storeMap.has(s.store_id)) {
          storeMap.set(s.store_id, {
            store_id: storeData.id,
            store_name: storeData.name,
            store_address: storeData.address || '',
            work_count: 1,
            has_review: false
          });
        }
      });

      // Check for existing reviews
      if (storeMap.size > 0) {
        const storeIds = Array.from(storeMap.keys());
        const { data: reviews } = await supabase
          .from('store_reviews')
          .select('store_id')
          .eq('author_id', user.id)
          .in('store_id', storeIds);

        reviews?.forEach(r => {
          const store = storeMap.get(r.store_id);
          if (store) {
            store.has_review = true;
          }
        });
      }

      setStores(Array.from(storeMap.values()));
    } else {
      setStores(data || []);
    }

    setLoading(false);
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

  const availableStores = stores.filter(s => !s.has_review);

  return (
    <div>
      <Link to="/staff/reviews" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 리뷰 목록</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-6">
        {isEditMode ? '리뷰 수정' : '리뷰 작성'}
      </h1>

      {!isEditMode && availableStores.length === 0 && (
        <div className="p-6 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500 mb-2">리뷰를 작성할 수 있는 가게가 없습니다.</p>
          <p className="text-sm text-slate-400">출근 이력이 있는 가게에만 리뷰를 작성할 수 있습니다.</p>
        </div>
      )}

      {(isEditMode || availableStores.length > 0) && (
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
          ) : (
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-2">가게 선택</label>
              <select
                value={selectedStoreId || ''}
                onChange={(e) => setSelectedStoreId(e.target.value ? parseInt(e.target.value) : null)}
                className="w-full px-4 py-3 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500"
                required
              >
                <option value="">가게를 선택하세요</option>
                {availableStores.map((store) => (
                  <option key={store.store_id} value={store.store_id}>
                    {store.store_name} (출근 {store.work_count}회)
                  </option>
                ))}
              </select>
              <p className="text-xs text-slate-500 mt-1">출근 이력이 있는 가게만 표시됩니다.</p>
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
      )}
    </div>
  );
}
