-- 선물 기능을 위한 RLS 정책 추가

-- 기존 정책 삭제 (에러 방지를 위해 IF EXISTS 사용)
DROP POLICY IF EXISTS "manage_own_score" ON user_scores;
DROP POLICY IF EXISTS "insert_own_history" ON score_history;

-- user_scores: 자신의 점수 관리 + 다른 사람에게 선물 가능
CREATE POLICY "manage_own_score" ON user_scores
  FOR UPDATE TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "gift_score_update" ON user_scores
  FOR UPDATE TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "insert_score" ON user_scores
  FOR INSERT TO authenticated
  WITH CHECK (true);

-- score_history: 자신의 내역 + 선물 관련 내역 추가 가능
CREATE POLICY "insert_own_history" ON score_history
  FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "insert_gift_history" ON score_history
  FOR INSERT TO authenticated
  WITH CHECK (reason IN ('gift_sent', 'gift_received'));

-- 알림 테이블 생성
CREATE TABLE IF NOT EXISTS notifications (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  type TEXT NOT NULL,
  title TEXT NOT NULL,
  message TEXT,
  data JSONB,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 알림 인덱스
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_created_at ON notifications(created_at);
CREATE INDEX idx_notifications_is_read ON notifications(user_id, is_read);

-- 알림 RLS
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "view_own_notifications" ON notifications
  FOR SELECT TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "insert_notifications" ON notifications
  FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "update_own_notifications" ON notifications
  FOR UPDATE TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "delete_own_notifications" ON notifications
  FOR DELETE TO authenticated USING (auth.uid() = user_id);

-- Superadmin 알림 전체 접근
CREATE POLICY "superadmin_notifications" ON notifications
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));
