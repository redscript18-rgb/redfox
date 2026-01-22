import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface DailyPhoto {
  id: number;
  photo_url: string;
  caption: string | null;
  like_count?: number;
}

interface Store {
  id: number;
  name: string;
  address: string;
}

interface Schedule {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  status: string;
  store?: { name: string };
}

interface Reservation {
  id: number;
  store_id: number;
  date: string;
  start_time: string;
  status: string;
  menu?: { name: string };
  store?: { name: string };
}

interface BestReview {
  id: number;
  rating: number;
  view_count?: number;
  store?: { name: string };
  like_count: number;
}

interface BestPost {
  id: number;
  title: string;
  view_count: number;
  like_count: number;
}

export default function StaffDashboard() {
  const { user } = useAuth();
  const [myStores, setMyStores] = useState<Store[]>([]);
  const [myTodaySchedules, setMyTodaySchedules] = useState<Schedule[]>([]);
  const [myTodayReservations, setMyTodayReservations] = useState<Reservation[]>([]);
  const [myStoreDemand, setMyStoreDemand] = useState<Record<number, number>>({});
  const [pendingRequests, setPendingRequests] = useState(0);
  const [bestReviews, setBestReviews] = useState<BestReview[]>([]);
  const [bestPosts, setBestPosts] = useState<BestPost[]>([]);
  const [todayPhotos, setTodayPhotos] = useState<DailyPhoto[]>([]);
  const [uploadingPhoto, setUploadingPhoto] = useState(false);
  const [favoriteCount, setFavoriteCount] = useState(0);
  const [loading, setLoading] = useState(true);
  const dailyInputRef = useRef<HTMLInputElement>(null);
  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchData();
      fetchBestContent();
      fetchTodayPhotos();
      fetchFavoriteCount();
    }
  }, [user]);

  const fetchFavoriteCount = async () => {
    if (!user) return;

    const { count } = await supabase
      .from('favorites')
      .select('*', { count: 'exact', head: true })
      .eq('target_type', 'staff')
      .eq('target_staff_id', user.id);

    setFavoriteCount(count || 0);
  };

  const fetchTodayPhotos = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('staff_photos')
      .select('id, photo_url, caption')
      .eq('staff_id', user.id)
      .eq('date', today)
      .order('created_at', { ascending: false });

    setTodayPhotos(data || []);
  };

  const handleDailyPhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0 || !user) return;

    const remainingSlots = 3 - todayPhotos.length;
    if (remainingSlots <= 0) {
      alert('오늘은 최대 3장까지만 업로드할 수 있습니다.');
      return;
    }

    const filesToUpload = Array.from(files).slice(0, remainingSlots);

    setUploadingPhoto(true);

    for (const file of filesToUpload) {
      if (file.size > 5 * 1024 * 1024) {
        alert(`${file.name}: 파일 크기는 5MB 이하여야 합니다.`);
        continue;
      }

      const fileExt = file.name.split('.').pop();
      const fileName = `daily_${user.id}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}.${fileExt}`;
      const filePath = `daily/${fileName}`;

      const { error: uploadError } = await supabase.storage
        .from('staff-photos')
        .upload(filePath, file);

      if (uploadError) {
        console.error('업로드 오류:', uploadError.message);
        continue;
      }

      const { data: { publicUrl } } = supabase.storage
        .from('staff-photos')
        .getPublicUrl(filePath);

      await supabase
        .from('staff_photos')
        .insert({
          staff_id: user.id,
          photo_url: publicUrl,
          date: today,
          caption: null,
        });
    }

    fetchTodayPhotos();
    setUploadingPhoto(false);
    if (e.target) e.target.value = '';
  };

  const fetchData = async () => {
    if (!user) return;

    const { data: storeStaff } = await supabase
      .from('store_staff')
      .select('store_id')
      .eq('staff_id', user.id);

    const myStoreIds = storeStaff?.map(s => s.store_id) || [];

    if (myStoreIds.length > 0) {
      const { data: storesData } = await supabase
        .from('stores')
        .select('*')
        .in('id', myStoreIds);
      setMyStores(storesData || []);

      // Fetch demand only for my stores
      const demand: Record<number, number> = {};
      for (const storeId of myStoreIds) {
        const { count } = await supabase
          .from('reservations')
          .select('*', { count: 'exact', head: true })
          .eq('store_id', storeId)
          .eq('date', today)
          .neq('status', 'cancelled');
        demand[storeId] = count || 0;
      }
      setMyStoreDemand(demand);
    }

    const { data: schedulesData } = await supabase
      .from('schedules')
      .select(`*, store:stores(name)`)
      .eq('staff_id', user.id)
      .eq('date', today)
      .eq('status', 'approved');
    setMyTodaySchedules(schedulesData || []);

    const { data: reservationsData } = await supabase
      .from('reservations')
      .select(`*, menu:menus(name), store:stores(name)`)
      .eq('staff_id', user.id)
      .eq('date', today)
      .neq('status', 'cancelled');
    setMyTodayReservations(reservationsData || []);

    const { count: pendingCount } = await supabase
      .from('work_requests')
      .select('*', { count: 'exact', head: true })
      .eq('staff_id', user.id)
      .eq('status', 'pending');
    setPendingRequests(pendingCount || 0);

    setLoading(false);
  };

  const fetchBestContent = async () => {
    // Fetch best reviews (weekly)
    const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();

    const { data: reviewsData } = await supabase
      .from('store_reviews')
      .select('id, rating, view_count, store:stores(name)')
      .gte('created_at', weekAgo);

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

      const reviewsWithScore = reviewsData.map(r => ({
        ...r,
        like_count: likeMap[r.id] || 0,
        score: (r.view_count || 0) + ((likeMap[r.id] || 0) * 3)
      }));

      const sorted = reviewsWithScore.sort((a, b) => b.score - a.score);
      setBestReviews(sorted.slice(0, 3) as unknown as BestReview[]);
    }

    // Fetch best posts (weekly)
    const { data: postsData } = await supabase
      .from('info_posts')
      .select('id, title, view_count')
      .gte('created_at', weekAgo);

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

      const postsWithScore = postsData.map(p => ({
        ...p,
        like_count: likeMap[p.id] || 0,
        score: (p.view_count || 0) + ((likeMap[p.id] || 0) * 3)
      }));

      const sorted = postsWithScore.sort((a, b) => b.score - a.score);
      setBestPosts(sorted.slice(0, 3) as BestPost[]);
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-slate-800">
            안녕하세요, <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">{user?.name}</span>님
          </h1>
          <p className="text-slate-500 mt-1">{now.getMonth() + 1}월 {now.getDate()}일 {['일', '월', '화', '수', '목', '금', '토'][now.getDay()]}요일</p>
        </div>
        <div className="flex items-center gap-2 px-4 py-2 bg-rose-50 rounded-full border border-rose-200">
          <span className="text-rose-500 text-lg">♥</span>
          <span className="text-sm font-medium text-rose-700">{favoriteCount}명이 고정</span>
        </div>
      </div>

      {/* Alert Badge */}
      {pendingRequests > 0 && (
        <Link to="/staff/work-requests" className="flex items-center gap-3 px-5 py-4 bg-gradient-to-r from-amber-400 to-orange-400 text-white rounded-2xl shadow-md shadow-orange-200">
          <span className="w-8 h-8 bg-white/20 rounded-full flex items-center justify-center text-lg font-bold">{pendingRequests}</span>
          <span className="font-medium">출근 요청이 대기 중이에요</span>
          <span className="ml-auto text-xl">→</span>
        </Link>
      )}

      {/* Today's Photo Section */}
      <div className="bg-gradient-to-br from-rose-50 to-pink-50 rounded-3xl border border-rose-100 p-5">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span>📸</span> 오늘의 사진
            <span className="text-sm font-normal text-rose-400">({todayPhotos.length}/3)</span>
          </h2>
          <Link to="/staff/today-photos" className="text-sm text-rose-500 hover:text-rose-600 font-medium">관리 →</Link>
        </div>

        {todayPhotos.length > 0 ? (
          <div className="flex gap-3 mb-4">
            {todayPhotos.map((photo) => (
              <div key={photo.id} className="relative w-20 h-20 rounded-xl overflow-hidden shadow-sm">
                <img src={photo.photo_url} alt="" className="w-full h-full object-cover" />
                {(photo.like_count || 0) > 0 && (
                  <div className="absolute bottom-0 left-0 right-0 px-1 py-0.5 bg-black/50 text-white text-xs flex items-center justify-center gap-0.5">
                    <span className="text-red-400">♥</span> {photo.like_count}
                  </div>
                )}
              </div>
            ))}
            {todayPhotos.length < 3 && (
              <button
                onClick={() => dailyInputRef.current?.click()}
                disabled={uploadingPhoto}
                className="w-20 h-20 rounded-xl border-2 border-dashed border-rose-200 flex items-center justify-center text-rose-300 hover:border-rose-400 hover:text-rose-400 transition-colors"
              >
                {uploadingPhoto ? (
                  <span className="text-xs">...</span>
                ) : (
                  <span className="text-2xl">+</span>
                )}
              </button>
            )}
          </div>
        ) : (
          <div className="text-center py-4">
            <p className="text-slate-500 mb-3 text-sm">오늘의 모습을 공유해보세요!</p>
            <button
              onClick={() => dailyInputRef.current?.click()}
              disabled={uploadingPhoto}
              className="inline-flex items-center gap-2 px-5 py-2.5 bg-gradient-to-r from-rose-500 to-pink-500 text-white font-medium rounded-full shadow-md shadow-rose-200 hover:from-rose-600 hover:to-pink-600 transition-all disabled:opacity-50"
            >
              {uploadingPhoto ? (
                '업로드 중...'
              ) : (
                <>
                  <span>📷</span> 사진 올리기
                </>
              )}
            </button>
          </div>
        )}

        <input
          type="file"
          ref={dailyInputRef}
          onChange={handleDailyPhotoUpload}
          accept="image/*"
          multiple
          className="hidden"
        />

        <p className="text-xs text-rose-400 text-center">손님들이 오늘의 사진을 볼 수 있어요 • 자정에 리셋됩니다</p>
      </div>

      {/* Today's Schedule Card */}
      <div className="bg-gradient-to-br from-pink-50 to-purple-50 rounded-3xl border border-pink-100 p-5">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span>📅</span> 오늘 스케줄
          </h2>
          <Link to="/staff/schedule" className="text-sm text-pink-500 hover:text-pink-600 font-medium">관리 →</Link>
        </div>

        {myTodaySchedules.length > 0 ? (
          <div className="space-y-3">
            {myTodaySchedules.map((schedule) => (
              <div key={schedule.id} className="flex items-center justify-between p-4 bg-white rounded-2xl shadow-sm">
                <span className="font-medium text-slate-800">{schedule.store?.name}</span>
                <span className="text-pink-500 font-semibold">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</span>
              </div>
            ))}
          </div>
        ) : (
          <div className="text-center py-6">
            <p className="text-slate-500 mb-4">오늘 등록된 출근이 없어요</p>
            <Link to="/staff/schedule" className="inline-block px-6 py-3 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-medium rounded-full shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all">
              출근 등록하기
            </Link>
          </div>
        )}
      </div>

      {/* Today's Reservations */}
      {myTodayReservations.length > 0 && (
        <div className="bg-white rounded-3xl border border-pink-100 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
              <span>💆‍♀️</span> 오늘 예약
            </h2>
            <Link to="/staff/reservations" className="text-sm text-pink-500 hover:text-pink-600 font-medium">{myTodayReservations.length}건 →</Link>
          </div>
          <div className="space-y-2">
            {myTodayReservations.slice(0, 3).map((reservation) => (
              <div key={reservation.id} className="flex items-center justify-between p-3 bg-pink-50/50 rounded-xl">
                <div className="flex items-center gap-3">
                  <span className="text-xl font-bold text-pink-500">{reservation.start_time.slice(0, 5)}</span>
                  <span className="text-slate-600 text-sm">{reservation.menu?.name}</span>
                </div>
                <span className={`px-3 py-1 rounded-full text-xs font-medium ${
                  reservation.status === 'confirmed' ? 'bg-green-100 text-green-600' : 'bg-amber-100 text-amber-600'
                }`}>
                  {reservation.status === 'confirmed' ? '확정' : '대기'}
                </span>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* My Stores */}
      {myStores.length > 0 && (
        <div>
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
              <span>🏠</span> 내 가게
            </h2>
            <Link to="/staff/stores" className="text-sm text-pink-500 hover:text-pink-600 font-medium">더보기 →</Link>
          </div>
          <div className="space-y-3">
            {myStores.map((store) => {
              const todayCount = myStoreDemand[store.id] || 0;
              const hasSchedule = myTodaySchedules.some((s) => s.store_id === store.id);

              return (
                <div key={store.id} className="flex items-center justify-between p-4 bg-white rounded-2xl border border-pink-100 shadow-sm hover:shadow-md hover:border-pink-200 transition-all">
                  <div>
                    <h3 className="font-medium text-slate-800">{store.name}</h3>
                    <p className="text-sm text-slate-400 mt-0.5">오늘 예약 {todayCount}건</p>
                  </div>
                  {hasSchedule ? (
                    <span className="px-4 py-2 bg-green-100 text-green-600 text-sm font-medium rounded-full">출근 예정</span>
                  ) : (
                    <Link to={`/staff/schedule?store=${store.id}`} className="px-4 py-2 bg-gradient-to-r from-pink-500 to-rose-500 text-white text-sm font-medium rounded-full hover:from-pink-600 hover:to-rose-600 transition-all shadow-sm shadow-pink-200">
                      출근 등록
                    </Link>
                  )}
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Best Content - 라운지 */}
      {(bestReviews.length > 0 || bestPosts.length > 0) && (
        <div>
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
              <span>🔥</span> 주간 베스트
            </h2>
            <Link to="/staff/community" className="text-sm text-pink-500 hover:text-pink-600 font-medium">라운지 →</Link>
          </div>

          <div className="bg-white rounded-2xl border border-purple-100 overflow-hidden shadow-sm">
            {bestReviews.slice(0, 2).map((review, index) => (
              <Link
                key={`review-${review.id}`}
                to={`/staff/reviews/${review.id}`}
                className="flex items-center gap-3 p-4 hover:bg-purple-50/50 transition-colors border-b border-purple-50 last:border-b-0"
              >
                <span className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold ${
                  index === 0 ? 'bg-yellow-100 text-yellow-700' : 'bg-slate-100 text-slate-600'
                }`}>
                  {index + 1}
                </span>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-slate-800 truncate">
                    <span className="text-yellow-500 mr-1">★{review.rating}</span>
                    {(review.store as { name: string })?.name}
                  </p>
                  <p className="text-xs text-slate-400">가게 리뷰</p>
                </div>
                <span className="text-sm text-rose-500 font-medium">♥ {review.like_count}</span>
              </Link>
            ))}
            {bestPosts.slice(0, 2).map((post, index) => (
              <Link
                key={`post-${post.id}`}
                to={`/staff/community/board/${post.id}`}
                className="flex items-center gap-3 p-4 hover:bg-purple-50/50 transition-colors border-b border-purple-50 last:border-b-0"
              >
                <span className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold ${
                  index === 0 ? 'bg-pink-100 text-pink-700' : 'bg-slate-100 text-slate-600'
                }`}>
                  {index + 1}
                </span>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-slate-800 truncate">{post.title}</p>
                  <p className="text-xs text-slate-400">자유게시판</p>
                </div>
                <span className="text-sm text-rose-500 font-medium">♥ {post.like_count}</span>
              </Link>
            ))}
          </div>
        </div>
      )}

      {/* Quick Links */}
      <div className="grid grid-cols-2 gap-4">
        <Link to="/staff/stores" className="p-5 bg-white rounded-2xl border border-pink-100 hover:shadow-md hover:border-pink-200 transition-all text-center">
          <div className="w-12 h-12 bg-pink-100 rounded-xl flex items-center justify-center mb-3 mx-auto text-2xl">
            🏪
          </div>
          <span className="font-medium text-slate-800">가게 탐색</span>
          <p className="text-xs text-slate-400 mt-1">새로운 가게 찾기</p>
        </Link>
        <Link to="/staff/community" className="p-5 bg-white rounded-2xl border border-purple-100 hover:shadow-md hover:border-purple-200 transition-all text-center">
          <div className="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center mb-3 mx-auto text-2xl">
            💬
          </div>
          <span className="font-medium text-slate-800">라운지</span>
          <p className="text-xs text-slate-400 mt-1">매니저들과 소통</p>
        </Link>
      </div>
    </div>
  );
}
