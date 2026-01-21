-- 사용자 ID 기반 인증으로 변경
-- username(아이디)과 nickname(닉네임) 컬럼 추가

-- 1. profiles 테이블에 컬럼 추가
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS username TEXT UNIQUE;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS nickname TEXT;

-- 2. 기존 사용자들에게 임시 username 생성 (이메일 앞부분 사용)
UPDATE profiles
SET username = COALESCE(username, SPLIT_PART(email, '@', 1) || '_' || SUBSTRING(id::TEXT, 1, 4))
WHERE username IS NULL;

-- 3. 기존 사용자들에게 nickname 설정 (name 복사)
UPDATE profiles
SET nickname = COALESCE(nickname, name)
WHERE nickname IS NULL;

-- 4. 인덱스 생성
CREATE INDEX IF NOT EXISTS idx_profiles_username ON profiles(username);

-- 5. username 중복 체크 함수
CREATE OR REPLACE FUNCTION check_username_available(p_username TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN NOT EXISTS (
    SELECT 1 FROM profiles WHERE LOWER(username) = LOWER(p_username)
  );
END;
$$;

-- 6. username으로 사용자 조회 함수
CREATE OR REPLACE FUNCTION get_user_by_username(p_username TEXT)
RETURNS TABLE(id UUID, email TEXT, username TEXT, nickname TEXT, name TEXT, role TEXT)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT
    profiles.id,
    profiles.email,
    profiles.username,
    profiles.nickname,
    profiles.name,
    profiles.role
  FROM profiles
  WHERE LOWER(profiles.username) = LOWER(p_username);
END;
$$;
