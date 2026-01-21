-- 매니저 가게 가입 요청 테이블
CREATE TABLE store_join_requests (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  message TEXT,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(store_id, staff_id)
);

-- 인덱스
CREATE INDEX idx_store_join_requests_store ON store_join_requests(store_id);
CREATE INDEX idx_store_join_requests_staff ON store_join_requests(staff_id);
CREATE INDEX idx_store_join_requests_status ON store_join_requests(status);

-- RLS 활성화
ALTER TABLE store_join_requests ENABLE ROW LEVEL SECURITY;

-- RLS 정책: 모든 인증된 사용자가 조회 가능
CREATE POLICY "store_join_requests_select" ON store_join_requests
  FOR SELECT TO authenticated
  USING (
    staff_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_join_requests.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = store_join_requests.store_id AND stores.owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- RLS 정책: 매니저 본인만 요청 생성 가능
CREATE POLICY "store_join_requests_insert" ON store_join_requests
  FOR INSERT TO authenticated
  WITH CHECK (staff_id = auth.uid());

-- RLS 정책: 매니저 본인 또는 가게 관리자가 수정 가능
CREATE POLICY "store_join_requests_update" ON store_join_requests
  FOR UPDATE TO authenticated
  USING (
    staff_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_join_requests.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = store_join_requests.store_id AND stores.owner_id = auth.uid())
  );

-- RLS 정책: 매니저 본인만 삭제 가능
CREATE POLICY "store_join_requests_delete" ON store_join_requests
  FOR DELETE TO authenticated
  USING (staff_id = auth.uid());
