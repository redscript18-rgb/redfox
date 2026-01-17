-- ratings 테이블에 서비스 별점 추가
-- 손님->직원, 관리자->직원 평가 시 사용

ALTER TABLE ratings ADD COLUMN service_rating DECIMAL(2,1)
  CHECK (service_rating IS NULL OR (service_rating >= 0.5 AND service_rating <= 5));

-- 기존 rating 컬럼 이름을 더 명확하게 (기본 별점)
COMMENT ON COLUMN ratings.rating IS '기본 별점';
COMMENT ON COLUMN ratings.service_rating IS '서비스 별점 (손님->직원, 관리자->직원 평가 시)';
