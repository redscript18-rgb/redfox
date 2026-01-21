import { useState, useEffect, useRef } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

interface VirtualStaff {
  id: string;
  store_id: number;
  name: string;
  phone: string | null;
  bio: string | null;
  specialties: string[] | null;
  profile_photo_url: string | null;
  age: number | null;
  height: number | null;
  weight: number | null;
  body_size: string | null;
  job: string | null;
  mbti: string | null;
  is_smoker: boolean | null;
  personality: string | null;
  style: string | null;
  skin_tone: string | null;
  hair_length: string | null;
  hair_style: string | null;
  hair_color: string | null;
  is_waxed: boolean | null;
  created_by_admin_id: string | null;
  nationalities: string[] | null;
  languages: string[] | null;
  store?: { name: string; address: string };
}

interface DailyPhoto {
  id: number;
  photo_url: string;
  date: string;
  caption: string | null;
}

interface GalleryPhoto {
  id: number;
  photo_url: string;
  sort_order: number;
}

interface Store {
  id: number;
  name: string;
}

interface Menu {
  id: number;
  name: string;
  price: number;
  description: string | null;
}

interface Schedule {
  id: number;
  virtual_staff_id: string;
  store_id: number;
  date: string;
  start_time: string;
  end_time: string;
  store?: { name: string; address: string };
}

