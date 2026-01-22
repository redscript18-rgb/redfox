-- 사진 좋아요 테이블
CREATE TABLE staff_photo_likes (
  id SERIAL PRIMARY KEY,
  photo_id INTEGER REFERENCES staff_photos(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(photo_id, user_id)
);

CREATE INDEX idx_staff_photo_likes_photo ON staff_photo_likes(photo_id);
CREATE INDEX idx_staff_photo_likes_user ON staff_photo_likes(user_id);

-- RLS 정책
ALTER TABLE staff_photo_likes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "staff_photo_likes_select" ON staff_photo_likes
  FOR SELECT TO authenticated
  USING (true);

CREATE POLICY "staff_photo_likes_insert" ON staff_photo_likes
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "staff_photo_likes_delete" ON staff_photo_likes
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());

-- staff_photos 테이블에 like_count 컬럼 추가
ALTER TABLE staff_photos ADD COLUMN IF NOT EXISTS like_count INTEGER DEFAULT 0;

-- 좋아요 수 동기화 함수
CREATE OR REPLACE FUNCTION update_photo_like_count()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE staff_photos SET like_count = like_count + 1 WHERE id = NEW.photo_id;
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE staff_photos SET like_count = GREATEST(0, like_count - 1) WHERE id = OLD.photo_id;
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_photo_like_count
AFTER INSERT OR DELETE ON staff_photo_likes
FOR EACH ROW EXECUTE FUNCTION update_photo_like_count();
