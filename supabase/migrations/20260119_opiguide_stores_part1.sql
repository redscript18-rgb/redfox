-- 오피가이드 데이터 마이그레이션 Part 1/7

-- 오피가이드 데이터 마이그레이션
-- 기존 가게는 정보 업데이트, 새 가게는 추가

-- 제주도 아이콘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 아이콘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이콘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 아이콘', '오피', '제주도', '10:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 꽃집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 꽃집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃집';
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
    VALUES ('구미 꽃집', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 체리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '대구 동구 동대구역' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 체리', '대구 동구 동대구역', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 하리보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 하리보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하리보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 하리보', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 오예스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 오예스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오예스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 오예스', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 개츠비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 개츠비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '개츠비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 개츠비', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 인연
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 인연';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인연';
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
    VALUES ('구미 인연', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 딸기', '오피', '부천', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '의정부' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 화이트', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 드라마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 드라마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드라마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 드라마', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 뉴페이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 뉴페이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뉴페이스';
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
    VALUES ('구미 뉴페이스', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 스타일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 스타일';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타일';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 스타일', '오피', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타임';
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
    VALUES ('구미 타임', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 솜사탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 솜사탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 솜사탕', '오피', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 세컨드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 세컨드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세컨드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 세컨드', '오피', '부천', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 달고나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 달고나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달고나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 달고나', '오피', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 큐피트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 큐피트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '큐피트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 큐피트', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 투아유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 투아유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투아유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 투아유', '오피', '제주도', '11:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 구미레깅스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 구미레깅스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구미레깅스';
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
    VALUES ('구미 구미레깅스', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 시그널
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 시그널';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그널';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 시그널', '오피', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 블루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 블루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 블루', '오피', '창동', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 찰떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 찰떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찰떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 찰떡', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 도쿄히메
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 도쿄히메';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄히메';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '분당' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 도쿄히메', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 티파니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 티파니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티파니';
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
    VALUES ('구미 티파니', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 청주여대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 청주여대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청주여대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 청주여대', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 SM플레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 SM플레이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'SM플레이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 SM플레이', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 김비서
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 김비서';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김비서';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 김비서', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 누피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 누피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '누피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 누피', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 돌핀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 돌핀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '돌핀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 돌핀', '오피', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 무지개
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 무지개';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '무지개';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 무지개', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 곰돌이네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 곰돌이네';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '곰돌이네';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 곰돌이네', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 럭키비키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 럭키비키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭키비키';
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
    VALUES ('구미 럭키비키', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 미슐랭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 미슐랭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미슐랭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 미슐랭', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 강남도파민', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 임팩트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 임팩트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '임팩트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '09:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 임팩트', '오피', '강남', '09:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 레드불
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 레드불';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드불';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 레드불', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 엣지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 엣지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엣지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '고양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 엣지', '고양', '고양', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 올리브오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 올리브오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올리브오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 올리브오피', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 여자친구', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 라운지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 라운지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라운지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 라운지', '오피', '제주도', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 냠냠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 냠냠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '냠냠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 냠냠', '오피', '파주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 오빠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 오빠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오빠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 오빠', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 방앗간
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 방앗간';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방앗간';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 방앗간', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 빽보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 빽보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빽보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 빽보', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 플러팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 플러팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 플러팅', '오피', '제주도', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 사쿠란보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 사쿠란보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠란보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 사쿠란보', '오피', '영등포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 사쿠란보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 사쿠란보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠란보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 사쿠란보', '오피', '부평', '19:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 탕후루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 탕후루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탕후루';
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
    VALUES ('구미 탕후루', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 고유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 고유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 고유', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도쿄긴자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도쿄긴자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄긴자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 도쿄긴자', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 여기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 여기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 여기', '오피', '전주', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 존슨빌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 존슨빌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '존슨빌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 존슨빌', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 국제시장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 국제시장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '국제시장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 국제시장', '오피', '제주도', '02:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 viet892
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 viet892';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'viet892';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 viet892', '오피', '제주도', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 SHEMALE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 SHEMALE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'SHEMALE';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 SHEMALE', '오피', '제주도', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 솜사탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 솜사탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 솜사탕', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 BLUE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 BLUE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BLUE';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 BLUE', '오피', '제주도', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 Dior
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 Dior';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Dior';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 Dior', '오피', '제주도', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 only,fans
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 only,fans';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'only,fans';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 only,fans', '오피', '제주도', '01:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 제주해독과학연구소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 제주해독과학연구소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제주해독과학연구소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 제주해독과학연구소', '오피', '제주도', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 버블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 버블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 버블', '전주', '전주', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 타이항공
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 타이항공';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타이항공';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 타이항공', '오피', '제주도', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 섹툰
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 섹툰';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹툰';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 섹툰', '오피', '구로', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 신사이바시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 신사이바시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신사이바시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 신사이바시', '오피', '은평', '12:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 오Yes 오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 오Yes 오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오Yes 오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 오Yes 오피', '오피', '마포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 별다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 별다방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별다방';
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
    VALUES ('구미 별다방', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 큐피트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 큐피트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '큐피트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 큐피트', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 다우니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 다우니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다우니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 다우니', '오피', '성북', '13:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 미인계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 미인계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인계';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 미인계', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 터치미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 터치미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '터치미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 터치미', '오피', '강서', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 블링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 블링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블링';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 블링', '오피', '강서', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 플레이시즌2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 플레이시즌2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플레이시즌2';
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
    VALUES ('구미 플레이시즌2', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 밤꽃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 밤꽃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밤꽃';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 밤꽃', '오피', '전주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 고고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 고고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 고고', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 CALL
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 CALL';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'CALL';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 CALL', '오피', '동대문', '19:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 일본오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 일본오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 일본오피', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 일본', '오피', '송파', '20:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 러블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리';
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
    VALUES ('구미 러블리', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 일본S급섹스오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 일본S급섹스오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본S급섹스오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 일본S급섹스오피', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 청담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 청담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청담';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 청담', '오피', '제주도', '13:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 가이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 가이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가이드';
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
    VALUES ('신림 가이드', '출장', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 넘버원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 넘버원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '넘버원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 넘버원', '오피', '울산', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도쿄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도쿄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 도쿄', '오피', '강남', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 만월
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 만월';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만월';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 만월', '오피', '영등포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 데이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 데이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데이트';
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
    VALUES ('구로 데이트', '출장', '구로', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 카카오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 카카오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카카오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 카카오', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 대구오뚜기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 대구오뚜기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대구오뚜기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 대구오뚜기', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 스토리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 스토리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스토리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 스토리', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 백마방앗간
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 백마방앗간';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마방앗간';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 백마방앗간', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 ▓▒░NEW░▒██▓▒░한입만OP░▒▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 ▓▒░NEW░▒██▓▒░한입만OP░▒▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓▒░NEW░▒██▓▒░한입만OP░▒▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '강서' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 ▓▒░NEW░▒██▓▒░한입만OP░▒▓██', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 도쿄여대생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 도쿄여대생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄여대생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '송파' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 도쿄여대생', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 도쿄도쿄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 도쿄도쿄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄도쿄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 도쿄도쿄', '오피', '수원', '15:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 일본야끼니꾸오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 일본야끼니꾸오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본야끼니꾸오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '08:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 일본야끼니꾸오피', '오피', '송파', '08:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 황홀일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 황홀일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황홀일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 황홀일본', '오피', '영등포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 판다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 판다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 판다', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 ▶강동오피♀️하나비♀️일본혼혈◀╋▓
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 ▶강동오피♀️하나비♀️일본혼혈◀╋▓';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▶강동오피♀️하나비♀️일본혼혈◀╋▓';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 ▶강동오피♀️하나비♀️일본혼혈◀╋▓', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '은평구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 일프로', '은평구', '은평', '07:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 앤조이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 앤조이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '앤조이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 앤조이', '오피', '수원', '07:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 ⭐버블⭐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 ⭐버블⭐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭐버블⭐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '제주도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 ⭐버블⭐', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남11만백마홀릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남11만백마홀릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남11만백마홀릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 강남11만백마홀릭', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 기생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 기생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 기생', '오피', '수유', '14:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 신촌No.1 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 신촌No.1 힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신촌No.1 힐링';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '신촌' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신촌 신촌No.1 힐링', '신촌', '신촌', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 메이드인재팬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 메이드인재팬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드인재팬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 메이드인재팬', '오피', '용인', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 가산No.1 메이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 가산No.1 메이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가산No.1 메이드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '가산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('가산 가산No.1 메이드', '가산', '가산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 메이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 메이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 메이드', '오피', '안산', '14:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 안양No.1 인스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 안양No.1 인스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안양No.1 인스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 안양No.1 인스타', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 ⭐❣️소개팅❣️⭐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 ⭐❣️소개팅❣️⭐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭐❣️소개팅❣️⭐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '구미' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 ⭐❣️소개팅❣️⭐', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 주파수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 주파수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주파수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 주파수', '오피', '강남', '19:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 ❤️쿠시나❤️일본오피❤️전원20대❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 ❤️쿠시나❤️일본오피❤️전원20대❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️쿠시나❤️일본오피❤️전원20대❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '상봉' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 ❤️쿠시나❤️일본오피❤️전원20대❤️', '상봉', '상봉', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 후쿠오카일본오피20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 후쿠오카일본오피20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후쿠오카일본오피20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '용산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용산 후쿠오카일본오피20대', '용산', '용산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 ✡️강나미✡️20대✡️일본오피✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 ✡️강나미✡️20대✡️일본오피✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️강나미✡️20대✡️일본오피✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '종로' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 ✡️강나미✡️20대✡️일본오피✡️', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 ❤️곤니찌❤️전원20대❤️일본오피❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 ❤️곤니찌❤️전원20대❤️일본오피❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️곤니찌❤️전원20대❤️일본오피❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '노원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 ❤️곤니찌❤️전원20대❤️일본오피❤️', '노원', '노원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 T팬티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 T팬티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'T팬티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 T팬티', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 일본69도쿄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 일본69도쿄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본69도쿄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 일본69도쿄', '오피', '구리', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 나카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 나카스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나카스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 나카스', '오피', '의정부', '15:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 용산 이찌방오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 용산 이찌방오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '용산 이찌방오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '용산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용산 용산 이찌방오피', '용산', '용산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 설레임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 설레임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설레임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 설레임', '오피', '동대문', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 메이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 메이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 메이드', '오피', '분당', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 일품
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 일품';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일품';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 일품', '오피', '강서', '11:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 오나라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 오나라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오나라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 오나라', '오피', '강서', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 일기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 일기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 일기', '오피', '강동', '20:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 부산역아고고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 부산역아고고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부산역아고고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 부산역아고고', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 오사카 기생일기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 오사카 기생일기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오사카 기생일기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 오사카 기생일기', '오피', '안산', '20:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 맛도리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 맛도리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛도리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 맛도리', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 페로페로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 페로페로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '페로페로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 페로페로', '오피', '하남', '19:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 뿜뿜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 뿜뿜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뿜뿜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 뿜뿜', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 ✡️한국정력공사✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 ✡️한국정력공사✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️한국정력공사✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍대 ✡️한국정력공사✡️', '오피', '홍대', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 11만 백마스쿨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 11만 백마스쿨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '11만 백마스쿨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 11만 백마스쿨', '오피', '강남', '24:00'::TIME, '24:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 구미호
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 구미호';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구미호';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 구미호', '오피', '광주', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군포 죽여주는
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군포 죽여주는';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '죽여주는';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:30'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '군포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군포 죽여주는', '오피', '군포', '19:30'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 맥도날드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 맥도날드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥도날드';
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
    VALUES ('구미 맥도날드', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 쥬얼리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 쥬얼리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쥬얼리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '김포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 쥬얼리', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 미인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 미인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 미인', '오피', '부천', '19:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 글래머
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 글래머';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '글래머';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 글래머', '오피', '광진', '19:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 슬랜더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 슬랜더';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슬랜더';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 슬랜더', '오피', '서구', '19:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 C.F
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 C.F';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'C.F';
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
    VALUES ('구미 C.F', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 러샤핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 러샤핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러샤핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 러샤핑크', '오피', '전주', '03:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김해 처음처럼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김해 처음처럼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '처음처럼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김해'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김해 처음처럼', '오피', '김해', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP미스유니버스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP미스유니버스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP미스유니버스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP미스유니버스', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP로엠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP로엠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP로엠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP로엠', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP페스티벌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP페스티벌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP페스티벌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP페스티벌', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 오사카
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 오사카';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오사카';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 오사카', '오피', '하남', '13:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP엔트라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP엔트라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP엔트라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP엔트라', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP딜라이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP딜라이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP딜라이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP딜라이트', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 라인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 라인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 라인', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP조선
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP조선';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP조선';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP조선', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 블루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 블루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루';
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
    VALUES ('구미 블루', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 vvip클로버
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 vvip클로버';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'vvip클로버';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 vvip클로버', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP블랙
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP블랙';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP블랙';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP블랙', '강남', '강남', '24:00'::TIME, '24:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 우아한그녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 우아한그녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우아한그녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 우아한그녀', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 피치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 피치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '피치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '구미' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 피치', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 파타야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 파타야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파타야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 파타야', '오피', '익산', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 오나쿠라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 오나쿠라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오나쿠라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 오나쿠라', '오피', '성남', '17:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 디저트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 디저트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 디저트', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 정마담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 정마담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정마담';
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
    VALUES ('구미 정마담', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 엔터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 엔터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 엔터', '오피', '대구', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 버섯
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 버섯';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버섯';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 버섯', '오피', '부산', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 컬렉션
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 컬렉션';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '컬렉션';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 컬렉션', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 일식당
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 일식당';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일식당';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 일식당', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 나고미오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 나고미오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나고미오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 나고미오피', '오피', '영등포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP캐슬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP캐슬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP캐슬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP캐슬', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 vvip비너스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 vvip비너스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'vvip비너스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 vvip비너스', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP펜트하우스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP펜트하우스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP펜트하우스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP펜트하우스', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 맛도리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 맛도리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛도리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 맛도리', '오피', '익산', '03:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 비서실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 비서실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비서실';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 비서실', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP클라우드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP클라우드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP클라우드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP클라우드', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 네코네코
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 네코네코';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '네코네코';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 네코네코', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 거래소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 거래소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '거래소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '부평' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 거래소', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 새콤달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 새콤달콤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '새콤달콤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 새콤달콤', '오피', '익산', '02:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 슈크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 슈크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈크림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 슈크림', '오피', '군산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 플라워';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플라워';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 플라워', '오피', '안산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 사쿠라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 사쿠라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 사쿠라', '오피', '시흥', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 심쿵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 심쿵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심쿵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 심쿵', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 맛집', '오피', '동대문', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 이쁜이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 이쁜이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이쁜이';
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
    VALUES ('일산 이쁜이', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 러블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 러블리', '오피', '영등포', '12:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 하녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 하녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 하녀', '오피', '전주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 여사친
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 여사친';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여사친';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 여사친', '오피', '전주', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 드림월드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 드림월드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드림월드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 드림월드', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 러시아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 러시아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 러시아', '오피', '전주', '03:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 오이시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 오이시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오이시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 오이시', '오피', '부평', '06:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 오이시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 오이시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오이시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 오이시', '오피', '부천', '06:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 즐겨찾기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 즐겨찾기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '즐겨찾기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '09:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 즐겨찾기', '오피', '구미', '09:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 탕후루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 탕후루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탕후루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 탕후루', '오피', '제주도', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 ZARA
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 ZARA';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ZARA';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 ZARA', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 헐리우드백마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 헐리우드백마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헐리우드백마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 헐리우드백마', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 DIOR
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 DIOR';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'DIOR';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '08:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 DIOR', '오피', '강남', '08:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 일본
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 일본';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 일본', '오피', '잠실', '06:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 베이글
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 베이글';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이글';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 베이글', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 로맨틱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 로맨틱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로맨틱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 로맨틱', '오피', '수원', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 신데렐라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 신데렐라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신데렐라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 신데렐라', '오피', '광명', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 퀸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 퀸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 퀸', '오피', '수원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '여수' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 도파민', '여수', '여수', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 플러스82
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 플러스82';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러스82';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 플러스82', '오피', '구로', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 뽀뽀뽀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 뽀뽀뽀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뽀뽀뽀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 뽀뽀뽀', '오피', '강서', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 롤스로이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 롤스로이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '롤스로이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 롤스로이스', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 에이원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 에이원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 에이원', '오피', '군산', '11:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 밍키넷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 밍키넷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밍키넷';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 밍키넷', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원 마네킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원 마네킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원 마네킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 수원 마네킹', '오피', '수원', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 퀄리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 퀄리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀄리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 퀄리티', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP Supreme
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP Supreme';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP Supreme';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP Supreme', '오피', '강남', '24:00'::TIME, '24:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링';
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
    VALUES ('구미 힐링', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 초콜렛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 초콜렛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초콜렛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 초콜렛', '오피', '대전', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 쁨쁨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 쁨쁨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쁨쁨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '부평' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 쁨쁨', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 일본 스시집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 일본 스시집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 스시집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('사당 일본 스시집', '오피', '사당', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 아쿠아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 아쿠아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아쿠아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 아쿠아', '부산', '부산', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 엔트리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 엔트리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔트리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 엔트리', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하숙집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하숙집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하숙집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '08:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 하숙집', '오피', '강남', '08:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 미스코리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 미스코리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미스코리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 미스코리아', '오피', '전주', '03:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 신주쿠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 신주쿠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신주쿠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 신주쿠', '오피', '강남', '12:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 디저트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 디저트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트';
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
    VALUES ('구미 디저트', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 슈퍼맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 슈퍼맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈퍼맨';
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
    VALUES ('구미 슈퍼맨', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 별다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 별다방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별다방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '강동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 별다방', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 GALAXY
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 GALAXY';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'GALAXY';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 GALAXY', '오피', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 cozy 코지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 cozy 코지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'cozy 코지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 cozy 코지', '오피', '의정부', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 일본맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 일본맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본맛집';
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
    VALUES ('부평 일본맛집', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 VIP임팩트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 VIP임팩트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP임팩트';
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
    VALUES ('제주도 VIP임팩트', '오피', '제주도', '06:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 스토리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 스토리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스토리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 스토리', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 디즈니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 디즈니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디즈니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 디즈니', '오피', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 푸르르
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 푸르르';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '푸르르';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 푸르르', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 팰리스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 팰리스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팰리스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 팰리스', '오피', '강남', '11:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 인스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 인스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '09:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 인스타', '오피', '강남', '09:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 젤리핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 젤리핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '젤리핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 젤리핑크', '오피', '익산', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 일본 야시꾸리 오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 일본 야시꾸리 오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본 야시꾸리 오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '성남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 일본 야시꾸리 오피', '성남', '성남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 SM
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 SM';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'SM';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '천안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 SM', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 쿵떡쿵떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 쿵떡쿵떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쿵떡쿵떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '창원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 쿵떡쿵떡', '창원', '창원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 핑두오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 핑두오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑두오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 핑두오피', '오피', '고양', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 여비서오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 여비서오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여비서오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '제주도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 여비서오피', '제주도', '제주도', '13:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 딥터치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 딥터치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딥터치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '의정부' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 딥터치', '의정부', '의정부', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안성 베이글
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안성 베이글';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이글';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안성'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '안성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안성 베이글', '안성', '안성', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 달콤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달콤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '청주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 달콤', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 나카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 나카스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나카스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 나카스', '오피', '강남', '11:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 파티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 파티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 파티', '오피', '강남', '06:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서초 강남역워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서초 강남역워터밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남역워터밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서초'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서초 강남역워터밤', '오피', '서초', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 복숭아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 복숭아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '복숭아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '목포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 복숭아', '목포', '목포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 단골집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 단골집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '단골집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 단골집', '오피', '수유', '12:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 야미야미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 야미야미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야미야미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 야미야미', '오피', '일산', '18:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 슈퍼맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 슈퍼맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈퍼맨';
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
    VALUES ('제주도 슈퍼맨', '건마', '제주도', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전떡딸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전떡딸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전떡딸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 대전떡딸', '오피', '대전', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 슈퍼맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 슈퍼맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈퍼맨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 슈퍼맨', '건마', '대구', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 야미야미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 야미야미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야미야미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 야미야미', '오피', '수원', '11:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 물통
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 물통';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물통';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 물통', '오피', '대구', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 프리미엄니혼진 돈키호테OP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 프리미엄니혼진 돈키호테OP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리미엄니혼진 돈키호테OP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '남양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 프리미엄니혼진 돈키호테OP', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 69
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 69';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '69';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '제주도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 69', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 설레임 오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임 오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설레임 오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 설레임 오피', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 몽족
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 몽족';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '몽족';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 몽족', '오피', '대구', '14:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 순천 슬기로운오피생활
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '순천 슬기로운오피생활';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슬기로운오피생활';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '순천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('순천 슬기로운오피생활', '오피', '순천', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 디올
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 디올';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 디올', '오피', '경주', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 하리보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 하리보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하리보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 하리보', '오피', '하남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 TOP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 TOP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOP';
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
    VALUES ('구미 TOP', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 엔디비아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 엔디비아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔디비아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 엔디비아', '오피', '창원', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진주 바비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진주 바비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '진주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진주 바비', '휴게텔', '진주', '01:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 청주파트너
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 청주파트너';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청주파트너';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 청주파트너', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 아이돌학교
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 아이돌학교';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌학교';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 아이돌학교', '오피', '부천', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 시크릿', '오피', '포항', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 순천 섹시한여자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '순천 섹시한여자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹시한여자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '순천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('순천 섹시한여자', '오피', '순천', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 퍼스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 퍼스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼스트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 퍼스트', '오피', '당진', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 전주트월킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 전주트월킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전주트월킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 전주트월킹', '오피', '전주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 인트로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 인트로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인트로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 인트로', '오피', '일산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 선릉 프리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 선릉 프리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선릉 프리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 선릉 프리티', '오피', '선릉', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 기생명기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 기생명기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기생명기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 기생명기', '오피', '의정부', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 오렌지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 오렌지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오렌지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 오렌지', '오피', '포항', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진주 진주성(性)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진주 진주성(性)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진주성(性)';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진주 진주성(性)', '오피', '진주', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 청춘충전소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 청춘충전소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청춘충전소';
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
    VALUES ('제주도 청춘충전소', '건마', '제주도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 데이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 데이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 데이트', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광양 HAN
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광양 HAN';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'HAN';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '광양'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광양 HAN', '오피', '광양', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 일프로', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 테슬라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 테슬라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '테슬라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 테슬라', '오피', '여수', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 차이나쉬멜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 차이나쉬멜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '차이나쉬멜';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 차이나쉬멜', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 엠넷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 엠넷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엠넷';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 엠넷', '오피', '여수', '12:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 베이글
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 베이글';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이글';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 베이글', '오피', '여수', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 초이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 초이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 초이스', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIPSPONSER
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIPSPONSER';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIPSPONSER';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIPSPONSER', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 호캉스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 호캉스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '호캉스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 호캉스', '휴게텔', '김포', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 스위트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 스위트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스위트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 스위트', '오피', '포항', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 토끼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 토끼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '토끼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 토끼', '오피', '일산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 삼육구삼육구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 삼육구삼육구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼육구삼육구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 삼육구삼육구', '오피', '의정부', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 나혼자간다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 나혼자간다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나혼자간다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 나혼자간다', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 순천 이랏샤이마세
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '순천 이랏샤이마세';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이랏샤이마세';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '순천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('순천 이랏샤이마세', '오피', '순천', '12:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 스타일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 스타일';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타일';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 스타일', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 아로이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 아로이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아로이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 아로이', '오피', '포항', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 포르쉐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 포르쉐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포르쉐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '경기남부 분당구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 포르쉐', '경기남부 분당구', '분당', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 시에스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 시에스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시에스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 시에스타', '오피', '분당', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP하트시그널
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP하트시그널';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP하트시그널';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP하트시그널', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 쓰담쓰담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 쓰담쓰담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쓰담쓰담';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 쓰담쓰담', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP아우라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP아우라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP아우라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP아우라', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 사춘기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 사춘기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사춘기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 사춘기', '오피', '수원', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 스타벅스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 스타벅스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타벅스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 스타벅스', '오피', '전주', '07:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 캐스팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 캐스팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캐스팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 캐스팅', '오피', '포항', '03:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 로즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 로즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 로즈', '오피', '군산', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 초이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 초이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 초이스', '오피', '군산', '03:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 키티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 키티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '키티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 키티', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 참교육
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 참교육';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '참교육';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 참교육', '오피', '목포', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 천상계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 천상계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천상계';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 천상계', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 부평발리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 부평발리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부평발리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 부평발리', '오피', '부평', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 한국관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 한국관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 한국관', '오피', '평택', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 썸', '오피', '익산', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 시크릿', '오피', '의정부', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 기생집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 기생집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기생집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 기생집', '오피', '전주', '01:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 자두
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 자두';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자두';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 자두', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 하트', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 KTX
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 KTX';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'KTX';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 KTX', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야놀자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야놀자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야놀자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 야놀자', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 랜드마크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 랜드마크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '랜드마크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 랜드마크', '오피', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 스타', '오피', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 헤븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 헤븐', '오피', '목포', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 오로나민 c
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 오로나민 c';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오로나민 c';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '04:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 오로나민 c', '오피', '군산', '04:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 도쿄 플레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 도쿄 플레이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄 플레이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 도쿄 플레이', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 사쿠라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 사쿠라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 사쿠라', '오피', '강남', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 보령 369
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '보령 369';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '369';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '보령'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '보령' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('보령 369', '보령', '보령', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 밈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 밈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밈';
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
    VALUES ('구미 밈', '오피', '구미', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍성 폭스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍성 폭스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '폭스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍성'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '충청남도 홍성군 홍성읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍성 폭스', '충청남도 홍성군 홍성읍', '홍성', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 어피치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 어피치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어피치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '울산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 어피치', '울산', '울산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 요기요
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 요기요';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요기요';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 요기요', '오피', '익산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 군산트월킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 군산트월킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '군산트월킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 군산트월킹', '오피', '군산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 순천 소개팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '순천 소개팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소개팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '순천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('순천 소개팅', '오피', '순천', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 맛집', '오피', '군산', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 헐리우드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 헐리우드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헐리우드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 헐리우드', '오피', '여수', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 구멍공장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 구멍공장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구멍공장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '창원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 구멍공장', '창원', '창원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 모찌모찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 모찌모찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모찌모찌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 모찌모찌', '오피', '광주', '12:00'::TIME, '07:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 오이시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 오이시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오이시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 오이시', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 라스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 라스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라스트';
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
    VALUES ('신림 라스트', '출장', '신림', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 상록수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 상록수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상록수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 상록수', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 딸기우유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 딸기우유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기우유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 딸기우유', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 모델
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 모델';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모델';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 모델', '오피', '대구', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 꽃밭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 꽃밭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃밭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 꽃밭', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 잇꾸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 잇꾸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잇꾸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 잇꾸', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 쁘띠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 쁘띠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쁘띠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 쁘띠', '오피', '천안', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 히메
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 히메';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히메';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 히메', '오피', '대전', '14:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 플러팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 플러팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 플러팅', '오피', '광주', '10:00'::TIME, '06:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경산 쿤타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경산 쿤타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쿤타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경산 쿤타이', '오피', '경산', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 골든타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 골든타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골든타임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 골든타임', '오피', '부천', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 여수올리브영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 여수올리브영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여수올리브영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 여수올리브영', '오피', '여수', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 메이저
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 메이저';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이저';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 메이저', '오피', '대전', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하이엔드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하이엔드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이엔드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 하이엔드', '오피', '강남', '12:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 여수투썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 여수투썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여수투썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '여수' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 여수투썸', '여수', '여수', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 도쿄핫
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 도쿄핫';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄핫';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 도쿄핫', '오피', '오산', '11:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 궁', '오피', '부산', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 zoo
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 zoo';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'zoo';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 zoo', '오피', '목포', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 돈키호테
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 돈키호테';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '돈키호테';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 돈키호테', '오피', '창원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 마카롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 마카롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마카롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 마카롱', '오피', '창원', '13:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 싸요
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 싸요';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸요';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경기광주'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '경기광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경기광주 싸요', '경기광주', '경기광주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 창원 가리비 오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 창원 가리비 오피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '창원 가리비 오피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 창원 가리비 오피', '오피', '창원', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '부산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 시크릿', '부산', '부산', '24:00'::TIME, '24:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진주 진주갤러리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진주 진주갤러리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진주갤러리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '진주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진주 진주갤러리아', '오피', '진주', '12:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 레이블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 레이블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 레이블', '오피', '강서', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 양귀비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 양귀비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양귀비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '울산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 양귀비', '울산', '울산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 블랙
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 블랙';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 블랙', '오피', '안산', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 아울렛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 아울렛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아울렛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 아울렛', '오피', '남양주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 베스킨라빈스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 베스킨라빈스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베스킨라빈스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 베스킨라빈스', '오피', '동대문', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 인연
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 인연';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인연';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 인연', '오피', '안양', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 G스팟
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 G스팟';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'G스팟';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 G스팟', '오피', '의정부', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 마녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 마녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 마녀', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 여사친
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 여사친';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여사친';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 여사친', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 태국떡집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 태국떡집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태국떡집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 태국떡집', '오피', '의정부', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 콜라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 콜라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 콜라', '오피', '청라', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 푸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 푸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '푸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 푸', '오피', '오산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 지스팟
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 지스팟';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '지스팟';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 지스팟', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 판타지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 판타지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판타지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 판타지', '오피', '대전', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 처음처럼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 처음처럼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '처음처럼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 처음처럼', '휴게텔', '의정부', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 보령 만남의 광장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '보령 만남의 광장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만남의 광장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '보령'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('보령 만남의 광장', '오피', '보령', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 소라넷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 소라넷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소라넷';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 소라넷', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 유앤미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 유앤미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유앤미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 유앤미', '오피', '대전', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 스와핑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 스와핑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스와핑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 스와핑', '오피', '대구', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 스타', '오피', '시흥', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 디저트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 디저트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송탄'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '송탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송탄 디저트', '송탄', '송탄', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 연산동 콩깍지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 연산동 콩깍지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연산동 콩깍지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 연산동 콩깍지', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 미남떡데리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 미남떡데리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미남떡데리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 미남떡데리아', '오피', '부산', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 창원국제시장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 창원국제시장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '창원국제시장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 창원국제시장', '오피', '창원', '12:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서산 꽃밭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서산 꽃밭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃밭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서산 꽃밭', '오피', '서산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 아쿠아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 아쿠아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아쿠아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 아쿠아', '오피', '청주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 어썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 어썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 어썸', '오피', '영등포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 콜라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 콜라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 콜라', '오피', '울산', '02:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경산 사이다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경산 사이다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사이다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경산 사이다', '오피', '경산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 홀릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 홀릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 홀릭', '오피', '울산', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 룰루랄라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 룰루랄라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '룰루랄라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 룰루랄라', '오피', '울산', '01:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 여비서
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 여비서';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여비서';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '충청북도 진천군 진천읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 여비서', '충청북도 진천군 진천읍', '진천', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 백마천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 백마천국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백마천국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 백마천국', '오피', '부산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 어부바
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 어부바';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어부바';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 어부바', '오피', '울산', '12:00'::TIME, '04:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서산 아지트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서산 아지트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아지트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서산 아지트', '오피', '서산', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 러블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '송탄'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송탄 러블리', '오피', '송탄', '13:00'::TIME, '03:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 해운대 해운대 사이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '해운대 해운대 사이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해운대 사이즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '해운대'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('해운대 해운대 사이즈', '오피', '해운대', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 요맘때
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 요맘때';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요맘때';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 요맘때', '오피', '광주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 이벤트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 이벤트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이벤트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 이벤트', '오피', '대전', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 노빠꾸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 노빠꾸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노빠꾸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '01:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 노빠꾸', '오피', '울산', '01:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 러시안카지노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 러시안카지노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시안카지노';
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
    VALUES ('영등포 러시안카지노', '출장', '영등포', '10:00'::TIME, '05:00'::TIME, '출장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 사쿠라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 사쿠라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '목포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 사쿠라', '목포', '목포', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 엔젤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 엔젤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 엔젤', '오피', '창동', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 에이스', '오피', '제주도', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 디셈버
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 디셈버';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디셈버';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 디셈버', '오피', '경주', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 비타민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비타민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 비타민', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성수동 카부키초
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성수동 카부키초';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카부키초';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성수동'),
      store_type = COALESCE(store_type, '오피')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성수동 카부키초', '오피', '성수동', '10:00'::TIME, '05:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 목구멍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 목구멍';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '목구멍';
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
    VALUES ('강동 목구멍', '휴게텔', '강동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 쥬얼리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 쥬얼리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쥬얼리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대구 동구 동대구역' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 쥬얼리', '대구 동구 동대구역', '대구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 전주송천동여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 전주송천동여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전주송천동여자친구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 전주송천동여자친구', '휴게텔', '전주', '03:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 씨리얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 씨리얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '씨리얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '대구 동구 동대구역' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 씨리얼', '대구 동구 동대구역', '대구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 바닐라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 바닐라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바닐라';
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
    VALUES ('대전 바닐라', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 스테이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 스테이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스테이';
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
    VALUES ('강남 스테이', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화이트';
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
    VALUES ('대전 화이트', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 꽃분이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 꽃분이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃분이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '03:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 꽃분이', '휴게텔', '전주', '03:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 러블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리';
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
    VALUES ('천안 러블리', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 세븐일레븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 세븐일레븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세븐일레븐';
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
    VALUES ('천안 세븐일레븐', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 1004
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 1004';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1004';
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
    VALUES ('천안 1004', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 샷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 샷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샷';
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
    VALUES ('평택 샷', '휴게텔', '평택', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 비타민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비타민';
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
    VALUES ('평택 비타민', '휴게텔', '평택', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 맥심걸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 맥심걸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심걸';
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
    VALUES ('평택 맥심걸', '휴게텔', '평택', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 ☎맛집☎
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 ☎맛집☎';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☎맛집☎';
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
    VALUES ('강서 ☎맛집☎', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 고트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 고트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고트';
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
    VALUES ('주안 고트', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 타이레놀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 타이레놀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타이레놀';
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
    VALUES ('주안 타이레놀', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 톰브라운
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 톰브라운';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '톰브라운';
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
    VALUES ('잠실 톰브라운', '휴게텔', '잠실', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 프라다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 프라다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프라다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 프라다', '휴게텔', '남동구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 즐달
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 즐달';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '즐달';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 즐달', '휴게텔', '평택', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 러블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리';
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
    VALUES ('오산 러블리', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 첫사랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 첫사랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫사랑';
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
    VALUES ('광주 첫사랑', '휴게텔', '광주', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 러브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 러브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러브';
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
    VALUES ('청주 러브', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 아모레
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 아모레';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아모레';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '창동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 아모레', '창동', '창동', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 솔로지옥
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 솔로지옥';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솔로지옥';
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
    VALUES ('강서 솔로지옥', '휴게텔', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
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
    VALUES ('광주 레전드', '휴게텔', '광주', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 아미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 아미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아미';
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
    VALUES ('광주 아미', '휴게텔', '광주', '01:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 이벤트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 이벤트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이벤트';
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
    VALUES ('광주 이벤트', '휴게텔', '광주', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 오뚜기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 오뚜기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오뚜기';
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
    VALUES ('청주 오뚜기', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 자두
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 자두';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자두';
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
    VALUES ('부평 자두', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 겨울
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 겨울';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '겨울';
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
    VALUES ('동탄 겨울', '휴게텔', '동탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '삼성' ELSE address END
      , contact_name = COALESCE(contact_name, '도파민')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 도파민', '삼성', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔', '도파민')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
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
    VALUES ('주안 여우', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 맥심
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 맥심';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심';
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
    VALUES ('주안 맥심', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 마돈나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 마돈나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마돈나';
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
    VALUES ('강남 마돈나', '휴게텔', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 복숭아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 복숭아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '복숭아';
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
    VALUES ('부평 복숭아', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링';
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
    VALUES ('일산 힐링', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 새콤달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 새콤달콤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '새콤달콤';
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
    VALUES ('안산 새콤달콤', '휴게텔', '안산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 다빈치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 다빈치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다빈치';
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
    VALUES ('대전 다빈치', '휴게텔', '대전', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 투썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 투썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 투썸', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
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
    VALUES ('일산 도파민', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 파타야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 파타야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파타야';
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
    VALUES ('금천 파타야', '금천', '금천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 디즈니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 디즈니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디즈니';
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
    VALUES ('일산 디즈니', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 러블리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리';
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
    VALUES ('강서 러블리', '휴게텔', '강서', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 허니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 허니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '허니';
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
    VALUES ('구월 허니', '휴게텔', '구월', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 에겐남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 에겐남';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에겐남';
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
    VALUES ('주안 에겐남', '주안', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 아지트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 아지트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아지트';
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
    VALUES ('금천 아지트', '금천', '금천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 여사친
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 여사친';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여사친';
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
    VALUES ('구로 여사친', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 여인숙
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 여인숙';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여인숙';
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
    VALUES ('오산 여인숙', '휴게텔', '오산', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 ♥열아홉♥
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 ♥열아홉♥';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♥열아홉♥';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '02:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 ♥열아홉♥', '휴게텔', '광주', '02:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 여고생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 여고생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여고생';
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
    VALUES ('광주 여고생', '휴게텔', '광주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연수구 포켓몬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연수구 포켓몬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포켓몬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연수구'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '연수구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('연수구 포켓몬', '연수구', '연수구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 베트남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 베트남';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 베트남', '휴게텔', '부천', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원ice
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원ice';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원ice';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 수원ice', '휴게텔', '수원', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 배트맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 배트맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '배트맨';
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
    VALUES ('용인 배트맨', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 바나나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 바나나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나';
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
    VALUES ('오산 바나나', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 스타킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 스타킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타킹';
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
    VALUES ('오산 스타킹', '휴게텔', '오산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 요거트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 요거트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요거트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 요거트', '휴게텔', '구로', '11:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 츄파춥스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 츄파춥스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '츄파춥스';
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
    VALUES ('구로 츄파춥스', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 스파크+쉬멜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 스파크+쉬멜';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스파크+쉬멜';
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
    VALUES ('일산 스파크+쉬멜', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신도림 하녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신도림 하녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신도림'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신도림 하녀', '휴게텔', '신도림', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 르네상스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 르네상스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '르네상스';
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
    VALUES ('광주 르네상스', '휴게텔', '광주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 아이돌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌';
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
    VALUES ('영등포 아이돌', '휴게텔', '영등포', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 기생충
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 기생충';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기생충';
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
    VALUES ('시흥 기생충', '휴게텔', '시흥', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 까꿍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 까꿍';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '까꿍';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 까꿍', '휴게텔', '강동', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 섯다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 섯다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섯다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 섯다', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 매칭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 매칭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '매칭';
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
    VALUES ('분당 매칭', '휴게텔', '분당', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 톰포드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 톰포드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '톰포드';
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
    VALUES ('수원 톰포드', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 바카디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 바카디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바카디';
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
    VALUES ('청주 바카디', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 사우나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 사우나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사우나';
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
    VALUES ('용인 사우나', '휴게텔', '용인', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 우영미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 우영미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우영미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 우영미', '휴게텔', '대전', '12:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 바나나우유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 바나나우유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나우유';
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
    VALUES ('천안 바나나우유', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 핑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 핑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '이천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 핑', '이천', '이천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
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
    VALUES ('이천 딸기', '휴게텔', '이천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 궁둥이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 궁둥이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁둥이';
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
    VALUES ('광주 궁둥이', '휴게텔', '광주', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 첫경험
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 첫경험';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫경험';
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
    VALUES ('금천 첫경험', '휴게텔', '금천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 벤틀리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 벤틀리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벤틀리';
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
    VALUES ('용인 벤틀리', '휴게텔', '용인', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 글로리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 글로리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '글로리';
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
    VALUES ('수원 글로리', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송탄 무지개
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송탄 무지개';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '무지개';
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
    VALUES ('송탄 무지개', '휴게텔', '송탄', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 사탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 사탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사탕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 사탕', '휴게텔', '분당', '24:00'::TIME, '24:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 도쿄핫
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 도쿄핫';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄핫';
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
    VALUES ('주안 도쿄핫', '휴게텔', '주안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 스프링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 스프링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스프링';
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
    VALUES ('청주 스프링', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 루이비통
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 루이비통';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루이비통';
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
    VALUES ('송도 루이비통', '휴게텔', '송도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 안내상
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 안내상';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안내상';
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
    VALUES ('송도 안내상', '휴게텔', '송도', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 블루문
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 블루문';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루문';
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
    VALUES ('이천 블루문', '휴게텔', '이천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 려[麗
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 려[麗';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '려[麗';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN ']이천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 려[麗', ']이천', '이천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 하와이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 하와이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하와이';
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
    VALUES ('수원 하와이', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 룰렛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 룰렛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '룰렛';
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
    VALUES ('부천 룰렛', '휴게텔', '부천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 춘식이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 춘식이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '춘식이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '강남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 춘식이', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 방앗간
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 방앗간';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방앗간';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 방앗간', '휴게텔', '수원', '11:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 짝꿍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 짝꿍';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '짝꿍';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 짝꿍', '휴게텔', '천안', '13:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 휴게소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 휴게소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '휴게소';
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
    VALUES ('천안 휴게소', '휴게텔', '천안', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 여기야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 여기야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여기야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 여기야', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 생로랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 생로랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '생로랑';
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
    VALUES ('수원 생로랑', '휴게텔', '수원', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 장미공원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 장미공원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장미공원';
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
    VALUES ('원주 장미공원', '휴게텔', '원주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 디저트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 디저트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트';
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
    VALUES ('금천 디저트', '휴게텔', '금천', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 터미널
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 터미널';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '터미널';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 터미널', '휴게텔', '원주', '12:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 스캔들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 스캔들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스캔들';
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
    VALUES ('청주 스캔들', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 버블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 버블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블';
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
    VALUES ('일산 버블', '휴게텔', '일산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 고추밭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 고추밭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고추밭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 고추밭', '휴게텔', '남동구', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 소녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 소녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 소녀', '휴게텔', '청주', '12:00'::TIME, '04:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 아이돌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌';
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
    VALUES ('부평 아이돌', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 허니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 허니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '허니';
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
    VALUES ('용인 허니', '휴게텔', '용인', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 홈런볼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 홈런볼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런볼';
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
    VALUES ('상봉 홈런볼', '휴게텔', '상봉', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 미끌미끌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 미끌미끌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미끌미끌';
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
    VALUES ('아산 미끌미끌', '휴게텔', '아산', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 버블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 버블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 버블', '휴게텔', '은평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 플라워';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플라워';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 플라워', '휴게텔', '동대문', '12:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 뜨밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 뜨밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뜨밤';
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
    VALUES ('부평 뜨밤', '휴게텔', '부평', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;