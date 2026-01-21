-- 사장 가입 승인 시스템
-- 사장 역할은 superadmin 승인 후 로그인 가능

-- 1. profiles 테이블에 승인 상태 컬럼 추가
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS is_approved BOOLEAN DEFAULT true;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS approved_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS approved_by UUID REFERENCES profiles(id);

-- 2. 기존 사장 계정은 승인된 것으로 처리
UPDATE profiles SET is_approved = true WHERE role = 'owner' AND is_approved IS NULL;

-- 3. 대기 중인 사장 가입 조회 함수 (superadmin용)
CREATE OR REPLACE FUNCTION get_pending_owners()
RETURNS TABLE(
  id UUID,
  username TEXT,
  nickname TEXT,
  email TEXT,
  phone TEXT,
  created_at TIMESTAMP WITH TIME ZONE
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.id,
    p.username,
    p.nickname,
    p.email,
    p.phone,
    p.created_at
  FROM profiles p
  WHERE p.role = 'owner' AND p.is_approved = false
  ORDER BY p.created_at DESC;
END;
$$;

-- 4. 사장 가입 승인 함수
CREATE OR REPLACE FUNCTION approve_owner(p_owner_id UUID, p_approver_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_approver_role TEXT;
BEGIN
  -- 승인자가 superadmin인지 확인
  SELECT role INTO v_approver_role FROM profiles WHERE id = p_approver_id;
  IF v_approver_role != 'superadmin' THEN
    RETURN false;
  END IF;

  -- 승인 처리
  UPDATE profiles
  SET is_approved = true, approved_at = NOW(), approved_by = p_approver_id
  WHERE id = p_owner_id AND role = 'owner' AND is_approved = false;

  RETURN FOUND;
END;
$$;

-- 5. 사장 가입 거절 함수 (계정 삭제)
CREATE OR REPLACE FUNCTION reject_owner(p_owner_id UUID, p_approver_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_approver_role TEXT;
BEGIN
  -- 승인자가 superadmin인지 확인
  SELECT role INTO v_approver_role FROM profiles WHERE id = p_approver_id;
  IF v_approver_role != 'superadmin' THEN
    RETURN false;
  END IF;

  -- 프로필 삭제 (auth.users는 별도 처리 필요)
  DELETE FROM profiles WHERE id = p_owner_id AND role = 'owner' AND is_approved = false;

  RETURN FOUND;
END;
$$;

-- 6. 인덱스
CREATE INDEX IF NOT EXISTS idx_profiles_pending_approval ON profiles(role, is_approved) WHERE is_approved = false;
