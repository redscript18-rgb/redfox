-- 출석체크 함수 시간대 수정 (한국 시간 기준)
-- 기존 함수를 덮어씀

CREATE OR REPLACE FUNCTION do_daily_checkin(p_user_id UUID)
RETURNS TABLE(success BOOLEAN, points_earned INTEGER, streak INTEGER, message TEXT) AS $$
DECLARE
  v_today DATE := (NOW() AT TIME ZONE 'Asia/Seoul')::DATE;
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
