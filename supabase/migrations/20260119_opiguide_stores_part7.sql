-- 오피가이드 데이터 마이그레이션 Part 7/7


-- 대전 메이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 메이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 메이드', '안마', '대전', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도쿄100pro
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도쿄100pro';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄100pro';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 도쿄100pro', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 비키니클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 비키니클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비키니클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 비키니클럽', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 AV-딜도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 AV-딜도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'AV-딜도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 AV-딜도', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️킹스맨안마❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️킹스맨안마❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️킹스맨안마❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 ❤️킹스맨안마❤️', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 bj안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 bj안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'bj안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '울산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 bj안마', '울산', '울산', '24:00'::TIME, '24:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연수구 bj안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연수구 bj안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'bj안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '연수구'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '연수구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('연수구 bj안마', '연수구', '연수구', '24:00'::TIME, '24:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 첨단달밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 첨단달밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첨단달밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 첨단달밤', '안마', '광주', '14:00'::TIME, '04:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 로얄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 로얄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로얄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 로얄', '안마', '평택', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 apple
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 apple';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'apple';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 apple', '건마', '용인', '17:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 한국여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 한국여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국여우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 한국여우', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 S안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 S안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 S안마', '안마', '안양', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 캔디안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 캔디안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캔디안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '역삼' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('역삼 캔디안마', '역삼', '역삼', '24:00'::TIME, '24:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 강남클럽안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 강남클럽안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남클럽안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 강남클럽안마', '안마', '잠실', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 포시즌안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 포시즌안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포시즌안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '삼성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('삼성 포시즌안마', '삼성', '삼성', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 잔나비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 잔나비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잔나비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 잔나비', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 럭키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 럭키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 럭키', '안마', '수원', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 꿀맛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 꿀맛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀맛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 꿀맛', '안마', '전주', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 080
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 080';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '080';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 080', '안마', '안양', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 핫타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 핫타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫타임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 핫타임', '안마', '전주', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 EPL
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 EPL';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'EPL';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 EPL', '안마', '분당', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 티파니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 티파니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티파니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 티파니', '안마', '시흥', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 싼다클로스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 싼다클로스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싼다클로스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 싼다클로스', '안마', '대구', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 쥬얼리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 쥬얼리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쥬얼리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 쥬얼리', '안마', '구리', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 풀코스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 풀코스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀코스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 풀코스', '안마', '구미', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 킹', '안마', '시흥', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 프라다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 프라다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프라다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 프라다', '안마', '안산', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 겐조
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 겐조';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '겐조';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 겐조', '안마', '안양', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 맥심
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 맥심';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 맥심', '룸', '강남', '18:00'::TIME, '05:00'::TIME, '룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 모델
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 모델';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모델';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 모델', '안마', '구리', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연신내 핫플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연신내 핫플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연신내'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('연신내 핫플', '안마', '연신내', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 버닝썸안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 버닝썸안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버닝썸안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 버닝썸안마', '안마', '부천', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 어벤져스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 어벤져스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어벤져스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 어벤져스', '안마', '안산', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 더갤러리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 더갤러리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더갤러리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 더갤러리아', '안마', '구로', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 랜드마크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 랜드마크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '랜드마크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 랜드마크', '안마', '부천', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 엔젤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 엔젤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 엔젤', '안마', '수원', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 백악관 마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 백악관 마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백악관 마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '경주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 백악관 마사지', '경주', '경주', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 뮤츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 뮤츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뮤츠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 뮤츠', '안마', '부천', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 벤틀리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 벤틀리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벤틀리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 벤틀리', '안마', '원주', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 홍등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 홍등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 홍등', '안마', '안양', '12:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 긴자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 긴자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '긴자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 긴자', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 플레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 플레이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플레이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 플레이', '안마', '의정부', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 구의동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 구의동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구의동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천호'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천호 구의동', '안마', '천호', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 파티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 파티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 파티', '안마', '구미', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 아이돌안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 아이돌안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 아이돌안마', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 베베
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 베베';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베베';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 베베', '안마', '수원', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 십이야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 십이야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '십이야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 십이야', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남 플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남 플라워';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 플라워';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 강남 플라워', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 다은안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 다은안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다은안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 다은안마', '안마', '건대', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 별관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 별관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여의도 별관', '안마', '여의도', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 정마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 정마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 정마', '안마', '분당', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 명품관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 명품관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('병점 명품관', '안마', '병점', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 1티어
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 1티어';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1티어';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 1티어', '안마', '부천', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 티아라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 티아라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티아라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 티아라', '안마', '부천', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 답십리 답십리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '답십리 답십리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '답십리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '답십리'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('답십리 답십리', '안마', '답십리', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 시네마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 시네마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시네마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 시네마', '안마', '안양', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 버터플라이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 버터플라이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버터플라이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 버터플라이', '안마', '구미', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 크리스탈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 크리스탈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크리스탈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 크리스탈', '안마', '동대문', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 수안보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 수안보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수안보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 수안보', '안마', '분당', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강북 에비앙
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강북 에비앙';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에비앙';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강북'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강북 에비앙', '안마', '강북', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 화이트', '안마', '구미', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 MAXIM
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 MAXIM';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'MAXIM';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '분당' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 MAXIM', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 딸기', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 오이시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 오이시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오이시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 오이시', '출장', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 아리따움
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 아리따움';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아리따움';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 아리따움', '출장', '마포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 키레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 키레이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '키레이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 키레이', '출장', '일산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 망고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 망고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '망고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 망고', '출장', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 나가사키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 나가사키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나가사키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 나가사키', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 초미녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 초미녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초미녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 초미녀', '강남', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 엠티비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 엠티비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엠티비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 엠티비', '출장', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 코레아판타스틱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 코레아판타스틱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '코레아판타스틱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 코레아판타스틱', '출장', '강남', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 24시수도권원정녀출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 24시수도권원정녀출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시수도권원정녀출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 24시수도권원정녀출장', '출장', '서구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 바나나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 바나나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 바나나', '출장', '파주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 나홀로집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 나홀로집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나홀로집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 나홀로집', '출장', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 사쿠란보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 사쿠란보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠란보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 사쿠란보', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 니뽄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 니뽄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '니뽄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 니뽄', '출장', '건대', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 빨딱 세워줄까
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 빨딱 세워줄까';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨딱 세워줄까';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '종로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 빨딱 세워줄까', '종로', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 오빠섯어일본1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 오빠섯어일본1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오빠섯어일본1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 오빠섯어일본1등', '출장', '시흥', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 빨딱 세워줄까
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 빨딱 세워줄까';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨딱 세워줄까';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 빨딱 세워줄까', '강서', '종로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 VIP힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 VIP힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP힐링';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 VIP힐링', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 빨딱 세워줄까
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 빨딱 세워줄까';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨딱 세워줄까';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 빨딱 세워줄까', '출장', '안산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 빨딱 세워줄까
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 빨딱 세워줄까';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨딱 세워줄까';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 빨딱 세워줄까', '인천', '화성', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 조니워커
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 조니워커';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조니워커';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 조니워커', '출장', '용인', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 캥거루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 캥거루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캥거루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 캥거루', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 월드컵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 월드컵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '월드컵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 월드컵', '출장', '수원', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 오르가즘출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 오르가즘출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오르가즘출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신촌 오르가즘출장', '출장', '신촌', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 핑두핑보24시출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 핑두핑보24시출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑두핑보24시출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '오산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 핑두핑보24시출장', '오산', '노원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 홀딱벗은스시녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 홀딱벗은스시녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀딱벗은스시녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강북' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 홀딱벗은스시녀', '강북', '인천', '12:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강북 먹거나 먹히거나 24시출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강북 먹거나 먹히거나 24시출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '먹거나 먹히거나 24시출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강북'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강북' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강북 먹거나 먹히거나 24시출장', '강북', '강북', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 홀딱벗은스시녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 홀딱벗은스시녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀딱벗은스시녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 홀딱벗은스시녀', '출장', '안산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동작구 꿀떡홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동작구 꿀떡홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀떡홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동작구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '동작구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동작구 꿀떡홈타이', '동작구', '동작구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 섹스타그램24시출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 섹스타그램24시출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹스타그램24시출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천호'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '남양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천호 섹스타그램24시출장', '남양주', '천호', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 레전드', '출장', '성남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 셀럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 셀럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셀럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 셀럽', '출장', '김포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 Porn hub
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 Porn hub';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Porn hub';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 Porn hub', '출장', '고양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 젖소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 젖소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '젖소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 젖소', '출장', '시흥', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 강아지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 강아지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강아지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 강아지', '출장', '하남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야무진
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야무진';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야무진';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 야무진', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 한국20대출장 클 라 스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 한국20대출장 클 라 스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국20대출장 클 라 스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '병점' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 한국20대출장 클 라 스', '병점', '구리', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 24시수도권원정녀출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 24시수도권원정녀출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시수도권원정녀출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 24시수도권원정녀출장', '출장', '평택', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 오르가즘출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 오르가즘출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오르가즘출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 오르가즘출장', '출장', '분당', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 초이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 초이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 초이스', '출장', '파주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 디저트맛집출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 디저트맛집출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트맛집출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 디저트맛집출장', '출장', '안산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 24시별의공주
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 24시별의공주';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시별의공주';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 24시별의공주', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 관악구 ⛔24시⛔하드⛔씹보지모음집⛔출장⛔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '관악구 ⛔24시⛔하드⛔씹보지모음집⛔출장⛔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⛔24시⛔하드⛔씹보지모음집⛔출장⛔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '관악구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '관악구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('관악구 ⛔24시⛔하드⛔씹보지모음집⛔출장⛔', '관악구', '관악구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신촌 24시', '출장', '신촌', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 24시', '출장', '광진', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 왕십리 보픈마인드 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '왕십리 보픈마인드 출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보픈마인드 출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '왕십리'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '마포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('왕십리 보픈마인드 출장', '마포', '왕십리', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달리기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달리기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달리기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 달리기', '출장', '강남', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 VIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 VIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 VIP', '출장', '송도', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 ✅러시아 하드 스웨디시✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 ✅러시아 하드 스웨디시✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅러시아 하드 스웨디시✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 ✅러시아 하드 스웨디시✅', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 대표', '출장', '인천', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 떡히트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 떡히트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '떡히트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 떡히트', '출장', '강서', '19:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 ❤️러시아 섹스출장 백마부장관❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 ❤️러시아 섹스출장 백마부장관❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️러시아 섹스출장 백마부장관❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 ❤️러시아 섹스출장 백마부장관❤️', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 비행기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 비행기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비행기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 비행기', '출장', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 기모노일본섹스출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 기모노일본섹스출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기모노일본섹스출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 기모노일본섹스출장', '안양', '동대문', '19:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 꽃집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 꽃집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 꽃집', '출장', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 미인도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미인도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 미인도', '출장', '일산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 기모노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 기모노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기모노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('역삼 기모노', '출장', '역삼', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 Ⓜ️100프로 실사인증Ⓜ️일본섹스출장Ⓜ️히토츠Ⓜ️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 Ⓜ️100프로 실사인증Ⓜ️일본섹스출장Ⓜ️히토츠Ⓜ️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️100프로 실사인증Ⓜ️일본섹스출장Ⓜ️히토츠Ⓜ️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 Ⓜ️100프로 실사인증Ⓜ️일본섹스출장Ⓜ️히토츠Ⓜ️', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 장관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 장관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 장관', '출장', '인천', '17:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 20대활어출장24시간일본한
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 20대활어출장24시간일본한';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대활어출장24시간일본한';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 20대활어출장24시간일본한', '인천', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 잘함
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 잘함';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잘함';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 잘함', '출장', '강서', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 잇빠이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 잇빠이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잇빠이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 잇빠이', '출장', '동대문', '19:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 서경인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 서경인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서경인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 서경인', '출장', '종로', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 촉촉한
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 촉촉한';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '촉촉한';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 촉촉한', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 20대활어섹녀출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 20대활어섹녀출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대활어섹녀출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 20대활어섹녀출장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 초이스백마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 초이스백마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이스백마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 초이스백마', '인천', '인천', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 さくらんぼ출장스시녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 さくらんぼ출장스시녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'さくらんぼ출장스시녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 さくらんぼ출장스시녀', '강서', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 출장의대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 출장의대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '출장의대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 출장의대표', '출장', '마포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 헨타이 일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 헨타이 일본출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헨타이 일본출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 헨타이 일본출장', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 달리기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 달리기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달리기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 달리기', '출장', '부평', '20:00'::TIME, '07:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 싸이월드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 싸이월드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸이월드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 싸이월드', '출장', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 24시여기클릭까시맛집만족시켜줘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 24시여기클릭까시맛집만족시켜줘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시여기클릭까시맛집만족시켜줘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 24시여기클릭까시맛집만족시켜줘', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 WOW 섹스출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 WOW 섹스출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'WOW 섹스출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 WOW 섹스출장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 セクシー출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 セクシー출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'セクシー출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 セクシー출장', '출장', '영등포', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 부산항공
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 부산항공';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부산항공';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 부산항공', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 길들이기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 길들이기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '길들이기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 길들이기', '출장', '동대문', '20:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 미친
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 미친';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미친';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 미친', '출장', '영등포', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 에로이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 에로이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에로이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 에로이', '출장', '송도', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 다모임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 다모임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다모임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 다모임', '출장', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 맛집탐방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 맛집탐방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛집탐방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 맛집탐방', '출장', '용인', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 츄릅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 츄릅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '츄릅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신촌 츄릅', '출장', '신촌', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 KIATIGERS
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 KIATIGERS';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'KIATIGERS';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 KIATIGERS', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 히드라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 히드라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히드라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 히드라', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 ❤️러시아 섹스출장 백마부장관❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 ❤️러시아 섹스출장 백마부장관❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️러시아 섹스출장 백마부장관❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '구로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 ❤️러시아 섹스출장 백마부장관❤️', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 제로타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 제로타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제로타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 제로타이', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 삿포로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 삿포로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삿포로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 삿포로', '출장', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 혼또니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 혼또니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '혼또니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 혼또니', '출장', '강남', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 풀옵션
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 풀옵션';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀옵션';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 풀옵션', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 에어포트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 에어포트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에어포트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 에어포트', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 Yellow Taxi
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 Yellow Taxi';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Yellow Taxi';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 Yellow Taxi', '출장', '제주도', '12:00'::TIME, '12:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 도톤보리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 도톤보리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도톤보리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 도톤보리', '출장', '안산', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 24H
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 24H';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24H';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 24H', '출장', '성남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 참이슬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 참이슬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '참이슬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 참이슬', '출장', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 김선생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 김선생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김선생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용산 김선생', '출장', '용산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 수박
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 수박';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수박';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('사당 수박', '출장', '사당', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 여신출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 여신출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여신출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 여신출장', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 한국산 과일배달
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 한국산 과일배달';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국산 과일배달';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '제주도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 한국산 과일배달', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 착즙병동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 착즙병동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '착즙병동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '양재' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('논현 착즙병동', '양재', '논현', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 히요리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 히요리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히요리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 히요리', '출장', '종로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '남양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 20대맛집 보픈마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 20대맛집 보픈마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대맛집 보픈마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '왕십리' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 20대맛집 보픈마인드', '왕십리', '마포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '고양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '고양', '고양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 슬로우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 슬로우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슬로우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 슬로우', '출장', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '의정부' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 크리스탈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 크리스탈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크리스탈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 크리스탈', '휴게텔', '인천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 ✡️유니버셜✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 ✡️유니버셜✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️유니버셜✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '구로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 ✡️유니버셜✡️', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 신주쿠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 신주쿠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신주쿠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 신주쿠', '출장', '부천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 일프로', '출장', '의정부', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 맛도리일본인오마카세출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 맛도리일본인오마카세출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛도리일본인오마카세출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 맛도리일본인오마카세출장', '인천', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 오키나와
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 오키나와';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오키나와';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 오키나와', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 백마에반하다 출장오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 백마에반하다 출장오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마에반하다 출장오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 백마에반하다 출장오피', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 20대도쿄핫걸이꾸욧출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 20대도쿄핫걸이꾸욧출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대도쿄핫걸이꾸욧출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 20대도쿄핫걸이꾸욧출장', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '용인' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 산지직송한국산왕가슴출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 산지직송한국산왕가슴출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '산지직송한국산왕가슴출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 산지직송한국산왕가슴출장', '출장', '시흥', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 산지직송 20대자연산거유출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 산지직송 20대자연산거유출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '산지직송 20대자연산거유출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 산지직송 20대자연산거유출장', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 24시', '출장', '수원', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 20대유럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 20대유럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대유럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 20대유럽', '출장', '안산', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 관악구 ███❌일단클릭⛔️일프로⛔️보고결정❌███
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '관악구 ███❌일단클릭⛔️일프로⛔️보고결정❌███';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '███❌일단클릭⛔️일프로⛔️보고결정❌███';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '관악구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '관악구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('관악구 ███❌일단클릭⛔️일프로⛔️보고결정❌███', '관악구', '관악구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 일본 스시천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 일본 스시천국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 스시천국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 일본 스시천국', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 ✡️와타시노✡️실사인증✡️재방문1위✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 ✡️와타시노✡️실사인증✡️재방문1위✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️와타시노✡️실사인증✡️재방문1위✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '성북' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 ✡️와타시노✡️실사인증✡️재방문1위✡️', '성북', '성북', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 맛있는일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 맛있는일본출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛있는일본출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '은평' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 맛있는일본출장', '은평', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 내상제로일본출장일단클릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 내상제로일본출장일단클릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '내상제로일본출장일단클릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 내상제로일본출장일단클릭', '신림', '부천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 도봉구 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '도봉구 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '도봉구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('도봉구 일프로', '출장', '도봉구', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 히토츠일본섹스출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 히토츠일본섹스출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히토츠일본섹스출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 히토츠일본섹스출장', '강서', '인천', '19:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 일본야르떼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 일본야르떼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본야르떼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 일본야르떼', '부천', '남양주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 란제리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 란제리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '란제리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 란제리', '출장', '인천', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 ███❌일단클릭⛔️일프로⛔️보고결정❌███
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 ███❌일단클릭⛔️일프로⛔️보고결정❌███';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '███❌일단클릭⛔️일프로⛔️보고결정❌███';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '용인' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 ███❌일단클릭⛔️일프로⛔️보고결정❌███', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 꽃향기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 꽃향기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃향기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 꽃향기', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 초이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 초이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 초이', '출장', '시흥', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 러시아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 러시아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 러시아', '출장', '안산', '07:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 엣지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 엣지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엣지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 엣지', '출장', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 야르떼 일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 야르떼 일본출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야르떼 일본출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 야르떼 일본출장', '안양', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 일본S급섹스출장녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 일본S급섹스출장녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본S급섹스출장녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 일본S급섹스출장녀', '출장', '구리', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 판타지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 판타지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판타지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 판타지', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성동구 ███❌일단클릭⛔️일프로⛔️보고결정❌███
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성동구 ███❌일단클릭⛔️일프로⛔️보고결정❌███';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '███❌일단클릭⛔️일프로⛔️보고결정❌███';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성동구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '성동구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성동구 ███❌일단클릭⛔️일프로⛔️보고결정❌███', '성동구', '성동구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 일프로', '출장', '강동', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 일본스시천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 일본스시천국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본스시천국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 일본스시천국', '출장', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 셋쿠스 일본섹스출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 셋쿠스 일본섹스출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셋쿠스 일본섹스출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '성남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 셋쿠스 일본섹스출장', '성남', '동대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 퀸s 홈 타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 퀸s 홈 타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀸s 홈 타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 퀸s 홈 타이', '출장', '구미', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 ███❌일단클릭⛔️일프로⛔️보고결정❌███
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 ███❌일단클릭⛔️일프로⛔️보고결정❌███';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '███❌일단클릭⛔️일프로⛔️보고결정❌███';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 ███❌일단클릭⛔️일프로⛔️보고결정❌███', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 기모찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 기모찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기모찌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 기모찌', '출장', '동대문', '19:00'::TIME, '04:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 명품유앤미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 명품유앤미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품유앤미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 명품유앤미', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 시크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 시크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 시크', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 심쿵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 심쿵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심쿵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 심쿵', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 배달의민족
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 배달의민족';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '배달의민족';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 배달의민족', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 하트', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 ███❌일단클릭⛔️일프로⛔️보고결정❌███
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 ███❌일단클릭⛔️일프로⛔️보고결정❌███';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '███❌일단클릭⛔️일프로⛔️보고결정❌███';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 ███❌일단클릭⛔️일프로⛔️보고결정❌███', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 스고이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 스고이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스고이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 스고이', '출장', '마포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 키모찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 키모찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '키모찌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 키모찌', '출장', '고양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 제펜클라쓰
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 제펜클라쓰';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제펜클라쓰';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 제펜클라쓰', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 니혼진
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 니혼진';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '니혼진';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 니혼진', '강남', '동대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 오로라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 오로라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오로라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 오로라', '출장', '용인', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 백마타자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 백마타자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마타자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 백마타자', '출장', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 핑클
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 핑클';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑클';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 핑클', '출장', '구미', '14:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '출장', '시흥', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 소나타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 소나타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소나타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 소나타', '출장', '대구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서대문 재팬BJ맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서대문 재팬BJ맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재팬BJ맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서대문 재팬BJ맛집', '출장', '서대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 재팬BJ맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 재팬BJ맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재팬BJ맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '관악구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 재팬BJ맛집', '관악구', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 재팬BJ맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 재팬BJ맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재팬BJ맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 재팬BJ맛집', '부천', '일산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 재팬월드 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 재팬월드 출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재팬월드 출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 재팬월드 출장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 관악구 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '관악구 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '관악구'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '관악구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('관악구 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '관악구', '관악구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 모찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 모찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모찌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 모찌', '출장', '구로', '19:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 마인드', '출장', '안양', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 꽃집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 꽃집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 꽃집', '출장', '성남', '19:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 마인드', '출장', '송파', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '노원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '노원', '노원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 아오이일본섹스출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 아오이일본섹스출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아오이일본섹스출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 아오이일본섹스출장', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 아는누나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 아는누나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아는누나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 아는누나', '출장', '고양', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 아는누나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 아는누나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아는누나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '경기광주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경기광주 아는누나', '출장', '경기광주', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 ❤️24시 어리고 예쁘고 출장❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 ❤️24시 어리고 예쁘고 출장❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️24시 어리고 예쁘고 출장❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '성북' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 ❤️24시 어리고 예쁘고 출장❤️', '성북', '성북', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️24시 어리고 예쁘고 출장❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️24시 어리고 예쁘고 출장❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️24시 어리고 예쁘고 출장❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 ❤️24시 어리고 예쁘고 출장❤️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 맑을린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 맑을린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맑을린';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 맑을린', '강남', '수유', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 맛집', '출장', '은평', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 오아시스 20대일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 오아시스 20대일본출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오아시스 20대일본출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '동작구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 오아시스 20대일본출장', '동작구', '은평', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '인천', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 일프로', '출장', '남양주', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 모스크바
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 모스크바';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모스크바';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 모스크바', '출장', '강남', '20:00'::TIME, '07:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 야바이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 야바이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야바이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 야바이', '출장', '의정부', '20:00'::TIME, '07:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '하남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '하남', '하남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 일프로', '출장', '수원', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '성북' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '성북', '성북', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❣️오사카❣️ 일본출장❣️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❣️오사카❣️ 일본출장❣️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❣️오사카❣️ 일본출장❣️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 ❣️오사카❣️ 일본출장❣️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도키도키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도키도키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도키도키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 도키도키', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 일본 좁보년들 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 일본 좁보년들 출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 좁보년들 출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '의정부' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 일본 좁보년들 출장', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 코리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 코리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '코리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 코리아', '강남', '성남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️❤️30대미시출장오피❤️❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️❤️30대미시출장오피❤️❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️❤️30대미시출장오피❤️❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 ❤️❤️30대미시출장오피❤️❤️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '신촌' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신촌 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '신촌', '신촌', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 3no
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 3no';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '3no';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 3no', '출장', '인천', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '출장', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 エロい일본 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 エロい일본 출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'エロい일본 출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 エロい일본 출장', '인천', '부천', '17:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 1티어일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 1티어일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1티어일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '16:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 1티어일본', '출장', '송파', '16:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 기모노백마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 기모노백마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기모노백마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 기모노백마', '출장', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 스타그램
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 스타그램';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타그램';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 스타그램', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 로또
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 로또';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로또';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 로또', '출장', '광주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 일프로', '출장', '일산', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 부산출장마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 부산출장마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부산출장마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 부산출장마사지', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 ▓▒░NEW░▒██▓▒░한입만░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 ▓▒░NEW░▒██▓▒░한입만░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '종로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 ▓▒░NEW░▒██▓▒░한입만░▒▓██', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 스웨덴아레나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 스웨덴아레나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스웨덴아레나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 스웨덴아레나', '출장', '수유', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 카와이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 카와이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카와이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 카와이', '출장', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 히로시마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 히로시마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히로시마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 히로시마', '출장', '고양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 개깡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 개깡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '개깡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 개깡', '출장', '의정부', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 ❄️❄️러시아좆집❄️❄️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 ❄️❄️러시아좆집❄️❄️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❄️❄️러시아좆집❄️❄️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '동대문' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 ❄️❄️러시아좆집❄️❄️', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 니뽄텐동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 니뽄텐동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '니뽄텐동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 니뽄텐동', '강남', '종로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군포 미슐랭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군포 미슐랭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미슐랭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군포 미슐랭', '출장', '군포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 바비걸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 바비걸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바비걸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 바비걸', '출장', '구미', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 원조❌️섹스❌️맛집HNT
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 원조❌️섹스❌️맛집HNT';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원조❌️섹스❌️맛집HNT';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 원조❌️섹스❌️맛집HNT', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 일본출장히나타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 일본출장히나타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본출장히나타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 일본출장히나타', '출장', '동대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 히말라야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 히말라야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히말라야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 히말라야', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 도쿄도어
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 도쿄도어';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄도어';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 도쿄도어', '출장', '종로', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 출장 도교
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 출장 도교';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '출장 도교';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 출장 도교', '수원', '부평', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 야르떼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 야르떼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야르떼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 야르떼', '출장', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 일본야르떼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 일본야르떼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본야르떼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '마포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 일본야르떼', '마포', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 새로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 새로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '새로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 새로', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 처음처럼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 처음처럼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '처음처럼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 처음처럼', '출장', '남동구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 서비스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 서비스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서비스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 서비스', '출장', '일산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 딴딴하게
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 딴딴하게';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딴딴하게';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 딴딴하게', '출장', '수유', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 아이돌출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 아이돌출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 아이돌출장', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 마인드출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 마인드출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 마인드출장', '출장', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 힐링메이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 힐링메이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링메이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 힐링메이트', '출장', '강남', '19:00'::TIME, '04:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 일본 출장 히나타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 일본 출장 히나타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 출장 히나타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 일본 출장 히나타', '인천', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 마스터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 마스터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마스터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 마스터', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 신세계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 신세계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신세계';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 신세계', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 24시적극적인발정기이쁜백마출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 24시적극적인발정기이쁜백마출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시적극적인발정기이쁜백마출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '금천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 24시적극적인발정기이쁜백마출장', '금천', '금천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 24시허리잘돌리는일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 24시허리잘돌리는일본출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시허리잘돌리는일본출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 24시허리잘돌리는일본출장', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 24시빨통큰한국여대생출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 24시빨통큰한국여대생출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시빨통큰한국여대생출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '화성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 24시빨통큰한국여대생출장', '화성', '화성', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 24시', '출장', '부천', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 바디s홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 바디s홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바디s홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 바디s홈타이', '출장', '대구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❌️도쿄도어❌️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❌️도쿄도어❌️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❌️도쿄도어❌️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 ❌️도쿄도어❌️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 베스킨라빈스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 베스킨라빈스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베스킨라빈스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 베스킨라빈스', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 여비서
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 여비서';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여비서';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 여비서', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 찐20대 백마출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 찐20대 백마출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐20대 백마출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '의정부' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 찐20대 백마출장', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 음탕한년들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 음탕한년들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '음탕한년들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '송도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 음탕한년들', '송도', '송도', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 음탕한년들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 음탕한년들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '음탕한년들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 음탕한년들', '출장', '영종도', '20:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 음탕한년들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 음탕한년들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '음탕한년들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 음탕한년들', '강남', '부평', '20:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 후레쉬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 후레쉬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후레쉬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 후레쉬', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 푸틴의 여자들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 푸틴의 여자들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '푸틴의 여자들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '잠실' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 푸틴의 여자들', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 ⚜️니뽄야끼니꾸출장⚜️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 ⚜️니뽄야끼니꾸출장⚜️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⚜️니뽄야끼니꾸출장⚜️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '광진' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 ⚜️니뽄야끼니꾸출장⚜️', '광진', '광진', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 유혹 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 유혹 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유혹 24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 유혹 24시', '출장', '부평', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 일본 출장 히나타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 일본 출장 히나타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 출장 히나타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '동대문' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 일본 출장 히나타', '동대문', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 ZERO
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 ZERO';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ZERO';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 ZERO', '출장', '동대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 TOP 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 TOP 출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOP 출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 TOP 출장', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 럭셔리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 럭셔리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭셔리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 럭셔리', '출장', '구미', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 니코니코
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 니코니코';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '니코니코';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 니코니코', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 푸틴
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 푸틴';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '푸틴';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 푸틴', '출장', '일산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 픽미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 픽미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '픽미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 픽미', '출장', '강남', '12:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 드루와홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 드루와홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드루와홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 드루와홈타이', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 꿀밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 꿀밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 꿀밤', '출장', '광주', '12:00'::TIME, '12:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 아고다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 아고다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아고다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 아고다', '출장', '광주', '12:00'::TIME, '12:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 스시일본혼혈출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 스시일본혼혈출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스시일본혼혈출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 스시일본혼혈출장', '출장', '영종도', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 보드카
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 보드카';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보드카';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신촌 보드카', '강남', '신촌', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 러시아 NO1 백마카세
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 러시아 NO1 백마카세';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아 NO1 백마카세';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 러시아 NO1 백마카세', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 레전드', '출장', '인천', '17:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 레전드', '출장', '강서', '17:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 일본하드코어섹스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 일본하드코어섹스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본하드코어섹스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 일본하드코어섹스', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 복숭아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 복숭아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '복숭아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '구미' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 복숭아', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 살아남기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 살아남기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '살아남기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 살아남기', '출장', '청주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울대 그라비아일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울대 그라비아일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '그라비아일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서울대'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서울대 그라비아일본', '출장', '서울대', '19:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 원탑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 원탑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원탑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 원탑', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 타니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 타니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 타니', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 오브레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 오브레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오브레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 오브레전드', '출장', '대전', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 카와이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 카와이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카와이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 카와이', '출장', '부천', '18:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 스시녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 스시녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스시녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 스시녀', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 오이시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 오이시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오이시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 오이시', '출장', '파주', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 싸와디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 싸와디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸와디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 싸와디', '출장', '대전', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 황홀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 황홀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황홀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 황홀', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 이쁨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 이쁨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이쁨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 이쁨', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 관악구 산토리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '관악구 산토리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '산토리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '관악구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('관악구 산토리', '출장', '관악구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 천국도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 천국도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천국도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 천국도', '출장', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 하얀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 하얀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하얀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 하얀', '출장', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 사이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 사이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사이즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 사이즈', '출장', '마포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 복숭아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 복숭아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '복숭아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 복숭아', '출장', '강서', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 언니들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 언니들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '언니들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 언니들', '출장', '시흥', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 리뉴얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 리뉴얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '리뉴얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 리뉴얼', '출장', '안산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 24시 찐20대 한 . 일 출짱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 24시 찐20대 한 . 일 출짱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시 찐20대 한 . 일 출짱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 24시 찐20대 한 . 일 출짱', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 24시 찐20대 한 . 일 출짱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 24시 찐20대 한 . 일 출짱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시 찐20대 한 . 일 출짱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '은평' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 24시 찐20대 한 . 일 출짱', '은평', '은평', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 일본 이쁜이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 일본 이쁜이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 이쁜이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 일본 이쁜이', '출장', '남양주', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 24시하드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 24시하드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시하드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용산 24시하드', '출장', '용산', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 24시일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 24시일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 24시일본', '출장', '광명', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 24시일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 24시일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 24시일본', '출장', '강동', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 일본 상큼와꾸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 일본 상큼와꾸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 상큼와꾸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 일본 상큼와꾸', '출장', '화성', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 24일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 24일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 24일본', '출장', '종로', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 24일본하드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 24일본하드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24일본하드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 24일본하드', '출장', '동탄', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 일본 몸매최고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 일본 몸매최고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 몸매최고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 일본 몸매최고', '출장', '파주', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 일본 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 일본 출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 일본 출장', '출장', '광진', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 상큼한 일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 상큼한 일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상큼한 일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 상큼한 일본', '출장', '신림', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 일본 상큼이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 일본 상큼이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 상큼이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 일본 상큼이', '출장', '금천', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 용인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 용인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '용인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '용인' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 용인샵', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 비쥬얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 비쥬얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비쥬얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 비쥬얼', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 성형외과
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 성형외과';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '성형외과';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 성형외과', '출장', '안양', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 아메리카노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 아메리카노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아메리카노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 아메리카노', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 명품
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 명품';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 명품', '출장', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 에너자이저
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 에너자이저';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에너자이저';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 에너자이저', '출장', '김포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 핑크팬더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 핑크팬더';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크팬더';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 핑크팬더', '출장', '성남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 황홀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 황홀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황홀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 황홀', '출장', '오산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 아리가또
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 아리가또';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아리가또';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 아리가또', '출장', '평택', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 섹슈얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 섹슈얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹슈얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 섹슈얼', '출장', '동대문', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 섹슈얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 섹슈얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹슈얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 섹슈얼', '출장', '용인', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 20대한국섹슈얼스웨디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 20대한국섹슈얼스웨디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대한국섹슈얼스웨디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 20대한국섹슈얼스웨디', '출장', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 20대한국섹슈얼스웨디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 20대한국섹슈얼스웨디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대한국섹슈얼스웨디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 20대한국섹슈얼스웨디', '출장', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 20대한국섹슈얼스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 20대한국섹슈얼스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대한국섹슈얼스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 20대한국섹슈얼스웨디시', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 센스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 센스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '센스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 센스', '출장', '부산', '10:00'::TIME, '07:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 야마자키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 야마자키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야마자키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 야마자키', '출장', '아산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 얼짱시대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 얼짱시대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '얼짱시대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 얼짱시대', '출장', '천안', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 체인지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 체인지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체인지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 체인지', '출장', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 아찔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 아찔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아찔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 아찔', '출장', '평택', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 시즈오카
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 시즈오카';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시즈오카';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 시즈오카', '출장', '의정부', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 백마Land
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 백마Land';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마Land';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 백마Land', '출장', '부천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 히토미섹스출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 히토미섹스출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히토미섹스출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 히토미섹스출장', '출장', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 하야꾸빠구리출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 하야꾸빠구리출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하야꾸빠구리출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 하야꾸빠구리출장', '출장', '인천', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서대문 잘대주는앙팡진씹년들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서대문 잘대주는앙팡진씹년들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잘대주는앙팡진씹년들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서대문'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '서대문' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서대문 잘대주는앙팡진씹년들', '서대문', '서대문', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 쭈물주물찍찍폭폭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 쭈물주물찍찍폭폭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쭈물주물찍찍폭폭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 쭈물주물찍찍폭폭', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 하니 홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 하니 홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하니 홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 하니 홈타이', '출장', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 크렘린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 크렘린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크렘린';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 크렘린', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 스시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 스시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 스시', '출장', '송파', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 쏘프란도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 쏘프란도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쏘프란도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 쏘프란도', '출장', '수원', '18:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 퀸 홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 퀸 홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀸 홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 퀸 홈타이', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 헤븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 헤븐', '출장', '부산', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 제주도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 제주도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제주도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 제주도', '출장', '제주도', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 프라이빗
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 프라이빗';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프라이빗';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 프라이빗', '출장', '구미', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 망고홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 망고홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '망고홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 망고홈타이', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전하트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '16:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 대전하트', '출장', '대전', '16:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 체리출장마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 체리출장마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체리출장마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '원주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 체리출장마사지', '원주', '원주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 쩜오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 쩜오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쩜오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 쩜오', '출장', '강동', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 싸이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 싸이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸이즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 싸이즈', '출장', '남양주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 모또모또
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 모또모또';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모또모또';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 모또모또', '출장', '노원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 광주파트너
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 광주파트너';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '광주파트너';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 광주파트너', '출장', '광주', '12:00'::TIME, '12:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 밀크출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 밀크출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 밀크출장', '출장', '대전', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중랑 1프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중랑 1프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '중랑'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('중랑 1프로', '출장', '중랑', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 신난다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 신난다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신난다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 신난다', '오피', '제주도', '06:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 사바이 홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 사바이 홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사바이 홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 사바이 홈타이', '출장', '구미', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 전자담배
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 전자담배';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전자담배';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 전자담배', '출장', '군산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 세종 부장관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '세종 부장관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부장관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '세종'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('세종 부장관', '출장', '세종', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 청주쏠로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 청주쏠로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청주쏠로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 청주쏠로', '출장', '청주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 평택장관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 평택장관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '평택장관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 평택장관', '출장', '당진', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 콜센터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 콜센터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜센터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 콜센터', '출장', '대구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 레종
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 레종';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레종';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 레종', '출장', '평택', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 파트너출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 파트너출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파트너출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 파트너출장', '출장', '천안', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 익산오피출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 익산오피출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '익산오피출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 익산오피출장', '출장', '익산', '12:00'::TIME, '12:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 베라출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 베라출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베라출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 베라출장', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 샹차이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 샹차이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샹차이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 샹차이', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 라라홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 라라홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라라홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 라라홈타이', '출장', '전주', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 빨간집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 빨간집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨간집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 빨간집', '출장', '대전', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산설탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산설탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산설탕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 울산설탕', '출장', '울산', '12:00'::TIME, '12:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 Ace
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 Ace';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ace';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 Ace', '출장', '구미', '06:00'::TIME, '06:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 홍콩홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 홍콩홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 홍콩홈타이', '출장', '울산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 한국여신
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 한국여신';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국여신';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 한국여신', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 콜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 콜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 콜', '출장', '부산', '20:00'::TIME, '09:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 노보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 노보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 노보', '출장', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 오일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 오일';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오일';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 오일', '출장', '남동구', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 홈서비스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 홈서비스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈서비스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 홈서비스', '출장', '대전', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오창 마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오창 마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오창'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오창 마인드', '출장', '오창', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 핑크돌핀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 핑크돌핀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크돌핀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 핑크돌핀', '출장', '아산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 효녀출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 효녀출장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '효녀출장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 효녀출장', '출장', '청주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 인스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 인스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 인스타', '출장', '수원', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 핑계고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 핑계고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑계고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍대 핑계고', '출장', '홍대', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 오빠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 오빠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오빠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 오빠', '수원', '안산', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 합체
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 합체';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '합체';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 합체', '강남', '건대', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 비키니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 비키니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비키니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 비키니', '출장', '강남', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 소나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 소나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 소나', '출장', '청주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 루미에르 홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 루미에르 홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루미에르 홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '청주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 루미에르 홈타이', '청주', '청주', '24:00'::TIME, '24:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 충주홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 충주홈타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '충주홈타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '충주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 충주홈타이', '충주', '충주', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 콜라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 콜라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '출장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 콜라', '출장', '경주', '17:00'::TIME, '04:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 베트남출장마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 베트남출장마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남출장마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '출장')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '출장' THEN '제주도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 베트남출장마사지', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;