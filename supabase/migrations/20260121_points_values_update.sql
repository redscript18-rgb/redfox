-- 포인트 값 업데이트: 매일 100P, 3일 연속 200P, 7일 연속 500P
CREATE OR REPLACE FUNCTION do_daily_checkin(p_user_id UUID)
RETURNS TABLE(success BOOLEAN, points_earned INTEGER, streak INTEGER, message TEXT)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_today DATE := CURRENT_DATE;
  v_last_checkin DATE;
  v_streak INTEGER;
  v_points INTEGER := 100;  -- 기본 출석 포인트
  v_bonus INTEGER := 0;
  v_message TEXT;
BEGIN
  -- 기존 포인트 데이터 확인 또는 생성
  INSERT INTO user_points (user_id, balance, total_earned, total_spent, streak_days)
  VALUES (p_user_id, 0, 0, 0, 0)
  ON CONFLICT (user_id) DO NOTHING;

  -- 현재 상태 조회
  SELECT last_checkin_date, streak_days INTO v_last_checkin, v_streak
  FROM user_points WHERE user_id = p_user_id;

  -- 이미 오늘 출석했는지 확인
  IF v_last_checkin = v_today THEN
    RETURN QUERY SELECT false, 0, v_streak, '이미 오늘 출석체크를 완료했습니다.'::TEXT;
    RETURN;
  END IF;

  -- 연속 출석 계산
  IF v_last_checkin = v_today - INTERVAL '1 day' THEN
    v_streak := v_streak + 1;
  ELSE
    v_streak := 1;
  END IF;

  -- 연속 출석 보너스
  IF v_streak = 3 THEN
    v_bonus := 200;
    v_message := '🔥 3일 연속 출석! +' || (v_points + v_bonus) || 'P (보너스 ' || v_bonus || 'P)';
  ELSIF v_streak = 7 THEN
    v_bonus := 500;
    v_message := '🎉 7일 연속 출석! +' || (v_points + v_bonus) || 'P (보너스 ' || v_bonus || 'P)';
  ELSIF v_streak > 7 AND v_streak % 7 = 0 THEN
    v_bonus := 500;
    v_message := '🎉 ' || v_streak || '일 연속 출석! +' || (v_points + v_bonus) || 'P (보너스 ' || v_bonus || 'P)';
  ELSE
    v_message := '출석체크 완료! +' || v_points || 'P (' || v_streak || '일 연속)';
  END IF;

  -- 포인트 업데이트
  UPDATE user_points SET
    balance = balance + v_points + v_bonus,
    total_earned = total_earned + v_points + v_bonus,
    streak_days = v_streak,
    last_checkin_date = v_today,
    updated_at = NOW()
  WHERE user_id = p_user_id;

  -- 포인트 히스토리 기록
  INSERT INTO point_history (user_id, amount, type, description)
  VALUES (p_user_id, v_points, 'checkin', '매일 출석체크');

  IF v_bonus > 0 THEN
    INSERT INTO point_history (user_id, amount, type, description)
    VALUES (p_user_id, v_bonus, 'streak_bonus', v_streak || '일 연속 출석 보너스');
  END IF;

  RETURN QUERY SELECT true, v_points + v_bonus, v_streak, v_message;
END;
$$;
