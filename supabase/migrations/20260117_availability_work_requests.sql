-- 직원 가용성 테이블
CREATE TABLE staff_availability (
  id SERIAL PRIMARY KEY,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  day_of_week INTEGER NOT NULL CHECK (day_of_week >= 0 AND day_of_week <= 6),
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (staff_id, day_of_week, start_time, end_time)
);

-- 출근 요청 테이블
CREATE TABLE work_requests (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  admin_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
  date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  message TEXT,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'accepted', 'rejected', 'cancelled')),
  schedule_id INTEGER REFERENCES schedules(id) ON DELETE SET NULL,
  responded_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE staff_availability ENABLE ROW LEVEL SECURITY;
ALTER TABLE work_requests ENABLE ROW LEVEL SECURITY;

-- staff_availability RLS 정책
-- 모든 인증된 사용자가 조회 가능
CREATE POLICY "가용성 조회" ON staff_availability
  FOR SELECT TO authenticated USING (true);

-- 본인만 삽입 가능
CREATE POLICY "본인 가용성 등록" ON staff_availability
  FOR INSERT TO authenticated
  WITH CHECK (staff_id = auth.uid());

-- 본인만 수정 가능
CREATE POLICY "본인 가용성 수정" ON staff_availability
  FOR UPDATE TO authenticated
  USING (staff_id = auth.uid());

-- 본인만 삭제 가능
CREATE POLICY "본인 가용성 삭제" ON staff_availability
  FOR DELETE TO authenticated
  USING (staff_id = auth.uid());

-- work_requests RLS 정책
-- 해당 직원 또는 해당 가게 관리자만 조회 가능
CREATE POLICY "출근요청 조회" ON work_requests
  FOR SELECT TO authenticated
  USING (
    staff_id = auth.uid()
    OR admin_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = work_requests.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = work_requests.store_id AND stores.owner_id = auth.uid())
  );

-- 관리자만 생성 가능
CREATE POLICY "관리자 출근요청 생성" ON work_requests
  FOR INSERT TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = work_requests.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = work_requests.store_id AND stores.owner_id = auth.uid())
  );

-- 직원 또는 관리자 수정 가능
CREATE POLICY "출근요청 수정" ON work_requests
  FOR UPDATE TO authenticated
  USING (
    staff_id = auth.uid()
    OR admin_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = work_requests.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = work_requests.store_id AND stores.owner_id = auth.uid())
  );

-- 인덱스
CREATE INDEX idx_staff_availability_staff ON staff_availability(staff_id);
CREATE INDEX idx_staff_availability_day ON staff_availability(day_of_week);
CREATE INDEX idx_work_requests_staff ON work_requests(staff_id);
CREATE INDEX idx_work_requests_store ON work_requests(store_id);
CREATE INDEX idx_work_requests_date ON work_requests(date);
CREATE INDEX idx_work_requests_status ON work_requests(status);
