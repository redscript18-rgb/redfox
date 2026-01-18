-- Add additional profile fields to virtual_staff table
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS is_smoker BOOLEAN DEFAULT FALSE;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS personality TEXT;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS style TEXT;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS skin_tone TEXT;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS hair_length TEXT;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS hair_style TEXT;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS hair_color TEXT;
ALTER TABLE virtual_staff ADD COLUMN IF NOT EXISTS is_waxed BOOLEAN DEFAULT FALSE;
