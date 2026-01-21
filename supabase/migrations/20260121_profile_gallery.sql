-- 매니저 프로필 갤러리 사진 테이블 (고정 사진, 최대 3장)

-- 일반 매니저 프로필 갤러리
CREATE TABLE IF NOT EXISTS staff_gallery (
  id SERIAL PRIMARY KEY,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  photo_url TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_staff_gallery_staff ON staff_gallery(staff_id);

ALTER TABLE staff_gallery ENABLE ROW LEVEL SECURITY;

-- 본인만 조회/관리
CREATE POLICY "staff_gallery_select" ON staff_gallery
  FOR SELECT TO authenticated USING (true);

CREATE POLICY "staff_gallery_insert" ON staff_gallery
  FOR INSERT TO authenticated
  WITH CHECK (staff_id = auth.uid());

CREATE POLICY "staff_gallery_delete" ON staff_gallery
  FOR DELETE TO authenticated
  USING (staff_id = auth.uid());

-- 등록 매니저 프로필 갤러리
CREATE TABLE IF NOT EXISTS virtual_staff_gallery (
  id SERIAL PRIMARY KEY,
  virtual_staff_id UUID REFERENCES virtual_staff(id) ON DELETE CASCADE NOT NULL,
  photo_url TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_virtual_staff_gallery_staff ON virtual_staff_gallery(virtual_staff_id);

ALTER TABLE virtual_staff_gallery ENABLE ROW LEVEL SECURITY;

-- 조회는 모두 가능
CREATE POLICY "virtual_staff_gallery_select" ON virtual_staff_gallery
  FOR SELECT TO authenticated USING (true);

-- 해당 매니저를 등록한 실장/사장만 관리
CREATE POLICY "virtual_staff_gallery_insert" ON virtual_staff_gallery
  FOR INSERT TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM virtual_staff vs
      WHERE vs.id = virtual_staff_id
      AND (
        vs.created_by_admin_id = auth.uid()
        OR EXISTS (SELECT 1 FROM stores WHERE id = vs.store_id AND owner_id = auth.uid())
        OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = vs.store_id AND admin_id = auth.uid())
      )
    )
  );

CREATE POLICY "virtual_staff_gallery_delete" ON virtual_staff_gallery
  FOR DELETE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM virtual_staff vs
      WHERE vs.id = virtual_staff_id
      AND (
        vs.created_by_admin_id = auth.uid()
        OR EXISTS (SELECT 1 FROM stores WHERE id = vs.store_id AND owner_id = auth.uid())
        OR EXISTS (SELECT 1 FROM store_admins WHERE store_id = vs.store_id AND admin_id = auth.uid())
      )
    )
  );
