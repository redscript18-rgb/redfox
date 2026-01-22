-- 샘플 가게 리뷰 데이터 추가
-- 매니저 계정 중 하나를 사용하고, 랜덤 가게에 리뷰 추가

DO $$
DECLARE
  v_manager_id UUID;
  v_store_ids INTEGER[];
  v_store_id INTEGER;
  v_reviews TEXT[] := ARRAY[
    '분위기가 정말 좋고 손님들도 친절해요. 일하기 편한 곳입니다.',
    '사장님이 매니저들 챙겨주시고 팁도 잘 나와요. 추천합니다!',
    '위치가 좋아서 손님이 많아요. 바쁘지만 그만큼 수입도 좋습니다.',
    '청결하고 시설이 잘 되어있어요. 대기실도 편하고 좋습니다.',
    '처음 일하는 분들한테 추천해요. 시스템이 잘 갖춰져 있습니다.',
    '급여가 정확하게 나오고 정산도 빨라요. 믿을 수 있는 곳이에요.',
    '실장님이 스케줄 조율 잘 해주셔서 편하게 일할 수 있어요.',
    '단골 손님이 많아서 안정적으로 일할 수 있습니다. 분위기도 좋아요.',
    '인테리어가 고급스럽고 손님 퀄리티가 좋아요. 일하기 좋습니다.',
    '주차장이 넓고 접근성이 좋아요. 손님들 만족도가 높습니다.'
  ];
  v_ratings INTEGER[] := ARRAY[5, 5, 4, 5, 4, 5, 4, 5, 5, 4];
  i INTEGER;
BEGIN
  -- 매니저 계정 가져오기
  SELECT id INTO v_manager_id FROM profiles WHERE role = 'manager' LIMIT 1;

  IF v_manager_id IS NULL THEN
    RAISE NOTICE 'No manager found, skipping sample reviews';
    RETURN;
  END IF;

  -- 랜덤 가게 10개 가져오기
  SELECT ARRAY_AGG(id) INTO v_store_ids
  FROM (SELECT id FROM stores ORDER BY RANDOM() LIMIT 10) s;

  IF v_store_ids IS NULL OR array_length(v_store_ids, 1) < 10 THEN
    RAISE NOTICE 'Not enough stores found, skipping sample reviews';
    RETURN;
  END IF;

  -- 먼저 해당 매니저의 출근 이력 추가 (리뷰 작성을 위해 필요)
  FOR i IN 1..10 LOOP
    v_store_id := v_store_ids[i];

    -- 출근 이력이 없으면 추가
    INSERT INTO schedules (store_id, staff_id, date, start_time, end_time, status, type)
    SELECT v_store_id, v_manager_id, CURRENT_DATE - (i || ' days')::interval, '18:00', '24:00', 'approved', 'self'
    WHERE NOT EXISTS (
      SELECT 1 FROM schedules
      WHERE store_id = v_store_id AND staff_id = v_manager_id AND status = 'approved'
    );
  END LOOP;

  -- 리뷰 추가
  FOR i IN 1..10 LOOP
    v_store_id := v_store_ids[i];

    -- 이미 리뷰가 있으면 건너뛰기
    INSERT INTO store_reviews (store_id, author_id, rating, content, is_anonymous, created_at)
    SELECT
      v_store_id,
      v_manager_id,
      v_ratings[i],
      v_reviews[i],
      (i % 3 = 0),  -- 3개 중 1개는 익명
      NOW() - ((11 - i) || ' hours')::interval
    WHERE NOT EXISTS (
      SELECT 1 FROM store_reviews
      WHERE store_id = v_store_id AND author_id = v_manager_id
    );
  END LOOP;

  RAISE NOTICE 'Sample reviews added successfully';
END $$;
