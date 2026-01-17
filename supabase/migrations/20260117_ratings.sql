-- 별점 테이블
CREATE TABLE ratings (
  id SERIAL PRIMARY KEY,
  reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE NOT NULL,
  rater_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  target_type TEXT NOT NULL CHECK (target_type IN ('staff', 'customer', 'store')),
  target_profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  target_store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE,
  rating DECIMAL(2,1) NOT NULL CHECK (rating >= 0.5 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  -- 같은 예약에서 같은 대상에게 중복 평가 불가
  UNIQUE (reservation_id, rater_id, target_type)
);

-- RLS 활성화
ALTER TABLE ratings ENABLE ROW LEVEL SECURITY;

-- 모든 인증된 사용자가 조회 가능
CREATE POLICY "별점 조회" ON ratings
  FOR SELECT TO authenticated USING (true);

-- 본인이 작성한 별점만 삽입 가능
CREATE POLICY "별점 작성" ON ratings
  FOR INSERT TO authenticated
  WITH CHECK (rater_id = auth.uid());

-- 본인이 작성한 별점만 수정 가능
CREATE POLICY "별점 수정" ON ratings
  FOR UPDATE TO authenticated
  USING (rater_id = auth.uid());

-- 인덱스
CREATE INDEX idx_ratings_reservation ON ratings(reservation_id);
CREATE INDEX idx_ratings_target_profile ON ratings(target_profile_id);
CREATE INDEX idx_ratings_target_store ON ratings(target_store_id);
CREATE INDEX idx_ratings_rater ON ratings(rater_id);
