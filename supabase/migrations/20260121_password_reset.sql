-- 비밀번호 초기화 요청 시스템

-- 1. 비밀번호 초기화 요청 테이블
CREATE TABLE password_reset_requests (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  reason TEXT,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  temp_password TEXT, -- 관리자가 설정한 임시 비밀번호 (평문으로 저장, 사용자에게 전달용)
  processed_by UUID REFERENCES profiles(id),
  processed_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_password_reset_status ON password_reset_requests(status);
CREATE INDEX idx_password_reset_created ON password_reset_requests(created_at DESC);

-- 2. RLS 정책
ALTER TABLE password_reset_requests ENABLE ROW LEVEL SECURITY;

-- 누구나 요청 생성 가능 (로그인 안 한 상태에서도)
CREATE POLICY "anyone_can_create_reset_request" ON password_reset_requests
  FOR INSERT TO anon, authenticated
  WITH CHECK (true);

-- superadmin만 조회/수정 가능
CREATE POLICY "superadmin_can_view_requests" ON password_reset_requests
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "superadmin_can_update_requests" ON password_reset_requests
  FOR UPDATE TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

-- 3. 대기 중인 요청 수 조회 함수
CREATE OR REPLACE FUNCTION get_pending_reset_count()
RETURNS INTEGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN (SELECT COUNT(*) FROM password_reset_requests WHERE status = 'pending');
END;
$$;

-- 4. 비밀번호 초기화 요청 생성 함수 (비로그인 상태에서도 호출 가능)
CREATE OR REPLACE FUNCTION request_password_reset(p_username TEXT, p_reason TEXT DEFAULT NULL)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_user_exists BOOLEAN;
BEGIN
  -- 사용자 존재 확인
  SELECT EXISTS(SELECT 1 FROM profiles WHERE LOWER(username) = LOWER(p_username)) INTO v_user_exists;

  IF NOT v_user_exists THEN
    RETURN false;
  END IF;

  -- 이미 대기 중인 요청이 있는지 확인
  IF EXISTS(SELECT 1 FROM password_reset_requests WHERE LOWER(username) = LOWER(p_username) AND status = 'pending') THEN
    RETURN true; -- 이미 요청됨
  END IF;

  -- 요청 생성
  INSERT INTO password_reset_requests (username, reason)
  VALUES (LOWER(p_username), p_reason);

  RETURN true;
END;
$$;
