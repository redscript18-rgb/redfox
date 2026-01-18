-- Add virtual staff support to favorites table
ALTER TABLE favorites ADD COLUMN IF NOT EXISTS target_virtual_staff_id UUID REFERENCES virtual_staff(id) ON DELETE CASCADE;

-- Drop and recreate the check constraint to include 'virtual_staff'
ALTER TABLE favorites DROP CONSTRAINT IF EXISTS favorites_target_type_check;
ALTER TABLE favorites ADD CONSTRAINT favorites_target_type_check CHECK (target_type IN ('store', 'staff', 'virtual_staff'));

-- Add unique constraint for virtual staff
ALTER TABLE favorites ADD CONSTRAINT favorites_user_virtual_staff_unique UNIQUE (user_id, target_type, target_virtual_staff_id);
