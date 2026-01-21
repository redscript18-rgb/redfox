-- 대기 중인 선물 테이블
CREATE TABLE pending_gifts (
  id SERIAL PRIMARY KEY,
  sender_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  receiver_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  amount INTEGER NOT NULL,
  message TEXT,
  status TEXT DEFAULT 'pending', -- pending, accepted, rejected
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  processed_at TIMESTAMP WITH TIME ZONE
);

-- 인덱스
CREATE INDEX idx_pending_gifts_sender ON pending_gifts(sender_id);
CREATE INDEX idx_pending_gifts_receiver ON pending_gifts(receiver_id);
CREATE INDEX idx_pending_gifts_status ON pending_gifts(status);

-- RLS 정책
ALTER TABLE pending_gifts ENABLE ROW LEVEL SECURITY;

-- 자신이 보낸/받은 선물 조회
CREATE POLICY "view_own_gifts" ON pending_gifts
  FOR SELECT TO authenticated
  USING (auth.uid() = sender_id OR auth.uid() = receiver_id);

-- 선물 보내기 (insert)
CREATE POLICY "send_gift" ON pending_gifts
  FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = sender_id);

-- 선물 상태 업데이트 (받는 사람만)
CREATE POLICY "update_gift_status" ON pending_gifts
  FOR UPDATE TO authenticated
  USING (auth.uid() = receiver_id);

-- Superadmin 전체 접근
CREATE POLICY "superadmin_gifts" ON pending_gifts
  FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));
