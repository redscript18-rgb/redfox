-- virtual_staff 테이블에 superadmin 전체 권한 추가
CREATE POLICY "superadmin_virtual_staff_all" ON virtual_staff
  FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin')
  );
