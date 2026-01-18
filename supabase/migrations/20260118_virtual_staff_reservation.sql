-- Add virtual_staff_id to reservations table
ALTER TABLE reservations ADD COLUMN IF NOT EXISTS virtual_staff_id UUID REFERENCES virtual_staff(id) ON DELETE CASCADE;

-- Make staff_id nullable (either staff_id or virtual_staff_id should be set)
ALTER TABLE reservations ALTER COLUMN staff_id DROP NOT NULL;

-- Add check constraint to ensure either staff_id or virtual_staff_id is set
ALTER TABLE reservations ADD CONSTRAINT check_staff_or_virtual_staff
  CHECK (
    (staff_id IS NOT NULL AND virtual_staff_id IS NULL) OR
    (staff_id IS NULL AND virtual_staff_id IS NOT NULL)
  );

-- Add virtual_staff_id to ratings table for rating virtual staff
ALTER TABLE ratings ADD COLUMN IF NOT EXISTS target_virtual_staff_id UUID REFERENCES virtual_staff(id) ON DELETE CASCADE;
