-- profiles 테이블에 생성자 추적 필드 추가
-- created_by_admin_id가 NULL이면 본인이 직접 만든 프로필
-- created_by_admin_id가 있으면 해당 관리자가 만든 프로필
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS created_by_admin_id UUID REFERENCES profiles(id);
