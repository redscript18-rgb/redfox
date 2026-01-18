-- conversations 테이블에 staff_id 추가 (관리자-매니저 채팅 지원)
ALTER TABLE conversations ADD COLUMN IF NOT EXISTS staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE;

-- customer_id를 nullable로 변경
ALTER TABLE conversations ALTER COLUMN customer_id DROP NOT NULL;

-- 기존 유니크 제약조건 제거 및 새로운 조건 추가
ALTER TABLE conversations DROP CONSTRAINT IF EXISTS conversations_store_id_admin_id_customer_id_key;

-- 관리자-손님 대화 유니크 제약조건
CREATE UNIQUE INDEX IF NOT EXISTS conversations_admin_customer_unique
ON conversations(store_id, admin_id, customer_id)
WHERE customer_id IS NOT NULL AND staff_id IS NULL;

-- 관리자-매니저 대화 유니크 제약조건
CREATE UNIQUE INDEX IF NOT EXISTS conversations_admin_staff_unique
ON conversations(store_id, admin_id, staff_id)
WHERE staff_id IS NOT NULL AND customer_id IS NULL;

-- customer_id 또는 staff_id 중 하나는 반드시 있어야 함
ALTER TABLE conversations DROP CONSTRAINT IF EXISTS conversations_participant_check;
ALTER TABLE conversations ADD CONSTRAINT conversations_participant_check
CHECK (
  (customer_id IS NOT NULL AND staff_id IS NULL) OR
  (staff_id IS NOT NULL AND customer_id IS NULL)
);

-- 인덱스 추가
CREATE INDEX IF NOT EXISTS idx_conversations_staff_id ON conversations(staff_id);

-- 기존 RLS 정책 삭제 및 재생성
DROP POLICY IF EXISTS "conversations_select" ON conversations;
DROP POLICY IF EXISTS "conversations_insert" ON conversations;
DROP POLICY IF EXISTS "conversations_update" ON conversations;

-- conversations RLS 정책: 대화 참여자만 조회 가능
CREATE POLICY "conversations_select" ON conversations
  FOR SELECT TO authenticated
  USING (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
  );

-- conversations RLS 정책: 인증된 사용자가 대화 생성 가능
CREATE POLICY "conversations_insert" ON conversations
  FOR INSERT TO authenticated
  WITH CHECK (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
  );

-- conversations RLS 정책: 참여자가 업데이트 가능
CREATE POLICY "conversations_update" ON conversations
  FOR UPDATE TO authenticated
  USING (
    auth.uid() = admin_id
    OR auth.uid() = customer_id
    OR auth.uid() = staff_id
  );

-- messages RLS 정책도 업데이트
DROP POLICY IF EXISTS "messages_select" ON messages;
DROP POLICY IF EXISTS "messages_insert" ON messages;
DROP POLICY IF EXISTS "messages_update" ON messages;

-- messages RLS 정책: 대화 참여자만 메시지 조회 가능
CREATE POLICY "messages_select" ON messages
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid())
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
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid())
    )
  );

-- messages RLS 정책: 수신자가 읽음 처리 가능
CREATE POLICY "messages_update" ON messages
  FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid() OR c.staff_id = auth.uid())
    )
    AND sender_id != auth.uid()
  );
