-- 역할별 노출 설정 테이블
CREATE TABLE IF NOT EXISTS role_visibility (
  id SERIAL PRIMARY KEY,
  role_type TEXT NOT NULL UNIQUE, -- 'owner', 'admin', 'staff', 'virtual_staff'
  is_visible BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 기본 역할 노출 설정 추가
INSERT INTO role_visibility (role_type, is_visible) VALUES
  ('owner', true),
  ('admin', true),
  ('staff', true),
  ('virtual_staff', true)
ON CONFLICT (role_type) DO NOTHING;

-- RLS 정책
ALTER TABLE role_visibility ENABLE ROW LEVEL SECURITY;

CREATE POLICY "superadmin_manage_role_visibility" ON role_visibility
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "read_role_visibility" ON role_visibility
  FOR SELECT TO authenticated USING (true);
