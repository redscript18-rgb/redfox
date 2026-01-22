-- 가게 리뷰 테이블 (매니저 전용)
CREATE TABLE store_reviews (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  content TEXT NOT NULL CHECK (char_length(content) >= 10),
  is_anonymous BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (store_id, author_id)  -- 가게당 1개 리뷰
);

-- 가게 리뷰 댓글 테이블
CREATE TABLE store_review_comments (
  id SERIAL PRIMARY KEY,
  review_id INTEGER REFERENCES store_reviews(id) ON DELETE CASCADE NOT NULL,
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  content TEXT NOT NULL CHECK (char_length(content) >= 1),
  is_anonymous BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE store_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE store_review_comments ENABLE ROW LEVEL SECURITY;

-- store_reviews RLS 정책
-- 모든 매니저가 조회 가능
CREATE POLICY "매니저 리뷰 조회" ON store_reviews
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 리뷰 작성: 매니저 + 출근 이력 있는 가게만
CREATE POLICY "리뷰 작성" ON store_reviews
  FOR INSERT TO authenticated
  WITH CHECK (
    author_id = auth.uid()
    AND EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
    AND EXISTS (
      SELECT 1 FROM schedules
      WHERE schedules.staff_id = auth.uid()
      AND schedules.store_id = store_reviews.store_id
      AND schedules.status = 'approved'
    )
  );

-- 리뷰 수정: 본인 것만
CREATE POLICY "리뷰 수정" ON store_reviews
  FOR UPDATE TO authenticated
  USING (author_id = auth.uid())
  WITH CHECK (author_id = auth.uid());

-- 리뷰 삭제: 본인 것만
CREATE POLICY "리뷰 삭제" ON store_reviews
  FOR DELETE TO authenticated
  USING (author_id = auth.uid());

-- store_review_comments RLS 정책
-- 모든 매니저가 조회 가능
CREATE POLICY "매니저 댓글 조회" ON store_review_comments
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 댓글 작성: 매니저만
CREATE POLICY "댓글 작성" ON store_review_comments
  FOR INSERT TO authenticated
  WITH CHECK (
    author_id = auth.uid()
    AND EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 댓글 삭제: 본인 것만
CREATE POLICY "댓글 삭제" ON store_review_comments
  FOR DELETE TO authenticated
  USING (author_id = auth.uid());

-- 인덱스
CREATE INDEX idx_store_reviews_store ON store_reviews(store_id);
CREATE INDEX idx_store_reviews_author ON store_reviews(author_id);
CREATE INDEX idx_store_reviews_created ON store_reviews(created_at DESC);
CREATE INDEX idx_store_review_comments_review ON store_review_comments(review_id);
CREATE INDEX idx_store_review_comments_author ON store_review_comments(author_id);

-- RPC: 리뷰 작성 가능한 가게 목록 (출근 이력 있는 가게 중 리뷰 미작성)
CREATE OR REPLACE FUNCTION get_reviewable_stores(p_user_id UUID)
RETURNS TABLE (
  store_id INTEGER,
  store_name TEXT,
  store_address TEXT,
  work_count BIGINT,
  has_review BOOLEAN
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT DISTINCT
    s.id AS store_id,
    s.name AS store_name,
    s.address AS store_address,
    COUNT(sch.id) AS work_count,
    EXISTS (
      SELECT 1 FROM store_reviews sr
      WHERE sr.store_id = s.id AND sr.author_id = p_user_id
    ) AS has_review
  FROM stores s
  INNER JOIN schedules sch ON sch.store_id = s.id
  WHERE sch.staff_id = p_user_id
    AND sch.status = 'approved'
  GROUP BY s.id, s.name, s.address
  ORDER BY work_count DESC;
END;
$$;

-- updated_at 자동 업데이트 트리거
CREATE OR REPLACE FUNCTION update_store_review_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER store_reviews_updated_at
  BEFORE UPDATE ON store_reviews
  FOR EACH ROW
  EXECUTE FUNCTION update_store_review_updated_at();
