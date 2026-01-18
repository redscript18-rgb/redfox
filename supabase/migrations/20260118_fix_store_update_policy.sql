-- stores 테이블 RLS 정책 재설정

-- 기존 UPDATE 정책 삭제
DROP POLICY IF EXISTS "가게 관리" ON stores;
DROP POLICY IF EXISTS "stores_update" ON stores;
DROP POLICY IF EXISTS "stores_update_by_owner_or_admin" ON stores;
DROP POLICY IF EXISTS "Stores are editable by owner" ON stores;

-- 기존 SELECT 정책 삭제 (있다면)
DROP POLICY IF EXISTS "stores_select" ON stores;
DROP POLICY IF EXISTS "가게 조회" ON stores;
DROP POLICY IF EXISTS "Stores are viewable by everyone" ON stores;

-- SELECT 정책: 모든 인증된 사용자가 가게 조회 가능
CREATE POLICY "stores_select_all" ON stores
  FOR SELECT TO authenticated
  USING (true);

-- UPDATE 정책: 사장 또는 관리자가 가게 정보 수정 가능
CREATE POLICY "stores_update_by_owner_or_admin" ON stores
  FOR UPDATE TO authenticated
  USING (
    owner_id = auth.uid()
    OR EXISTS (
      SELECT 1 FROM store_admins
      WHERE store_admins.store_id = stores.id
      AND store_admins.admin_id = auth.uid()
    )
  )
  WITH CHECK (
    owner_id = auth.uid()
    OR EXISTS (
      SELECT 1 FROM store_admins
      WHERE store_admins.store_id = stores.id
      AND store_admins.admin_id = auth.uid()
    )
  );
