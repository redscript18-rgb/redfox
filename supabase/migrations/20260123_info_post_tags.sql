-- 카테고리 대신 태그 시스템으로 변경
ALTER TABLE info_posts ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}';

-- 기존 카테고리 데이터를 태그로 이전 (선택적)
UPDATE info_posts SET tags = ARRAY[category] WHERE category IS NOT NULL AND category != 'general';

-- 카테고리 컬럼은 유지하되 기본값만 설정 (이전 데이터 호환성)
ALTER TABLE info_posts ALTER COLUMN category SET DEFAULT 'general';
