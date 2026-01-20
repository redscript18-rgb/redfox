-- store_type_visibility 테이블에 순서 컬럼 추가
ALTER TABLE store_type_visibility ADD COLUMN IF NOT EXISTS display_order INTEGER DEFAULT 0;
CREATE INDEX IF NOT EXISTS idx_store_type_visibility_order ON store_type_visibility(display_order);
