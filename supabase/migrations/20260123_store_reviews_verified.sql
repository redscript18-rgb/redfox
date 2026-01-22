-- 인증 리뷰 기능 추가
-- 출근 이력이 있는 경우 is_verified = true (인증 뱃지 표시)
-- 출근 이력이 없어도 리뷰 작성 가능 (일반 리뷰)

-- 1. is_verified 컬럼 추가
ALTER TABLE store_reviews ADD COLUMN IF NOT EXISTS is_verified BOOLEAN DEFAULT false;

-- 2. 기존 INSERT 정책 삭제 (출근 이력 필수였던 정책)
DROP POLICY IF EXISTS "리뷰 작성" ON store_reviews;

-- 3. 새 INSERT 정책: 모든 매니저 작성 가능
CREATE POLICY "리뷰 작성" ON store_reviews
  FOR INSERT TO authenticated
  WITH CHECK (
    author_id = auth.uid()
    AND EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 4. 트리거 함수: 리뷰 작성 시 is_verified 자동 설정
CREATE OR REPLACE FUNCTION set_review_verified()
RETURNS TRIGGER AS $$
BEGIN
  -- 출근 이력이 있는지 확인
  NEW.is_verified := EXISTS (
    SELECT 1 FROM schedules
    WHERE schedules.staff_id = NEW.author_id
    AND schedules.store_id = NEW.store_id
    AND schedules.status = 'approved'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 5. INSERT 트리거 생성
DROP TRIGGER IF EXISTS store_reviews_set_verified ON store_reviews;
CREATE TRIGGER store_reviews_set_verified
  BEFORE INSERT ON store_reviews
  FOR EACH ROW
  EXECUTE FUNCTION set_review_verified();

-- 6. 기존 리뷰들의 is_verified 업데이트
UPDATE store_reviews sr
SET is_verified = EXISTS (
  SELECT 1 FROM schedules s
  WHERE s.staff_id = sr.author_id
  AND s.store_id = sr.store_id
  AND s.status = 'approved'
);

-- 7. RPC 함수 업데이트: 모든 가게 목록 + 출근 이력 표시
CREATE OR REPLACE FUNCTION get_all_stores_for_review(p_user_id UUID)
RETURNS TABLE (
  store_id INTEGER,
  store_name TEXT,
  store_address TEXT,
  work_count BIGINT,
  has_review BOOLEAN,
  is_worked BOOLEAN
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT
    s.id AS store_id,
    s.name AS store_name,
    s.address AS store_address,
    COALESCE(w.work_count, 0) AS work_count,
    EXISTS (
      SELECT 1 FROM store_reviews sr
      WHERE sr.store_id = s.id AND sr.author_id = p_user_id
    ) AS has_review,
    COALESCE(w.work_count, 0) > 0 AS is_worked
  FROM stores s
  LEFT JOIN (
    SELECT sch.store_id, COUNT(*) AS work_count
    FROM schedules sch
    WHERE sch.staff_id = p_user_id
    AND sch.status = 'approved'
    GROUP BY sch.store_id
  ) w ON w.store_id = s.id
  ORDER BY
    COALESCE(w.work_count, 0) DESC,  -- 출근 이력 있는 가게 먼저
    s.name ASC;
END;
$$;