export default function VirtualStaffDetail() {
  const { id } = useParams<{ id: string }>();
  const { user } = useAuth();
  const [staff, setStaff] = useState<VirtualStaff | null>(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [canEdit, setCanEdit] = useState(false);
  const [availableStores, setAvailableStores] = useState<Store[]>([]);
  const [showStoreModal, setShowStoreModal] = useState(false);
  const [selectedStoreId, setSelectedStoreId] = useState<number | null>(null);
  const [uploadingPhoto, setUploadingPhoto] = useState(false);
  const [showReservationModal, setShowReservationModal] = useState(false);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [dailyPhotos, setDailyPhotos] = useState<DailyPhoto[]>([]);
  const [uploadingDaily, setUploadingDaily] = useState(false);
  const [newPhotoCaption, setNewPhotoCaption] = useState('');
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [showScheduleModal, setShowScheduleModal] = useState(false);
  const [newScheduleDate, setNewScheduleDate] = useState('');
  const [newScheduleStartTime, setNewScheduleStartTime] = useState('10:00');
  const [newScheduleEndTime, setNewScheduleEndTime] = useState('22:00');
  const [savingSchedule, setSavingSchedule] = useState(false);
  const [selectedScheduleId, setSelectedScheduleId] = useState<number | null>(null);
  const [selectedPhotoIndex, setSelectedPhotoIndex] = useState<number | null>(null);
  const [selectedPhotoList, setSelectedPhotoList] = useState<{ id: number; photo_url: string; caption: string | null }[]>([]);
  const [isFavorite, setIsFavorite] = useState(false);
  const [staffRating, setStaffRating] = useState<{ avgRating: number | null; avgServiceRating: number | null; totalCount: number }>({ avgRating: null, avgServiceRating: null, totalCount: 0 });
  const [reservationCounts, setReservationCounts] = useState<Record<number, number>>({});
  const [galleryPhotos, setGalleryPhotos] = useState<GalleryPhoto[]>([]);
  const [uploadingGallery, setUploadingGallery] = useState(false);
  const galleryInputRef = useRef<HTMLInputElement>(null);

  // Form state
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [bio, setBio] = useState('');
  const [specialties, setSpecialties] = useState<string[]>([]);
  const [newSpecialty, setNewSpecialty] = useState('');
  const [age, setAge] = useState<number | ''>('');
  const [height, setHeight] = useState<number | ''>('');
  const [weight, setWeight] = useState<number | ''>('');
  const [bodySize, setBodySize] = useState('');
  const [job, setJob] = useState('');
  const [mbti, setMbti] = useState('');
  const [isSmoker, setIsSmoker] = useState(false);
  const [personality, setPersonality] = useState('');
  const [style, setStyle] = useState('');
  const [skinTone, setSkinTone] = useState('');
  const [hairLength, setHairLength] = useState('');
  const [hairStyle, setHairStyle] = useState('');
  const [hairColor, setHairColor] = useState('');
  const [isWaxed, setIsWaxed] = useState(false);
  const [profilePhotoUrl, setProfilePhotoUrl] = useState<string | null>(null);

  const profileInputRef = useRef<HTMLInputElement>(null);
  const dailyInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (id) {
      fetchData();
      fetchDailyPhotos();
      fetchGalleryPhotos();
      fetchSchedules();
      fetchRatings();
      if (user) checkFavorite();
    }
  }, [id, user]);

  const checkFavorite = async () => {
    if (!user || !id) return;
    const { data } = await supabase.from('favorites').select('id').eq('user_id', user.id).eq('target_type', 'virtual_staff').eq('target_virtual_staff_id', id).maybeSingle();
    setIsFavorite(!!data);
  };

  const toggleFavorite = async () => {
    if (!user || !id) return;
    if (isFavorite) {
      await supabase.from('favorites').delete().eq('user_id', user.id).eq('target_type', 'virtual_staff').eq('target_virtual_staff_id', id);
      setIsFavorite(false);
    } else {
      await supabase.from('favorites').insert({ user_id: user.id, target_type: 'virtual_staff', target_virtual_staff_id: id });
      setIsFavorite(true);
    }
  };

  const fetchRatings = async () => {
    if (!id) return;
    const { data: ratingsData } = await supabase
      .from('ratings')
      .select('rating, service_rating')
      .eq('target_virtual_staff_id', id)
      .eq('target_type', 'staff');

    if (ratingsData && ratingsData.length > 0) {
      const ratingValues = ratingsData.map(r => r.rating).filter(r => r !== null);
      const serviceValues = ratingsData.map(r => r.service_rating).filter(r => r !== null);
      setStaffRating({
        avgRating: ratingValues.length > 0 ? ratingValues.reduce((a, b) => a + b, 0) / ratingValues.length : null,
        avgServiceRating: serviceValues.length > 0 ? serviceValues.reduce((a, b) => a + b, 0) / serviceValues.length : null,
        totalCount: ratingsData.length,
      });
    }
  };

  const fetchData = async () => {
    if (!id) return;

    const { data } = await supabase
      .from('virtual_staff')
      .select('*, store:stores(name, address, store_type)')
      .eq('id', id)
      .single();

    if (data) {
      // Check if store type is hidden (only for customer view)
      if (user?.role === 'customer') {
        const storeData = data.store as unknown as { name: string; address: string; store_type?: string } | null;
        if (storeData?.store_type) {
          const { data: visibilityData } = await supabase
            .from('store_type_visibility')
            .select('is_visible')
            .eq('store_type', storeData.store_type)
            .single();

          if (visibilityData && !visibilityData.is_visible) {
            // Store type is hidden - don't show this virtual staff
            setLoading(false);
            return;
          }
        }
      }
      setStaff(data);
      setName(data.name || '');
      setPhone(data.phone || '');
      setBio(data.bio || '');
      setSpecialties(data.specialties || []);
      setAge(data.age || '');
      setHeight(data.height || '');
      setWeight(data.weight || '');
      setBodySize(data.body_size || '');
      setJob(data.job || '');
      setMbti(data.mbti || '');
      setIsSmoker(data.is_smoker || false);
      setPersonality(data.personality || '');
      setStyle(data.style || '');
      setSkinTone(data.skin_tone || '');
      setHairLength(data.hair_length || '');
      setHairStyle(data.hair_style || '');
      setHairColor(data.hair_color || '');
      setIsWaxed(data.is_waxed || false);
      setProfilePhotoUrl(data.profile_photo_url || null);

      // Check edit permission
      if (user) {
        if (data.created_by_admin_id === user.id) {
          setCanEdit(true);
        } else {
          const { data: storeData } = await supabase
            .from('stores')
            .select('owner_id')
            .eq('id', data.store_id)
            .single();

          if (storeData?.owner_id === user.id) {
            setCanEdit(true);
          } else {
            const { data: adminData } = await supabase
              .from('store_admins')
              .select('id')
              .eq('store_id', data.store_id)
              .eq('admin_id', user.id)
              .maybeSingle();

            if (adminData) setCanEdit(true);
          }
        }
      }

      // Fetch menus for reservation
      const { data: menuData } = await supabase
        .from('menus')
        .select('*')
        .eq('store_id', data.store_id);
      setMenus(menuData || []);
    }

    setLoading(false);
  };

  const fetchDailyPhotos = async () => {
    if (!id) return;

    const { data } = await supabase
      .from('virtual_staff_photos')
      .select('*')
      .eq('virtual_staff_id', id)
      .order('date', { ascending: false })
      .limit(20);

    setDailyPhotos(data || []);
  };

  const fetchGalleryPhotos = async () => {
    if (!id) return;

    const { data } = await supabase
      .from('virtual_staff_gallery')
      .select('*')
      .eq('virtual_staff_id', id)
      .order('sort_order', { ascending: true });

    setGalleryPhotos(data || []);
  };

  const handleGalleryPhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0 || !id) return;

    const remainingSlots = 3 - galleryPhotos.length;
    if (remainingSlots <= 0) {
      alert('프로필 사진은 최대 3장까지 등록할 수 있습니다.');
      return;
    }

    const filesToUpload = Array.from(files).slice(0, remainingSlots);

    for (const file of filesToUpload) {
      if (file.size > 5 * 1024 * 1024) {
        alert(`${file.name}: 파일 크기는 5MB 이하여야 합니다.`);
        continue;
      }
    }

    setUploadingGallery(true);

    let currentOrder = galleryPhotos.length;
    for (const file of filesToUpload) {
      if (file.size > 5 * 1024 * 1024) continue;

      const fileExt = file.name.split('.').pop();
      const fileName = `gallery_${id}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}.${fileExt}`;
      const filePath = `virtual-staff-gallery/${fileName}`;

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
        .from('virtual_staff_gallery')
        .insert({
          virtual_staff_id: id,
          photo_url: publicUrl,
          sort_order: currentOrder++,
        });
    }

    fetchGalleryPhotos();
    setUploadingGallery(false);
    if (e.target) e.target.value = '';
  };

  const handleDeleteGalleryPhoto = async (photoId: number) => {
    if (!confirm('이 사진을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('virtual_staff_gallery')
      .delete()
      .eq('id', photoId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchGalleryPhotos();
    }
  };

  const fetchSchedules = async () => {
    if (!id) return;

    const todayDate = new Date();
    const todayStr = `${todayDate.getFullYear()}-${String(todayDate.getMonth() + 1).padStart(2, '0')}-${String(todayDate.getDate()).padStart(2, '0')}`;

    const { data } = await supabase
      .from('virtual_staff_schedules')
      .select('*, store:stores(name, address)')
      .eq('virtual_staff_id', id)
      .gte('date', todayStr)
      .order('date', { ascending: true });

    setSchedules(data || []);

    // Fetch reservation counts
    if (data && data.length > 0) {
      const counts: Record<number, number> = {};
      for (const schedule of data) {
        const { count } = await supabase
          .from('reservations')
          .select('*', { count: 'exact', head: true })
          .eq('virtual_staff_id', id)
          .eq('store_id', schedule.store_id)
          .eq('date', schedule.date)
          .neq('status', 'cancelled');
        counts[schedule.id] = count || 0;
      }
      setReservationCounts(counts);
    }
  };

  const handleAddSchedule = async () => {
    if (!id || !staff || !newScheduleDate) {
      alert('날짜를 선택해주세요.');
      return;
    }

    setSavingSchedule(true);

    const { error } = await supabase
      .from('virtual_staff_schedules')
      .insert({
        virtual_staff_id: id,
        store_id: staff.store_id,
        date: newScheduleDate,
        start_time: newScheduleStartTime,
        end_time: newScheduleEndTime,
      });

    setSavingSchedule(false);

    if (error) {
      alert('출근 일정 등록 중 오류가 발생했습니다.');
    } else {
      setShowScheduleModal(false);
      setNewScheduleDate('');
      setNewScheduleStartTime('10:00');
      setNewScheduleEndTime('22:00');
      fetchSchedules();
    }
  };

  const handleDeleteSchedule = async (scheduleId: number) => {
    if (!confirm('이 출근 일정을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('virtual_staff_schedules')
      .delete()
      .eq('id', scheduleId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchSchedules();
    }
  };

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
  const todayPhotos = dailyPhotos.filter(p => p.date === today);
  const canUploadMore = todayPhotos.length < 3;

  const handleDailyPhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0 || !id) return;

    const remainingSlots = 3 - todayPhotos.length;
    if (remainingSlots <= 0) {
      alert('오늘은 최대 3장까지만 업로드할 수 있습니다.');
      return;
    }

    const filesToUpload = Array.from(files).slice(0, remainingSlots);

    setUploadingDaily(true);

    const uploadNow = new Date();
    const uploadDate = `${uploadNow.getFullYear()}-${String(uploadNow.getMonth() + 1).padStart(2, '0')}-${String(uploadNow.getDate()).padStart(2, '0')}`;

    for (const file of filesToUpload) {
      if (file.size > 5 * 1024 * 1024) {
        alert(`${file.name}: 파일 크기는 5MB 이하여야 합니다.`);
        continue;
      }

      const fileExt = file.name.split('.').pop();
      const fileName = `daily_${id}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}.${fileExt}`;
      const filePath = `virtual-staff-daily/${fileName}`;

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
        .from('virtual_staff_photos')
        .insert({
          virtual_staff_id: id,
          photo_url: publicUrl,
          date: uploadDate,
          caption: newPhotoCaption || null,
        });
    }

    setNewPhotoCaption('');
    fetchDailyPhotos();
    setUploadingDaily(false);
    if (e.target) e.target.value = '';
  };

  const handleDeleteDailyPhoto = async (photoId: number) => {
    if (!confirm('이 사진을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('virtual_staff_photos')
      .delete()
      .eq('id', photoId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchDailyPhotos();
    }
  };

  const fetchAvailableStores = async () => {
    if (!user) return;

    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id, store:stores(id, name)')
      .eq('admin_id', user.id);

    const { data: ownedStores } = await supabase
      .from('stores')
      .select('id, name')
      .eq('owner_id', user.id);

    const allStores: Store[] = [];
    const seenIds = new Set<number>();

    ownedStores?.forEach(s => {
      if (!seenIds.has(s.id)) {
        allStores.push(s);
        seenIds.add(s.id);
      }
    });

    adminStores?.forEach(s => {
      const store = s.store as unknown as Store;
      if (store && !seenIds.has(store.id)) {
        allStores.push(store);
        seenIds.add(store.id);
      }
    });

    setAvailableStores(allStores);
  };

  const handleChangeStore = async () => {
    if (!id || !selectedStoreId) return;

    setSaving(true);
    const { error } = await supabase
      .from('virtual_staff')
      .update({ store_id: selectedStoreId })
      .eq('id', id);

    setSaving(false);

    if (error) {
      alert('소속 가게 변경 중 오류가 발생했습니다.');
    } else {
      setShowStoreModal(false);
      fetchData();
    }
  };

  const handleProfilePhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !id) return;

    if (file.size > 5 * 1024 * 1024) {
      alert('파일 크기는 5MB 이하여야 합니다.');
      return;
    }

    setUploadingPhoto(true);

    const fileExt = file.name.split('.').pop();
    const filePath = `virtual-staff/${id}/profile.${fileExt}`;

    const { error: uploadError } = await supabase.storage
      .from('staff-photos')
      .upload(filePath, file, { upsert: true });

    if (uploadError) {
      alert('업로드 중 오류가 발생했습니다: ' + uploadError.message);
      setUploadingPhoto(false);
      return;
    }

    const { data: { publicUrl } } = supabase.storage
      .from('staff-photos')
      .getPublicUrl(filePath);

    const { error: updateError } = await supabase
      .from('virtual_staff')
      .update({ profile_photo_url: publicUrl })
      .eq('id', id);

    setUploadingPhoto(false);

    if (updateError) {
      alert('프로필 업데이트 중 오류가 발생했습니다.');
    } else {
      setProfilePhotoUrl(publicUrl);
      fetchData();
    }
  };

  const handleAddSpecialty = () => {
    const trimmed = newSpecialty.trim();
    if (trimmed && !specialties.includes(trimmed)) {
      setSpecialties([...specialties, trimmed]);
      setNewSpecialty('');
    }
  };

  const handleRemoveSpecialty = (specialty: string) => {
    setSpecialties(specialties.filter((s) => s !== specialty));
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      handleAddSpecialty();
    }
  };

  const handleSave = async () => {
    if (!id || !name.trim()) {
      alert('이름을 입력하세요.');
      return;
    }

    setSaving(true);

    const { error } = await supabase
      .from('virtual_staff')
      .update({
        name: name.trim(),
        phone: phone.trim() || null,
        bio: bio.trim() || null,
        specialties: specialties.length > 0 ? specialties : null,
        age: age || null,
        height: height || null,
        weight: weight || null,
        body_size: bodySize || null,
        job: job.trim() || null,
        mbti: mbti || null,
        is_smoker: isSmoker,
        personality: personality.trim() || null,
        style: style.trim() || null,
        skin_tone: skinTone.trim() || null,
        hair_length: hairLength.trim() || null,
        hair_style: hairStyle.trim() || null,
        hair_color: hairColor.trim() || null,
        is_waxed: isWaxed,
      })
      .eq('id', id);

    setSaving(false);

    if (error) {
      alert('저장 중 오류가 발생했습니다.');
    } else {
      alert('프로필이 저장되었습니다.');
      fetchData();
    }
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  if (!staff) {
    return (
      <div>
        <p className="text-slate-500 mb-4">매니저를 찾을 수 없습니다.</p>
        <Link to="/" className="text-orange-600 text-sm hover:underline">← 돌아가기</Link>
      </div>
    );
  }

  const getBackLink = () => {
    if (user?.role === 'customer') return '/';
    if (user?.role === 'superadmin') return '/superadmin/virtual-staff';
    // admin/owner - go to store page
    return staff?.store_id ? `/store/${staff.store_id}` : '/';
  };
  const getBackText = () => {
    if (user?.role === 'customer') return '← 돌아가기';
    if (user?.role === 'superadmin') return '← 등록 매니저 관리';
    return '← 가게로 돌아가기';
  };
  const backLink = getBackLink();
  const backText = getBackText();
  const isCustomer = user?.role === 'customer';

  // Helper function for date formatting
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
  };

  const handleReserve = (scheduleId: number) => {
    setSelectedScheduleId(scheduleId);
    setShowReservationModal(true);
  };

  // Customer view (read-only)
  if (isCustomer) {
    return (
      <div>
        <Link to="/" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 매니저 목록</Link>

        {/* Profile Header */}
        <div className="flex gap-5 p-5 bg-white border border-slate-200 rounded-xl mb-6 max-sm:flex-col max-sm:items-center max-sm:text-center">
          <div className="w-28 h-28 rounded-2xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-3xl font-bold text-white overflow-hidden flex-shrink-0">
            {staff.profile_photo_url ? (
              <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
            ) : (
              staff.name.charAt(0)
            )}
          </div>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-3 mb-2 max-sm:justify-center">
              <h1 className="text-2xl font-bold text-slate-900">{staff.name}</h1>
              <span className="px-2 py-1 bg-purple-50 text-purple-600 text-xs font-medium rounded">실장 등록</span>
              <button
                className={`w-9 h-9 flex items-center justify-center text-xl rounded-full transition-colors ${isFavorite ? 'text-red-500 bg-red-50' : 'text-slate-300 hover:text-red-500 hover:bg-red-50'}`}
                onClick={toggleFavorite}
              >
                {isFavorite ? '♥' : '♡'}
              </button>
            </div>

            {(staff.age || staff.height || staff.weight || staff.body_size || staff.job || staff.mbti) && (
              <div className="flex flex-wrap gap-2 mb-3 max-sm:justify-center">
                {staff.job && <span className="px-2 py-1 bg-blue-50 text-blue-600 text-sm rounded">{staff.job}</span>}
                {staff.mbti && <span className="px-2 py-1 bg-purple-50 text-purple-600 text-sm rounded">{staff.mbti}</span>}
                {staff.age && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.age}세</span>}
                {staff.height && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.height}cm</span>}
                {staff.weight && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.weight}kg</span>}
                {staff.body_size && <span className="px-2 py-1 bg-slate-100 text-slate-600 text-sm rounded">{staff.body_size}컵</span>}
              </div>
            )}

            {staffRating.totalCount > 0 && (
              <div className="flex flex-wrap gap-4 mb-3 max-sm:justify-center">
                <div className="flex items-center gap-2 text-sm">
                  <span className="text-slate-500">손님</span>
                  <span className="text-amber-500">★</span>
                  <span className="font-medium text-slate-900">{staffRating.avgRating?.toFixed(1)}</span>
                  {staffRating.avgServiceRating && (
                    <span className="text-slate-400">서비스 {staffRating.avgServiceRating?.toFixed(1)}</span>
                  )}
                  <span className="text-slate-400">({staffRating.totalCount})</span>
                </div>
              </div>
            )}

            {staff.bio && <p className="text-slate-600 mb-3">{staff.bio}</p>}

            {staff.specialties && staff.specialties.length > 0 && (
              <div className="flex flex-wrap gap-1 max-sm:justify-center">
                {staff.specialties.map((s) => (
                  <span key={s} className="px-2 py-1 bg-orange-50 text-orange-600 text-sm rounded">{s}</span>
                ))}
              </div>
            )}

            {/* Nationalities & Languages */}
            {((staff.nationalities && staff.nationalities.length > 0) || (staff.languages && staff.languages.length > 0)) && (
              <div className="flex flex-wrap gap-2 mt-3 max-sm:justify-center">
                {staff.nationalities && staff.nationalities.map((n) => (
                  <span key={n} className="px-2 py-1 bg-green-50 text-green-600 text-sm rounded">{n}</span>
                ))}
                {staff.languages && staff.languages.map((l) => (
                  <span key={l} className="px-2 py-1 bg-indigo-50 text-indigo-600 text-sm rounded">{l}</span>
                ))}
              </div>
            )}
          </div>
        </div>

        {/* Profile Details */}
        {(staff.skin_tone || staff.hair_length || staff.hair_style || staff.hair_color || staff.is_waxed !== null || staff.is_smoker !== null || staff.personality || staff.style) && (
          <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">상세 프로필</h2>
            <div className="grid grid-cols-2 gap-6 max-sm:grid-cols-1">
              {(staff.skin_tone || staff.hair_length || staff.hair_style || staff.hair_color || staff.is_waxed !== null) && (
                <div>
                  <h3 className="text-sm font-medium text-slate-500 mb-2">외모</h3>
                  <div className="flex flex-col gap-2">
                    {staff.skin_tone && <div className="flex justify-between text-sm"><span className="text-slate-500">피부톤</span><span className="text-slate-900">{staff.skin_tone}</span></div>}
                    {staff.hair_length && <div className="flex justify-between text-sm"><span className="text-slate-500">머리길이</span><span className="text-slate-900">{staff.hair_length}</span></div>}
                    {staff.hair_style && <div className="flex justify-between text-sm"><span className="text-slate-500">헤어스타일</span><span className="text-slate-900">{staff.hair_style}</span></div>}
                    {staff.hair_color && <div className="flex justify-between text-sm"><span className="text-slate-500">머리색</span><span className="text-slate-900">{staff.hair_color}</span></div>}
                    {staff.is_waxed !== null && <div className="flex justify-between text-sm"><span className="text-slate-500">왁싱</span><span className="text-slate-900">{staff.is_waxed ? '함' : '안함'}</span></div>}
                  </div>
                </div>
              )}
              {(staff.personality || staff.style || staff.is_smoker !== null) && (
                <div>
                  <h3 className="text-sm font-medium text-slate-500 mb-2">성격 & 스타일</h3>
                  <div className="flex flex-col gap-2">
                    {staff.personality && <div className="flex justify-between text-sm"><span className="text-slate-500">성격</span><span className="text-slate-900">{staff.personality}</span></div>}
                    {staff.style && <div className="flex justify-between text-sm"><span className="text-slate-500">스타일</span><span className="text-slate-900">{staff.style}</span></div>}
                    {staff.is_smoker !== null && <div className="flex justify-between text-sm"><span className="text-slate-500">흡연</span><span className="text-slate-900">{staff.is_smoker ? '흡연' : '비흡연'}</span></div>}
                  </div>
                </div>
              )}
            </div>
          </section>
        )}

        {/* Profile Gallery */}
        {galleryPhotos.length > 0 && (
          <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">프로필 사진</h2>
            <div className="grid grid-cols-3 gap-2">
              {galleryPhotos.map((photo, index) => (
                <div
                  key={photo.id}
                  className="aspect-square rounded-lg overflow-hidden cursor-pointer hover:opacity-80 transition-opacity"
                  onClick={() => {
                    setSelectedPhotoList(galleryPhotos.map(p => ({ id: p.id, photo_url: p.photo_url, caption: null })));
                    setSelectedPhotoIndex(index);
                  }}
                >
                  <img src={photo.photo_url} alt="프로필 사진" className="w-full h-full object-cover" />
                </div>
              ))}
            </div>
          </section>
        )}

        {/* Today's Photos */}
        {todayPhotos.length > 0 && (
          <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-1">오늘의 사진</h2>
            <p className="text-sm text-slate-500 mb-4">매일 0시 기준으로 리셋됩니다</p>
            <div className="grid grid-cols-4 gap-2 max-sm:grid-cols-3">
              {todayPhotos.map((photo, index) => (
                <div
                  key={photo.id}
                  className="aspect-square rounded-lg overflow-hidden cursor-pointer hover:opacity-80 transition-opacity"
                  onClick={() => {
                    setSelectedPhotoList(todayPhotos.map(p => ({ id: p.id, photo_url: p.photo_url, caption: p.caption })));
                    setSelectedPhotoIndex(index);
                  }}
                >
                  <img src={photo.photo_url} alt={photo.caption || '작업 사진'} className="w-full h-full object-cover" />
                </div>
              ))}
            </div>
          </section>
        )}

        {/* Schedule */}
        <section className="p-5 bg-white border border-slate-200 rounded-xl mb-6">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">출근 스케줄</h2>
          {schedules.length > 0 ? (
            <div className="flex flex-col gap-3">
              {schedules.map((schedule) => {
                const isToday = schedule.date === today;
                return (
                  <div key={schedule.id} className={`p-4 border rounded-xl ${isToday ? 'border-orange-300 bg-orange-50/50' : 'border-slate-200'}`}>
                    <div className="flex items-start justify-between mb-3 max-sm:flex-col max-sm:gap-2">
                      <div className="flex items-center gap-2">
                        <span className="font-medium text-slate-900">{formatDate(schedule.date)}</span>
                        {isToday && <span className="px-2 py-0.5 bg-red-600 text-white text-xs rounded-full">오늘</span>}
                      </div>
                      <button
                        className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
                        onClick={() => handleReserve(schedule.id)}
                      >
                        예약하기
                      </button>
                    </div>
                    <div className="grid grid-cols-3 gap-4 text-sm max-sm:grid-cols-1">
                      <div>
                        <span className="text-slate-500">가게</span>
                        <Link to={`/store/${schedule.store_id}`} className="block text-slate-900 hover:text-orange-600 transition-colors">{schedule.store?.name || staff.store?.name}</Link>
                        <div className="text-xs text-slate-400">{schedule.store?.address || staff.store?.address}</div>
                      </div>
                      <div>
                        <span className="text-slate-500">시간</span>
                        <div className="text-slate-900">{schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}</div>
                      </div>
                      <div>
                        <span className="text-slate-500">예약</span>
                        <div className="text-slate-900">{reservationCounts[schedule.id] || 0}건</div>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          ) : (
            <p className="text-slate-500">예정된 출근 스케줄이 없습니다.</p>
          )}
        </section>

        {/* Store Info */}
        <section className="p-5 bg-white border border-slate-200 rounded-xl">
          <h2 className="text-lg font-semibold text-slate-900 mb-4">소속 가게</h2>
          <Link to={`/store/${staff.store_id}`} className="block p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors">
            <h3 className="font-medium text-slate-900">{staff.store?.name}</h3>
            <p className="text-sm text-slate-500">{staff.store?.address}</p>
          </Link>
        </section>

        {/* Reservation Modal */}
        {showReservationModal && selectedScheduleId && (
          <VirtualStaffReservationModal
            virtualStaffId={staff.id}
            virtualStaffName={staff.name}
            storeId={staff.store_id}
            storeName={staff.store?.name || ''}
            menus={menus}
            schedules={schedules}
            selectedScheduleId={selectedScheduleId}
            customerId={user?.id}
            onClose={() => { setShowReservationModal(false); setSelectedScheduleId(null); }}
            onSuccess={() => { setShowReservationModal(false); setSelectedScheduleId(null); fetchSchedules(); }}
          />
        )}

        {/* Photo Viewer Modal with Swipe */}
        {selectedPhotoIndex !== null && selectedPhotoList.length > 0 && (
          <SwipeablePhotoModal
            photos={selectedPhotoList}
            currentIndex={selectedPhotoIndex}
            onClose={() => { setSelectedPhotoIndex(null); setSelectedPhotoList([]); }}
            onNavigate={setSelectedPhotoIndex}
          />
        )}
      </div>
    );
  }

  // Admin view (editable) - same structure as ProfileManage
  return (
    <div>
      <Link to={backLink} className="inline-block mb-4 text-orange-600 text-sm hover:underline">{backText}</Link>

      {/* Header with Save Button */}
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">프로필 관리</h1>
        {canEdit && (
          <button
            onClick={handleSave}
            disabled={saving}
            className="px-6 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
          >
            {saving ? '저장 중...' : '저장하기'}
          </button>
        )}
      </div>

      {/* 소속 가게 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold text-slate-900">소속 가게</h2>
          {canEdit && (
            <button
              onClick={() => { fetchAvailableStores(); setSelectedStoreId(staff.store_id); setShowStoreModal(true); }}
              className="text-sm text-red-600 hover:underline"
            >
              변경
            </button>
          )}
        </div>
        <div className="p-3 bg-slate-50 rounded-lg">
          <h3 className="font-medium text-slate-900">{staff.store?.name}</h3>
          <p className="text-sm text-slate-500">{staff.store?.address}</p>
        </div>
      </section>

      {/* 프로필 사진 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">프로필 사진</h2>
        <div className="flex items-center gap-4">
          <div className="w-20 h-20 rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-2xl font-bold text-white overflow-hidden">
            {profilePhotoUrl ? (
              <img src={profilePhotoUrl} alt="프로필" className="w-full h-full object-cover" />
            ) : (
              name.charAt(0) || '?'
            )}
          </div>
          {canEdit && (
            <div>
              <input
                type="file"
                ref={profileInputRef}
                onChange={handleProfilePhotoUpload}
                accept="image/*"
                className="hidden"
              />
              <button
                type="button"
                onClick={() => profileInputRef.current?.click()}
                className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
                disabled={uploadingPhoto}
              >
                {uploadingPhoto ? '업로드 중...' : '사진 변경'}
              </button>
              <p className="text-xs text-slate-500 mt-2">JPG, PNG (최대 5MB)</p>
            </div>
          )}
        </div>
      </section>

      {/* 프로필 갤러리 (고정 사진) */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-2">프로필 갤러리 ({galleryPhotos.length}/3)</h2>
        <p className="text-sm text-slate-500 mb-4">프로필에 표시되는 고정 사진입니다. 최대 3장까지 등록 가능합니다.</p>

        {canEdit && galleryPhotos.length < 3 && (
          <div className="mb-4">
            <input
              type="file"
              ref={galleryInputRef}
              onChange={handleGalleryPhotoUpload}
              accept="image/*"
              multiple
              className="hidden"
            />
            <button
              type="button"
              onClick={() => galleryInputRef.current?.click()}
              disabled={uploadingGallery}
              className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
            >
              {uploadingGallery ? '업로드 중...' : '+ 사진 추가'}
            </button>
          </div>
        )}

        {galleryPhotos.length > 0 ? (
          <div className="grid grid-cols-3 gap-2 max-sm:grid-cols-2">
            {galleryPhotos.map((photo) => (
              <div key={photo.id} className="relative group">
                <img src={photo.photo_url} alt="프로필 사진" className="w-full aspect-square object-cover rounded-lg" />
                {canEdit && (
                  <button
                    type="button"
                    onClick={() => handleDeleteGalleryPhoto(photo.id)}
                    className="absolute top-1 right-1 w-6 h-6 bg-red-500 text-white text-xs rounded-full opacity-0 group-hover:opacity-100 transition-opacity"
                  >
                    ×
                  </button>
                )}
              </div>
            ))}
          </div>
        ) : (
          <p className="text-sm text-slate-400">등록된 프로필 사진이 없습니다.</p>
        )}
      </section>

      {/* 오늘의 사진 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-2">오늘의 사진 ({todayPhotos.length}/3)</h2>
        <p className="text-sm text-slate-500 mb-4">오늘 작업한 결과물이나 스타일 사진을 올려보세요. 손님들이 볼 수 있습니다. (0시 리셋)</p>

        {canEdit && canUploadMore && (
          <div className="flex gap-2 mb-4">
            <input
              type="text"
              value={newPhotoCaption}
              onChange={(e) => setNewPhotoCaption(e.target.value)}
              placeholder="사진 설명 (선택)"
              className="flex-1 h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
            <input
              type="file"
              ref={dailyInputRef}
              onChange={handleDailyPhotoUpload}
              accept="image/*"
              multiple
              className="hidden"
            />
            <button
              type="button"
              onClick={() => dailyInputRef.current?.click()}
              disabled={uploadingDaily}
              className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
            >
              {uploadingDaily ? '업로드 중...' : '사진 업로드'}
            </button>
          </div>
        )}

        {canEdit && !canUploadMore && (
          <p className="text-sm text-amber-600 mb-4">오늘 업로드 가능한 사진 수를 모두 사용했습니다.</p>
        )}

        {todayPhotos.length > 0 ? (
          <div className="grid grid-cols-3 gap-2 max-sm:grid-cols-2">
            {todayPhotos.map((photo) => (
              <div key={photo.id} className="relative group">
                <img src={photo.photo_url} alt={photo.caption || '사진'} className="w-full aspect-square object-cover rounded-lg" />
                {photo.caption && (
                  <div className="absolute bottom-0 left-0 right-0 p-2 bg-black/50 text-white text-xs rounded-b-lg truncate">
                    {photo.caption}
                  </div>
                )}
                {canEdit && (
                  <button
                    type="button"
                    onClick={() => handleDeleteDailyPhoto(photo.id)}
                    className="absolute top-1 right-1 w-6 h-6 bg-red-500 text-white text-xs rounded-full opacity-0 group-hover:opacity-100 transition-opacity"
                  >
                    ×
                  </button>
                )}
              </div>
            ))}
          </div>
        ) : (
          <p className="text-sm text-slate-400">오늘 업로드한 사진이 없습니다.</p>
        )}
      </section>

      {/* 출근 관리 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold text-slate-900">출근 관리</h2>
          {canEdit && (
            <button
              onClick={() => setShowScheduleModal(true)}
              className="px-3 py-1.5 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
            >
              + 출근 등록
            </button>
          )}
        </div>
        <p className="text-sm text-slate-500 mb-4">손님이 예약할 수 있는 출근 일정입니다.</p>

        {schedules.length > 0 ? (
          <div className="flex flex-col gap-2">
            {schedules.map((schedule) => {
              const date = new Date(schedule.date);
              const days = ['일', '월', '화', '수', '목', '금', '토'];
              const dateStr = `${date.getMonth() + 1}/${date.getDate()} (${days[date.getDay()]})`;
              const isToday = schedule.date === today;

              return (
                <div
                  key={schedule.id}
                  className={`flex items-center justify-between p-3 rounded-lg ${isToday ? 'bg-orange-50 border border-orange-200' : 'bg-slate-50'}`}
                >
                  <div className="flex items-center gap-3">
                    <span className={`font-semibold ${isToday ? 'text-orange-600' : 'text-slate-900'}`}>
                      {dateStr}
                      {isToday && <span className="ml-1 text-xs">(오늘)</span>}
                    </span>
                    <span className="text-sm text-slate-500">
                      {schedule.start_time.slice(0, 5)} - {schedule.end_time.slice(0, 5)}
                    </span>
                  </div>
                  {canEdit && (
                    <button
                      onClick={() => handleDeleteSchedule(schedule.id)}
                      className="text-xs text-red-500 hover:text-red-700"
                    >
                      삭제
                    </button>
                  )}
                </div>
              );
            })}
          </div>
        ) : (
          <p className="text-sm text-slate-400">등록된 출근 일정이 없습니다.</p>
        )}
      </section>

      {/* 기본 정보 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">기본 정보</h2>
        <div className="grid grid-cols-2 gap-4 max-sm:grid-cols-1">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">이름 *</label>
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="이름"
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">연락처</label>
            <input
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="010-0000-0000"
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">나이</label>
            <input
              type="number"
              value={age}
              onChange={(e) => setAge(e.target.value ? Number(e.target.value) : '')}
              placeholder="나이"
              min={18}
              max={99}
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">직업</label>
            <input
              type="text"
              value={job}
              onChange={(e) => setJob(e.target.value)}
              placeholder="예: 대학생, 직장인, 프리랜서..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">MBTI</label>
            <select
              value={mbti}
              onChange={(e) => setMbti(e.target.value)}
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 bg-white disabled:bg-slate-50"
            >
              <option value="">선택안함</option>
              <option value="INTJ">INTJ</option>
              <option value="INTP">INTP</option>
              <option value="ENTJ">ENTJ</option>
              <option value="ENTP">ENTP</option>
              <option value="INFJ">INFJ</option>
              <option value="INFP">INFP</option>
              <option value="ENFJ">ENFJ</option>
              <option value="ENFP">ENFP</option>
              <option value="ISTJ">ISTJ</option>
              <option value="ISFJ">ISFJ</option>
              <option value="ESTJ">ESTJ</option>
              <option value="ESFJ">ESFJ</option>
              <option value="ISTP">ISTP</option>
              <option value="ISFP">ISFP</option>
              <option value="ESTP">ESTP</option>
              <option value="ESFP">ESFP</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">키 (cm)</label>
            <input
              type="number"
              value={height}
              onChange={(e) => setHeight(e.target.value ? Number(e.target.value) : '')}
              placeholder="키"
              min={100}
              max={250}
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">몸무게 (kg)</label>
            <input
              type="number"
              value={weight}
              onChange={(e) => setWeight(e.target.value ? Number(e.target.value) : '')}
              placeholder="몸무게"
              min={30}
              max={200}
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">B-Size</label>
            <input
              type="text"
              value={bodySize}
              onChange={(e) => setBodySize(e.target.value)}
              placeholder="예: A, B, C..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">흡연 여부</label>
            <div className="flex gap-4 h-10 items-center">
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="smoking" checked={!isSmoker} onChange={() => setIsSmoker(false)} disabled={!canEdit} className="accent-blue-600" />
                비흡연
              </label>
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="smoking" checked={isSmoker} onChange={() => setIsSmoker(true)} disabled={!canEdit} className="accent-blue-600" />
                흡연
              </label>
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">왁싱 여부</label>
            <div className="flex gap-4 h-10 items-center">
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="waxing" checked={!isWaxed} onChange={() => setIsWaxed(false)} disabled={!canEdit} className="accent-blue-600" />
                안함
              </label>
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="waxing" checked={isWaxed} onChange={() => setIsWaxed(true)} disabled={!canEdit} className="accent-blue-600" />
                함
              </label>
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">피부톤</label>
            <input
              type="text"
              value={skinTone}
              onChange={(e) => setSkinTone(e.target.value)}
              placeholder="예: 밝은편, 중간, 어두운편..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">머리길이</label>
            <input
              type="text"
              value={hairLength}
              onChange={(e) => setHairLength(e.target.value)}
              placeholder="예: 숏컷, 단발, 중간, 장발..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">헤어스타일</label>
            <input
              type="text"
              value={hairStyle}
              onChange={(e) => setHairStyle(e.target.value)}
              placeholder="예: 생머리, 웨이브..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">머리색</label>
            <input
              type="text"
              value={hairColor}
              onChange={(e) => setHairColor(e.target.value)}
              placeholder="예: 검정, 갈색, 금발..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
        </div>
      </section>

      {/* 성격 & 스타일 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">성격 & 스타일</h2>
        <div className="flex flex-col gap-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">성격</label>
            <input
              type="text"
              value={personality}
              onChange={(e) => setPersonality(e.target.value)}
              placeholder="예: 활발함, 차분함, 친근함..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">스타일</label>
            <input
              type="text"
              value={style}
              onChange={(e) => setStyle(e.target.value)}
              placeholder="예: 캐주얼, 시크, 청순..."
              disabled={!canEdit}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
            />
          </div>
        </div>
      </section>

      {/* 자기소개 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">자기소개</h2>
        <textarea
          value={bio}
          onChange={(e) => setBio(e.target.value)}
          placeholder="간단한 자기소개를 입력하세요"
          rows={4}
          disabled={!canEdit}
          className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 disabled:bg-slate-50"
        />
      </section>

      {/* 전문 분야 */}
      <section className="p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-2">전문 분야 (스킬)</h2>
        <p className="text-sm text-slate-500 mb-4">손님에게 표시되는 전문 분야입니다. 최대 10개까지 등록 가능합니다.</p>

        <div className="flex flex-wrap gap-2 mb-4">
          {specialties.map((specialty) => (
            <div key={specialty} className="flex items-center gap-1 px-3 py-1.5 bg-orange-50 text-orange-600 rounded-full text-sm">
              <span>{specialty}</span>
              {canEdit && (
                <button
                  type="button"
                  onClick={() => handleRemoveSpecialty(specialty)}
                  className="w-4 h-4 flex items-center justify-center text-blue-400 hover:text-red-500"
                >
                  ×
                </button>
              )}
            </div>
          ))}
        </div>

        {canEdit && specialties.length < 10 && (
          <div className="flex gap-2">
            <input
              type="text"
              value={newSpecialty}
              onChange={(e) => setNewSpecialty(e.target.value)}
              onKeyPress={handleKeyPress}
              placeholder="새 전문 분야 입력"
              className="flex-1 h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
            <button
              type="button"
              onClick={handleAddSpecialty}
              disabled={!newSpecialty.trim()}
              className="px-4 py-2 bg-slate-100 text-slate-700 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors disabled:opacity-50"
            >
              추가
            </button>
          </div>
        )}

        {specialties.length === 0 && (
          <p className="text-sm text-slate-400">등록된 전문 분야가 없습니다.</p>
        )}
      </section>

      {/* Store Change Modal */}
      {showStoreModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-slate-900 mb-4">소속 가게 변경</h2>
            <div className="space-y-2 max-h-60 overflow-y-auto">
              {availableStores.map((store) => (
                <label
                  key={store.id}
                  className={`flex items-center gap-3 p-3 border rounded-lg cursor-pointer transition-colors ${
                    selectedStoreId === store.id ? 'border-red-600 bg-orange-50' : 'border-slate-200 hover:border-slate-300'
                  }`}
                >
                  <input
                    type="radio"
                    name="store"
                    value={store.id}
                    checked={selectedStoreId === store.id}
                    onChange={() => setSelectedStoreId(store.id)}
                    className="w-4 h-4 text-red-600"
                  />
                  <span className="font-medium text-slate-900">{store.name}</span>
                </label>
              ))}
            </div>
            <div className="flex gap-2 mt-6">
              <button
                onClick={() => setShowStoreModal(false)}
                className="flex-1 py-3 bg-slate-100 text-slate-600 font-medium rounded-lg hover:bg-slate-200 transition-colors"
              >
                취소
              </button>
              <button
                onClick={handleChangeStore}
                disabled={saving || !selectedStoreId}
                className="flex-1 py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
              >
                {saving ? '변경 중...' : '변경'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Schedule Add Modal */}
      {showScheduleModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-slate-900 mb-4">출근 등록</h2>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">날짜</label>
                <input
                  type="date"
                  value={newScheduleDate}
                  onChange={(e) => setNewScheduleDate(e.target.value)}
                  min={today}
                  className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
                />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">시작 시간</label>
                  <select
                    value={newScheduleStartTime}
                    onChange={(e) => setNewScheduleStartTime(e.target.value)}
                    className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 bg-white"
                  >
                    {Array.from({ length: 24 }, (_, i) => i).map((h) => (
                      <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                        {h.toString().padStart(2, '0')}:00
                      </option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">종료 시간</label>
                  <select
                    value={newScheduleEndTime}
                    onChange={(e) => setNewScheduleEndTime(e.target.value)}
                    className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 bg-white"
                  >
                    {Array.from({ length: 24 }, (_, i) => i).map((h) => (
                      <option key={h} value={`${h.toString().padStart(2, '0')}:00`}>
                        {h.toString().padStart(2, '0')}:00
                      </option>
                    ))}
                  </select>
                </div>
              </div>
            </div>

            <div className="flex gap-2 mt-6">
              <button
                onClick={() => { setShowScheduleModal(false); setNewScheduleDate(''); }}
                className="flex-1 py-3 bg-slate-100 text-slate-600 font-medium rounded-lg hover:bg-slate-200 transition-colors"
              >
                취소
              </button>
              <button
                onClick={handleAddSchedule}
                disabled={savingSchedule || !newScheduleDate}
                className="flex-1 py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
              >
                {savingSchedule ? '등록 중...' : '등록'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

const getLocalToday = () => {
  const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
};

function SwipeablePhotoModal({
  photos,
  currentIndex,
  onClose,
  onNavigate,
}: {
  photos: { id: number; photo_url: string; caption: string | null }[];
  currentIndex: number;
  onClose: () => void;
  onNavigate: (index: number) => void;
}) {
  const [touchStart, setTouchStart] = useState<number | null>(null);
  const [touchEnd, setTouchEnd] = useState<number | null>(null);

  const currentPhoto = photos[currentIndex];
  const hasPrev = currentIndex > 0;
  const hasNext = currentIndex < photos.length - 1;

  const minSwipeDistance = 50;

  const onTouchStart = (e: React.TouchEvent) => {
    setTouchEnd(null);
    setTouchStart(e.targetTouches[0].clientX);
  };

  const onTouchMove = (e: React.TouchEvent) => {
    setTouchEnd(e.targetTouches[0].clientX);
  };

  const onTouchEnd = () => {
    if (!touchStart || !touchEnd) return;
    const distance = touchStart - touchEnd;
    const isLeftSwipe = distance > minSwipeDistance;
    const isRightSwipe = distance < -minSwipeDistance;

    if (isLeftSwipe && hasNext) {
      onNavigate(currentIndex + 1);
    }
    if (isRightSwipe && hasPrev) {
      onNavigate(currentIndex - 1);
    }
  };

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose();
      if (e.key === 'ArrowLeft' && hasPrev) onNavigate(currentIndex - 1);
      if (e.key === 'ArrowRight' && hasNext) onNavigate(currentIndex + 1);
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [currentIndex, hasPrev, hasNext, onClose, onNavigate]);

  if (!currentPhoto) return null;

  return (
    <div className="fixed inset-0 bg-black/90 flex items-center justify-center z-50" onClick={onClose}>
      <div
        className="relative w-full h-full flex items-center justify-center p-4"
        onClick={(e) => e.stopPropagation()}
        onTouchStart={onTouchStart}
        onTouchMove={onTouchMove}
        onTouchEnd={onTouchEnd}
      >
        {/* Close button */}
        <button
          className="absolute top-4 right-4 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors z-10"
          onClick={onClose}
        >
          ×
        </button>

        {/* Counter */}
        <div className="absolute top-4 left-4 px-3 py-1 bg-black/50 rounded-full text-white text-sm">
          {currentIndex + 1} / {photos.length}
        </div>

        {/* Previous button */}
        {hasPrev && (
          <button
            className="absolute left-2 md:left-4 w-12 h-12 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors"
            onClick={(e) => { e.stopPropagation(); onNavigate(currentIndex - 1); }}
          >
            ‹
          </button>
        )}

        {/* Image */}
        <div className="max-w-4xl max-h-[80vh] flex flex-col items-center">
          <img
            src={currentPhoto.photo_url}
            alt={currentPhoto.caption || '사진'}
            className="max-w-full max-h-[70vh] object-contain rounded-lg"
            draggable={false}
          />
          {currentPhoto.caption && (
            <p className="mt-4 text-center text-white text-sm">{currentPhoto.caption}</p>
          )}
        </div>

        {/* Next button */}
        {hasNext && (
          <button
            className="absolute right-2 md:right-4 w-12 h-12 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors"
            onClick={(e) => { e.stopPropagation(); onNavigate(currentIndex + 1); }}
          >
            ›
          </button>
        )}

        {/* Swipe hint for mobile */}
        <div className="absolute bottom-4 left-1/2 -translate-x-1/2 text-white/50 text-xs md:hidden">
          좌우로 스와이프하여 넘기기
        </div>
      </div>
    </div>
  );
}

function VirtualStaffReservationModal({
  virtualStaffId,
  virtualStaffName,
  storeId: _storeId,
  storeName,
  menus,
  schedules,
  selectedScheduleId,
  customerId,
  onClose,
  onSuccess,
}: {
  virtualStaffId: string;
  virtualStaffName: string;
  storeId: number;
  storeName: string;
  menus: Menu[];
  schedules: Schedule[];
  selectedScheduleId: number;
  customerId?: string;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const schedule = schedules.find(s => s.id === selectedScheduleId);
  const [selectedMenu, setSelectedMenu] = useState<number | null>(null);
  const [selectedTime, setSelectedTime] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  const today = getLocalToday();

  if (!schedule) return null;

  const generateTimeSlots = () => {
    const slots: string[] = [];
    const startHour = parseInt(schedule.start_time.split(':')[0]);
    const endHour = parseInt(schedule.end_time.split(':')[0]);
    const currentHour = new Date().getHours();

    for (let h = startHour; h < endHour; h++) {
      if (schedule.date === today && h <= currentHour) continue;
      slots.push(`${h.toString().padStart(2, '0')}:00`);
    }
    return slots;
  };

  const handleSubmit = async () => {
    if (!selectedMenu || !selectedTime || !customerId) return;
    setSubmitting(true);

    const startHour = parseInt(selectedTime.split(':')[0]);
    const endTime = `${(startHour + 1).toString().padStart(2, '0')}:00`;

    const { error } = await supabase.from('reservations').insert({
      store_id: schedule.store_id,
      virtual_staff_id: virtualStaffId,
      customer_id: customerId,
      menu_id: selectedMenu,
      date: schedule.date,
      start_time: selectedTime,
      end_time: endTime,
      status: 'pending',
    });

    setSubmitting(false);

    if (error) {
      console.error(error);
      alert('예약 중 오류가 발생했습니다.');
    } else {
      setSubmitted(true);
    }
  };

  if (submitted) {
    return (
      <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
        <div className="bg-white rounded-2xl p-6 max-w-md w-full text-center" onClick={(e) => e.stopPropagation()}>
          <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-3xl text-green-600">✓</span>
          </div>
          <h2 className="text-xl font-bold text-slate-900 mb-2">예약 신청 완료!</h2>
          <p className="text-slate-600 mb-6">가게에서 확인 후 연락드릴 예정입니다.</p>
          <button onClick={onSuccess} className="w-full py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors">확인</button>
        </div>
      </div>
    );
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-2xl p-6 max-w-md w-full max-h-[90vh] overflow-y-auto" onClick={(e) => e.stopPropagation()}>
        <h2 className="text-xl font-bold text-slate-900 mb-4">예약하기</h2>

        <div className="p-4 bg-slate-50 rounded-lg mb-4 space-y-2">
          <div className="flex justify-between text-sm">
            <span className="text-slate-500">매니저</span>
            <span className="font-medium text-slate-900">{virtualStaffName}</span>
          </div>
          <div className="flex justify-between text-sm">
            <span className="text-slate-500">가게</span>
            <span className="font-medium text-slate-900">{schedule.store?.name || storeName}</span>
          </div>
          <div className="flex justify-between text-sm">
            <span className="text-slate-500">날짜</span>
            <span className="font-medium text-slate-900">{schedule.date}</span>
          </div>
        </div>

        <div className="mb-4">
          <label className="block text-sm font-medium text-slate-700 mb-2">서비스 선택</label>
          <div className="flex flex-col gap-2">
            {menus.map((menu) => (
              <label
                key={menu.id}
                className={`flex items-center justify-between p-3 border rounded-lg cursor-pointer transition-colors ${
                  selectedMenu === menu.id ? 'border-red-600 bg-orange-50' : 'border-slate-200 hover:border-slate-300'
                }`}
              >
                <div className="flex items-center gap-3">
                  <input
                    type="radio"
                    name="menu"
                    value={menu.id}
                    checked={selectedMenu === menu.id}
                    onChange={() => setSelectedMenu(menu.id)}
                    className="w-4 h-4 text-orange-600"
                  />
                  <span className="font-medium text-slate-900">{menu.name}</span>
                </div>
                <span className="text-orange-600 font-medium">{menu.price.toLocaleString()}원</span>
              </label>
            ))}
          </div>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-medium text-slate-700 mb-2">시간 선택</label>
          {generateTimeSlots().length > 0 ? (
            <div className="grid grid-cols-4 gap-2">
              {generateTimeSlots().map((time) => (
                <button
                  key={time}
                  type="button"
                  className={`py-2 text-sm font-medium rounded-lg transition-colors ${
                    selectedTime === time ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                  }`}
                  onClick={() => setSelectedTime(time)}
                >
                  {time}
                </button>
              ))}
            </div>
          ) : (
            <p className="text-sm text-slate-500">선택한 날짜에 예약 가능한 시간이 없습니다.</p>
          )}
        </div>

        <div className="flex gap-3">
          <button
            onClick={onClose}
            className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors"
          >
            취소
          </button>
          <button
            onClick={handleSubmit}
            className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400"
            disabled={!selectedMenu || !selectedTime || submitting}
          >
            {submitting ? '예약 중...' : '예약 신청'}
          </button>
        </div>
      </div>
    </div>
  );
}
