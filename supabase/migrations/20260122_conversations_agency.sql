-- conversations 테이블에 agency_id 추가 (에이전시-실장/사장 채팅 지원)
ALTER TABLE conversations ADD COLUMN IF NOT EXISTS agency_id UUID REFERENCES profiles(id) ON DELETE CASCADE;

-- 기존 제약조건 수정
ALTER TABLE conversations DROP CONSTRAINT IF EXISTS conversations_participant_check;
ALTER TABLE conversations ADD CONSTRAINT conversations_participant_check
CHECK (
  -- 손님 대화: customer_id만 있음
  (customer_id IS NOT NULL AND staff_id IS NULL AND agency_id IS NULL) OR
  -- 매니저 대화: staff_id만 있음
  (staff_id IS NOT NULL AND customer_id IS NULL AND agency_id IS NULL) OR
  -- 에이전시 대화: agency_id만 있음
  (agency_id IS NOT NULL AND customer_id IS NULL AND staff_id IS NULL)
);

-- 에이전시-관리자 대화 유니크 제약조건
CREATE UNIQUE INDEX IF NOT EXISTS conversations_admin_agency_unique
ON conversations(store_id, admin_id, agency_id)
WHERE agency_id IS NOT NULL AND customer_id IS NULL AND staff_id IS NULL;

-- 인덱스 추가
CREATE INDEX IF NOT EXISTS idx_conversations_agency_id ON conversations(agency_id);

-- 기존 RLS 정책 삭제 및 재생성
DROP POLICY IF EXISTS "conversations_select" ON conversations;
DROP POLICY IF EXISTS "conversations_insert" ON conversations;
DROP POLICY IF EXISTS "conversations_update" ON conversations;
DROP POLICY IF EXISTS "conversations_delete" ON conversations;

-- conversations RLS 정책: 대화 참여자만 조회 가능
CREATE POLICY "conversations_select" ON conversations
  FOR SELECT TO authenticated
  USING (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
    OR auth.uid() = agency_id
  );

-- conversations RLS 정책: 인증된 사용자가 대화 생성 가능
CREATE POLICY "conversations_insert" ON conversations
  FOR INSERT TO authenticated
  WITH CHECK (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
    OR auth.uid() = agency_id
  );

-- conversations RLS 정책: 참여자가 업데이트 가능
CREATE POLICY "conversations_update" ON conversations
  FOR UPDATE TO authenticated
  USING (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
    OR auth.uid() = agency_id
  );

-- conversations RLS 정책: 참여자가 삭제 가능
CREATE POLICY "conversations_delete" ON conversations
  FOR DELETE TO authenticated
  USING (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
    OR auth.uid() = agency_id
  );

-- messages RLS 정책도 업데이트
DROP POLICY IF EXISTS "messages_select" ON messages;
DROP POLICY IF EXISTS "messages_insert" ON messages;
DROP POLICY IF EXISTS "messages_update" ON messages;
DROP POLICY IF EXISTS "messages_delete" ON messages;

-- messages RLS 정책: 대화 참여자만 메시지 조회 가능
CREATE POLICY "messages_select" ON messages
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid() OR c.agency_id = auth.uid())
    )
  );

-- messages RLS 정책: 대화 참여자만 메시지 작성 가능
CREATE POLICY "messages_insert" ON messages
  FOR INSERT TO authenticated
  WITH CHECK (
    auth.uid() = sender_id
    AND EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid() OR c.agency_id = auth.uid())
    )
  );

-- messages RLS 정책: 수신자가 읽음 처리 가능
CREATE POLICY "messages_update" ON messages
  FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid() OR c.agency_id = auth.uid())
    )
    AND sender_id != auth.uid()
  );

-- messages RLS 정책: 대화 참여자가 삭제 가능
CREATE POLICY "messages_delete" ON messages
  FOR DELETE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid() OR c.agency_id = auth.uid())
    )
  );
