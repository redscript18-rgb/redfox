-- 가게 리뷰 좋아요
CREATE TABLE store_review_likes (
  id SERIAL PRIMARY KEY,
  review_id INTEGER REFERENCES store_reviews(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (review_id, user_id)
);

-- 가게 리뷰 댓글 좋아요
CREATE TABLE store_review_comment_likes (
  id SERIAL PRIMARY KEY,
  comment_id INTEGER REFERENCES store_review_comments(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (comment_id, user_id)
);

-- 정보공유 게시글 좋아요
CREATE TABLE info_post_likes (
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES info_posts(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (post_id, user_id)
);

-- 정보공유 댓글 좋아요
CREATE TABLE info_post_comment_likes (
  id SERIAL PRIMARY KEY,
  comment_id INTEGER REFERENCES info_post_comments(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (comment_id, user_id)
);

-- RLS 활성화
ALTER TABLE store_review_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE store_review_comment_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE info_post_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE info_post_comment_likes ENABLE ROW LEVEL SECURITY;

-- 매니저만 조회/추가/삭제 가능
CREATE POLICY "매니저 리뷰좋아요 조회" ON store_review_likes
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 리뷰좋아요 추가" ON store_review_likes
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid() AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 리뷰좋아요 삭제" ON store_review_likes
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());

CREATE POLICY "매니저 리뷰댓글좋아요 조회" ON store_review_comment_likes
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 리뷰댓글좋아요 추가" ON store_review_comment_likes
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid() AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 리뷰댓글좋아요 삭제" ON store_review_comment_likes
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());

CREATE POLICY "매니저 게시글좋아요 조회" ON info_post_likes
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 게시글좋아요 추가" ON info_post_likes
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid() AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 게시글좋아요 삭제" ON info_post_likes
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());

CREATE POLICY "매니저 게시글댓글좋아요 조회" ON info_post_comment_likes
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 게시글댓글좋아요 추가" ON info_post_comment_likes
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid() AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'manager'));

CREATE POLICY "매니저 게시글댓글좋아요 삭제" ON info_post_comment_likes
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());

-- 인덱스
CREATE INDEX idx_store_review_likes_review ON store_review_likes(review_id);
CREATE INDEX idx_store_review_likes_user ON store_review_likes(user_id);
CREATE INDEX idx_store_review_comment_likes_comment ON store_review_comment_likes(comment_id);
CREATE INDEX idx_info_post_likes_post ON info_post_likes(post_id);
CREATE INDEX idx_info_post_likes_user ON info_post_likes(user_id);
CREATE INDEX idx_info_post_comment_likes_comment ON info_post_comment_likes(comment_id);
