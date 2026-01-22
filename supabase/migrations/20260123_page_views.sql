-- Page views tracking table
CREATE TABLE IF NOT EXISTS page_views (
  id SERIAL PRIMARY KEY,
  path TEXT NOT NULL,
  user_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
  user_role TEXT,
  referrer TEXT,
  user_agent TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for faster queries
CREATE INDEX idx_page_views_created_at ON page_views(created_at);
CREATE INDEX idx_page_views_path ON page_views(path);
CREATE INDEX idx_page_views_user_id ON page_views(user_id);

-- Daily stats materialized view (for faster dashboard queries)
CREATE TABLE IF NOT EXISTS daily_stats (
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL UNIQUE,
  total_views INTEGER DEFAULT 0,
  unique_visitors INTEGER DEFAULT 0,
  new_users INTEGER DEFAULT 0,
  active_users INTEGER DEFAULT 0,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_daily_stats_date ON daily_stats(date);

-- RLS policies
ALTER TABLE page_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_stats ENABLE ROW LEVEL SECURITY;

-- Anyone can insert page views
CREATE POLICY "Anyone can insert page views" ON page_views
  FOR INSERT WITH CHECK (true);

-- Only superadmin can read page views
CREATE POLICY "Superadmin can read page views" ON page_views
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'superadmin'
    )
  );

-- Only superadmin can read daily stats
CREATE POLICY "Superadmin can read daily stats" ON daily_stats
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'superadmin'
    )
  );

-- Superadmin can manage daily stats
CREATE POLICY "Superadmin can manage daily stats" ON daily_stats
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'superadmin'
    )
  );

-- Function to update daily stats
CREATE OR REPLACE FUNCTION update_daily_stats(target_date DATE)
RETURNS void AS $$
BEGIN
  INSERT INTO daily_stats (date, total_views, unique_visitors, new_users, active_users, updated_at)
  SELECT
    target_date,
    COUNT(*)::INTEGER as total_views,
    COUNT(DISTINCT COALESCE(user_id::text, user_agent))::INTEGER as unique_visitors,
    (SELECT COUNT(*) FROM profiles WHERE DATE(created_at) = target_date)::INTEGER as new_users,
    COUNT(DISTINCT user_id)::INTEGER as active_users
  FROM page_views
  WHERE DATE(created_at) = target_date
  ON CONFLICT (date) DO UPDATE SET
    total_views = EXCLUDED.total_views,
    unique_visitors = EXCLUDED.unique_visitors,
    new_users = EXCLUDED.new_users,
    active_users = EXCLUDED.active_users,
    updated_at = NOW();
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
