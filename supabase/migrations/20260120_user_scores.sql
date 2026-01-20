-- 사용자 점수 테이블
CREATE TABLE user_scores (
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE PRIMARY KEY,
  total_score INTEGER DEFAULT 0,
  last_login_reward_date DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 점수 내역 테이블 (확장성을 위해)
CREATE TABLE score_history (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  reason TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 인덱스
CREATE INDEX idx_score_history_user_id ON score_history(user_id);
CREATE INDEX idx_score_history_created_at ON score_history(created_at);

-- RLS 정책
ALTER TABLE user_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE score_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "view_own_score" ON user_scores
  FOR SELECT TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "manage_own_score" ON user_scores
  FOR ALL TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "view_own_history" ON score_history
  FOR SELECT TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "insert_own_history" ON score_history
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- Superadmin 전체 접근
CREATE POLICY "superadmin_scores" ON user_scores
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "superadmin_history" ON score_history
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));
