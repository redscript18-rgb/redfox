-- 직원 가용성 테이블
CREATE TABLE IF NOT EXISTS staff_availability (
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
CREATE TABLE IF NOT EXISTS work_requests (
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
CREATE POLICY "staff_availability_select" ON staff_availability
  FOR SELECT TO authenticated USING (true);

CREATE POLICY "staff_availability_insert" ON staff_availability
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = staff_id);

CREATE POLICY "staff_availability_update" ON staff_availability
  FOR UPDATE TO authenticated USING (auth.uid() = staff_id);

CREATE POLICY "staff_availability_delete" ON staff_availability
  FOR DELETE TO authenticated USING (auth.uid() = staff_id);

-- work_requests RLS 정책
CREATE POLICY "work_requests_select" ON work_requests
  FOR SELECT TO authenticated USING (
    auth.uid() = staff_id OR auth.uid() = admin_id
  );

CREATE POLICY "work_requests_insert" ON work_requests
  FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "work_requests_update" ON work_requests
  FOR UPDATE TO authenticated USING (
    auth.uid() = staff_id OR auth.uid() = admin_id
  );
