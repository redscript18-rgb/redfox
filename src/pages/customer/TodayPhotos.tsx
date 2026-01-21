import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface DailyPhoto {
  id: number;
  staff_id: string;
  staff_name: string;
  staff_photo: string | null;
  store_name: string;
  photo_url: string;
  caption: string | null;
  created_at: string;
  isVirtual: boolean;
  isFavorite: boolean;
}

export default function TodayPhotos() {
  const { user } = useAuth();
  const [photos, setPhotos] = useState<DailyPhoto[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedPhoto, setSelectedPhoto] = useState<DailyPhoto | null>(null);
  const [filter, setFilter] = useState<'all' | 'favorites'>('all');

  useEffect(() => {
    fetchPhotos();
  }, [user]);

  const fetchPhotos = async () => {
    // 테스트 기간: 날짜 필터 비활성화
    // const now = new Date();
    // const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

    // Fetch favorites
    let favIds = new Set<string>();
    if (user) {
      const { data: favData } = await supabase
        .from('favorites')
        .select('target_staff_id, target_virtual_staff_id')
        .eq('user_id', user.id)
        .in('target_type', ['staff', 'virtual_staff']);

      if (favData) {
        favData.forEach(f => {
          if (f.target_staff_id) favIds.add(f.target_staff_id);
          if (f.target_virtual_staff_id) favIds.add(f.target_virtual_staff_id);
        });
      }
    }

    // Fetch real staff photos - 테스트 기간: 날짜 필터 제거
    const { data: realPhotos } = await supabase
      .from('staff_photos')
      .select(`
        id,
        staff_id,
        photo_url,
        caption,
        created_at,
        staff:profiles(id, name, profile_photo_url)
      `)
      // .eq('date', today) // 테스트 기간 동안 비활성화
      .order('created_at', { ascending: false });

    // Fetch virtual staff photos - 테스트 기간: 날짜 필터 제거
    const { data: virtualPhotos } = await supabase
      .from('virtual_staff_photos')
      .select(`
        id,
        virtual_staff_id,
        photo_url,
        caption,
        created_at,
        virtual_staff:virtual_staff(id, name, profile_photo_url, store:stores(name))
      `)
      // .eq('date', today) // 테스트 기간 동안 비활성화
      .order('created_at', { ascending: false });

    const allPhotos: DailyPhoto[] = [];

    // Process real staff photos
    realPhotos?.forEach(p => {
      const staff = Array.isArray(p.staff) ? p.staff[0] : p.staff;
      if (staff) {
        allPhotos.push({
          id: p.id,
          staff_id: p.staff_id,
          staff_name: (staff as { name: string }).name,
          staff_photo: (staff as { profile_photo_url: string | null }).profile_photo_url,
          store_name: '',
          photo_url: p.photo_url,
          caption: p.caption,
          created_at: p.created_at,
          isVirtual: false,
          isFavorite: favIds.has(p.staff_id),
        });
      }
    });

    // Process virtual staff photos
    virtualPhotos?.forEach(p => {
      const vs = Array.isArray(p.virtual_staff) ? p.virtual_staff[0] : p.virtual_staff;
      if (vs) {
        const vsTyped = vs as { name: string; profile_photo_url: string | null; store: { name: string }[] | { name: string } | null };
        const storeData = vsTyped.store;
        const storeName = Array.isArray(storeData) ? storeData[0]?.name : storeData?.name;
        allPhotos.push({
          id: p.id + 100000,
          staff_id: p.virtual_staff_id,
          staff_name: vsTyped.name,
          staff_photo: vsTyped.profile_photo_url,
          store_name: storeName || '',
          photo_url: p.photo_url,
          caption: p.caption,
          created_at: p.created_at,
          isVirtual: true,
          isFavorite: favIds.has(p.virtual_staff_id),
        });
      }
    });

    // Sort: favorites first, then by created_at
    allPhotos.sort((a, b) => {
      if (a.isFavorite !== b.isFavorite) return b.isFavorite ? 1 : -1;
      return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
    });

    setPhotos(allPhotos);
    setLoading(false);
  };

  const formatTime = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
  };

  const filteredPhotos = filter === 'favorites'
    ? photos.filter(p => p.isFavorite)
    : photos;

  if (loading) {
    return <div className="text-slate-500 py-8 text-center">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 홈</Link>

      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">오늘의 사진</h1>
          <p className="text-slate-500 text-sm mt-1">매니저들이 올린 오늘의 사진 ({photos.length}장)</p>
        </div>
      </div>

      {/* Filter */}
      <div className="flex gap-2 mb-6">
        <button
          onClick={() => setFilter('all')}
          className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
            filter === 'all'
              ? 'bg-red-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
        >
          전체 ({photos.length})
        </button>
        <button
          onClick={() => setFilter('favorites')}
          className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
            filter === 'favorites'
              ? 'bg-red-600 text-white'
              : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
          }`}
        >
          즐겨찾기 ({photos.filter(p => p.isFavorite).length})
        </button>
      </div>

      {filteredPhotos.length === 0 ? (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">
            {filter === 'favorites' ? '즐겨찾기한 매니저의 사진이 없습니다.' : '오늘 올라온 사진이 없습니다.'}
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
          {filteredPhotos.map((photo) => (
            <div
              key={`${photo.isVirtual ? 'v' : 'r'}-${photo.id}`}
              className={`relative group rounded-xl overflow-hidden border cursor-pointer hover:border-red-600 transition-all ${
                photo.isFavorite ? 'border-red-300' : 'border-slate-200'
              }`}
              onClick={() => setSelectedPhoto(photo)}
            >
              <img
                src={photo.photo_url}
                alt={photo.caption || '오늘의 사진'}
                className="w-full aspect-square object-cover group-hover:scale-105 transition-transform"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent" />
              <div className="absolute bottom-0 left-0 right-0 p-3">
                <div className="flex items-center gap-2 mb-1">
                  <div className="w-7 h-7 rounded-full bg-white overflow-hidden flex-shrink-0">
                    {photo.staff_photo ? (
                      <img src={photo.staff_photo} alt={photo.staff_name} className="w-full h-full object-cover" />
                    ) : (
                      <div className="w-full h-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white text-xs font-bold">
                        {photo.staff_name.charAt(0)}
                      </div>
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <span className="text-white text-sm font-medium truncate block">{photo.staff_name}</span>
                    {photo.store_name && (
                      <span className="text-white/70 text-xs truncate block">{photo.store_name}</span>
                    )}
                  </div>
                  {photo.isFavorite && <span className="text-red-400">♥</span>}
                </div>
                {photo.caption && (
                  <p className="text-white/80 text-xs truncate">{photo.caption}</p>
                )}
                <p className="text-white/50 text-xs mt-1">{formatTime(photo.created_at)}</p>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Photo Viewer Modal */}
      {selectedPhoto && (
        <div
          className="fixed inset-0 bg-black/90 flex items-center justify-center z-50 p-4"
          onClick={() => setSelectedPhoto(null)}
        >
          <div className="relative max-w-4xl w-full" onClick={(e) => e.stopPropagation()}>
            <img
              src={selectedPhoto.photo_url}
              alt={selectedPhoto.caption || '사진'}
              className="w-full max-h-[80vh] object-contain rounded-xl"
            />
            <div className="mt-4 text-center">
              <Link
                to={selectedPhoto.isVirtual ? `/virtual-staff/${selectedPhoto.staff_id}` : `/staff/${selectedPhoto.staff_id}`}
                className="inline-flex items-center gap-2 text-white hover:text-orange-400 transition-colors"
                onClick={(e) => e.stopPropagation()}
              >
                <div className="w-8 h-8 rounded-full bg-white overflow-hidden">
                  {selectedPhoto.staff_photo ? (
                    <img src={selectedPhoto.staff_photo} alt={selectedPhoto.staff_name} className="w-full h-full object-cover" />
                  ) : (
                    <div className="w-full h-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white text-sm font-bold">
                      {selectedPhoto.staff_name.charAt(0)}
                    </div>
                  )}
                </div>
                <span className="font-medium">{selectedPhoto.staff_name}</span>
                <span className="text-white/50">→ 프로필 보기</span>
              </Link>
              {selectedPhoto.caption && (
                <p className="text-white/80 mt-2">{selectedPhoto.caption}</p>
              )}
            </div>
            <button
              className="absolute -top-2 -right-2 w-10 h-10 bg-white rounded-full flex items-center justify-center text-slate-600 text-xl hover:bg-slate-100 shadow-lg"
              onClick={() => setSelectedPhoto(null)}
            >
              ×
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
