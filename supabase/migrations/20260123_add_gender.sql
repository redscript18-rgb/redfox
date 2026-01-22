-- 프로필에 성별 필드 추가 (옵션)
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS gender TEXT;

-- 성별 값 제한 (남성, 여성, 기타, null 허용)
ALTER TABLE profiles ADD CONSTRAINT profiles_gender_check
  CHECK (gender IS NULL OR gender IN ('male', 'female', 'other'));
