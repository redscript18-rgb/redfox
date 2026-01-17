-- 가게 영업시간 컬럼 추가
ALTER TABLE stores ADD COLUMN IF NOT EXISTS phone TEXT;
ALTER TABLE stores ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE stores ADD COLUMN IF NOT EXISTS open_time TIME DEFAULT '10:00';
ALTER TABLE stores ADD COLUMN IF NOT EXISTS close_time TIME DEFAULT '22:00';
ALTER TABLE stores ADD COLUMN IF NOT EXISTS closed_days INTEGER[] DEFAULT '{}'; -- 0=일, 1=월, ..., 6=토
ALTER TABLE stores ADD COLUMN IF NOT EXISTS store_type TEXT; -- 가게 형태 (예: 1인샵, 커플관리샵, 왁싱샵 등)

-- 가게 휴무일 테이블
CREATE TABLE IF NOT EXISTS store_holidays (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  date DATE NOT NULL,
  reason TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (store_id, date)
);

-- RLS 활성화
ALTER TABLE store_holidays ENABLE ROW LEVEL SECURITY;

-- store_holidays RLS 정책
CREATE POLICY "store_holidays_select" ON store_holidays
  FOR SELECT TO authenticated USING (true);

CREATE POLICY "store_holidays_insert" ON store_holidays
  FOR INSERT TO authenticated WITH CHECK (
    EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_holidays.store_id AND store_admins.admin_id = auth.uid())
  );

CREATE POLICY "store_holidays_update" ON store_holidays
  FOR UPDATE TO authenticated USING (
    EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_holidays.store_id AND store_admins.admin_id = auth.uid())
  );

CREATE POLICY "store_holidays_delete" ON store_holidays
  FOR DELETE TO authenticated USING (
    EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_holidays.store_id AND store_admins.admin_id = auth.uid())
  );

-- stores 테이블 업데이트 권한 (관리자도 수정 가능하도록)
DROP POLICY IF EXISTS "사장 가게 관리" ON stores;
CREATE POLICY "가게 관리" ON stores FOR UPDATE TO authenticated USING (
  owner_id = auth.uid()
  OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = stores.id AND store_admins.admin_id = auth.uid())
);
CREATE POLICY "가게 생성" ON stores FOR INSERT TO authenticated WITH CHECK (owner_id = auth.uid());
CREATE POLICY "가게 삭제" ON stores FOR DELETE TO authenticated USING (owner_id = auth.uid());
