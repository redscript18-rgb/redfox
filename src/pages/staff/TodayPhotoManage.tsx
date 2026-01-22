import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface DailyPhoto {
  id: number;
  photo_url: string;
  date: string;
  caption: string | null;
  like_count: number;
  created_at: string;
}

export default function TodayPhotoManage() {
  const { user } = useAuth();
  const [todayPhotos, setTodayPhotos] = useState<DailyPhoto[]>([]);
  const [pastPhotos, setPastPhotos] = useState<DailyPhoto[]>([]);
  const [loading, setLoading] = useState(true);
  const [uploading, setUploading] = useState(false);
  const [newCaption, setNewCaption] = useState('');
  const [totalLikes, setTotalLikes] = useState(0);
  const [selectedPhoto, setSelectedPhoto] = useState<DailyPhoto | null>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

  useEffect(() => {
    if (user) {
      fetchPhotos();
    }
  }, [user]);

  const fetchPhotos = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('staff_photos')
      .select('*')
      .eq('staff_id', user.id)
      .order('date', { ascending: false })
      .order('created_at', { ascending: false });

    if (data) {
      const todayData = data.filter(p => p.date === today);
      const pastData = data.filter(p => p.date !== today);
      setTodayPhotos(todayData);
      setPastPhotos(pastData);

      // Calculate total likes
      const total = data.reduce((sum, p) => sum + (p.like_count || 0), 0);
      setTotalLikes(total);
    }

    setLoading(false);
  };

  const handleUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0 || !user) return;

    const remainingSlots = 3 - todayPhotos.length;
    if (remainingSlots <= 0) {
      alert('오늘은 최대 3장까지만 업로드할 수 있습니다.');
      return;
    }

    const filesToUpload = Array.from(files).slice(0, remainingSlots);
    setUploading(true);

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

      await supabase.from('staff_photos').insert({
        staff_id: user.id,
        photo_url: publicUrl,
        date: today,
        caption: newCaption || null,
      });
    }

    setNewCaption('');
    fetchPhotos();
    setUploading(false);
    if (e.target) e.target.value = '';
  };

  const handleDelete = async (photoId: number) => {
    if (!confirm('이 사진을 삭제하시겠습니까?')) return;

    const { error } = await supabase.from('staff_photos').delete().eq('id', photoId);
    if (!error) {
      fetchPhotos();
      setSelectedPhoto(null);
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  const formatTime = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
  };

  // Group past photos by date
  const groupedPastPhotos = pastPhotos.reduce((acc, photo) => {
    if (!acc[photo.date]) acc[photo.date] = [];
    acc[photo.date].push(photo);
    return acc;
  }, {} as Record<string, DailyPhoto[]>);

  const canUploadMore = todayPhotos.length < 3;

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <Link to="/staff/profile" className="text-pink-500 text-sm hover:text-pink-600 mb-1 inline-block">← 프로필 관리</Link>
          <h1 className="text-2xl font-bold text-slate-800">
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-rose-500 to-pink-500">오늘의 사진</span> 관리
          </h1>
        </div>
        <div className="flex items-center gap-2 px-4 py-2 bg-rose-50 rounded-full border border-rose-200">
          <span className="text-rose-500 text-lg">♥</span>
          <span className="text-sm font-medium text-rose-700">총 {totalLikes}개 좋아요</span>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-3 gap-4">
        <div className="p-4 bg-gradient-to-br from-rose-50 to-pink-50 rounded-2xl border border-rose-100 text-center">
          <p className="text-3xl font-bold text-rose-600">{todayPhotos.length}</p>
          <p className="text-sm text-rose-500">오늘 업로드</p>
        </div>
        <div className="p-4 bg-gradient-to-br from-purple-50 to-pink-50 rounded-2xl border border-purple-100 text-center">
          <p className="text-3xl font-bold text-purple-600">{pastPhotos.length}</p>
          <p className="text-sm text-purple-500">총 사진</p>
        </div>
        <div className="p-4 bg-gradient-to-br from-amber-50 to-orange-50 rounded-2xl border border-amber-100 text-center">
          <p className="text-3xl font-bold text-amber-600">{totalLikes}</p>
          <p className="text-sm text-amber-500">총 좋아요</p>
        </div>
      </div>

      {/* Today's Photos */}
      <div className="bg-gradient-to-br from-rose-50 to-pink-50 rounded-3xl border border-rose-100 p-5">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-2">
            <span className="w-8 h-8 bg-rose-100 rounded-lg flex items-center justify-center text-base">📸</span>
            오늘의 사진
            <span className="text-sm font-normal text-rose-400">({todayPhotos.length}/3)</span>
          </h2>
        </div>

        <div className="bg-white/60 rounded-2xl p-4 mb-4">
          <p className="text-sm text-slate-600 mb-1">손님들에게 노출되는 오늘의 사진입니다.</p>
          <p className="text-xs text-rose-400">매일 자정에 리셋되며, 하루 최대 3장까지 업로드할 수 있습니다.</p>
        </div>

        {canUploadMore && (
          <div className="flex gap-2 mb-4">
            <input
              type="text"
              value={newCaption}
              onChange={(e) => setNewCaption(e.target.value)}
              placeholder="사진 설명 (선택)"
              className="flex-1 min-w-0 h-11 px-4 bg-white border border-rose-100 rounded-xl text-sm focus:outline-none focus:border-rose-300"
            />
            <input type="file" ref={inputRef} onChange={handleUpload} accept="image/*" multiple className="hidden" />
            <button
              onClick={() => inputRef.current?.click()}
              disabled={uploading}
              className="px-6 py-2 bg-gradient-to-r from-rose-500 to-pink-500 text-white font-medium rounded-xl shadow-md shadow-rose-200 hover:from-rose-600 hover:to-pink-600 transition-all disabled:opacity-50"
            >
              {uploading ? '업로드 중...' : '사진 올리기'}
            </button>
          </div>
        )}

        {todayPhotos.length > 0 ? (
          <div className="grid grid-cols-3 gap-3 max-sm:grid-cols-2">
            {todayPhotos.map((photo) => (
              <div
                key={photo.id}
                className="relative aspect-square rounded-2xl overflow-hidden shadow-md group cursor-pointer"
                onClick={() => setSelectedPhoto(photo)}
              >
                <img src={photo.photo_url} alt="" className="w-full h-full object-cover" />
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                <div className="absolute bottom-0 left-0 right-0 p-3 text-white opacity-0 group-hover:opacity-100 transition-opacity">
                  <div className="flex items-center justify-between">
                    <span className="flex items-center gap-1 text-sm">
                      <span className="text-red-400">♥</span> {photo.like_count || 0}
                    </span>
                    <span className="text-xs">{formatTime(photo.created_at)}</span>
                  </div>
                  {photo.caption && <p className="text-xs truncate mt-1">{photo.caption}</p>}
                </div>
                {/* Like badge always visible */}
                {(photo.like_count || 0) > 0 && (
                  <div className="absolute top-2 right-2 px-2 py-1 bg-black/50 rounded-full text-white text-xs flex items-center gap-1">
                    <span className="text-red-400">♥</span> {photo.like_count}
                  </div>
                )}
                {/* Delete button on hover */}
                <button
                  onClick={(e) => { e.stopPropagation(); handleDelete(photo.id); }}
                  className="absolute top-2 left-2 w-7 h-7 bg-red-500 text-white text-sm rounded-full opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center"
                >
                  ×
                </button>
              </div>
            ))}
            {/* Upload placeholder */}
            {canUploadMore && (
              <button
                onClick={() => inputRef.current?.click()}
                disabled={uploading}
                className="aspect-square rounded-2xl border-2 border-dashed border-rose-200 flex flex-col items-center justify-center text-rose-300 hover:border-rose-400 hover:text-rose-400 transition-colors"
              >
                <span className="text-3xl mb-1">+</span>
                <span className="text-xs">사진 추가</span>
              </button>
            )}
          </div>
        ) : (
          <div className="text-center py-8">
            <div className="w-16 h-16 bg-rose-100 rounded-full flex items-center justify-center mx-auto mb-3 text-3xl">
              📷
            </div>
            <p className="text-slate-500 mb-4">오늘 업로드한 사진이 없습니다.</p>
            <button
              onClick={() => inputRef.current?.click()}
              disabled={uploading}
              className="px-6 py-3 bg-gradient-to-r from-rose-500 to-pink-500 text-white font-medium rounded-full shadow-md shadow-rose-200 hover:from-rose-600 hover:to-pink-600 transition-all"
            >
              {uploading ? '업로드 중...' : '첫 사진 올리기'}
            </button>
          </div>
        )}
      </div>

      {/* Past Photos */}
      {Object.keys(groupedPastPhotos).length > 0 && (
        <div className="bg-white rounded-3xl border border-slate-100 p-5 shadow-sm">
          <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
            <span className="w-8 h-8 bg-slate-100 rounded-lg flex items-center justify-center text-base">🕐</span>
            지난 사진
          </h2>

          <div className="space-y-6">
            {Object.entries(groupedPastPhotos).slice(0, 7).map(([date, photos]) => (
              <div key={date}>
                <h3 className="text-sm font-medium text-slate-500 mb-3">{formatDate(date)}</h3>
                <div className="grid grid-cols-4 gap-2 max-sm:grid-cols-3">
                  {photos.map((photo) => (
                    <div
                      key={photo.id}
                      className="relative aspect-square rounded-xl overflow-hidden cursor-pointer group"
                      onClick={() => setSelectedPhoto(photo)}
                    >
                      <img src={photo.photo_url} alt="" className="w-full h-full object-cover" />
                      {(photo.like_count || 0) > 0 && (
                        <div className="absolute bottom-1 right-1 px-1.5 py-0.5 bg-black/50 rounded-full text-white text-[10px] flex items-center gap-0.5">
                          <span className="text-red-400">♥</span> {photo.like_count}
                        </div>
                      )}
                      <button
                        onClick={(e) => { e.stopPropagation(); handleDelete(photo.id); }}
                        className="absolute top-1 right-1 w-6 h-6 bg-red-500 text-white text-xs rounded-full opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Photo Detail Modal */}
      {selectedPhoto && (
        <div className="fixed inset-0 bg-black/90 flex items-center justify-center z-50 p-4" onClick={() => setSelectedPhoto(null)}>
          <div className="relative max-w-2xl w-full" onClick={(e) => e.stopPropagation()}>
            <img src={selectedPhoto.photo_url} alt="" className="w-full max-h-[70vh] object-contain rounded-xl" />
            <div className="mt-4 flex items-center justify-between text-white">
              <div>
                <p className="text-sm">{formatDate(selectedPhoto.date)} {formatTime(selectedPhoto.created_at)}</p>
                {selectedPhoto.caption && <p className="text-white/70 text-sm mt-1">{selectedPhoto.caption}</p>}
              </div>
              <div className="flex items-center gap-4">
                <span className="flex items-center gap-1 text-lg">
                  <span className="text-red-400">♥</span> {selectedPhoto.like_count || 0}
                </span>
                <button
                  onClick={() => handleDelete(selectedPhoto.id)}
                  className="px-4 py-2 bg-red-500 text-white text-sm rounded-lg hover:bg-red-600 transition-colors"
                >
                  삭제
                </button>
              </div>
            </div>
            <button
              className="absolute -top-2 -right-2 w-10 h-10 bg-white rounded-full flex items-center justify-center text-slate-600 text-xl shadow-lg hover:bg-slate-100"
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
