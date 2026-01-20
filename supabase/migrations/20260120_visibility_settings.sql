-- stores 테이블에 is_visible 컬럼 추가
ALTER TABLE stores ADD COLUMN IF NOT EXISTS is_visible BOOLEAN DEFAULT true;
CREATE INDEX IF NOT EXISTS idx_stores_is_visible ON stores(is_visible);

-- virtual_staff 테이블에 is_visible 컬럼 추가
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS is_visible BOOLEAN DEFAULT true;
CREATE INDEX IF NOT EXISTS idx_virtual_staff_is_visible ON virtual_staff(is_visible);

-- 업종별 노출 설정 테이블 생성
CREATE TABLE IF NOT EXISTS store_type_visibility (
  id SERIAL PRIMARY KEY,
  store_type TEXT NOT NULL UNIQUE,
  is_visible BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 정책
ALTER TABLE store_type_visibility ENABLE ROW LEVEL SECURITY;

CREATE POLICY "superadmin_manage_type_visibility" ON store_type_visibility
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "read_type_visibility" ON store_type_visibility
  FOR SELECT TO authenticated USING (true);
