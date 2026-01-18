-- Allow superadmin to update and delete stores

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Superadmin can update any store" ON stores;
DROP POLICY IF EXISTS "Superadmin can delete any store" ON stores;

-- Create policy for superadmin to update any store
CREATE POLICY "Superadmin can update any store" ON stores
  FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'superadmin'
    )
  );

-- Create policy for superadmin to delete any store
CREATE POLICY "Superadmin can delete any store" ON stores
  FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'superadmin'
    )
  );

-- Also allow superadmin to insert stores
DROP POLICY IF EXISTS "Superadmin can insert stores" ON stores;
CREATE POLICY "Superadmin can insert stores" ON stores
  FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'superadmin'
    )
  );
