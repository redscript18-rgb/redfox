-- stores 테이블에 지역(region) 컬럼 추가
ALTER TABLE stores ADD COLUMN IF NOT EXISTS region TEXT;
