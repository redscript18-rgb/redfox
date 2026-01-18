-- 오피가이드 데이터 마이그레이션 Part 2/7


-- 천안 캣츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 캣츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캣츠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 캣츠', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 빙그레
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 빙그레';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빙그레';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 빙그레', '휴게텔', '파주', '12:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 곰인형
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 곰인형';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '곰인형';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 곰인형', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안성 포커페이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안성 포커페이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포커페이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안성'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안성 포커페이스', '휴게텔', '안성', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 쫄깃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 쫄깃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쫄깃';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 쫄깃', '휴게텔', '안양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 유체이탈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 유체이탈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유체이탈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '잠실' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 유체이탈', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 프리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 프리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 프리티', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '잠실' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 에이스', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 드림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 드림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 드림', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 맛동산
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 맛동산';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛동산';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 맛동산', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 마징가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 마징가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마징가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '주안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 마징가', '주안', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 루트66
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 루트66';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루트66';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '구로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 루트66', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 Y
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 Y';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Y';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 Y', '휴게텔', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 원탑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 원탑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원탑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 원탑', '휴게텔', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 철용이네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 철용이네';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '철용이네';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 철용이네', '휴게텔', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 빰빰
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 빰빰';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빰빰';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 빰빰', '휴게텔', '일산', '11:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 휴게소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 휴게소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '휴게소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 휴게소', '휴게텔', '상봉', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 세븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 세븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 세븐', '휴게텔', '충주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 시크릿', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 오산 홈런
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 오산 홈런';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오산 홈런';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 오산 홈런', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 ☀️망고☀️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 ☀️망고☀️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☀️망고☀️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 ☀️망고☀️', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 넘버원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 넘버원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '넘버원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 넘버원', '휴게텔', '평촌', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 티슈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 티슈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티슈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 티슈', '휴게텔', '원주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '강동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 시크릿', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 쩜사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 쩜사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쩜사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:30'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 쩜사', '휴게텔', '강서', '12:30'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 애플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 애플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '은평' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 애플', '은평', '은평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 갤럭시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 갤럭시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갤럭시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 갤럭시', '휴게텔', '광주', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 배꼽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 배꼽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '배꼽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 배꼽', '휴게텔', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 마카롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 마카롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마카롱';
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
    VALUES ('청주 마카롱', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 요정집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 요정집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요정집';
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
    VALUES ('청주 요정집', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 그린라이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 그린라이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '그린라이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 그린라이트', '휴게텔', '청라', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 참이슬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 참이슬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '참이슬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 참이슬', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 블루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 블루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 블루', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 아이브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 아이브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이브';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 아이브', '휴게텔', '양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 팝콘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 팝콘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팝콘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 팝콘', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 팅커벨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 팅커벨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팅커벨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 팅커벨', '휴게텔', '양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 스캔들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 스캔들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스캔들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 스캔들', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 당근
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 당근';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '당근';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 당근', '휴게텔', '대전', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 레전드', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 맥심
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 맥심';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 맥심', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 도봉구 봉봉
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '도봉구 봉봉';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봉봉';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '도봉구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '도봉구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('도봉구 봉봉', '도봉구', '도봉구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 하녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 하녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 하녀', '휴게텔', '영등포', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 ⭕이클립스⭕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 ⭕이클립스⭕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭕이클립스⭕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 ⭕이클립스⭕', '수원', '수원', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 흐르리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 흐르리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '흐르리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 흐르리', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 검단A
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 검단A';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '검단A';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 검단A', '휴게텔', '서구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 찜찜찜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 찜찜찜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찜찜찜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 찜찜찜', '휴게텔', '광주', '06:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 엔젤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 엔젤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 엔젤', '휴게텔', '파주', '01:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 TOP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 TOP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 TOP', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 TOP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 TOP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 TOP', '휴게텔', '오산', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 콜라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 콜라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 콜라', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 GRAND
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 GRAND';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'GRAND';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 GRAND', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 비치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 비치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 비치', '휴게텔', '평택', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 동탄화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 동탄화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '동탄화이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 동탄화이트', '휴게텔', '동탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 레인보우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 레인보우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레인보우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('계양 레인보우', '휴게텔', '계양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 치즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 치즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '치즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 치즈', '휴게텔', '동탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 구청맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 구청맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구청맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 구청맛집', '휴게텔', '용인', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 럭셔리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 럭셔리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭셔리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '송탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송탄 럭셔리', '휴게텔', '송탄', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 타이레놀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 타이레놀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타이레놀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 타이레놀', '휴게텔', '동탄', '13:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 루트66
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 루트66';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루트66';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 루트66', '휴게텔', '분당', '12:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 와우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 와우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '와우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 와우', '휴게텔', '서구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 빌보드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 빌보드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빌보드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 빌보드', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 사거리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 사거리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사거리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '오산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 사거리', '오산', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 BOSS
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 BOSS';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BOSS';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 BOSS', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 천지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 천지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 천지', '휴게텔', '용인', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 도봉구 영차
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '도봉구 영차';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영차';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '도봉구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('도봉구 영차', '휴게텔', '도봉구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 지혜1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 지혜1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '지혜1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 지혜1인샵', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 스누피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 스누피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스누피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '구로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 스누피', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 휴게소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 휴게소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '휴게소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구월 휴게소', '휴게텔', '구월', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산 싸이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산 싸이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 싸이즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 일산 싸이즈', '일산', '일산', '14:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 장난감
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 장난감';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장난감';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 장난감', '휴게텔', '남동구', '06:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 NEW대한항공
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 NEW대한항공';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW대한항공';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송탄'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '송탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송탄 NEW대한항공', '송탄', '송탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 초콜릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 초콜릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초콜릿';
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
    VALUES ('청주 초콜릿', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 팝콘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 팝콘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팝콘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 팝콘', '휴게텔', '분당', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 스위트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 스위트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스위트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 스위트', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 아고고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 아고고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아고고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 아고고', '휴게텔', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 OK
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 OK';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'OK';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '아산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 OK', '아산', '아산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 BLACK
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 BLACK';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BLACK';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 BLACK', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 홍등가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 홍등가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍등가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '동대문' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 홍등가', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 은하수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 은하수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '은하수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '고양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 은하수', '고양', '고양', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 베이글
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 베이글';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이글';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 베이글', '휴게텔', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 클로버
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 클로버';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '클로버';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 클로버', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 멜론
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 멜론';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멜론';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 멜론', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 썸씽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 썸씽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸씽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 썸씽', '휴게텔', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 빽다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 빽다방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빽다방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 빽다방', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 심플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 심플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 심플', '휴게텔', '용인', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 원피스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 원피스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원피스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송탄 원피스', '휴게텔', '송탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 쿠키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 쿠키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쿠키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 쿠키', '휴게텔', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 낼름낼름
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 낼름낼름';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '낼름낼름';
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
    VALUES ('청주 낼름낼름', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 옹달샘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 옹달샘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '옹달샘';
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
    VALUES ('청주 옹달샘', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 잭팟
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 잭팟';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잭팟';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 잭팟', '휴게텔', '평택', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 플라워';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플라워';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 플라워', '휴게텔', '영등포', '11:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 갤럭시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 갤럭시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갤럭시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 갤럭시', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 마카롱코리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 마카롱코리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마카롱코리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 마카롱코리아', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 부평 썸블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 부평 썸블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부평 썸블리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 부평 썸블리', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 신세계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 신세계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신세계';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
      , contact_name = COALESCE(contact_name, '신세계')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('고양 신세계', '휴게텔', '고양', '10:00'::TIME, '05:00'::TIME, '휴게텔', '신세계')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 핫소스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 핫소스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫소스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 핫소스', '휴게텔', '창동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 테토녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 테토녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '테토녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 테토녀', '휴게텔', '강남', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 애플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 애플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 애플', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 이쁘다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 이쁘다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이쁘다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 이쁘다', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 더블유W
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 더블유W';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더블유W';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 더블유W', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 마이쮸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 마이쮸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마이쮸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 마이쮸', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 892
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 892';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '892';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 892', '휴게텔', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 다이소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 다이소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 다이소', '휴게텔', '광주', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 첫사랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 첫사랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫사랑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 첫사랑', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 소개팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 소개팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소개팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '서울 동대문구 신설동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 소개팅', '서울 동대문구 신설동', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 루체
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 루체';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루체';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 루체', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 시그널
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 시그널';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그널';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 시그널', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 코카콜라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 코카콜라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '코카콜라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 코카콜라', '휴게텔', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 헤븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 헤븐', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전- 미 스 틱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전- 미 스 틱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전- 미 스 틱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 대전- 미 스 틱', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 데이데이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 데이데이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데이데이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 데이데이', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 디즈니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 디즈니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디즈니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 디즈니', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 백마엘프
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 백마엘프';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마엘프';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '하남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 백마엘프', '하남', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 드루와
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 드루와';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드루와';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '김포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 드루와', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 루이비떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 루이비떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루이비떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 루이비떡', '휴게텔', '시흥', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 워라벨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 워라벨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '워라벨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '용인' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 워라벨', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 홈런볼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 홈런볼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런볼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 홈런볼', '휴게텔', '대전', '14:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 홀릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 홀릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 홀릭', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 석계 뷰티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '석계 뷰티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뷰티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '석계'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '석계' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('석계 뷰티', '석계', '석계', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 RILEX롤렉스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 RILEX롤렉스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'RILEX롤렉스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 RILEX롤렉스', '휴게텔', '수원', '06:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 베어스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 베어스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베어스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '역삼' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 베어스', '역삼', '강남', '10:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 야구장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 야구장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야구장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '09:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '구로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 야구장', '구로', '구로', '09:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 비키니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 비키니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비키니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 비키니', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 쓰리뽕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 쓰리뽕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쓰리뽕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 쓰리뽕', '건마', '영등포', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 미즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 미즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 미즈', '광주', '광주', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 빨래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 빨래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '고양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 빨래방', '고양', '고양', '11:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '파주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 크림', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 와이키키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 와이키키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '와이키키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 와이키키', '휴게텔', '부천', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 모델
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 모델';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모델';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 모델', '휴게텔', '군산', '14:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 블랙핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 블랙핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 블랙핑크', '휴게텔', '군산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 이글스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 이글스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이글스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '강동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 이글스', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 아우라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 아우라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아우라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 아우라', '건마', '대전', '14:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 퍼스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 퍼스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼스트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '아산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 퍼스트', '아산', '아산', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 슈퍼맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 슈퍼맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈퍼맨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 슈퍼맨', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 CU
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 CU';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'CU';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 CU', '휴게텔', '동탄', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 오산
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 오산';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오산';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 오산', '휴게텔', '오산', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 동탄오렌지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 동탄오렌지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '동탄오렌지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 동탄오렌지', '휴게텔', '동탄', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 도쿄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 도쿄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '충청북도 진천군' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 도쿄', '충청북도 진천군', '진천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 군산틱톡휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 군산틱톡휴게텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '군산틱톡휴게텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '16:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 군산틱톡휴게텔', '휴게텔', '군산', '16:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 새콤달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 새콤달콤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '새콤달콤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 새콤달콤', '휴게텔', '동탄', '15:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 이자카야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 이자카야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이자카야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '고양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 이자카야', '고양', '고양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 네이버
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 네이버';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '네이버';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 네이버', '휴게텔', '대전', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 데이지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 데이지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데이지';
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
    VALUES ('인천 데이지', '휴게텔', '인천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 첫사랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 첫사랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫사랑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '잠실' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 첫사랑', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 샤르망
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 샤르망';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤르망';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 샤르망', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 69바디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 69바디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '69바디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '용인' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 69바디', '용인', '용인', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 여사친
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 여사친';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여사친';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 여사친', '휴게텔', '일산', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 판타지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 판타지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판타지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 판타지', '휴게텔', '광주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 야구장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 야구장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야구장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 야구장', '휴게텔', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 굿나잇
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 굿나잇';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '굿나잇';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 굿나잇', '휴게텔', '대전', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 퍼스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 퍼스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼스트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '간석'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('간석 퍼스트', '휴게텔', '간석', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 밀크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 밀크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 밀크', '휴게텔', '잠실', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 S+
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 S+';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S+';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 S+', '대구', '대구', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 온니팬스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 온니팬스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '온니팬스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 온니팬스', '휴게텔', '대전', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 5882
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 5882';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '5882';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 5882', '휴게텔', '강남', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오창 꽃밭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오창 꽃밭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃밭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오창'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '오창' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오창 꽃밭', '오창', '오창', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 디올
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 디올';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '간석'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('간석 디올', '휴게텔', '간석', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오창 교복
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오창 교복';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '교복';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오창'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오창 교복', '휴게텔', '오창', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 라부부 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 라부부 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라부부 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 라부부 스웨디시', '건마', '파주', '14:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 뉴진스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 뉴진스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뉴진스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 뉴진스', '휴게텔', '광주', '01:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 사쿠라(さくら)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 사쿠라(さくら)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠라(さくら)';
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
    VALUES ('청주 사쿠라(さくら)', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 봄날
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 봄날';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봄날';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 봄날', '휴게텔', '성남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 딸기', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 원픽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 원픽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원픽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 원픽', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 구세주
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 구세주';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구세주';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 구세주', '휴게텔', '강동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 SNS
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 SNS';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'SNS';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 SNS', '휴게텔', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 오아시스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 오아시스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오아시스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 오아시스', '휴게텔', '용인', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 세븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 세븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 세븐', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 랜드휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 랜드휴게텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '랜드휴게텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 랜드휴게텔', '휴게텔', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 바닐라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 바닐라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바닐라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 바닐라', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 에스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 에스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 에스파', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 파타야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 파타야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파타야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 파타야', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 베트남천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 베트남천국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남천국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '송도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 베트남천국', '송도', '송도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 싸이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 싸이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸이즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 싸이즈', '휴게텔', '김포', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 아이스크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 아이스크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이스크림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 아이스크림', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 헤븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 헤븐', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 럭키비키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 럭키비키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭키비키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 럭키비키', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 WOW
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 WOW';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'WOW';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 WOW', '휴게텔', '아산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 바나나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 바나나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 바나나', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안성 풀하우스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안성 풀하우스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀하우스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안성'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안성 풀하우스', '휴게텔', '안성', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 보령 보령스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '보령 보령스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보령스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '보령'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('보령 보령스웨디시', '휴게텔', '보령', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 유니크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 유니크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유니크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 유니크', '휴게텔', '상봉', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 코인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 코인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '코인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 코인', '휴게텔', '충주', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 골든리프
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 골든리프';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골든리프';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 골든리프', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 밤양갱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 밤양갱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밤양갱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 밤양갱', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 구름가게
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 구름가게';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구름가게';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 구름가게', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 타짜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 타짜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타짜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 타짜', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 세종 팝콘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '세종 팝콘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팝콘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '세종'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('세종 팝콘', '휴게텔', '세종', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 땡초
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 땡초';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '땡초';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 땡초', '휴게텔', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 싸요싸요
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 싸요싸요';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸요싸요';
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
    VALUES ('청주 싸요싸요', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 시그니처
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 시그니처';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그니처';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 시그니처', '휴게텔', '상봉', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 어썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 어썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 어썸', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 엔젤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 엔젤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 엔젤', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 발기해서생긴일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 발기해서생긴일';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '발기해서생긴일';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 발기해서생긴일', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 춘천 갤럭시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '춘천 갤럭시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갤럭시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '춘천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('춘천 갤럭시', '건마', '춘천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 섹파24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 섹파24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹파24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 섹파24시', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 낙원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 낙원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '낙원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 낙원', '휴게텔', '충주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 인스타휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 인스타휴게텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타휴게텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 인스타휴게텔', '휴게텔', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 여긴어때
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 여긴어때';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여긴어때';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 여긴어때', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오창 미인도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오창 미인도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오창'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오창 미인도', '휴게텔', '오창', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 건마 vip
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 건마 vip';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '건마 vip';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 건마 vip', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 스페셜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 스페셜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스페셜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 스페셜', '휴게텔', '광주', '01:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 베트남헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 베트남헤븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남헤븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 베트남헤븐', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 수변공원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 수변공원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수변공원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 수변공원', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 섹섹정보통
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 섹섹정보통';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹섹정보통';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 섹섹정보통', '휴게텔', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 X
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 X';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'X';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 X', '휴게텔', '금천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 벚꽃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 벚꽃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벚꽃';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구월 벚꽃', '휴게텔', '구월', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 샴푸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 샴푸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샴푸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 샴푸', '휴게텔', '아산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 더블유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 더블유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더블유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 더블유', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 캐스팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 캐스팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캐스팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 캐스팅', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 뉴원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 뉴원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뉴원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 뉴원', '휴게텔', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 홈런
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 홈런';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 홈런', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 오레오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 오레오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오레오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 오레오', '휴게텔', '송도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 M
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 M';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'M';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 M', '휴게텔', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 롤렉스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 롤렉스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '롤렉스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 롤렉스', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 오프화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 오프화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오프화이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 오프화이트', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 피크닉
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 피크닉';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '피크닉';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 피크닉', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 블랙핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 블랙핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 블랙핑크', '휴게텔', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 별다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 별다방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별다방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 별다방', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서초 워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서초 워터밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '워터밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서초'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '서초' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서초 워터밤', '서초', '서초', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 테크노밸리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 테크노밸리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '테크노밸리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 테크노밸리', '휴게텔', '아산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 사운드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 사운드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사운드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 사운드', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 구찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 구찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구찌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '향남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('향남 구찌', '휴게텔', '향남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 속궁합
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 속궁합';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '속궁합';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '충청북도 진천군 진천읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 속궁합', '충청북도 진천군 진천읍', '진천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 명품관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 명품관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '향남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('향남 명품관', '휴게텔', '향남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 프리티', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 오사카섹스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 오사카섹스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오사카섹스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 오사카섹스타', '휴게텔', '시흥', '14:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 퐁당
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 퐁당';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퐁당';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 퐁당', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 더킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 더킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 더킹', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 용인불여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 용인불여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '용인불여우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 용인불여우', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 마담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 마담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마담';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 마담', '휴게텔', '광주', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 럭스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 럭스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 럭스', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 직진
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 직진';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '직진';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 직진', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 바나나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 바나나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 바나나', '휴게텔', '서구', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 틱톡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 틱톡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '틱톡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 틱톡', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 블랙라벨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 블랙라벨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙라벨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '서구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 블랙라벨', '서구', '서구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 글로리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 글로리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '글로리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 글로리', '휴게텔', '동대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 M A N G O
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 M A N G O';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'M A N G O';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 M A N G O', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 부가티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 부가티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부가티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 부가티', '휴게텔', '수유', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야놀자휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야놀자휴게텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야놀자휴게텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 야놀자휴게텔', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 자취방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 자취방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자취방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 자취방', '휴게텔', '잠실', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 레이블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 레이블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 레이블', '휴게텔', '이천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 야시장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 야시장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야시장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구월 야시장', '휴게텔', '구월', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 중증내상센터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 중증내상센터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '중증내상센터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 중증내상센터', '휴게텔', '송도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 카카오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 카카오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카카오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 카카오', '휴게텔', '평촌', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 여기어때
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 여기어때';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여기어때';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 여기어때', '휴게텔', '광주', '02:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 룰루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 룰루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '룰루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 룰루', '휴게텔', '파주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 란제리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 란제리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '란제리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 란제리', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 활명수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 활명수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '활명수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 활명수', '휴게텔', '강동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 꿀떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 꿀떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 꿀떡', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 블루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 블루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 블루', '휴게텔', '대전', '13:00'::TIME, '02:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 캔디샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 캔디샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캔디샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 캔디샵', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 더퀸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 더퀸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더퀸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목동 더퀸', '휴게텔', '목동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 미시클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 미시클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미시클럽';
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
    VALUES ('청주 미시클럽', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 봄날
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 봄날';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봄날';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 봄날', '휴게텔', '서구', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 TOP쉬멜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 TOP쉬멜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOP쉬멜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 TOP쉬멜', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 홈런
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 홈런';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 홈런', '휴게텔', '분당', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 맛집', '휴게텔', '분당', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 여기어때
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 여기어때';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여기어때';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '김포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 여기어때', '김포', '김포', '11:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 백마or타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 백마or타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마or타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '간석'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('간석 백마or타이', '휴게텔', '간석', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 셔츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 셔츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 셔츠', '휴게텔', '영등포', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 방앗간
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 방앗간';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방앗간';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '충청북도 진천군' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 방앗간', '충청북도 진천군', '진천', '14:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 루프탑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 루프탑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루프탑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 루프탑', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 쫀득플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 쫀득플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쫀득플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 쫀득플', '일산', '일산', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 계양 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 계양 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '계양 샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '계양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('계양 계양 샤넬', '계양', '계양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 레드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 레드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 레드', '휴게텔', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 69
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 69';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '69';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '광명' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 69', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 불여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 불여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '불여우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 불여우', '안마', '당진', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 춘천 발그레
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '춘천 발그레';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '발그레';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:30'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '춘천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('춘천 발그레', '휴게텔', '춘천', '15:30'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 그녀의방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 그녀의방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '그녀의방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 그녀의방', '휴게텔', '동대문', '14:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 넘버원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 넘버원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '넘버원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 넘버원', '휴게텔', '청라', '12:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 핫태핫태
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 핫태핫태';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫태핫태';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 핫태핫태', '건마', '김포', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 동암역 애인모드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 동암역 애인모드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '동암역 애인모드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 동암역 애인모드', '휴게텔', '부평', '12:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 도봉구 밝히는 미시 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '도봉구 밝히는 미시 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밝히는 미시 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '도봉구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('도봉구 밝히는 미시 1인샵', '휴게텔', '도봉구', '13:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 포카리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 포카리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포카리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '서구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 포카리', '서구', '서구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 파라다이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 파라다이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파라다이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 파라다이스', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '충청북도 진천군 진천읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 핑크', '충청북도 진천군 진천읍', '진천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 지나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 지나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '지나1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 지나1인샵', '휴게텔', '영종도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 태릉 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '태릉 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '태릉'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('태릉 일프로', '휴게텔', '태릉', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 럭스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 럭스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 럭스', '휴게텔', '파주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 설레임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설레임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 설레임', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 이클립스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 이클립스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이클립스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 이클립스', '휴게텔', '광주', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 미라클
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 미라클';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미라클';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 미라클', '휴게텔', '고양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 박카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 박카스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박카스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 박카스', '휴게텔', '영종도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 탑티어
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 탑티어';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탑티어';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 탑티어', '휴게텔', '서구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 모델
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 모델';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모델';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 모델', '휴게텔', '창동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 골드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 골드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강릉'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강릉 골드', '휴게텔', '강릉', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 비비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 비비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 비비', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 유튜브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 유튜브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유튜브';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 유튜브', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 속초 벤틀리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '속초 벤틀리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벤틀리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '속초'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('속초 벤틀리', '휴게텔', '속초', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 윤서1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 윤서1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '윤서1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 윤서1인샵', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 비타민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비타민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 비타민', '휴게텔', '고양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제천 돌아온틱톡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제천 돌아온틱톡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '돌아온틱톡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제천 돌아온틱톡', '휴게텔', '제천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 썸', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 쉬멜맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 쉬멜맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쉬멜맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 쉬멜맛집', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포승 박카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포승 박카스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박카스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포승'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포승 박카스', '휴게텔', '포승', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 올누드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 올누드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올누드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 올누드', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 레전드', '휴게텔', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제천 vip
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제천 vip';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'vip';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제천 vip', '휴게텔', '제천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 나이키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 나이키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나이키';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 나이키', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수지 레드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수지 레드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수지'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수지 레드', '휴게텔', '수지', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 프리미엄오피쓰
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 프리미엄오피쓰';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리미엄오피쓰';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '인천 부평구 부평동 부평역인근' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 프리미엄오피쓰', '인천 부평구 부평동 부평역인근', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 오피스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 오피스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오피스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 오피스', '휴게텔', '성남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 꿀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 꿀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 꿀', '휴게텔', '분당', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 킹타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 킹타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 킹타이', '휴게텔', '원주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 무지개
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 무지개';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '무지개';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경기광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경기광주 무지개', '휴게텔', '경기광주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 스카이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 스카이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스카이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 스카이', '휴게텔', '고양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 산소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 산소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '산소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 산소', '휴게텔', '광주', '02:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 맛집', '휴게텔', '청라', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 핫플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 핫플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송탄'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '송탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송탄 핫플', '송탄', '송탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 샤인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 샤인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '김포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 샤인', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논산 하리보 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논산 하리보 휴게텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하리보 휴게텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '논산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '논산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('논산 하리보 휴게텔', '논산', '논산', '13:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 다오스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 다오스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다오스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 다오스파', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 과일가게
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 과일가게';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '과일가게';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '병점' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('병점 과일가게', '병점', '병점', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 여자친구', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 타임', '휴게텔', '파주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 부비부비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 부비부비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부비부비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '05:00'::TIME,
      close_time = '04:30'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 부비부비', '휴게텔', '전주', '05:00'::TIME, '04:30'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 아이스크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 아이스크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이스크림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 아이스크림', '휴게텔', '수유', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 다산 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 다산 휴게텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다산 휴게텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '남양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 다산 휴게텔', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 주안 무지개
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 주안 무지개';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주안 무지개';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 주안 무지개', '인천', '인천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 미추홀구 옐로하우스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '미추홀구 옐로하우스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '옐로하우스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '미추홀구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '미추홀구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('미추홀구 옐로하우스', '미추홀구', '미추홀구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 마이쮸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 마이쮸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마이쮸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '금천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 마이쮸', '금천', '금천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 초희
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 초희';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초희';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '파주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 초희', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍성 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍성 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍성'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '홍성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍성 도파민', '홍성', '홍성', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 소라1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 소라1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소라1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '마포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 소라1인샵', '마포', '마포', '13:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 꽃집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 꽃집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '잠실' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 꽃집', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 VIP인플루언서스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 VIP인플루언서스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP인플루언서스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 VIP인플루언서스웨디시', '건마', '제주도', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 본능
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 본능';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '본능';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 본능', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 TOP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 TOP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 TOP', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 베이글1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 베이글1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이글1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 베이글1인샵', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 럭셔리 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 럭셔리 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭셔리 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 럭셔리 스웨디시', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 우유범벅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 우유범벅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우유범벅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 우유범벅', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 純白乙女
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 純白乙女';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '純白乙女';
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
    VALUES ('강남 純白乙女', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 아이린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 아이린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이린';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 아이린', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 VVIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 VVIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 VVIP', '건마', '전주', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산TOP큐티스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산TOP큐티스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산TOP큐티스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 일산TOP큐티스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 라이프
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 라이프';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라이프';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 라이프', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 하리보1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 하리보1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하리보1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 하리보1인샵', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 신전스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 신전스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신전스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 신전스웨디시', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 힐아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 힐아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐아로마';
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
    VALUES ('구미 힐아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 츄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 츄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '츄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 츄', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 인생타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 인생타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인생타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 인생타이', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 물총
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 물총';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물총';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 물총', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 백차우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 백차우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백차우';
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
    VALUES ('구미 백차우', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 비누
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 비누';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비누';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 비누', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 vvip데일리스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 vvip데일리스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'vvip데일리스웨디시';
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
    VALUES ('강남 vvip데일리스웨디시', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 향기1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 향기1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '향기1인샵';
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
    VALUES ('구미 향기1인샵', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 ■코코■
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 ■코코■';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '■코코■';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 ■코코■', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 S스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 S스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 S스웨디시', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 야놀자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 야놀자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야놀자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 야놀자', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 BLACK
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 BLACK';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BLACK';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 BLACK', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 화이트', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 윙크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 윙크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '윙크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 윙크', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 하루1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 하루1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하루1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 하루1인샵', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 캣츠1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 캣츠1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캣츠1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 캣츠1인샵', '건마', '청라', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 더힐스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 더힐스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더힐스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 더힐스파', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 미라클스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 미라클스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미라클스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 미라클스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 디올스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 디올스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 디올스웨디시', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 심쿵스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 심쿵스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심쿵스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 심쿵스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 낙원1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 낙원1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '낙원1인샵';
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
    VALUES ('구미 낙원1인샵', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 단비1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 단비1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '단비1인샵';
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
    VALUES ('구미 단비1인샵', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 꽃잎1인샾
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 꽃잎1인샾';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃잎1인샾';
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
    VALUES ('구미 꽃잎1인샾', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 럼블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 럼블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럼블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 럼블', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 세차장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 세차장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세차장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 세차장', '건마', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 초이스 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 초이스 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이스 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 초이스 스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 언니네1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 언니네1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '언니네1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 언니네1인샵', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 황제
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 황제';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황제';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
      , contact_name = COALESCE(contact_name, '황제')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 황제', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마', '황제')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 비밀수업1인샵 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 비밀수업1인샵 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비밀수업1인샵 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 비밀수업1인샵 스웨디시', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남신드룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남신드룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남신드룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 강남신드룸', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 다이아스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 다이아스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 다이아스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 오로라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 오로라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오로라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 오로라', '건마', '제주도', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 여름이야기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 여름이야기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여름이야기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 여름이야기', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 돌핀 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 돌핀 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '돌핀 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 돌핀 1인샵', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 궁', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 황제태국테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 황제태국테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황제태국테라피';
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
    VALUES ('구미 황제태국테라피', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 썸아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 썸아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 썸아로마', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 두부 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 두부 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '두부 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 두부 1인샵', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 올리브건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 올리브건마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올리브건마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 올리브건마', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 1인샵 존예
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 1인샵 존예';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인샵 존예';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '경기남부 동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 1인샵 존예', '경기남부 동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 자일리톨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 자일리톨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자일리톨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 자일리톨', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 s스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 s스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 's스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 s스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 달달아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 달달아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달달아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 달달아로마', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 셀럽스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 셀럽스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셀럽스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 셀럽스웨디시', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 심쿵스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 심쿵스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심쿵스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 심쿵스웨디시', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 수정아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 수정아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수정아로마';
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
    VALUES ('구미 수정아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 s라인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 s라인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 's라인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 s라인', '건마', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 앵두스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 앵두스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '앵두스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 앵두스웨디시', '건마', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 락테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 락테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '락테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 락테라피', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 소울스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 소울스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소울스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여의도 소울스웨디시', '건마', '여의도', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 럭스1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 럭스1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭스1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 럭스1인샵', '건마', '구미', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 신세계마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 신세계마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신세계마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 신세계마사지', '건마', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 킹덤스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 킹덤스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹덤스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 킹덤스파', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 메이드스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 메이드스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 메이드스웨디시', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 그레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 그레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '그레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 그레이스', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 샤넬', '건마', '천안', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 아이유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 아이유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 아이유', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 비타민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비타민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 비타민', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 홀리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 홀리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 홀리', '건마', '영등포', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 캣츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 캣츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캣츠';
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
    VALUES ('구미 캣츠', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 봄아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 봄아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봄아로마';
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
    VALUES ('구미 봄아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 20대 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 20대 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 20대 1인샵', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 뱅뱅스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 뱅뱅스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뱅뱅스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 뱅뱅스웨디시', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 시크릿', '건마', '일산', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 윈터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 윈터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '윈터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 윈터', '건마', '강서', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 아로하스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 아로하스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아로하스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 아로하스웨디시', '건마', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 삼다수1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 삼다수1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼다수1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 삼다수1인샵', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 하드스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 하드스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 하드스웨디시', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 공주아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 공주아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '공주아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 공주아로마', '건마', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 설렘스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 설렘스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설렘스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 설렘스웨디시', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 논현5월스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 논현5월스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '논현5월스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 논현5월스파', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 하울스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 하울스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하울스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 하울스웨디시', '건마', '영등포', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 에이스스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 에이스스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여의도 에이스스웨디시', '건마', '여의도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 올인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 올인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 올인', '건마', '대구', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 마보이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 마보이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마보이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 마보이', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 핫바디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 핫바디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫바디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 핫바디', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 나비아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 나비아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나비아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 나비아로마', '건마', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 어썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 어썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '00:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 어썸', '천안', '천안', '00:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 가산뒤지는스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 가산뒤지는스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가산뒤지는스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 가산뒤지는스웨디시', '건마', '신림', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 섹녀1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 섹녀1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹녀1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 섹녀1인샵', '건마', '안양', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중랑 중랑1인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중랑 중랑1인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '중랑1인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '중랑'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('중랑 중랑1인', '건마', '중랑', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 여기어때
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 여기어때';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여기어때';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 여기어때', '건마', '구미', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 요정테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 요정테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요정테라피';
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
    VALUES ('구미 요정테라피', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 버블아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 버블아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블아로마';
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
    VALUES ('구미 버블아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 더블랙
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 더블랙';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더블랙';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 더블랙', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 BJ 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 BJ 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BJ 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '김포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 BJ 스웨디시', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 럭셔리스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 럭셔리스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭셔리스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 럭셔리스파', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 2프로 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 2프로 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '2프로 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 2프로 1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원 랜드마크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원 랜드마크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원 랜드마크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 수원 랜드마크', '건마', '수원', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 무드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 무드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '무드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 무드', '건마', '서구', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 ABC스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 ABC스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ABC스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 ABC스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 밀크스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 밀크스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 밀크스웨디시', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 B2B스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 B2B스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'B2B스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 B2B스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 엣지 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 엣지 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엣지 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '잠실' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 엣지 1인샵', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 하이난아로마 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 하이난아로마 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이난아로마 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 하이난아로마 스웨디시', '건마', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 36.5
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 36.5';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '36.5';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 36.5', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 다산동 브라더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '다산동 브라더';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '브라더';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '다산동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('다산동 브라더', '건마', '다산동', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 황금스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 황금스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황금스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 황금스파', '건마', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 브라더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 브라더';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '브라더';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 브라더', '건마', '남양주', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 행신붕어빵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 행신붕어빵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '행신붕어빵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 행신붕어빵', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 꿀떡스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 꿀떡스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀떡스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '부평' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 꿀떡스웨디시', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 멜로우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 멜로우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멜로우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 멜로우', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 슈가맨스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 슈가맨스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈가맨스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 슈가맨스파', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 블라썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 블라썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블라썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 블라썸', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 미스사이공
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미스사이공';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미스사이공';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 미스사이공', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 티오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 티오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 티오피', '건마', '광진', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 공주왕자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 공주왕자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '공주왕자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 공주왕자', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 뱅뱅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 뱅뱅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뱅뱅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 뱅뱅', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 극락 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 극락 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극락 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 극락 1인샵', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 메이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 메이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('사당 메이드', '건마', '사당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 포인트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 포인트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포인트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 포인트', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 여자친구', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 걸스 데이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 걸스 데이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '걸스 데이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 걸스 데이', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 다이아몬드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 다이아몬드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아몬드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 다이아몬드', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 애플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 애플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 애플', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 제국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 제국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 제국', '건마', '고양', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 스타 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 스타 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 스타 스웨디시', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 가산라벤더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 가산라벤더';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가산라벤더';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '금천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 가산라벤더', '금천', '금천', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 올인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 올인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 올인', '건마', '제주도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 물총
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 물총';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물총';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 물총', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 홍다혜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 홍다혜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍다혜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 홍다혜', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 로즈스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 로즈스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로즈스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 로즈스웨디시', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 바디타는아라1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 바디타는아라1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바디타는아라1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '강동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 바디타는아라1인샵', '강동', '강동', '14:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
      , contact_name = COALESCE(contact_name, '도파민')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 도파민', '평택', '평택', '11:00'::TIME, '04:00'::TIME, '건마', '도파민')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '강동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 크림', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 엄지척
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 엄지척';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엄지척';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 엄지척', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 킹스파74
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 킹스파74';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹스파74';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 킹스파74', '건마', '천안', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 에스포톤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 에스포톤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에스포톤';
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
    VALUES ('구미 에스포톤', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 별아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 별아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별아로마';
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
    VALUES ('구미 별아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 명품 섹슈얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 명품 섹슈얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품 섹슈얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 명품 섹슈얼', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 고덕1등 크림스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 고덕1등 크림스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고덕1등 크림스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 고덕1등 크림스웨디시', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 H스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 H스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'H스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 H스웨디시', '건마', '부천', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 킹덤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 킹덤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹덤스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 킹덤스웨디시', '건마', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 멜로우 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 멜로우 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멜로우 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 멜로우 스웨디시', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 오션아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 오션아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오션아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 오션아로마', '건마', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 워터밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '워터밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 워터밤', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 범벅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 범벅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '범벅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 범벅', '건마', '구미', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 라이브 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 라이브 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라이브 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 라이브 스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 플러팅스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 플러팅스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 플러팅스웨디시', '건마', '강남', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 미미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 미미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 미미', '건마', '영등포', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 스타벅스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 스타벅스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타벅스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 스타벅스', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 불당솜스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 불당솜스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '불당솜스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 불당솜스파', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 하이난
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 하이난';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이난';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '인천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 하이난', '인천', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 BUGATTI _SWEDISH
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 BUGATTI _SWEDISH';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BUGATTI _SWEDISH';
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
    VALUES ('강남 BUGATTI _SWEDISH', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 진짜로 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 진짜로 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진짜로 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 진짜로 스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 신세계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 신세계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신세계';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 신세계', '건마', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 구로쉬멜스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 구로쉬멜스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구로쉬멜스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '구로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 구로쉬멜스웨디시', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 시크릿스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 시크릿스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 시크릿스파', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 반하나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 반하나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '반하나1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 반하나1인샵', '건마', '제주도', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 구로백마센슈얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 구로백마센슈얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구로백마센슈얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 구로백마센슈얼', '건마', '구로', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 송파러시아스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 송파러시아스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송파러시아스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 송파러시아스웨디시', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 20대다산역연희1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 20대다산역연희1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대다산역연희1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '남양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 20대다산역연희1인샵', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 롤리팝
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 롤리팝';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '롤리팝';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 롤리팝', '휴게텔', '하남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 쌍문역 솔미1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 쌍문역 솔미1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쌍문역 솔미1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 쌍문역 솔미1인샵', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 처음처럼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 처음처럼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '처음처럼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 처음처럼', '건마', '평택', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 열매
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 열매';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '열매';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 열매', '휴게텔', '천안', '12:00'::TIME, '03:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 폭스타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 폭스타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '폭스타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 폭스타이', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 더킹스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 더킹스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더킹스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '광명' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 더킹스웨디시', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 시그니엘 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 시그니엘 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그니엘 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 시그니엘 스웨디시', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 약국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 약국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '약국';
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
    VALUES ('구미 약국', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 중독스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 중독스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '중독스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 중독스파', '천안', '천안', '14:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;