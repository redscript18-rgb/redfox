-- superadmin 역할 추가를 위한 profiles 테이블 수정
-- role 체크 제약조건 업데이트
ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_role_check;
ALTER TABLE profiles ADD CONSTRAINT profiles_role_check
  CHECK (role IN ('owner', 'admin', 'staff', 'customer', 'superadmin'));

-- superadmin은 모든 테이블 조회 가능하도록 RLS 정책 추가

-- stores: superadmin 전체 조회/수정 가능
CREATE POLICY "superadmin_stores_all" ON stores
  FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- profiles: superadmin 전체 조회/수정 가능
CREATE POLICY "superadmin_profiles_all" ON profiles
  FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- reservations: superadmin 전체 조회 가능
CREATE POLICY "superadmin_reservations_select" ON reservations
  FOR SELECT TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- store_admins: superadmin 전체 관리 가능
CREATE POLICY "superadmin_store_admins_all" ON store_admins
  FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- store_staff: superadmin 전체 관리 가능
CREATE POLICY "superadmin_store_staff_all" ON store_staff
  FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- schedules: superadmin 전체 조회 가능
CREATE POLICY "superadmin_schedules_select" ON schedules
  FOR SELECT TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- menus: superadmin 전체 관리 가능
CREATE POLICY "superadmin_menus_all" ON menus
  FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- conversations: superadmin 전체 조회 가능
CREATE POLICY "superadmin_conversations_select" ON conversations
  FOR SELECT TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

-- messages: superadmin 전체 조회 가능
CREATE POLICY "superadmin_messages_select" ON messages
  FOR SELECT TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );
