-- 정보공유 게시글에 가게 태그 기능 추가
ALTER TABLE info_posts ADD COLUMN store_id INTEGER REFERENCES stores(id) ON DELETE SET NULL;

-- 인덱스 추가
CREATE INDEX idx_info_posts_store ON info_posts(store_id);
