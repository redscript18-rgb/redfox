-- 기존 RLS 정책 모두 삭제
DROP POLICY IF EXISTS "conversations_select" ON conversations;
DROP POLICY IF EXISTS "conversations_insert" ON conversations;
DROP POLICY IF EXISTS "conversations_update" ON conversations;
DROP POLICY IF EXISTS "messages_select" ON messages;
DROP POLICY IF EXISTS "messages_insert" ON messages;
DROP POLICY IF EXISTS "messages_update" ON messages;

-- conversations RLS 정책 재생성
CREATE POLICY "conversations_select" ON conversations
  FOR SELECT TO authenticated
  USING (
    admin_id = auth.uid()
    OR (customer_id IS NOT NULL AND customer_id = auth.uid())
    OR (staff_id IS NOT NULL AND staff_id = auth.uid())
  );

CREATE POLICY "conversations_insert" ON conversations
  FOR INSERT TO authenticated
  WITH CHECK (
    admin_id = auth.uid()
    OR (customer_id IS NOT NULL AND customer_id = auth.uid())
    OR (staff_id IS NOT NULL AND staff_id = auth.uid())
  );

CREATE POLICY "conversations_update" ON conversations
  FOR UPDATE TO authenticated
  USING (
    admin_id = auth.uid()
    OR (customer_id IS NOT NULL AND customer_id = auth.uid())
    OR (staff_id IS NOT NULL AND staff_id = auth.uid())
  );

-- messages RLS 정책 재생성
CREATE POLICY "messages_select" ON messages
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = messages.conversation_id
      AND (
        c.admin_id = auth.uid()
        OR (c.customer_id IS NOT NULL AND c.customer_id = auth.uid())
        OR (c.staff_id IS NOT NULL AND c.staff_id = auth.uid())
      )
    )
  );

CREATE POLICY "messages_insert" ON messages
  FOR INSERT TO authenticated
  WITH CHECK (
    sender_id = auth.uid()
    AND EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = messages.conversation_id
      AND (
        c.admin_id = auth.uid()
        OR (c.customer_id IS NOT NULL AND c.customer_id = auth.uid())
        OR (c.staff_id IS NOT NULL AND c.staff_id = auth.uid())
      )
    )
  );

CREATE POLICY "messages_update" ON messages
  FOR UPDATE TO authenticated
  USING (
    sender_id != auth.uid()
    AND EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = messages.conversation_id
      AND (
        c.admin_id = auth.uid()
        OR (c.customer_id IS NOT NULL AND c.customer_id = auth.uid())
        OR (c.staff_id IS NOT NULL AND c.staff_id = auth.uid())
      )
    )
  );
