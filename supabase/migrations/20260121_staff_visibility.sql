-- 프리 매니저(본인 가입 staff) 노출 설정
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS is_visible BOOLEAN DEFAULT true;
CREATE INDEX IF NOT EXISTS idx_profiles_is_visible ON profiles(is_visible);

-- 기존 staff는 기본적으로 보이도록 설정
UPDATE profiles SET is_visible = true WHERE role = 'staff' AND is_visible IS NULL;
