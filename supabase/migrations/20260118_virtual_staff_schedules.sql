-- 관리자 등록 매니저 출근 일정 테이블
CREATE TABLE virtual_staff_schedules (
  id SERIAL PRIMARY KEY,
  virtual_staff_id UUID REFERENCES virtual_staff(id) ON DELETE CASCADE NOT NULL,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE virtual_staff_schedules ENABLE ROW LEVEL SECURITY;

-- 모든 인증된 사용자가 조회 가능
CREATE POLICY "가상매니저 출근일정 조회" ON virtual_staff_schedules
  FOR SELECT TO authenticated USING (true);

-- 관리자만 삽입/수정/삭제 가능
CREATE POLICY "가상매니저 출근일정 관리" ON virtual_staff_schedules
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM virtual_staff vs
      WHERE vs.id = virtual_staff_id
      AND (
        vs.created_by_admin_id = auth.uid()
        OR EXISTS (
          SELECT 1 FROM store_admins sa
          WHERE sa.store_id = vs.store_id AND sa.admin_id = auth.uid()
        )
        OR EXISTS (
          SELECT 1 FROM stores s
          WHERE s.id = vs.store_id AND s.owner_id = auth.uid()
        )
      )
    )
  );

-- 인덱스
CREATE INDEX idx_virtual_staff_schedules_staff ON virtual_staff_schedules(virtual_staff_id);
CREATE INDEX idx_virtual_staff_schedules_date ON virtual_staff_schedules(date);
CREATE INDEX idx_virtual_staff_schedules_store ON virtual_staff_schedules(store_id);
