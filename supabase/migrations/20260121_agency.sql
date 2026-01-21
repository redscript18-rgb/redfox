-- 1. agency 역할 추가
ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_role_check;
ALTER TABLE profiles ADD CONSTRAINT profiles_role_check
  CHECK (role IN ('owner', 'admin', 'staff', 'manager', 'customer', 'superadmin', 'agency'));

-- 2. 에이전시-매니저 연결 테이블
CREATE TABLE agency_managers (
  agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  manager_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('pending', 'active', 'inactive')),
  joined_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  PRIMARY KEY (agency_id, manager_id)
);

CREATE INDEX idx_agency_managers_agency ON agency_managers(agency_id);
CREATE INDEX idx_agency_managers_manager ON agency_managers(manager_id);

-- 3. 에이전시 초대 링크 테이블
CREATE TABLE agency_invites (
  id SERIAL PRIMARY KEY,
  agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  invite_code TEXT NOT NULL UNIQUE,
  expires_at TIMESTAMP WITH TIME ZONE,
  max_uses INTEGER DEFAULT 1,
  used_count INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_agency_invites_code ON agency_invites(invite_code);

-- 4. 에이전시 가상 매니저 테이블
CREATE TABLE agency_virtual_staff (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  phone TEXT,
  bio TEXT,
  specialties TEXT[],
  profile_photo_url TEXT,
  age INTEGER,
  height INTEGER,
  weight INTEGER,
  body_size TEXT,
  job TEXT,
  mbti TEXT,
  is_visible BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_agency_virtual_staff_agency ON agency_virtual_staff(agency_id);

-- 5. 에이전시 파견 테이블
CREATE TABLE agency_dispatches (
  id SERIAL PRIMARY KEY,
  agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  -- 실제 매니저 또는 가상 매니저 중 하나
  manager_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  virtual_staff_id UUID REFERENCES agency_virtual_staff(id) ON DELETE CASCADE,
  -- 파견 대상 (손님 또는 가게)
  target_type TEXT NOT NULL CHECK (target_type IN ('customer', 'store')),
  target_customer_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  target_store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE,
  -- 파견 정보
  date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  -- 매니저 또는 가상 매니저 중 하나 필수
  CONSTRAINT dispatch_has_staff CHECK (manager_id IS NOT NULL OR virtual_staff_id IS NOT NULL)
);

CREATE INDEX idx_agency_dispatches_agency ON agency_dispatches(agency_id);
CREATE INDEX idx_agency_dispatches_manager ON agency_dispatches(manager_id);
CREATE INDEX idx_agency_dispatches_date ON agency_dispatches(date);
CREATE INDEX idx_agency_dispatches_status ON agency_dispatches(status);

-- 6. RLS 정책
ALTER TABLE agency_managers ENABLE ROW LEVEL SECURITY;
ALTER TABLE agency_invites ENABLE ROW LEVEL SECURITY;
ALTER TABLE agency_virtual_staff ENABLE ROW LEVEL SECURITY;
ALTER TABLE agency_dispatches ENABLE ROW LEVEL SECURITY;

-- agency_managers: 에이전시/매니저 본인 또는 superadmin 접근
CREATE POLICY "agency_managers_select" ON agency_managers
  FOR SELECT TO authenticated
  USING (agency_id = auth.uid() OR manager_id = auth.uid()
         OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "agency_managers_insert" ON agency_managers
  FOR INSERT TO authenticated
  WITH CHECK (agency_id = auth.uid() OR manager_id = auth.uid());

CREATE POLICY "agency_managers_update" ON agency_managers
  FOR UPDATE TO authenticated
  USING (agency_id = auth.uid()
         OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "agency_managers_delete" ON agency_managers
  FOR DELETE TO authenticated
  USING (agency_id = auth.uid() OR manager_id = auth.uid());

-- agency_invites: 에이전시 본인 또는 superadmin
CREATE POLICY "agency_invites_all" ON agency_invites
  FOR ALL TO authenticated
  USING (agency_id = auth.uid()
         OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "agency_invites_select_by_code" ON agency_invites
  FOR SELECT TO authenticated USING (true);

-- agency_virtual_staff: 에이전시 본인 또는 superadmin
CREATE POLICY "agency_virtual_staff_all" ON agency_virtual_staff
  FOR ALL TO authenticated
  USING (agency_id = auth.uid()
         OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "agency_virtual_staff_select" ON agency_virtual_staff
  FOR SELECT TO authenticated USING (is_visible = true OR agency_id = auth.uid());

-- agency_dispatches: 관련자 접근
CREATE POLICY "agency_dispatches_select" ON agency_dispatches
  FOR SELECT TO authenticated
  USING (agency_id = auth.uid()
         OR manager_id = auth.uid()
         OR target_customer_id = auth.uid()
         OR EXISTS (SELECT 1 FROM stores WHERE id = target_store_id AND owner_id = auth.uid())
         OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = target_store_id AND admin_id = auth.uid())
         OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "agency_dispatches_manage" ON agency_dispatches
  FOR ALL TO authenticated
  USING (agency_id = auth.uid()
         OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

-- role_visibility에 agency 추가
INSERT INTO role_visibility (role_type, is_visible) VALUES ('agency', true)
ON CONFLICT (role_type) DO NOTHING;
