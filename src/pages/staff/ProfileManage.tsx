import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface GalleryPhoto {
  id: number;
  photo_url: string;
  sort_order: number;
}

export default function ProfileManage() {
  const { user } = useAuth();
  const [bio, setBio] = useState('');
  const [specialties, setSpecialties] = useState<string[]>([]);
  const [newSpecialty, setNewSpecialty] = useState('');
  const [nationalities, setNationalities] = useState<string[]>([]);
  const [newNationality, setNewNationality] = useState('');
  const [languages, setLanguages] = useState<string[]>([]);
  const [newLanguage, setNewLanguage] = useState('');
  const [profilePhotoUrl, setProfilePhotoUrl] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [uploadingProfile, setUploadingProfile] = useState(false);
  const [galleryPhotos, setGalleryPhotos] = useState<GalleryPhoto[]>([]);
  const [uploadingGallery, setUploadingGallery] = useState(false);
  const [selectedPhotoIndex, setSelectedPhotoIndex] = useState<number | null>(null);
  const [selectedPhotoList, setSelectedPhotoList] = useState<{ id: number; photo_url: string; caption: string | null }[]>([]);

  const [age, setAge] = useState<number | ''>('');
  const [height, setHeight] = useState<number | ''>('');
  const [weight, setWeight] = useState<number | ''>('');
  const [bodySize, setBodySize] = useState('');
  const [isSmoker, setIsSmoker] = useState(false);
  const [personality, setPersonality] = useState('');
  const [style, setStyle] = useState('');
  const [skinTone, setSkinTone] = useState('');
  const [hairLength, setHairLength] = useState('');
  const [hairStyle, setHairStyle] = useState('');
  const [hairColor, setHairColor] = useState('');
  const [isWaxed, setIsWaxed] = useState(false);
  const [job, setJob] = useState('');
  const [mbti, setMbti] = useState('');
  const [gender, setGender] = useState('');

  const profileInputRef = useRef<HTMLInputElement>(null);
  const galleryInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (user) {
      fetchProfile();
      fetchGalleryPhotos();
    }
  }, [user]);

  const fetchProfile = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('profiles')
      .select('bio, specialties, profile_photo_url, age, height, weight, body_size, is_smoker, personality, style, skin_tone, hair_length, hair_style, hair_color, is_waxed, job, mbti, nationalities, languages, gender')
      .eq('id', user.id)
      .single();

    if (data) {
      setBio(data.bio || '');
      setSpecialties(data.specialties || []);
      setProfilePhotoUrl(data.profile_photo_url || null);
      setAge(data.age || '');
      setHeight(data.height || '');
      setWeight(data.weight || '');
      setBodySize(data.body_size || '');
      setIsSmoker(data.is_smoker || false);
      setPersonality(data.personality || '');
      setStyle(data.style || '');
      setSkinTone(data.skin_tone || '');
      setHairLength(data.hair_length || '');
      setHairStyle(data.hair_style || '');
      setHairColor(data.hair_color || '');
      setIsWaxed(data.is_waxed || false);
      setJob(data.job || '');
      setMbti(data.mbti || '');
      setGender(data.gender || '');
      setNationalities(data.nationalities || []);
      setLanguages(data.languages || []);
    }

    setLoading(false);
  };

  const fetchGalleryPhotos = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('staff_gallery')
      .select('*')
      .eq('staff_id', user.id)
      .order('sort_order', { ascending: true });

    setGalleryPhotos(data || []);
  };

  const handleGalleryPhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0 || !user) return;

    const remainingSlots = 3 - galleryPhotos.length;
    if (remainingSlots <= 0) {
      alert('프로필 사진은 최대 3장까지 등록할 수 있습니다.');
      return;
    }

    const filesToUpload = Array.from(files).slice(0, remainingSlots);
    setUploadingGallery(true);

    let currentOrder = galleryPhotos.length;
    for (const file of filesToUpload) {
      if (file.size > 5 * 1024 * 1024) {
        alert(`${file.name}: 파일 크기는 5MB 이하여야 합니다.`);
        continue;
      }

      const fileExt = file.name.split('.').pop();
      const fileName = `gallery_${user.id}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}.${fileExt}`;
      const filePath = `staff-gallery/${fileName}`;

      const { error: uploadError } = await supabase.storage
        .from('staff-photos')
        .upload(filePath, file);

      if (uploadError) continue;

      const { data: { publicUrl } } = supabase.storage
        .from('staff-photos')
        .getPublicUrl(filePath);

      await supabase.from('staff_gallery').insert({
        staff_id: user.id,
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

    const { error } = await supabase.from('staff_gallery').delete().eq('id', photoId);
    if (!error) fetchGalleryPhotos();
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

  const handleAddNationality = () => {
    const trimmed = newNationality.trim();
    if (trimmed && !nationalities.includes(trimmed)) {
      setNationalities([...nationalities, trimmed]);
      setNewNationality('');
    }
  };

  const handleRemoveNationality = (nationality: string) => {
    setNationalities(nationalities.filter((n) => n !== nationality));
  };

  const handleAddLanguage = () => {
    const trimmed = newLanguage.trim();
    if (trimmed && !languages.includes(trimmed)) {
      setLanguages([...languages, trimmed]);
      setNewLanguage('');
    }
  };

  const handleRemoveLanguage = (language: string) => {
    setLanguages(languages.filter((l) => l !== language));
  };

  const handleProfilePhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !user) return;

    if (file.size > 5 * 1024 * 1024) {
      alert('파일 크기는 5MB 이하여야 합니다.');
      return;
    }

    setUploadingProfile(true);

    const fileExt = file.name.split('.').pop();
    const fileName = `profile_${user.id}_${Date.now()}.${fileExt}`;
    const filePath = `profiles/${fileName}`;

    const { error: uploadError } = await supabase.storage
      .from('staff-photos')
      .upload(filePath, file);

    if (uploadError) {
      alert('업로드 중 오류가 발생했습니다.');
      setUploadingProfile(false);
      return;
    }

    const { data: { publicUrl } } = supabase.storage
      .from('staff-photos')
      .getPublicUrl(filePath);

    await supabase.from('profiles').update({ profile_photo_url: publicUrl }).eq('id', user.id);
    setProfilePhotoUrl(publicUrl);
    setUploadingProfile(false);
  };

  const handleSave = async () => {
    if (!user) return;

    setSaving(true);

    const { error } = await supabase
      .from('profiles')
      .update({
        bio,
        specialties: specialties.length > 0 ? specialties : null,
        age: age || null,
        height: height || null,
        weight: weight || null,
        body_size: bodySize || null,
        is_smoker: isSmoker,
        personality: personality || null,
        style: style || null,
        skin_tone: skinTone || null,
        hair_length: hairLength || null,
        hair_style: hairStyle || null,
        hair_color: hairColor || null,
        is_waxed: isWaxed,
        job: job || null,
        mbti: mbti || null,
        gender: gender || null,
        nationalities: nationalities.length > 0 ? nationalities : null,
        languages: languages.length > 0 ? languages : null,
      })
      .eq('id', user.id);

    setSaving(false);

    if (error) alert('저장 중 오류가 발생했습니다.');
    else alert('프로필이 저장되었습니다.');
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <Link to="/" className="text-pink-500 text-sm hover:text-pink-600 mb-1 inline-block">← 대시보드</Link>
          <h1 className="text-2xl font-bold">
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-rose-500">프로필</span>
          </h1>
        </div>
        <button
          onClick={handleSave}
          disabled={saving}
          className="px-6 py-2.5 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-medium rounded-full shadow-md shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all disabled:opacity-50"
        >
          {saving ? '저장 중...' : '저장하기'}
        </button>
      </div>

      {/* 프로필 사진 + 갤러리 - 4칸 그리드 */}
      <div className="bg-gradient-to-br from-pink-50 to-purple-50 rounded-3xl border border-pink-100 p-4 sm:p-5">
        <input type="file" ref={profileInputRef} onChange={handleProfilePhotoUpload} accept="image/*" className="hidden" />
        <input type="file" ref={galleryInputRef} onChange={handleGalleryPhotoUpload} accept="image/*" multiple className="hidden" />

        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 sm:gap-4">
          {/* 프로필 사진 */}
          <div className="relative">
            <div
              onClick={() => {
                if (profilePhotoUrl) {
                  setSelectedPhotoList([{ id: 0, photo_url: profilePhotoUrl, caption: '프로필 사진' }]);
                  setSelectedPhotoIndex(0);
                }
              }}
              className="aspect-square rounded-2xl bg-gradient-to-br from-pink-400 to-rose-500 flex items-center justify-center text-4xl font-bold text-white overflow-hidden shadow-lg shadow-pink-300 ring-4 ring-pink-400 cursor-pointer hover:ring-pink-500 transition-all"
            >
              {profilePhotoUrl ? (
                <img src={profilePhotoUrl} alt="프로필" className="w-full h-full object-cover" />
              ) : (
                user?.name?.charAt(0) || '?'
              )}
            </div>
            <button
              onClick={() => profileInputRef.current?.click()}
              disabled={uploadingProfile}
              className="absolute -bottom-2 left-1/2 -translate-x-1/2 px-3 py-1 bg-white text-pink-600 text-xs font-medium rounded-full border border-pink-200 shadow-md hover:bg-pink-50 transition-colors disabled:opacity-50"
            >
              {uploadingProfile ? '...' : '변경'}
            </button>
          </div>

          {/* 갤러리 사진 3장 */}
          {[0, 1, 2].map((i) => {
            const photo = galleryPhotos[i];
            if (photo) {
              return (
                <div key={photo.id} className="relative group">
                  <div className="aspect-square rounded-2xl overflow-hidden shadow-md bg-white">
                    <img
                      src={photo.photo_url}
                      alt=""
                      className="w-full h-full object-cover cursor-pointer"
                      onClick={() => {
                        setSelectedPhotoList(galleryPhotos.map(p => ({ id: p.id, photo_url: p.photo_url, caption: null })));
                        setSelectedPhotoIndex(i);
                      }}
                    />
                  </div>
                  <button
                    onClick={() => handleDeleteGalleryPhoto(photo.id)}
                    className="absolute top-2 right-2 w-6 h-6 bg-red-500 text-white text-sm rounded-full opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center shadow-lg"
                  >
                    ×
                  </button>
                </div>
              );
            }
            return (
              <div
                key={`empty-${i}`}
                onClick={() => !uploadingGallery && galleryInputRef.current?.click()}
                className={`aspect-square rounded-2xl bg-white/80 border-2 border-dashed border-pink-200 flex flex-col items-center justify-center text-pink-300 cursor-pointer hover:border-pink-400 hover:text-pink-400 hover:bg-white transition-all ${uploadingGallery ? 'opacity-50 cursor-wait' : ''}`}
              >
                <span className="text-2xl mb-1">{uploadingGallery ? '...' : '+'}</span>
                <span className="text-xs font-medium">{uploadingGallery ? '업로드 중' : '갤러리 추가'}</span>
              </div>
            );
          })}
        </div>

        {/* 안내 텍스트 */}
        <p className="text-center text-xs text-slate-400 mt-3">
          프로필 사진 1장 + 갤러리 사진 최대 3장
        </p>
      </div>

      {/* 기본 정보 */}
      <div className="bg-white rounded-3xl border border-pink-100 p-5 shadow-sm">
        <h2 className="text-lg font-semibold text-slate-800 mb-3 flex items-center gap-2">
          <span className="w-8 h-8 bg-pink-100 rounded-lg flex items-center justify-center text-base">👤</span>
          기본 정보
        </h2>
        <div className="grid grid-cols-3 gap-3 max-sm:grid-cols-2">
              <div>
                <label className="block text-xs text-slate-500 mb-1">나이</label>
                <input
                  type="number"
                  value={age}
                  onChange={(e) => setAge(e.target.value ? Number(e.target.value) : '')}
                  placeholder="나이"
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                />
              </div>
              <div>
                <label className="block text-xs text-slate-500 mb-1">키 (cm)</label>
                <input
                  type="number"
                  value={height}
                  onChange={(e) => setHeight(e.target.value ? Number(e.target.value) : '')}
                  placeholder="키"
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                />
              </div>
              <div>
                <label className="block text-xs text-slate-500 mb-1">몸무게 (kg)</label>
                <input
                  type="number"
                  value={weight}
                  onChange={(e) => setWeight(e.target.value ? Number(e.target.value) : '')}
                  placeholder="몸무게"
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                />
              </div>
              <div>
                <label className="block text-xs text-slate-500 mb-1">B-Size</label>
                <input
                  type="text"
                  value={bodySize}
                  onChange={(e) => setBodySize(e.target.value)}
                  placeholder="A, B, C..."
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                />
              </div>
              <div>
                <label className="block text-xs text-slate-500 mb-1">직업</label>
                <input
                  type="text"
                  value={job}
                  onChange={(e) => setJob(e.target.value)}
                  placeholder="대학생, 직장인..."
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                />
              </div>
              <div>
                <label className="block text-xs text-slate-500 mb-1">MBTI</label>
                <select
                  value={mbti}
                  onChange={(e) => setMbti(e.target.value)}
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                >
                  <option value="">선택</option>
                  {['INTJ','INTP','ENTJ','ENTP','INFJ','INFP','ENFJ','ENFP','ISTJ','ISFJ','ESTJ','ESFJ','ISTP','ISFP','ESTP','ESFP'].map(m => (
                    <option key={m} value={m}>{m}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-xs text-slate-500 mb-1">성별</label>
                <select
                  value={gender}
                  onChange={(e) => setGender(e.target.value)}
                  className="w-full h-10 px-3 bg-white border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300"
                >
                  <option value="">선택안함</option>
                  <option value="female">여성</option>
                  <option value="male">남성</option>
                  <option value="other">기타</option>
                </select>
              </div>
            </div>
          </div>

      {/* 자기소개 */}
      <div className="bg-white rounded-3xl border border-pink-100 p-5 shadow-sm">
        <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
          <span className="w-8 h-8 bg-pink-100 rounded-lg flex items-center justify-center text-base">💬</span>
          자기소개
        </h2>
        <textarea
          value={bio}
          onChange={(e) => setBio(e.target.value)}
          placeholder="간단한 자기소개를 입력하세요"
          rows={3}
          className="w-full px-4 py-3 bg-pink-50/50 border border-pink-100 rounded-2xl text-sm focus:outline-none focus:border-pink-300 resize-none"
        />
      </div>

      {/* 외모 & 스타일 */}
      <div className="bg-white rounded-3xl border border-pink-100 p-5 shadow-sm">
        <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
          <span className="w-8 h-8 bg-pink-100 rounded-lg flex items-center justify-center text-base">✨</span>
          외모 & 스타일
        </h2>
        <div className="grid grid-cols-2 gap-4 max-sm:grid-cols-1">
          <div>
            <label className="block text-xs text-slate-500 mb-1">피부톤</label>
            <input type="text" value={skinTone} onChange={(e) => setSkinTone(e.target.value)} placeholder="밝은편, 중간..." className="w-full h-10 px-3 bg-pink-50/50 border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300" />
          </div>
          <div>
            <label className="block text-xs text-slate-500 mb-1">머리길이</label>
            <input type="text" value={hairLength} onChange={(e) => setHairLength(e.target.value)} placeholder="숏컷, 단발, 장발..." className="w-full h-10 px-3 bg-pink-50/50 border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300" />
          </div>
          <div>
            <label className="block text-xs text-slate-500 mb-1">헤어스타일</label>
            <input type="text" value={hairStyle} onChange={(e) => setHairStyle(e.target.value)} placeholder="생머리, 웨이브..." className="w-full h-10 px-3 bg-pink-50/50 border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300" />
          </div>
          <div>
            <label className="block text-xs text-slate-500 mb-1">머리색</label>
            <input type="text" value={hairColor} onChange={(e) => setHairColor(e.target.value)} placeholder="검정, 갈색..." className="w-full h-10 px-3 bg-pink-50/50 border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300" />
          </div>
          <div>
            <label className="block text-xs text-slate-500 mb-1">성격</label>
            <input type="text" value={personality} onChange={(e) => setPersonality(e.target.value)} placeholder="활발함, 차분함..." className="w-full h-10 px-3 bg-pink-50/50 border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300" />
          </div>
          <div>
            <label className="block text-xs text-slate-500 mb-1">스타일</label>
            <input type="text" value={style} onChange={(e) => setStyle(e.target.value)} placeholder="캐주얼, 시크..." className="w-full h-10 px-3 bg-pink-50/50 border border-pink-100 rounded-xl text-sm focus:outline-none focus:border-pink-300" />
          </div>
          <div className="flex items-center gap-6">
            <label className="flex items-center gap-2 text-sm text-slate-600">
              <input type="checkbox" checked={isSmoker} onChange={(e) => setIsSmoker(e.target.checked)} className="w-4 h-4 accent-pink-500 rounded" />
              흡연
            </label>
            <label className="flex items-center gap-2 text-sm text-slate-600">
              <input type="checkbox" checked={isWaxed} onChange={(e) => setIsWaxed(e.target.checked)} className="w-4 h-4 accent-pink-500 rounded" />
              왁싱
            </label>
          </div>
        </div>
      </div>

      {/* 국적 & 언어 */}
      <div className="bg-white rounded-3xl border border-pink-100 p-5 shadow-sm">
        <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
          <span className="w-8 h-8 bg-green-100 rounded-lg flex items-center justify-center text-base">🌍</span>
          국적 & 언어
        </h2>
        <div className="grid grid-cols-2 gap-6 max-sm:grid-cols-1">
          {/* 국적 */}
          <div>
            <label className="block text-xs text-slate-500 mb-2">국적</label>
            <div className="flex flex-wrap gap-2 mb-3">
              {nationalities.map((n) => (
                <span key={n} className="inline-flex items-center gap-1 px-3 py-1.5 bg-green-50 text-green-600 rounded-full text-sm">
                  {n}
                  <button onClick={() => handleRemoveNationality(n)} className="text-green-400 hover:text-red-500">×</button>
                </span>
              ))}
            </div>
            {nationalities.length < 5 && (
              <div className="flex gap-2">
                <input
                  type="text"
                  value={newNationality}
                  onChange={(e) => setNewNationality(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && (e.preventDefault(), handleAddNationality())}
                  placeholder="한국, 일본..."
                  className="flex-1 h-10 px-3 bg-green-50/50 border border-green-100 rounded-xl text-sm focus:outline-none focus:border-green-300"
                />
                <button onClick={handleAddNationality} disabled={!newNationality.trim()} className="px-4 py-2 bg-green-100 text-green-600 text-sm rounded-xl hover:bg-green-200 disabled:opacity-50">추가</button>
              </div>
            )}
          </div>
          {/* 언어 */}
          <div>
            <label className="block text-xs text-slate-500 mb-2">언어</label>
            <div className="flex flex-wrap gap-2 mb-3">
              {languages.map((l) => (
                <span key={l} className="inline-flex items-center gap-1 px-3 py-1.5 bg-indigo-50 text-indigo-600 rounded-full text-sm">
                  {l}
                  <button onClick={() => handleRemoveLanguage(l)} className="text-indigo-400 hover:text-red-500">×</button>
                </span>
              ))}
            </div>
            {languages.length < 5 && (
              <div className="flex gap-2">
                <input
                  type="text"
                  value={newLanguage}
                  onChange={(e) => setNewLanguage(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && (e.preventDefault(), handleAddLanguage())}
                  placeholder="한국어, 영어..."
                  className="flex-1 h-10 px-3 bg-indigo-50/50 border border-indigo-100 rounded-xl text-sm focus:outline-none focus:border-indigo-300"
                />
                <button onClick={handleAddLanguage} disabled={!newLanguage.trim()} className="px-4 py-2 bg-indigo-100 text-indigo-600 text-sm rounded-xl hover:bg-indigo-200 disabled:opacity-50">추가</button>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* 전문 분야 */}
      <div className="bg-white rounded-3xl border border-pink-100 p-5 shadow-sm">
        <h2 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
          <span className="w-8 h-8 bg-orange-100 rounded-lg flex items-center justify-center text-base">🎯</span>
          전문 분야
        </h2>
        <p className="text-sm text-slate-500 mb-4">손님에게 표시됩니다. 최대 10개</p>

        <div className="flex flex-wrap gap-2 mb-4">
          {specialties.map((s) => (
            <span key={s} className="inline-flex items-center gap-1 px-3 py-1.5 bg-orange-50 text-orange-600 rounded-full text-sm">
              {s}
              <button onClick={() => handleRemoveSpecialty(s)} className="text-orange-400 hover:text-red-500">×</button>
            </span>
          ))}
        </div>

        {specialties.length < 10 && (
          <div className="flex gap-2">
            <input
              type="text"
              value={newSpecialty}
              onChange={(e) => setNewSpecialty(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && (e.preventDefault(), handleAddSpecialty())}
              placeholder="새 전문 분야 입력"
              className="flex-1 h-10 px-3 bg-orange-50/50 border border-orange-100 rounded-xl text-sm focus:outline-none focus:border-orange-300"
            />
            <button onClick={handleAddSpecialty} disabled={!newSpecialty.trim()} className="px-4 py-2 bg-orange-100 text-orange-600 text-sm rounded-xl hover:bg-orange-200 disabled:opacity-50">추가</button>
          </div>
        )}
      </div>

      {/* 하단 저장 버튼 */}
      <div className="flex justify-center pt-4 pb-8">
        <button
          onClick={handleSave}
          disabled={saving}
          className="px-10 py-3 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-semibold rounded-full shadow-lg shadow-pink-200 hover:from-pink-600 hover:to-rose-600 transition-all disabled:opacity-50"
        >
          {saving ? '저장 중...' : '프로필 저장하기'}
        </button>
      </div>

      {/* Photo Viewer Modal */}
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

  const onTouchStart = (e: React.TouchEvent) => { setTouchEnd(null); setTouchStart(e.targetTouches[0].clientX); };
  const onTouchMove = (e: React.TouchEvent) => { setTouchEnd(e.targetTouches[0].clientX); };
  const onTouchEnd = () => {
    if (!touchStart || !touchEnd) return;
    const distance = touchStart - touchEnd;
    if (distance > minSwipeDistance && hasNext) onNavigate(currentIndex + 1);
    if (distance < -minSwipeDistance && hasPrev) onNavigate(currentIndex - 1);
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
      <div className="relative w-full h-full flex items-center justify-center p-4" onClick={(e) => e.stopPropagation()} onTouchStart={onTouchStart} onTouchMove={onTouchMove} onTouchEnd={onTouchEnd}>
        <button className="absolute top-4 right-4 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors z-10" onClick={onClose}>×</button>
        <div className="absolute top-4 left-4 px-3 py-1 bg-black/50 rounded-full text-white text-sm">{currentIndex + 1} / {photos.length}</div>
        {hasPrev && <button className="absolute left-2 md:left-4 w-12 h-12 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors" onClick={(e) => { e.stopPropagation(); onNavigate(currentIndex - 1); }}>‹</button>}
        <div className="max-w-4xl max-h-[80vh] flex flex-col items-center">
          <img src={currentPhoto.photo_url} alt={currentPhoto.caption || '사진'} className="max-w-full max-h-[70vh] object-contain rounded-lg" draggable={false} />
          {currentPhoto.caption && <p className="mt-4 text-center text-white text-sm">{currentPhoto.caption}</p>}
        </div>
        {hasNext && <button className="absolute right-2 md:right-4 w-12 h-12 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center text-white text-2xl transition-colors" onClick={(e) => { e.stopPropagation(); onNavigate(currentIndex + 1); }}>›</button>}
        <div className="absolute bottom-4 left-1/2 -translate-x-1/2 text-white/50 text-xs md:hidden">좌우로 스와이프</div>
      </div>
    </div>
  );
}
