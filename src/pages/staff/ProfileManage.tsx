import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface DailyPhoto {
  id: number;
  photo_url: string;
  date: string;
  caption: string | null;
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
  const [dailyPhotos, setDailyPhotos] = useState<DailyPhoto[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [uploadingProfile, setUploadingProfile] = useState(false);
  const [uploadingDaily, setUploadingDaily] = useState(false);
  const [newPhotoCaption, setNewPhotoCaption] = useState('');

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

  const profileInputRef = useRef<HTMLInputElement>(null);
  const dailyInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (user) {
      fetchProfile();
      fetchDailyPhotos();
    }
  }, [user]);

  const fetchProfile = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('profiles')
      .select('bio, specialties, profile_photo_url, age, height, weight, body_size, is_smoker, personality, style, skin_tone, hair_length, hair_style, hair_color, is_waxed, job, mbti, nationalities, languages')
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
      setNationalities(data.nationalities || []);
      setLanguages(data.languages || []);
    }

    setLoading(false);
  };

  const fetchDailyPhotos = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('staff_photos')
      .select('*')
      .eq('staff_id', user.id)
      .order('date', { ascending: false })
      .limit(20);

    setDailyPhotos(data || []);
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

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      handleAddSpecialty();
    }
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
      alert('업로드 중 오류가 발생했습니다: ' + uploadError.message);
      setUploadingProfile(false);
      return;
    }

    const { data: { publicUrl } } = supabase.storage
      .from('staff-photos')
      .getPublicUrl(filePath);

    const { error: updateError } = await supabase
      .from('profiles')
      .update({ profile_photo_url: publicUrl })
      .eq('id', user.id);

    if (updateError) {
      alert('프로필 업데이트 중 오류가 발생했습니다.');
    } else {
      setProfilePhotoUrl(publicUrl);
    }

    setUploadingProfile(false);
  };

  const now = new Date();
  const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
  const todayPhotos = dailyPhotos.filter(p => p.date === today);
  const canUploadMore = todayPhotos.length < 3;

  const handleDailyPhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !user) return;

    if (!canUploadMore) {
      alert('오늘은 최대 3장까지만 업로드할 수 있습니다.');
      return;
    }

    if (file.size > 5 * 1024 * 1024) {
      alert('파일 크기는 5MB 이하여야 합니다.');
      return;
    }

    setUploadingDaily(true);

    const fileExt = file.name.split('.').pop();
    const uploadNow = new Date();
    const uploadDate = `${uploadNow.getFullYear()}-${String(uploadNow.getMonth() + 1).padStart(2, '0')}-${String(uploadNow.getDate()).padStart(2, '0')}`;
    const fileName = `daily_${user.id}_${Date.now()}.${fileExt}`;
    const filePath = `daily/${fileName}`;

    const { error: uploadError } = await supabase.storage
      .from('staff-photos')
      .upload(filePath, file);

    if (uploadError) {
      alert('업로드 중 오류가 발생했습니다: ' + uploadError.message);
      setUploadingDaily(false);
      return;
    }

    const { data: { publicUrl } } = supabase.storage
      .from('staff-photos')
      .getPublicUrl(filePath);

    const { error: insertError } = await supabase
      .from('staff_photos')
      .insert({
        staff_id: user.id,
        photo_url: publicUrl,
        date: uploadDate,
        caption: newPhotoCaption || null,
      });

    if (insertError) {
      alert('사진 저장 중 오류가 발생했습니다.');
    } else {
      setNewPhotoCaption('');
      fetchDailyPhotos();
    }

    setUploadingDaily(false);
  };

  const handleDeleteDailyPhoto = async (photoId: number) => {
    if (!confirm('이 사진을 삭제하시겠습니까?')) return;

    const { error } = await supabase
      .from('staff_photos')
      .delete()
      .eq('id', photoId);

    if (error) {
      alert('삭제 중 오류가 발생했습니다.');
    } else {
      fetchDailyPhotos();
    }
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
        nationalities: nationalities.length > 0 ? nationalities : null,
        languages: languages.length > 0 ? languages : null,
      })
      .eq('id', user.id);

    setSaving(false);

    if (error) {
      alert('저장 중 오류가 발생했습니다.');
    } else {
      alert('프로필이 저장되었습니다.');
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/staff" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>

      {/* Header with Save Button */}
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">프로필 관리</h1>
        <button
          onClick={handleSave}
          disabled={saving}
          className="px-6 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400"
        >
          {saving ? '저장 중...' : '저장하기'}
        </button>
      </div>

      {/* 프로필 사진 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">프로필 사진</h2>
        <div className="flex items-center gap-4">
          <div className="w-20 h-20 rounded-xl bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-2xl font-bold text-white overflow-hidden">
            {profilePhotoUrl ? (
              <img src={profilePhotoUrl} alt="프로필" className="w-full h-full object-cover" />
            ) : (
              user?.name?.charAt(0) || '?'
            )}
          </div>
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
              disabled={uploadingProfile}
            >
              {uploadingProfile ? '업로드 중...' : '사진 변경'}
            </button>
            <p className="text-xs text-slate-500 mt-2">JPG, PNG (최대 5MB)</p>
          </div>
        </div>
      </section>

      {/* 오늘의 사진 - 프로필 사진 바로 아래 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-2">오늘의 사진 ({todayPhotos.length}/3)</h2>
        <p className="text-sm text-slate-500 mb-4">오늘 작업한 결과물이나 스타일 사진을 올려보세요. 손님들이 볼 수 있습니다. (0시 리셋)</p>

        {canUploadMore && (
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
              className="hidden"
            />
            <button
              type="button"
              onClick={() => dailyInputRef.current?.click()}
              disabled={uploadingDaily}
              className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400 whitespace-nowrap flex-shrink-0"
            >
              {uploadingDaily ? '업로드 중...' : '업로드'}
            </button>
          </div>
        )}

        {!canUploadMore && (
          <p className="text-sm text-amber-600 mb-4">오늘 업로드 가능한 사진 수를 모두 사용했습니다.</p>
        )}

        {todayPhotos.length > 0 ? (
          <div className="grid grid-cols-5 gap-2 max-md:grid-cols-3 max-sm:grid-cols-2">
            {todayPhotos.map((photo) => (
              <div key={photo.id} className="relative group">
                <img src={photo.photo_url} alt={photo.caption || '사진'} className="w-full aspect-square object-cover rounded-lg" />
                {photo.caption && (
                  <div className="absolute bottom-0 left-0 right-0 p-2 bg-black/50 text-white text-xs rounded-b-lg truncate">
                    {photo.caption}
                  </div>
                )}
                <button
                  type="button"
                  onClick={() => handleDeleteDailyPhoto(photo.id)}
                  className="absolute top-1 right-1 w-6 h-6 bg-red-500 text-white text-xs rounded-full opacity-0 group-hover:opacity-100 transition-opacity"
                >
                  ×
                </button>
              </div>
            ))}
          </div>
        ) : (
          <p className="text-sm text-slate-400">오늘 업로드한 사진이 없습니다.</p>
        )}
      </section>

      {/* 자기소개 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">자기소개</h2>
        <textarea
          value={bio}
          onChange={(e) => setBio(e.target.value)}
          placeholder="간단한 자기소개를 입력하세요"
          rows={4}
          className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
        />
      </section>

      {/* 기본 정보 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">기본 정보</h2>
        <div className="grid grid-cols-2 gap-4 max-sm:grid-cols-1">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">나이</label>
            <input
              type="number"
              value={age}
              onChange={(e) => setAge(e.target.value ? Number(e.target.value) : '')}
              placeholder="나이"
              min={18}
              max={99}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">직업</label>
            <input
              type="text"
              value={job}
              onChange={(e) => setJob(e.target.value)}
              placeholder="예: 대학생, 직장인, 프리랜서..."
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">MBTI</label>
            <select
              value={mbti}
              onChange={(e) => setMbti(e.target.value)}
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600 bg-white"
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
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
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
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">B-Size</label>
            <input
              type="text"
              value={bodySize}
              onChange={(e) => setBodySize(e.target.value)}
              placeholder="예: A, B, C..."
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">흡연 여부</label>
            <div className="flex gap-4 h-10 items-center">
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="smoking" checked={!isSmoker} onChange={() => setIsSmoker(false)} className="accent-blue-600" />
                비흡연
              </label>
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="smoking" checked={isSmoker} onChange={() => setIsSmoker(true)} className="accent-blue-600" />
                흡연
              </label>
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">왁싱 여부</label>
            <div className="flex gap-4 h-10 items-center">
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="waxing" checked={!isWaxed} onChange={() => setIsWaxed(false)} className="accent-blue-600" />
                안함
              </label>
              <label className="flex items-center gap-2 text-sm">
                <input type="radio" name="waxing" checked={isWaxed} onChange={() => setIsWaxed(true)} className="accent-blue-600" />
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
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">머리길이</label>
            <input
              type="text"
              value={hairLength}
              onChange={(e) => setHairLength(e.target.value)}
              placeholder="예: 숏컷, 단발, 중간, 장발..."
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">헤어스타일</label>
            <input
              type="text"
              value={hairStyle}
              onChange={(e) => setHairStyle(e.target.value)}
              placeholder="예: 생머리, 웨이브..."
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">머리색</label>
            <input
              type="text"
              value={hairColor}
              onChange={(e) => setHairColor(e.target.value)}
              placeholder="예: 검정, 갈색, 금발..."
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
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
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">스타일</label>
            <input
              type="text"
              value={style}
              onChange={(e) => setStyle(e.target.value)}
              placeholder="예: 캐주얼, 시크, 청순..."
              className="w-full h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
            />
          </div>
        </div>
      </section>

      {/* 국적 & 언어 */}
      <section className="mb-6 p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">국적 & 언어</h2>
        <div className="grid grid-cols-2 gap-6 max-sm:grid-cols-1">
          {/* 국적 */}
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">국적</label>
            <div className="flex flex-wrap gap-2 mb-3">
              {nationalities.map((nationality) => (
                <div key={nationality} className="flex items-center gap-1 px-3 py-1.5 bg-green-50 text-green-600 rounded-full text-sm">
                  <span>{nationality}</span>
                  <button
                    type="button"
                    onClick={() => handleRemoveNationality(nationality)}
                    className="w-4 h-4 flex items-center justify-center text-green-400 hover:text-red-500"
                  >
                    ×
                  </button>
                </div>
              ))}
            </div>
            {nationalities.length < 5 && (
              <div className="flex gap-2">
                <input
                  type="text"
                  value={newNationality}
                  onChange={(e) => setNewNationality(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && (e.preventDefault(), handleAddNationality())}
                  placeholder="예: 한국, 일본, 미국..."
                  className="flex-1 h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
                />
                <button
                  type="button"
                  onClick={handleAddNationality}
                  disabled={!newNationality.trim()}
                  className="px-4 py-2 bg-slate-100 text-slate-700 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors disabled:opacity-50"
                >
                  추가
                </button>
              </div>
            )}
          </div>

          {/* 언어 */}
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">언어</label>
            <div className="flex flex-wrap gap-2 mb-3">
              {languages.map((language) => (
                <div key={language} className="flex items-center gap-1 px-3 py-1.5 bg-indigo-50 text-indigo-600 rounded-full text-sm">
                  <span>{language}</span>
                  <button
                    type="button"
                    onClick={() => handleRemoveLanguage(language)}
                    className="w-4 h-4 flex items-center justify-center text-indigo-400 hover:text-red-500"
                  >
                    ×
                  </button>
                </div>
              ))}
            </div>
            {languages.length < 5 && (
              <div className="flex gap-2">
                <input
                  type="text"
                  value={newLanguage}
                  onChange={(e) => setNewLanguage(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && (e.preventDefault(), handleAddLanguage())}
                  placeholder="예: 한국어, 영어, 일본어..."
                  className="flex-1 h-10 px-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600"
                />
                <button
                  type="button"
                  onClick={handleAddLanguage}
                  disabled={!newLanguage.trim()}
                  className="px-4 py-2 bg-slate-100 text-slate-700 text-sm font-medium rounded-lg hover:bg-slate-200 transition-colors disabled:opacity-50"
                >
                  추가
                </button>
              </div>
            )}
          </div>
        </div>
      </section>

      {/* 전문 분야 */}
      <section className="p-4 bg-white border border-slate-200 rounded-xl">
        <h2 className="text-lg font-semibold text-slate-900 mb-2">전문 분야 (스킬)</h2>
        <p className="text-sm text-slate-500 mb-4">손님에게 표시되는 전문 분야입니다. 최대 10개까지 등록 가능합니다.</p>

        <div className="flex flex-wrap gap-2 mb-4">
          {specialties.map((specialty) => (
            <div key={specialty} className="flex items-center gap-1 px-3 py-1.5 bg-orange-50 text-orange-600 rounded-full text-sm">
              <span>{specialty}</span>
              <button
                type="button"
                onClick={() => handleRemoveSpecialty(specialty)}
                className="w-4 h-4 flex items-center justify-center text-blue-400 hover:text-red-500"
              >
                ×
              </button>
            </div>
          ))}
        </div>

        {specialties.length < 10 && (
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

    </div>
  );
}
