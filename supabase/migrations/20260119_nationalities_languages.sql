-- Add nationalities and languages fields to profiles table (for 프리 매니저)
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS nationalities TEXT[] DEFAULT '{}';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS languages TEXT[] DEFAULT '{}';

-- Add nationalities and languages fields to virtual_staff table (for 등록 매니저)
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS nationalities TEXT[] DEFAULT '{}';
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS languages TEXT[] DEFAULT '{}';
