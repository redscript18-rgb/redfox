import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './ProfileManage.css';

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
  const [profilePhotoUrl, setProfilePhotoUrl] = useState<string | null>(null);
  const [dailyPhotos, setDailyPhotos] = useState<DailyPhoto[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [uploadingProfile, setUploadingProfile] = useState(false);
  const [uploadingDaily, setUploadingDaily] = useState(false);
  const [newPhotoCaption, setNewPhotoCaption] = useState('');

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
      .select('bio, specialties, profile_photo_url')
      .eq('id', user.id)
      .single();

    if (data) {
      setBio(data.bio || '');
      setSpecialties(data.specialties || []);
      setProfilePhotoUrl(data.profile_photo_url || null);
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

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      handleAddSpecialty();
    }
  };

  const handleProfilePhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !user) return;

    // 파일 크기 체크 (5MB)
    if (file.size > 5 * 1024 * 1024) {
      alert('파일 크기는 5MB 이하여야 합니다.');
      return;
    }

    setUploadingProfile(true);

    const fileExt = file.name.split('.').pop();
    const fileName = `profile_${user.id}_${Date.now()}.${fileExt}`;
    const filePath = `profiles/${fileName}`;

    // 스토리지에 업로드
    const { error: uploadError } = await supabase.storage
      .from('staff-photos')
      .upload(filePath, file);

    if (uploadError) {
      alert('업로드 중 오류가 발생했습니다: ' + uploadError.message);
      setUploadingProfile(false);
      return;
    }

    // 공개 URL 가져오기
    const { data: { publicUrl } } = supabase.storage
      .from('staff-photos')
      .getPublicUrl(filePath);

    // 프로필 업데이트
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

  const handleDailyPhotoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !user) return;

    // 파일 크기 체크 (5MB)
    if (file.size > 5 * 1024 * 1024) {
      alert('파일 크기는 5MB 이하여야 합니다.');
      return;
    }

    setUploadingDaily(true);

    const fileExt = file.name.split('.').pop();
    const today = new Date().toISOString().split('T')[0];
    const fileName = `daily_${user.id}_${Date.now()}.${fileExt}`;
    const filePath = `daily/${fileName}`;

    // 스토리지에 업로드
    const { error: uploadError } = await supabase.storage
      .from('staff-photos')
      .upload(filePath, file);

    if (uploadError) {
      alert('업로드 중 오류가 발생했습니다: ' + uploadError.message);
      setUploadingDaily(false);
      return;
    }

    // 공개 URL 가져오기
    const { data: { publicUrl } } = supabase.storage
      .from('staff-photos')
      .getPublicUrl(filePath);

    // DB에 저장
    const { error: insertError } = await supabase
      .from('staff_photos')
      .insert({
        staff_id: user.id,
        photo_url: publicUrl,
        date: today,
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
      })
      .eq('id', user.id);

    setSaving(false);

    if (error) {
      alert('저장 중 오류가 발생했습니다.');
    } else {
      alert('프로필이 저장되었습니다.');
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getMonth() + 1}/${date.getDate()}`;
  };

  if (loading) {
    return <div className="profile-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="profile-manage">
      <Link to="/staff" className="back-link">← 대시보드</Link>

      <h1>프로필 관리</h1>

      {/* 프로필 사진 */}
      <section className="section">
        <h2>프로필 사진</h2>
        <div className="profile-photo-section">
          <div className="profile-photo-preview">
            {profilePhotoUrl ? (
              <img src={profilePhotoUrl} alt="프로필" />
            ) : (
              <div className="photo-placeholder">
                {user?.name?.charAt(0) || '?'}
              </div>
            )}
          </div>
          <div className="profile-photo-actions">
            <input
              type="file"
              ref={profileInputRef}
              onChange={handleProfilePhotoUpload}
              accept="image/*"
              style={{ display: 'none' }}
            />
            <button
              type="button"
              onClick={() => profileInputRef.current?.click()}
              className="upload-btn"
              disabled={uploadingProfile}
            >
              {uploadingProfile ? '업로드 중...' : '사진 변경'}
            </button>
            <p className="upload-hint">JPG, PNG (최대 5MB)</p>
          </div>
        </div>
      </section>

      {/* 자기소개 */}
      <section className="section">
        <h2>자기소개</h2>
        <textarea
          value={bio}
          onChange={(e) => setBio(e.target.value)}
          placeholder="간단한 자기소개를 입력하세요"
          rows={4}
          className="bio-input"
        />
      </section>

      {/* 전문 분야 */}
      <section className="section">
        <h2>전문 분야 (스킬)</h2>
        <p className="section-desc">손님에게 표시되는 전문 분야입니다. 최대 10개까지 등록 가능합니다.</p>

        <div className="specialty-list">
          {specialties.map((specialty) => (
            <div key={specialty} className="specialty-tag">
              <span>{specialty}</span>
              <button
                type="button"
                onClick={() => handleRemoveSpecialty(specialty)}
                className="remove-btn"
              >
                ×
              </button>
            </div>
          ))}
        </div>

        {specialties.length < 10 && (
          <div className="add-specialty">
            <input
              type="text"
              value={newSpecialty}
              onChange={(e) => setNewSpecialty(e.target.value)}
              onKeyPress={handleKeyPress}
              placeholder="새 전문 분야 입력"
              className="specialty-input"
            />
            <button
              type="button"
              onClick={handleAddSpecialty}
              className="add-btn"
              disabled={!newSpecialty.trim()}
            >
              추가
            </button>
          </div>
        )}

        {specialties.length === 0 && (
          <p className="empty">등록된 전문 분야가 없습니다.</p>
        )}
      </section>

      <div className="actions">
        <button onClick={handleSave} className="save-btn" disabled={saving}>
          {saving ? '저장 중...' : '저장하기'}
        </button>
      </div>

      {/* 일별 사진 */}
      <section className="section daily-photos-section">
        <h2>오늘의 사진</h2>
        <p className="section-desc">오늘 작업한 결과물이나 스타일 사진을 올려보세요. 손님들이 볼 수 있습니다.</p>

        <div className="daily-photo-upload">
          <input
            type="text"
            value={newPhotoCaption}
            onChange={(e) => setNewPhotoCaption(e.target.value)}
            placeholder="사진 설명 (선택)"
            className="caption-input"
          />
          <input
            type="file"
            ref={dailyInputRef}
            onChange={handleDailyPhotoUpload}
            accept="image/*"
            style={{ display: 'none' }}
          />
          <button
            type="button"
            onClick={() => dailyInputRef.current?.click()}
            className="upload-btn"
            disabled={uploadingDaily}
          >
            {uploadingDaily ? '업로드 중...' : '사진 업로드'}
          </button>
        </div>

        {dailyPhotos.length > 0 ? (
          <div className="daily-photos-grid">
            {dailyPhotos.map((photo) => (
              <div key={photo.id} className="daily-photo-card">
                <img src={photo.photo_url} alt={photo.caption || '사진'} />
                <div className="photo-info">
                  <span className="photo-date">{formatDate(photo.date)}</span>
                  {photo.caption && <span className="photo-caption">{photo.caption}</span>}
                </div>
                <button
                  type="button"
                  onClick={() => handleDeleteDailyPhoto(photo.id)}
                  className="delete-photo-btn"
                >
                  삭제
                </button>
              </div>
            ))}
          </div>
        ) : (
          <p className="empty">아직 업로드한 사진이 없습니다.</p>
        )}
      </section>
    </div>
  );
}
