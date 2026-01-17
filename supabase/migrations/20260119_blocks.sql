-- 차단 테이블 (직원/관리자가 손님을 차단)
CREATE TABLE IF NOT EXISTS blocks (
  id SERIAL PRIMARY KEY,
  blocker_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  blocked_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  reason TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (blocker_id, blocked_id)
);

-- RLS 활성화
ALTER TABLE blocks ENABLE ROW LEVEL SECURITY;

-- 차단자 본인만 조회/생성/삭제 가능
CREATE POLICY "blocks_select" ON blocks
  FOR SELECT TO authenticated USING (auth.uid() = blocker_id);

CREATE POLICY "blocks_insert" ON blocks
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = blocker_id);

CREATE POLICY "blocks_delete" ON blocks
  FOR DELETE TO authenticated USING (auth.uid() = blocker_id);

-- 손님이 자신을 차단한 사람 목록 조회 (차단된 직원/관리자 필터링용)
CREATE POLICY "blocks_select_blocked" ON blocks
  FOR SELECT TO authenticated USING (auth.uid() = blocked_id);
