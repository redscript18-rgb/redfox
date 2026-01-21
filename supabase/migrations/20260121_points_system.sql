-- 포인트 시스템 테이블

-- 1. 사용자 포인트 잔액 테이블
CREATE TABLE user_points (
  user_id UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
  balance INTEGER NOT NULL DEFAULT 0,
  total_earned INTEGER NOT NULL DEFAULT 0,
  total_spent INTEGER NOT NULL DEFAULT 0,
  streak_days INTEGER NOT NULL DEFAULT 0,
  last_checkin_date DATE,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. 포인트 내역 테이블
CREATE TABLE point_history (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  amount INTEGER NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('checkin', 'streak_bonus', 'review', 'referral', 'gift_sent', 'gift_received', 'redemption', 'admin')),
  description TEXT,
  reference_id TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_point_history_user ON point_history(user_id);
CREATE INDEX idx_point_history_created ON point_history(created_at);

-- 3. RLS 정책
ALTER TABLE user_points ENABLE ROW LEVEL SECURITY;
ALTER TABLE point_history ENABLE ROW LEVEL SECURITY;

-- user_points: 본인만 조회, 시스템에서 업데이트
CREATE POLICY "user_points_select" ON user_points
  FOR SELECT TO authenticated
  USING (user_id = auth.uid() OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "user_points_insert" ON user_points
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "user_points_update" ON user_points
  FOR UPDATE TO authenticated
  USING (user_id = auth.uid() OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

-- point_history: 본인만 조회
CREATE POLICY "point_history_select" ON point_history
  FOR SELECT TO authenticated
  USING (user_id = auth.uid() OR EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'superadmin'));

CREATE POLICY "point_history_insert" ON point_history
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());

-- 4. 출석 체크 함수
CREATE OR REPLACE FUNCTION do_daily_checkin(p_user_id UUID)
RETURNS TABLE(success BOOLEAN, points_earned INTEGER, streak INTEGER, message TEXT) AS $$
DECLARE
  v_today DATE := CURRENT_DATE;
  v_last_checkin DATE;
  v_streak INTEGER;
  v_base_points INTEGER := 10;
  v_bonus_points INTEGER := 0;
  v_total_points INTEGER;
BEGIN
  -- 기존 포인트 레코드 확인/생성
  INSERT INTO user_points (user_id, balance, total_earned, streak_days)
  VALUES (p_user_id, 0, 0, 0)
  ON CONFLICT (user_id) DO NOTHING;

  -- 현재 상태 조회
  SELECT last_checkin_date, streak_days INTO v_last_checkin, v_streak
  FROM user_points WHERE user_id = p_user_id;

  -- 이미 오늘 출석했는지 확인
  IF v_last_checkin = v_today THEN
    RETURN QUERY SELECT FALSE, 0, v_streak, '이미 오늘 출석체크를 완료했습니다.'::TEXT;
    RETURN;
  END IF;

  -- 연속 출석 계산
  IF v_last_checkin = v_today - 1 THEN
    v_streak := v_streak + 1;
  ELSE
    v_streak := 1;
  END IF;

  -- 연속 출석 보너스 (7일마다)
  IF v_streak % 7 = 0 THEN
    v_bonus_points := 50;
  ELSIF v_streak % 3 = 0 THEN
    v_bonus_points := 20;
  END IF;

  v_total_points := v_base_points + v_bonus_points;

  -- 포인트 업데이트
  UPDATE user_points SET
    balance = balance + v_total_points,
    total_earned = total_earned + v_total_points,
    streak_days = v_streak,
    last_checkin_date = v_today,
    updated_at = NOW()
  WHERE user_id = p_user_id;

  -- 출석 기록
  INSERT INTO point_history (user_id, amount, type, description)
  VALUES (p_user_id, v_base_points, 'checkin', v_streak || '일차 출석');

  -- 보너스 기록 (있을 경우)
  IF v_bonus_points > 0 THEN
    INSERT INTO point_history (user_id, amount, type, description)
    VALUES (p_user_id, v_bonus_points, 'streak_bonus', v_streak || '일 연속 출석 보너스');
  END IF;

  RETURN QUERY SELECT TRUE, v_total_points, v_streak,
    CASE
      WHEN v_bonus_points > 0 THEN v_streak || '일 연속 출석! +' || v_total_points || 'P (보너스 ' || v_bonus_points || 'P 포함)'
      ELSE v_streak || '일차 출석 완료! +' || v_total_points || 'P'
    END::TEXT;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
