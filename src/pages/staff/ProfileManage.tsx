import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './ProfileManage.css';

export default function ProfileManage() {
  const { user } = useAuth();
  const [bio, setBio] = useState('');
  const [specialties, setSpecialties] = useState<string[]>([]);
  const [newSpecialty, setNewSpecialty] = useState('');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    if (user) {
      fetchProfile();
    }
  }, [user]);

  const fetchProfile = async () => {
    if (!user) return;

    const { data } = await supabase
      .from('profiles')
      .select('bio, specialties')
      .eq('id', user.id)
      .single();

    if (data) {
      setBio(data.bio || '');
      setSpecialties(data.specialties || []);
    }

    setLoading(false);
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

  if (loading) {
    return <div className="profile-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="profile-manage">
      <Link to="/staff" className="back-link">← 대시보드</Link>

      <h1>프로필 관리</h1>

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
    </div>
  );
}
