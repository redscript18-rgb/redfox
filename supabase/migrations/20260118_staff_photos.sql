-- 프로필 사진 컬럼 추가
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS profile_photo_url TEXT;

-- 직원 일별 사진 테이블
CREATE TABLE staff_photos (
  id SERIAL PRIMARY KEY,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  photo_url TEXT NOT NULL,
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  caption TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE staff_photos ENABLE ROW LEVEL SECURITY;

-- 모든 인증된 사용자가 조회 가능
CREATE POLICY "직원 사진 조회" ON staff_photos
  FOR SELECT TO authenticated USING (true);

-- 본인 사진만 삽입 가능
CREATE POLICY "직원 사진 업로드" ON staff_photos
  FOR INSERT TO authenticated
  WITH CHECK (staff_id = auth.uid());

-- 본인 사진만 삭제 가능
CREATE POLICY "직원 사진 삭제" ON staff_photos
  FOR DELETE TO authenticated
  USING (staff_id = auth.uid());

-- 인덱스
CREATE INDEX idx_staff_photos_staff ON staff_photos(staff_id);
CREATE INDEX idx_staff_photos_date ON staff_photos(date DESC);

-- 스토리지 버킷 생성 (Supabase Dashboard에서 실행하거나 아래 주석 해제)
-- INSERT INTO storage.buckets (id, name, public) VALUES ('staff-photos', 'staff-photos', true);
