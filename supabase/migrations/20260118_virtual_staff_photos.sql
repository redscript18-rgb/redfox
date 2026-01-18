-- 관리자 등록 매니저 일별 사진 테이블
CREATE TABLE virtual_staff_photos (
  id SERIAL PRIMARY KEY,
  virtual_staff_id UUID REFERENCES virtual_staff(id) ON DELETE CASCADE NOT NULL,
  photo_url TEXT NOT NULL,
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  caption TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE virtual_staff_photos ENABLE ROW LEVEL SECURITY;

-- 모든 인증된 사용자가 조회 가능
CREATE POLICY "가상매니저 사진 조회" ON virtual_staff_photos
  FOR SELECT TO authenticated USING (true);

-- 가상 매니저를 생성한 관리자 또는 해당 가게 관리자만 삽입 가능
CREATE POLICY "가상매니저 사진 업로드" ON virtual_staff_photos
  FOR INSERT TO authenticated
  WITH CHECK (
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

-- 가상 매니저를 생성한 관리자 또는 해당 가게 관리자만 삭제 가능
CREATE POLICY "가상매니저 사진 삭제" ON virtual_staff_photos
  FOR DELETE TO authenticated
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
CREATE INDEX idx_virtual_staff_photos_staff ON virtual_staff_photos(virtual_staff_id);
CREATE INDEX idx_virtual_staff_photos_date ON virtual_staff_photos(date DESC);
