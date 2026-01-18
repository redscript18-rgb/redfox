-- 대화 테이블
CREATE TABLE IF NOT EXISTS conversations (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  admin_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  customer_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  last_message_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(store_id, admin_id, customer_id)
);

-- 메시지 테이블
CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  conversation_id INTEGER REFERENCES conversations(id) ON DELETE CASCADE NOT NULL,
  sender_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  content TEXT NOT NULL,
  read_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 인덱스
CREATE INDEX idx_conversations_admin_id ON conversations(admin_id);
CREATE INDEX idx_conversations_customer_id ON conversations(customer_id);
CREATE INDEX idx_conversations_last_message_at ON conversations(last_message_at DESC);
CREATE INDEX idx_messages_conversation_id ON messages(conversation_id);
CREATE INDEX idx_messages_created_at ON messages(created_at);

-- RLS 활성화
ALTER TABLE conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- conversations RLS 정책: 대화 참여자만 조회 가능
CREATE POLICY "conversations_select" ON conversations
  FOR SELECT TO authenticated
  USING (auth.uid() = admin_id OR auth.uid() = customer_id);

-- conversations RLS 정책: 인증된 사용자가 대화 생성 가능 (본인이 customer여야 함)
CREATE POLICY "conversations_insert" ON conversations
  FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = customer_id OR auth.uid() = admin_id);

-- conversations RLS 정책: 참여자가 last_message_at 업데이트 가능
CREATE POLICY "conversations_update" ON conversations
  FOR UPDATE TO authenticated
  USING (auth.uid() = admin_id OR auth.uid() = customer_id);

-- messages RLS 정책: 대화 참여자만 메시지 조회 가능
CREATE POLICY "messages_select" ON messages
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid())
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
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid())
    )
  );

-- messages RLS 정책: 수신자가 읽음 처리 가능
CREATE POLICY "messages_update" ON messages
  FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.admin_id = auth.uid() OR c.customer_id = auth.uid())
    )
    AND sender_id != auth.uid()
  );
