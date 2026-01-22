-- 글 작성 시 포인트 지급 (하루 10개 제한)

-- 글 작성 포인트 지급 함수
CREATE OR REPLACE FUNCTION award_writing_points(p_user_id UUID, p_type TEXT)
RETURNS TABLE(success BOOLEAN, points_earned INTEGER, daily_count INTEGER, message TEXT) AS $$
DECLARE
  v_today DATE := CURRENT_DATE;
  v_daily_limit INTEGER := 10;
  v_points_per_post INTEGER := 100;
  v_today_count INTEGER;
  v_current_score INTEGER;
BEGIN
  -- 오늘 작성한 글/리뷰 수 확인 (score_history에서 post 타입 카운트)
  SELECT COUNT(*) INTO v_today_count
  FROM score_history
  WHERE user_id = p_user_id
    AND reason = 'post'
    AND DATE(created_at) = v_today;

  -- 일일 한도 확인
  IF v_today_count >= v_daily_limit THEN
    RETURN QUERY SELECT FALSE, 0, v_today_count, '오늘 포인트 지급 한도(10회)에 도달했습니다.'::TEXT;
    RETURN;
  END IF;

  -- user_scores 레코드 확인/생성
  INSERT INTO user_scores (user_id, total_score)
  VALUES (p_user_id, 0)
  ON CONFLICT (user_id) DO NOTHING;

  -- 현재 점수 조회
  SELECT total_score INTO v_current_score
  FROM user_scores WHERE user_id = p_user_id;

  -- 점수 업데이트
  UPDATE user_scores SET
    total_score = v_current_score + v_points_per_post,
    updated_at = NOW()
  WHERE user_id = p_user_id;

  -- 내역 기록
  INSERT INTO score_history (user_id, amount, reason, description)
  VALUES (
    p_user_id,
    v_points_per_post,
    'post',
    CASE p_type
      WHEN 'review' THEN '가게 리뷰 작성'
      WHEN 'info_post' THEN '게시글 작성'
      ELSE '글 작성'
    END
  );

  v_today_count := v_today_count + 1;

  RETURN QUERY SELECT
    TRUE,
    v_points_per_post,
    v_today_count,
    ('+' || v_points_per_post || 'P 지급! (오늘 ' || v_today_count || '/' || v_daily_limit || ')')::TEXT;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
