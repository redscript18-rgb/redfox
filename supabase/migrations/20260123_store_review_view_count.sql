-- 가게 리뷰에 조회수 추가
ALTER TABLE store_reviews ADD COLUMN view_count INTEGER DEFAULT 0;

-- 조회수 증가 함수
CREATE OR REPLACE FUNCTION increment_review_view_count(p_review_id INTEGER)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  UPDATE store_reviews
  SET view_count = view_count + 1
  WHERE id = p_review_id;
END;
$$;
