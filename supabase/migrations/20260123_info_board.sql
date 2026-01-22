-- 정보공유 게시판 테이블 (매니저 전용)
CREATE TABLE info_posts (
  id SERIAL PRIMARY KEY,
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL CHECK (char_length(title) >= 2),
  content TEXT NOT NULL CHECK (char_length(content) >= 10),
  category TEXT NOT NULL DEFAULT 'general' CHECK (category IN ('general', 'tip', 'question', 'review')),
  is_anonymous BOOLEAN DEFAULT false,
  view_count INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 정보공유 게시판 댓글 테이블
CREATE TABLE info_post_comments (
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES info_posts(id) ON DELETE CASCADE NOT NULL,
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  content TEXT NOT NULL CHECK (char_length(content) >= 1),
  is_anonymous BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE info_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE info_post_comments ENABLE ROW LEVEL SECURITY;

-- info_posts RLS 정책
-- 모든 매니저가 조회 가능
CREATE POLICY "매니저 게시글 조회" ON info_posts
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 게시글 작성: 매니저만
CREATE POLICY "게시글 작성" ON info_posts
  FOR INSERT TO authenticated
  WITH CHECK (
    author_id = auth.uid()
    AND EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 게시글 수정: 본인 것만
CREATE POLICY "게시글 수정" ON info_posts
  FOR UPDATE TO authenticated
  USING (author_id = auth.uid())
  WITH CHECK (author_id = auth.uid());

-- 게시글 삭제: 본인 것만
CREATE POLICY "게시글 삭제" ON info_posts
  FOR DELETE TO authenticated
  USING (author_id = auth.uid());

-- info_post_comments RLS 정책
-- 모든 매니저가 조회 가능
CREATE POLICY "매니저 게시글댓글 조회" ON info_post_comments
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'manager'
    )
  );

-- 댓글 작성: 매니저만
CREATE POLICY "게시글댓글 작성" ON info_post_comments
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
CREATE POLICY "게시글댓글 삭제" ON info_post_comments
  FOR DELETE TO authenticated
  USING (author_id = auth.uid());

-- 인덱스
CREATE INDEX idx_info_posts_author ON info_posts(author_id);
CREATE INDEX idx_info_posts_category ON info_posts(category);
CREATE INDEX idx_info_posts_created ON info_posts(created_at DESC);
CREATE INDEX idx_info_post_comments_post ON info_post_comments(post_id);
CREATE INDEX idx_info_post_comments_author ON info_post_comments(author_id);

-- updated_at 자동 업데이트 트리거
CREATE OR REPLACE FUNCTION update_info_post_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER info_posts_updated_at
  BEFORE UPDATE ON info_posts
  FOR EACH ROW
  EXECUTE FUNCTION update_info_post_updated_at();

-- 조회수 증가 함수
CREATE OR REPLACE FUNCTION increment_post_view_count(p_post_id INTEGER)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  UPDATE info_posts
  SET view_count = view_count + 1
  WHERE id = p_post_id;
END;
$$;
