-- 가게-에이전시 연결 요청 테이블
CREATE TABLE IF NOT EXISTS store_agency_requests (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  message TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  processed_at TIMESTAMP WITH TIME ZONE,
  UNIQUE(store_id, agency_id)
);

-- 가게-에이전시 연결 테이블 (승인된 관계)
CREATE TABLE IF NOT EXISTS store_agencies (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  joined_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(store_id, agency_id)
);

-- 인덱스
CREATE INDEX IF NOT EXISTS idx_store_agency_requests_store ON store_agency_requests(store_id);
CREATE INDEX IF NOT EXISTS idx_store_agency_requests_agency ON store_agency_requests(agency_id);
CREATE INDEX IF NOT EXISTS idx_store_agency_requests_status ON store_agency_requests(status);
CREATE INDEX IF NOT EXISTS idx_store_agencies_store ON store_agencies(store_id);
CREATE INDEX IF NOT EXISTS idx_store_agencies_agency ON store_agencies(agency_id);

-- RLS 활성화
ALTER TABLE store_agency_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE store_agencies ENABLE ROW LEVEL SECURITY;

-- store_agency_requests RLS 정책
-- 조회: 에이전시, 가게 사장/실장, superadmin
CREATE POLICY "store_agency_requests_select" ON store_agency_requests
  FOR SELECT TO authenticated
  USING (
    agency_id = auth.uid()
    OR EXISTS (SELECT 1 FROM stores WHERE id = store_id AND owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = store_agency_requests.store_id AND admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- 삽입: 가게 사장/실장만
CREATE POLICY "store_agency_requests_insert" ON store_agency_requests
  FOR INSERT TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM stores WHERE id = store_id AND owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = store_agency_requests.store_id AND admin_id = auth.uid())
  );

-- 수정: 에이전시만 (승인/거절)
CREATE POLICY "store_agency_requests_update" ON store_agency_requests
  FOR UPDATE TO authenticated
  USING (agency_id = auth.uid());

-- 삭제: 요청자 또는 superadmin
CREATE POLICY "store_agency_requests_delete" ON store_agency_requests
  FOR DELETE TO authenticated
  USING (
    EXISTS (SELECT 1 FROM stores WHERE id = store_id AND owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = store_agency_requests.store_id AND admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- store_agencies RLS 정책
-- 조회: 관련자 모두
CREATE POLICY "store_agencies_select" ON store_agencies
  FOR SELECT TO authenticated
  USING (
    agency_id = auth.uid()
    OR EXISTS (SELECT 1 FROM stores WHERE id = store_id AND owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = store_agencies.store_id AND admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- 삽입/삭제: 에이전시 또는 superadmin
CREATE POLICY "store_agencies_insert" ON store_agencies
  FOR INSERT TO authenticated
  WITH CHECK (
    agency_id = auth.uid()
    OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

CREATE POLICY "store_agencies_delete" ON store_agencies
  FOR DELETE TO authenticated
  USING (
    agency_id = auth.uid()
    OR EXISTS (SELECT 1 FROM stores WHERE id = store_id AND owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- 요청 승인 함수
CREATE OR REPLACE FUNCTION approve_store_agency_request(p_request_id INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user_id UUID := auth.uid();
  v_request store_agency_requests%ROWTYPE;
BEGIN
  -- 요청 조회
  SELECT * INTO v_request
  FROM store_agency_requests
  WHERE id = p_request_id AND agency_id = v_user_id AND status = 'pending';

  IF NOT FOUND THEN
    RETURN FALSE;
  END IF;

  -- 요청 상태 업데이트
  UPDATE store_agency_requests
  SET status = 'approved', processed_at = NOW()
  WHERE id = p_request_id;

  -- store_agencies에 추가
  INSERT INTO store_agencies (store_id, agency_id)
  VALUES (v_request.store_id, v_request.agency_id)
  ON CONFLICT (store_id, agency_id) DO NOTHING;

  RETURN TRUE;
END;
$$;

-- 요청 거절 함수
CREATE OR REPLACE FUNCTION reject_store_agency_request(p_request_id INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user_id UUID := auth.uid();
BEGIN
  UPDATE store_agency_requests
  SET status = 'rejected', processed_at = NOW()
  WHERE id = p_request_id AND agency_id = v_user_id AND status = 'pending';

  RETURN FOUND;
END;
$$;

-- 함수 실행 권한
GRANT EXECUTE ON FUNCTION approve_store_agency_request(INTEGER) TO authenticated;
GRANT EXECUTE ON FUNCTION reject_store_agency_request(INTEGER) TO authenticated;
