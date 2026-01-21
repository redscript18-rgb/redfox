-- 역할 명칭 변경 마이그레이션
-- admin → staff (실장)
-- staff → manager (프리 매니저)
-- admin은 향후 시스템 관리자용으로 예약

-- 1. 기존 role 제약조건 제거
ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_role_check;

-- 2. role 값 변경 (순서 중요: staff를 먼저 manager로, 그 다음 admin을 staff로)
-- 임시로 _temp 값 사용하여 충돌 방지
UPDATE profiles SET role = 'manager_temp' WHERE role = 'staff';
UPDATE profiles SET role = 'staff' WHERE role = 'admin';
UPDATE profiles SET role = 'manager' WHERE role = 'manager_temp';

-- 3. 새로운 role 제약조건 추가 (admin은 향후 사용 가능하도록 포함)
ALTER TABLE profiles ADD CONSTRAINT profiles_role_check
  CHECK (role IN ('owner', 'staff', 'manager', 'customer', 'superadmin', 'admin'));

-- 4. role_visibility 테이블 업데이트
UPDATE role_visibility SET role_type = 'manager_temp' WHERE role_type = 'staff';
UPDATE role_visibility SET role_type = 'staff' WHERE role_type = 'admin';
UPDATE role_visibility SET role_type = 'manager' WHERE role_type = 'manager_temp';

-- 5. 기존에 없던 role_type 추가 (있으면 무시)
INSERT INTO role_visibility (role_type, is_visible) VALUES ('manager', true)
ON CONFLICT (role_type) DO NOTHING;
INSERT INTO role_visibility (role_type, is_visible) VALUES ('staff', true)
ON CONFLICT (role_type) DO NOTHING;

-- 6. 이전 admin, staff role_type 삭제 (이미 변환되었으므로 중복 제거)
DELETE FROM role_visibility WHERE role_type = 'admin';

-- 참고: store_admins 테이블은 이름만 admin이 들어갔을 뿐,
-- 실제로는 store_id와 admin_id(user uuid)의 연결이므로 변경 불필요
-- admin_id 컬럼명도 user를 참조하는 FK이므로 변경 불필요
