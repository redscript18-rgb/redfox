-- 오피가이드 데이터 마이그레이션 Part 4/7


-- 강남 강남 코스튬 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남 코스튬 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 코스튬 1인샵';
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
    VALUES ('강남 강남 코스튬 1인샵', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 쩜오 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 쩜오 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쩜오 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 쩜오 스웨디시', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 S아로하
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 S아로하';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S아로하';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 S아로하', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 황실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 황실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황실';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '향남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('향남 황실', '건마', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 첫사랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 첫사랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫사랑';
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
    VALUES ('마포 첫사랑', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 황궁아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 황궁아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황궁아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 황궁아로마', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 세종 천사유혹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '세종 천사유혹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천사유혹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '세종'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('세종 천사유혹', '건마', '세종', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 북경 마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 북경 마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '북경 마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 북경 마사지', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 ☀️동경1인샵☀️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 ☀️동경1인샵☀️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☀️동경1인샵☀️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '분당' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 ☀️동경1인샵☀️', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 고양황제샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 고양황제샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고양황제샵';
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
    VALUES ('고양 고양황제샵', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 다이1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 다이1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('장안 다이1인샵', '건마', '장안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 수-1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 수-1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수-1';
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
    VALUES ('시흥 수-1', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 싱승생승
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 싱승생승';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싱승생승';
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
    VALUES ('시흥 싱승생승', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남 설레임 건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남 설레임 건마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임 건마';
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
    VALUES ('강남 강남 설레임 건마', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 구월 허니 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 구월 허니 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구월 허니 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구월 구월 허니 스웨디시', '건마', '구월', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 맥심스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 맥심스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심스웨디시';
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
    VALUES ('신림 맥심스웨디시', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 스타킹1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 스타킹1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타킹1인샵';
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
    VALUES ('김포 스타킹1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 운정샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 운정샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '운정샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '파주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 운정샤넬', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 가인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 가인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 가인', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 방이동 홀닭보지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '방이동 홀닭보지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀닭보지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '방이동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('방이동 홀닭보지', '건마', '방이동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 클로버스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 클로버스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '클로버스웨디시';
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
    VALUES ('동대문 클로버스웨디시', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 세탁소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 세탁소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세탁소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 세탁소', '건마', '창원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광교 베타미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광교 베타미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베타미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광교'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광교 베타미', '건마', '광교', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 BJ 스웨디시 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 BJ 스웨디시 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BJ 스웨디시 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 BJ 스웨디시 1인샵', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 오후1시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 오후1시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오후1시';
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
    VALUES ('용인 오후1시', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 레드샷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 레드샷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드샷';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 레드샷', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
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
    VALUES ('인천 여자친구', '건마', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 퐁퐁 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 퐁퐁 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퐁퐁 스웨디시';
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
    VALUES ('남양주 퐁퐁 스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 중국화경
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 중국화경';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '중국화경';
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
    VALUES ('구미 중국화경', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 샤넬마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 샤넬마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬마사지';
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
    VALUES ('용인 샤넬마사지', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 장미아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 장미아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장미아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 장미아로마', '건마', '아산', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 원주터미널스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 원주터미널스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원주터미널스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 원주터미널스파', '건마', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 보고싶다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 보고싶다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보고싶다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 보고싶다', '건마', '이천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 헬로스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 헬로스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헬로스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 헬로스파', '건마', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 왕십리 S라인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '왕십리 S라인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S라인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '왕십리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('왕십리 S라인', '건마', '왕십리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 플라워 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 플라워 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플라워 아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 플라워 아로마', '건마', '남동구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 인스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 인스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타';
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
    VALUES ('하남 인스타', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 뉴월드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 뉴월드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뉴월드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 뉴월드', '건마', '이천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 스물세살x녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 스물세살x녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스물세살x녀';
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
    VALUES ('대전 스물세살x녀', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 에비앙스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 에비앙스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에비앙스웨디시';
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
    VALUES ('강남 에비앙스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 왕십리 럭셔리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '왕십리 럭셔리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭셔리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '왕십리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('왕십리 럭셔리', '건마', '왕십리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 수 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 수 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수 테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 수 테라피', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 제리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 제리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제리';
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
    VALUES ('수원 제리', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 달기스웨디시1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 달기스웨디시1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달기스웨디시1인샵';
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
    VALUES ('남양주 달기스웨디시1인샵', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 소연 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 소연 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소연 1인샵';
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
    VALUES ('영등포 소연 1인샵', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 별아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 별아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별아로마';
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
    VALUES ('마포 별아로마', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 시드니스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 시드니스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시드니스웨디시';
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
    VALUES ('강남 시드니스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 방이동 MOON
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '방이동 MOON';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'MOON';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '방이동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('방이동 MOON', '건마', '방이동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 가인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 가인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가인';
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
    VALUES ('천안 가인', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 러블리충북대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 러블리충북대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리충북대';
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
    VALUES ('청주 러블리충북대', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 스카이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 스카이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스카이';
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
    VALUES ('서구 스카이', '건마', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 젤리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 젤리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '젤리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 젤리', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 환타지아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 환타지아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '환타지아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목동 환타지아', '건마', '목동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 끌림스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 끌림스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '끌림스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 끌림스웨디시', '건마', '금천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 하와이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 하와이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하와이';
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
    VALUES ('남양주 하와이', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프리티 립스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프리티 립스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리티 립스파';
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
    VALUES ('강남 프리티 립스파', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 보빨간 사춘기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 보빨간 사춘기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보빨간 사춘기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 보빨간 사춘기', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 요미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 요미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요미';
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
    VALUES ('평택 요미', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 랜드스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 랜드스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '랜드스파';
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
    VALUES ('강서 랜드스파', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 수', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 이브아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 이브아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이브아로마';
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
    VALUES ('용인 이브아로마', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 마카오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 마카오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마카오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 마카오', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 골드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 골드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골드';
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
    VALUES ('신림 골드', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 아만스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 아만스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아만스웨디시';
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
    VALUES ('강남 아만스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 고구마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 고구마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고구마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충청북도 음성군' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 고구마', '충청북도 음성군', '진천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 전주여고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 전주여고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전주여고';
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
    VALUES ('전주 전주여고', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 명아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 명아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강릉 명아로마', '건마', '강릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 귀족
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 귀족';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '귀족';
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
    VALUES ('하남 귀족', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 스캔들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 스캔들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스캔들';
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
    VALUES ('시흥 스캔들', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 선물
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 선물';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선물';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 선물', '건마', '경주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 롤리팝
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 롤리팝';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '롤리팝';
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
    VALUES ('천안 롤리팝', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 애플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 애플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플';
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
    VALUES ('강서 애플', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 히트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 히트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히트';
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
    VALUES ('시흥 히트', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 심쿵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 심쿵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심쿵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 심쿵', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 바비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 바비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 바비', '건마', '경주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 하트아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 하트아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목동 하트아로마', '건마', '목동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 궁아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 궁아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 궁아로마', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 명수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 명수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명수';
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
    VALUES ('평택 명수', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 엘프 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 엘프 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엘프 아로마';
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
    VALUES ('전주 엘프 아로마', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 369 스웨디시샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 369 스웨디시샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '369 스웨디시샵';
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
    VALUES ('아산 369 스웨디시샵', '건마', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 쿵떡쿵떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 쿵떡쿵떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쿵떡쿵떡';
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
    VALUES ('강서 쿵떡쿵떡', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 퀸카
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 퀸카';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀸카';
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
    VALUES ('동탄 퀸카', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 바디퀸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 바디퀸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바디퀸';
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
    VALUES ('전주 바디퀸', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 탕후루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 탕후루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탕후루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 탕후루', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 하나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 하나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하나1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 하나1인샵', '건마', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 복숭아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 복숭아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '복숭아';
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
    VALUES ('수원 복숭아', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 메로나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 메로나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메로나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('병점 메로나', '건마', '병점', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 별다스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 별다스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별다스웨디시';
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
    VALUES ('남양주 별다스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 고디바365스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 고디바365스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고디바365스웨디시';
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
    VALUES ('강남 고디바365스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 비타800
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 비타800';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비타800';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 비타800', '건마', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 홍콩아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 홍콩아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩아로마';
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
    VALUES ('남양주 홍콩아로마', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 포도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 포도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포도';
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
    VALUES ('시흥 포도', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 진접바나나스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 진접바나나스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진접바나나스웨디시';
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
    VALUES ('남양주 진접바나나스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 인조이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 인조이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인조이';
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
    VALUES ('평택 인조이', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 新북경마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 新북경마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '新북경마사지';
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
    VALUES ('은평 新북경마사지', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 휴
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 휴';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '휴';
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
    VALUES ('청주 휴', '휴게텔', '청주', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 에르메스 구리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 에르메스 구리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에르메스 구리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 에르메스 구리', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 송도 웁스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 송도 웁스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송도 웁스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 송도 웁스', '건마', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 욜로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 욜로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '욜로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 욜로', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 뜨거운감자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 뜨거운감자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뜨거운감자';
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
    VALUES ('시흥 뜨거운감자', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제천 SIMPEL
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제천 SIMPEL';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'SIMPEL';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제천 SIMPEL', '건마', '제천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 여인각
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 여인각';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여인각';
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
    VALUES ('천안 여인각', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광교 환타지아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광교 환타지아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '환타지아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광교'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광교 환타지아', '건마', '광교', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 24시왕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 24시왕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시왕';
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
    VALUES ('평택 24시왕', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 해피아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 해피아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해피아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 해피아로마', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 VIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 VIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 VIP', '건마', '여수', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 굿스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 굿스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '굿스파';
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
    VALUES ('구미 굿스파', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 빨간맛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 빨간맛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨간맛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 빨간맛', '건마', '목포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 캔디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 캔디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캔디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 캔디', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 로즈왁싱테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 로즈왁싱테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로즈왁싱테라피';
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
    VALUES ('일산 로즈왁싱테라피', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 속초 오션
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '속초 오션';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오션';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '속초'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('속초 오션', '건마', '속초', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 야당의밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 야당의밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야당의밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 야당의밤', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 밤마다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 밤마다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밤마다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 밤마다', '건마', '익산', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연신내 양귀비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연신내 양귀비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양귀비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연신내'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('연신내 양귀비', '건마', '연신내', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 다이아나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 다이아나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 다이아나', '휴게텔', '광진', '11:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 샤이넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 샤이넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤이넬';
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
    VALUES ('시흥 샤이넬', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산의 봄 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산의 봄 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산의 봄 스웨디시';
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
    VALUES ('일산 일산의 봄 스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 인스타스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 인스타스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타스파';
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
    VALUES ('잠실 인스타스파', '건마', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 좋아좋아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 좋아좋아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '좋아좋아';
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
    VALUES ('의정부 좋아좋아', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 민트 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 민트 힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '민트 힐링';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 민트 힐링', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 조개 비비기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 조개 비비기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조개 비비기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 조개 비비기', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
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
    VALUES ('영등포 여우', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 한국스시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 한국스시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국스시';
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
    VALUES ('평택 한국스시', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 초이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 초이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초이';
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
    VALUES ('하남 초이', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 아카사카
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 아카사카';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아카사카';
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
    VALUES ('고양 아카사카', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 여우', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 신난다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 신난다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신난다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부산 신난다', '건마', '부산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 부비부비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 부비부비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부비부비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 부비부비', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 미소스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 미소스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미소스웨디시';
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
    VALUES ('영등포 미소스웨디시', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 ACE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 ACE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ACE';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 ACE', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 윙크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 윙크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '윙크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 윙크', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 옐로우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 옐로우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '옐로우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 옐로우', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 모카스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 모카스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모카스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 모카스파', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 tae tae spa
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 tae tae spa';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'tae tae spa';
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
    VALUES ('시흥 tae tae spa', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 스타아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 스타아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타아로마';
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
    VALUES ('하남 스타아로마', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 과수원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 과수원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '과수원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경기광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경기광주 과수원', '건마', '경기광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 정왕동CGV
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 정왕동CGV';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정왕동CGV';
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
    VALUES ('시흥 정왕동CGV', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 싸바이1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 싸바이1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '싸바이1인샵';
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
    VALUES ('부평 싸바이1인샵', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 오션테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 오션테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오션테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 오션테라피', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 마석조안나바 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 마석조안나바 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마석조안나바 스웨디시';
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
    VALUES ('남양주 마석조안나바 스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 강동 로얄스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 강동 로얄스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강동 로얄스파';
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
    VALUES ('강동 강동 로얄스파', '건마', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 아이씨떡방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 아이씨떡방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이씨떡방';
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
    VALUES ('청주 아이씨떡방', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
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
    VALUES ('아산 딸기', '건마', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 나나플라자테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 나나플라자테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나나플라자테라피';
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
    VALUES ('부평 나나플라자테라피', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오창 일프로스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오창 일프로스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오창'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오창 일프로스웨디시', '건마', '오창', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타';
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
    VALUES ('강서 스타', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 너무밝히는우리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 너무밝히는우리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '너무밝히는우리';
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
    VALUES ('대전 너무밝히는우리', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 꿀테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 꿀테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀테라피';
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
    VALUES ('구미 꿀테라피', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁';
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
    VALUES ('전주 궁', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 딸기', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 별
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 별';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별';
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
    VALUES ('강서 별', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 샤론
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 샤론';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤론';
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
    VALUES ('아산 샤론', '건마', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 와글와글스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 와글와글스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '와글와글스웨디시';
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
    VALUES ('강서 와글와글스웨디시', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 샤넬 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 샤넬 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬 아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 샤넬 아로마', '건마', '안양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 명품아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 명품아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품아로마';
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
    VALUES ('구미 명품아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 스타일스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 스타일스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타일스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 스타일스웨디시', '건마', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 NO.1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 NO.1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NO.1';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 NO.1', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 샤넬', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 익산텐아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 익산텐아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '익산텐아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 익산텐아로마', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 샤넬', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 엔젤힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 엔젤힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤힐링';
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
    VALUES ('전주 엔젤힐링', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 ONE스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 ONE스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ONE스파';
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
    VALUES ('구로 ONE스파', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 홍콩마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 홍콩마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 홍콩마사지', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 선물 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 선물 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선물 아로마';
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
    VALUES ('대전 선물 아로마', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 심쿵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 심쿵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '심쿵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 심쿵', '건마', '안양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 핸드크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 핸드크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핸드크림';
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
    VALUES ('대전 핸드크림', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서산 미인맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서산 미인맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서산 미인맛집', '건마', '서산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 황실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 황실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황실';
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
    VALUES ('영등포 황실', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 구찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 구찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구찌';
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
    VALUES ('남양주 구찌', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 MZ
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 MZ';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'MZ';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 MZ', '건마', '전주', '17:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 광명비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 광명비타민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '광명비타민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 광명비타민', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 야당디올
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 야당디올';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야당디올';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 야당디올', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 멜론 몽스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 멜론 몽스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멜론 몽스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '구미' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 멜론 몽스파', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 버블타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 버블타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 버블타이', '건마', '광주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 블루아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 블루아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 블루아로마', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 See,You1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 See,You1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'See,You1인샵';
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
    VALUES ('청주 See,You1인샵', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야놀자 건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야놀자 건마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야놀자 건마';
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
    VALUES ('강남 야놀자 건마', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 세종 요정
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '세종 요정';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요정';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '세종'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('세종 요정', '건마', '세종', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 시그니처
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 시그니처';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그니처';
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
    VALUES ('강남 시그니처', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 마야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 마야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 마야', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안성 여왕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안성 여왕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여왕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안성'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안성 여왕', '건마', '안성', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 오션탄트라1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 오션탄트라1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오션탄트라1인샵';
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
    VALUES ('서구 오션탄트라1인샵', '건마', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 비타민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비타민';
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
    VALUES ('일산 비타민', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 갓핸드마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 갓핸드마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갓핸드마사지';
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
    VALUES ('대전 갓핸드마사지', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광양 스테이 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광양 스테이 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스테이 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '광양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광양 스테이 스웨디시', '건마', '광양', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 화성황실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 화성황실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화성황실';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 화성황실', '건마', '화성', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 히트스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 히트스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히트스파';
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
    VALUES ('강남 히트스파', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 뷰마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 뷰마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뷰마사지';
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
    VALUES ('동탄 뷰마사지', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 세타마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 세타마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세타마사지';
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
    VALUES ('천안 세타마사지', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 ROLEX스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 ROLEX스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ROLEX스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 ROLEX스웨디시', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 세컨드1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 세컨드1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세컨드1인샵';
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
    VALUES ('대전 세컨드1인샵', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 사이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 사이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사이즈';
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
    VALUES ('대전 사이즈', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 아이돌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 아이돌', '건마', '익산', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 VIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 VIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 VIP', '건마', '군산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 줄까 한국 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 줄까 한국 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '줄까 한국 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('계양 줄까 한국 스웨디시', '건마', '계양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 MOOD 무드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 MOOD 무드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'MOOD 무드';
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
    VALUES ('광주 MOOD 무드', '건마', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 야당부비부비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 야당부비부비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야당부비부비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '파주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 야당부비부비', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 둥근달
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 둥근달';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '둥근달';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 둥근달', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 웰 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 웰 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '웰 아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 웰 아로마', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 젤리1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 젤리1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '젤리1인샵';
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
    VALUES ('김포 젤리1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 소녀시대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 소녀시대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소녀시대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 소녀시대', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 BVG불가리바디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 BVG불가리바디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BVG불가리바디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('병점 BVG불가리바디', '건마', '병점', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 미스코리아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 미스코리아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미스코리아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 미스코리아', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 아로하테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 아로하테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아로하테라피';
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
    VALUES ('전주 아로하테라피', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 나비중국마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 나비중국마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나비중국마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 나비중국마사지', '건마', '구미', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 투썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 투썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 투썸', '건마', '평택', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 샤넬스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 샤넬스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬스웨디시';
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
    VALUES ('부천 샤넬스웨디시', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 섹시에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 섹시에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹시에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 섹시에이스', '건마', '당진', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 맛도리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 맛도리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛도리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 맛도리', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하인스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하인스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하인스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '홍대' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍대 하인스웨디시', '홍대', '홍대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 뒤1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 뒤1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뒤1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('종로 뒤1인샵', '건마', '종로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 창원콘타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 창원콘타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '창원콘타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 창원콘타이', '건마', '창원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 슈가테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 슈가테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈가테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 슈가테라피', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 여우 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 여우 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 여우 스웨디시', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 퇴계원별내 초코렛스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 퇴계원별내 초코렛스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퇴계원별내 초코렛스웨디시';
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
    VALUES ('남양주 퇴계원별내 초코렛스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 호치민테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 호치민테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '호치민테라피';
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
    VALUES ('천안 호치민테라피', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 부평S스웨디시 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 부평S스웨디시 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부평S스웨디시 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 부평S스웨디시 1인샵', '건마', '부평', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 성남 떡볶이 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 성남 떡볶이 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '성남 떡볶이 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '성남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 성남 떡볶이 스웨디시', '성남', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 후궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 후궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후궁';
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
    VALUES ('대전 후궁', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 디저트 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 디저트 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '분당' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 디저트 1인샵', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 김밥나라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 김밥나라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김밥나라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 김밥나라', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 카리나 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 카리나 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카리나 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '노원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 카리나 스웨디시', '노원', '노원', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 티파니 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 티파니 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티파니 스웨디시';
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
    VALUES ('제주도 티파니 스웨디시', '건마', '제주도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강북 20대 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강북 20대 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강북'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강북 20대 1인샵', '건마', '강북', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 존예스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 존예스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '존예스웨디시';
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
    VALUES ('청주 존예스웨디시', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 테라피', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 놀이터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 놀이터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀이터';
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
    VALUES ('시흥 놀이터', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 갤러리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 갤러리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갤러리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 갤러리', '건마', '강서', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 돌핀스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 돌핀스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '돌핀스웨디시';
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
    VALUES ('강남 돌핀스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 오리지널 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 오리지널 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오리지널 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 오리지널 스웨디시', '건마', '하남', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 나우테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 나우테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나우테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '마포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 나우테라피', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 워터스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 워터스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '워터스웨디시';
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
    VALUES ('강서 워터스웨디시', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 분당VVIP 1티어 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 분당VVIP 1티어 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당VVIP 1티어 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 분당VVIP 1티어 스웨디시', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP신세계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP신세계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP신세계';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 VVIP신세계', '건마', '강남', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 ⭐1인샵 손화민⭐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 ⭐1인샵 손화민⭐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭐1인샵 손화민⭐';
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
    VALUES ('구로 ⭐1인샵 손화민⭐', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 밀크 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 밀크 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크 스웨디시';
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
    VALUES ('강서 밀크 스웨디시', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 송파문정 조아 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 송파문정 조아 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송파문정 조아 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 송파문정 조아 1인샵', '건마', '송파', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 로얄 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 로얄 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로얄 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 로얄 스웨디시', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 단밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 단밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '단밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 단밤', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 핑크1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 핑크1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크1인샵';
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
    VALUES ('김포 핑크1인샵', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 여우별 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 여우별 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우별 스웨디시';
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
    VALUES ('부천 여우별 스웨디시', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 부비부비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 부비부비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부비부비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 부비부비', '건마', '평택', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 솜사탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 솜사탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕';
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
    VALUES ('강남 솜사탕', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 스리스리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 스리스리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스리스리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '분당' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 스리스리', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 프라다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 프라다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프라다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 프라다', '건마', '강서', '10:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 레이디1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 레이디1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이디1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '청주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 레이디1인샵', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 러쉬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 러쉬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러쉬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 러쉬', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 상상아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 상상아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상상아로마';
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
    VALUES ('구미 상상아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 ⭐블루⭐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 ⭐블루⭐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭐블루⭐';
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
    VALUES ('부평 ⭐블루⭐', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 설탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 설탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설탕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 설탕', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 플러리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 플러리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러리';
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
    VALUES ('구미 플러리', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 모찌스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 모찌스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모찌스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 모찌스웨디시', '건마', '포항', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 양주바디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 양주바디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양주바디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 양주바디', '안산', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 REVE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 REVE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'REVE';
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
    VALUES ('강서 REVE', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 스파클링스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 스파클링스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스파클링스웨디시';
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
    VALUES ('마포 스파클링스웨디시', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 베리1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 베리1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베리1인샵';
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
    VALUES ('강남 베리1인샵', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 THE MVL
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 THE MVL';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'THE MVL';
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
    VALUES ('전주 THE MVL', '건마', '전주', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 엔젤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 엔젤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤스웨디시';
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
    VALUES ('하남 엔젤스웨디시', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 밀크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 밀크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 밀크', '건마', '충주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '경주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 도파민', '경주', '경주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 공주
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 공주';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '공주';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 공주', '건마', '김포', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 아로마', '건마', '은평', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양재 은채1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양재 은채1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '은채1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '양재'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양재 은채1인샵', '건마', '양재', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 벚꽃스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 벚꽃스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벚꽃스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '오산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 벚꽃스웨디시', '오산', '오산', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 콩콩
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 콩콩';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콩콩';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 콩콩', '건마', '양주', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 ⛔쌍화점⛔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 ⛔쌍화점⛔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⛔쌍화점⛔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '구미' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구미 ⛔쌍화점⛔', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 GS25
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 GS25';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'GS25';
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
    VALUES ('강서 GS25', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 석계 Nice NC
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '석계 Nice NC';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Nice NC';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '석계'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('석계 Nice NC', '건마', '석계', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 레드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 레드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드';
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
    VALUES ('부평 레드', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 멜로망스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 멜로망스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멜로망스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평촌' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 멜로망스', '평촌', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 스웨디시블루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 스웨디시블루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스웨디시블루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 스웨디시블루', '건마', '경주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 럭키 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 럭키 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭키 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 럭키 스웨디시', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 밀크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 밀크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크';
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
    VALUES ('수원 밀크', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림VIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림VIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림VIP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '신림' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 신림VIP', '신림', '신림', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 부비부비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 부비부비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부비부비';
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
    VALUES ('수원 부비부비', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 블랙핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 블랙핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 블랙핑크', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 구찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 구찌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구찌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '오산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 구찌', '오산', '오산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 콜라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 콜라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콜라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 콜라', '건마', '전주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 디올스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 디올스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올스웨디시';
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
    VALUES ('수원 디올스웨디시', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 하늘마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 하늘마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하늘마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 하늘마사지', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 G바겐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 G바겐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'G바겐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 G바겐', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 다이소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 다이소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 다이소', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 디데이 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 디데이 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디데이 테라피';
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
    VALUES ('동탄 디데이 테라피', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 탑스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 탑스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탑스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 탑스파', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 퍼스트 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 퍼스트 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼스트 스웨디시';
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
    VALUES ('청주 퍼스트 스웨디시', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 섹시컬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 섹시컬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹시컬';
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
    VALUES ('시흥 섹시컬', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 The봄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 The봄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'The봄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 The봄', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중랑 투썸스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중랑 투썸스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투썸스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '중랑'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('중랑 투썸스웨디시', '건마', '중랑', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 탱글
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 탱글';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탱글';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 탱글', '건마', '이천', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 블레싱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 블레싱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블레싱';
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
    VALUES ('시흥 블레싱', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 베트남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 베트남';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 베트남', '건마', '시흥', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 수정1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 수정1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수정1인샵';
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
    VALUES ('마포 수정1인샵', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 금천 봄바람 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 금천 봄바람 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '금천 봄바람 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 금천 봄바람 1인샵', '건마', '금천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 달콤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 달콤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달콤스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 달콤스웨디시', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 말랑스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 말랑스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '말랑스웨디시';
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
    VALUES ('일산 말랑스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산황용
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산황용';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산황용';
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
    VALUES ('일산 일산황용', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 유앤미 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 유앤미 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유앤미 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 유앤미 1인샵', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 몽중인(夢中人)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 몽중인(夢中人)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '몽중인(夢中人)';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '남동구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 몽중인(夢中人)', '남동구', '남동구', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 1인샵 준희
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 1인샵 준희';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인샵 준희';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 1인샵 준희', '건마', '선릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 키티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 키티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '키티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 키티', '건마', '선릉', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 러시아스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 러시아스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아스웨디시';
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
    VALUES ('강남 러시아스웨디시', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 스카이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 스카이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스카이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 스카이', '건마', '대전', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 힐테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 힐테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목동 힐테라피', '건마', '목동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 느낌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 느낌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '느낌';
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
    VALUES ('수원 느낌', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 다희1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 다희1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다희1인샵';
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
    VALUES ('잠실 다희1인샵', '건마', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 연아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 연아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 연아', '건마', '잠실', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 송민1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 송민1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송민1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '마포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 송민1인샵', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 달빛스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 달빛스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달빛스웨디시';
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
    VALUES ('평택 달빛스웨디시', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 천안다솜1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 천안다솜1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천안다솜1인샵';
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
    VALUES ('천안 천안다솜1인샵', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 H테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 H테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'H테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '오피')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '오피' THEN '화성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 H테라피', '화성', '화성', '24:00'::TIME, '24:00'::TIME, '오피')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 오감타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 오감타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오감타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 오감타이', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남리젠트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남리젠트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남리젠트';
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
    VALUES ('강남 강남리젠트', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 헤븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 헤븐', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 컴온
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 컴온';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '컴온';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '마포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 컴온', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 풀 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 풀 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀 테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 풀 테라피', '건마', '천안', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 YOLO
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 YOLO';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'YOLO';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구월 YOLO', '건마', '구월', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 여왕의눈물
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 여왕의눈물';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여왕의눈물';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 여왕의눈물', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 세종 샾잉스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '세종 샾잉스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샾잉스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '세종'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('세종 샾잉스웨디시', '건마', '세종', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 시아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 시아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 시아', '건마', '제주도', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 별다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 별다방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별다방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '성남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 별다방', '성남', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 당산 M 스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 당산 M 스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '당산 M 스파';
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
    VALUES ('영등포 당산 M 스파', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
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
    VALUES ('강서 샤넬', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 달콤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달콤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 달콤', '건마', '원주', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 명품스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 명품스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '의정부' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 명품스웨디시', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 세이렌테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 세이렌테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세이렌테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('역삼 세이렌테라피', '건마', '역삼', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 아모르바디텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 아모르바디텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아모르바디텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 아모르바디텔', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 벤츠스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 벤츠스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벤츠스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '청주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 벤츠스웨디시', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 an스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 an스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'an스웨디시';
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
    VALUES ('여의도 an스웨디시', '건마', '여의도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 엔돌핀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 엔돌핀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔돌핀';
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
    VALUES ('수원 엔돌핀', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 대가을
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 대가을';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대가을';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 대가을', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 판타스틱 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 판타스틱 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판타스틱 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 판타스틱 스웨디시', '건마', '파주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 원흥 비스켓 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 원흥 비스켓 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원흥 비스켓 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '고양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('고양 원흥 비스켓 스웨디시', '고양', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 다방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('주안 다방', '건마', '주안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서대문 홍스파(한국)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서대문 홍스파(한국)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍스파(한국)';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서대문'),
      store_type = COALESCE(store_type, '휴게텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서대문 홍스파(한국)', '휴게텔', '서대문', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 new프라이빗
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 new프라이빗';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'new프라이빗';
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
    VALUES ('제주도 new프라이빗', '건마', '제주도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 쭈쭈바
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 쭈쭈바';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쭈쭈바';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 쭈쭈바', '평택', '평택', '11:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 나영1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 나영1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나영1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '01:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 나영1인샵', '건마', '강서', '11:00'::TIME, '01:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 베이비걸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 베이비걸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이비걸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 베이비걸', '건마', '대전', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 서희1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 서희1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서희1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '길동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 서희1인샵', '길동', '강동', '12:00'::TIME, '12:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '수원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 여우', '수원', '수원', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('병점 에이스', '건마', '병점', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 에르메스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 에르메스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에르메스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 에르메스', '건마', '아산', '15:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 개꿀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 개꿀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '개꿀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 개꿀', '건마', '남양주', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서대문 달달스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서대문 달달스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달달스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서대문'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '서대문' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서대문 달달스웨디시', '서대문', '서대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 비키니스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 비키니스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비키니스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '원주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 비키니스웨디시', '원주', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 여우스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 여우스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우스웨디시';
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
    VALUES ('수원 여우스웨디시', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 오타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 오타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '창원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 오타이', '창원', '창원', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 러빙유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 러빙유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러빙유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 러빙유', '건마', '평촌', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등';
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
    VALUES ('평택 1등', '건마', '평택', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 Miss A
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 Miss A';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Miss A';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 Miss A', '건마', '평촌', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 미시단아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 미시단아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미시단아1인샵';
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
    VALUES ('하남 미시단아1인샵', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 명품관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 명품관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품관';
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
    VALUES ('대전 명품관', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 크림', '건마', '군산', '14:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 월병아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 월병아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '월병아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '익산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 월병아로마', '익산', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 레젼드 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 레젼드 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레젼드 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 레젼드 스웨디시', '건마', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포승 S스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포승 S스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포승'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '포승' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포승 S스파', '포승', '포승', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 와꾸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 와꾸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '와꾸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '진천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 와꾸', '진천', '진천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 파라다이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 파라다이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파라다이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 파라다이스', '건마', '광주', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 컬러아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 컬러아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '컬러아로마';
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
    VALUES ('광주 컬러아로마', '건마', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서대문 누아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서대문 누아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '누아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '서대문'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서대문 누아', '건마', '서대문', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 솜사탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 솜사탕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '경기도 남양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 솜사탕', '경기도 남양주', '평택', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 스타 스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 스타 스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타 스파';
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
    VALUES ('남양주 스타 스파', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 Beautygirl
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 Beautygirl';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Beautygirl';
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
    VALUES ('영등포 Beautygirl', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 태양
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 태양';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태양';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('신림 태양', '건마', '신림', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 오산뜨밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 오산뜨밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오산뜨밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '휴게텔')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '휴게텔' THEN '오산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 오산뜨밤', '오산', '오산', '15:00'::TIME, '06:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 춘천 여비서
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '춘천 여비서';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여비서';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '춘천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('춘천 여비서', '건마', '춘천', '12:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 병점역스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 병점역스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '병점역스파';
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
    VALUES ('병점 병점역스파', '병점', '병점', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 야당퍼블릭테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 야당퍼블릭테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야당퍼블릭테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '파주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 야당퍼블릭테라피', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 건마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '건마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 건마', '건마', '부평', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 원', '건마', '당진', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 섹슈얼테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 섹슈얼테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹슈얼테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 섹슈얼테라피', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포천 이쁘다스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포천 이쁘다스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이쁘다스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '포천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포천 이쁘다스웨디시', '건마', '포천', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 방타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 방타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '선릉' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 방타이', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 청아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 청아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청아1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 청아1인샵', '동탄', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 후궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 후궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후궁';
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
    VALUES ('은평 후궁', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 고양이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 고양이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고양이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 고양이', '건마', '대전', '10:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 힐링테라피 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 힐링테라피 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링테라피 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 힐링테라피 스웨디시', '건마', '상봉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 숲속
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 숲속';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '숲속';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('계양 숲속', '건마', '계양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 인조이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 인조이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인조이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 인조이', '건마', '하남', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 레몬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 레몬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레몬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 레몬', '건마', '오산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 다이쏘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 다이쏘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이쏘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 다이쏘', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 호야 1인샾
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 호야 1인샾';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '호야 1인샾';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 호야 1인샾', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 방콕스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 방콕스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방콕스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 방콕스', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 BLS 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 BLS 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BLS 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '경주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경주 BLS 스웨디시', '건마', '경주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울대 세연&주아 1인샾
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울대 세연&주아 1인샾';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세연&주아 1인샾';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서울대'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서울대 세연&주아 1인샾', '건마', '서울대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 비비스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 비비스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비비스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 비비스파', '건마', '의정부', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 스타박스샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 스타박스샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타박스샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 스타박스샵', '건마', '수원', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 푸레쉬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 푸레쉬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '푸레쉬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('역삼 푸레쉬', '안마', '역삼', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 K테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 K테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'K테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '당진' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 K테라피', '당진', '당진', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 설레임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 설레임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설레임';
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
    VALUES ('청주 설레임', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 물레
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 물레';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물레';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 물레', '건마', '제주도', '18:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 느낌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 느낌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '느낌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 느낌', '건마', '파주', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 화이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 화이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화이트';
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
    VALUES ('수원 화이트', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 다이아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 다이아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아1인샵';
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
    VALUES ('대전 다이아1인샵', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 속살
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 속살';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '속살';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '당진'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '당진' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('당진 속살', '당진', '당진', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 천안바다1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 천안바다1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천안바다1인샵';
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
    VALUES ('천안 천안바다1인샵', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 림프스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 림프스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '림프스';
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
    VALUES ('하남 림프스', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 숨타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 숨타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '숨타이';
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
    VALUES ('전주 숨타이', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
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
    VALUES ('은평 여자친구', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 미드림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 미드림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미드림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('장안 미드림', '건마', '장안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 연합정보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 연합정보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연합정보';
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
    VALUES ('수원 연합정보', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 올영 딥스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 올영 딥스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올영 딥스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 올영 딥스웨디시', '건마', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 쁘띠첼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 쁘띠첼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쁘띠첼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 쁘띠첼', '건마', '충주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 램프지니(한국관)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 램프지니(한국관)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '램프지니(한국관)';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '상봉' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 램프지니(한국관)', '상봉', '상봉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 꼬란
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 꼬란';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꼬란';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 꼬란', '건마', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 솔로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 솔로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솔로';
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
    VALUES ('일산 솔로', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 별나라스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 별나라스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별나라스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목동 별나라스웨디시', '건마', '목동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 나나테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 나나테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나나테라피';
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
    VALUES ('동대문 나나테라피', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 LV
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 LV';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'LV';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '향남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '향남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('향남 LV', '향남', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 S테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 S테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '청주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 S테라피', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 다미1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 다미1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다미1인샵';
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
    VALUES ('일산 다미1인샵', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 팍스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 팍스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팍스';
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
    VALUES ('수원 팍스', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 익산 명품 샤인1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 익산 명품 샤인1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '익산 명품 샤인1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 익산 명품 샤인1인샵', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서산 버블 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서산 버블 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서산 버블 스웨디시', '건마', '서산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 하나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 하나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하나1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '하남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 하나1인샵', '하남', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 떡튜브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 떡튜브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '떡튜브';
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
    VALUES ('분당 떡튜브', '휴게텔', '분당', '10:00'::TIME, '05:00'::TIME, '휴게텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 힐링마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 힐링마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 힐링마사지', '평택', '평택', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 야화스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 야화스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야화스웨디시';
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
    VALUES ('영등포 야화스웨디시', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 고양이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 고양이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고양이';
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
    VALUES ('수원 고양이', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 문산스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 문산스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '문산스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 문산스웨디시', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 몽환테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 몽환테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '몽환테라피';
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
    VALUES ('신림 몽환테라피', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 우연아로마테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 우연아로마테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우연아로마테라피';
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
    VALUES ('동대문 우연아로마테라피', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 실버 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 실버 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '실버 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('상봉 실버 스웨디시', '건마', '상봉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 홀릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 홀릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홀릭';
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
    VALUES ('청주 홀릭', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 러시아스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 러시아스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구리 러시아스웨디시', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 포레스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 포레스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포레스트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 포레스트', '건마', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 하모니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 하모니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하모니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용산 하모니', '건마', '용산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 엘라스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 엘라스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엘라스웨디시';
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
    VALUES ('동대문 엘라스웨디시', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 럭키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 럭키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭키';
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
    VALUES ('부평 럭키', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 핫이슈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 핫이슈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫이슈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충청북도 진천군 진천읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 핫이슈', '충청북도 진천군 진천읍', '진천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 분홍치마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 분홍치마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분홍치마';
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
    VALUES ('청주 분홍치마', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 도매가 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 도매가 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도매가 테라피';
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
    VALUES ('잠실 도매가 테라피', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 수성스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 수성스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수성스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 수성스파', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 두리안
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 두리안';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '두리안';
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
    VALUES ('시흥 두리안', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 미시&느낌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 미시&느낌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미시&느낌';
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
    VALUES ('부평 미시&느낌', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 팟타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 팟타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팟타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 팟타이', '건마', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 세나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 세나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세나1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 세나1인샵', '건마', '선릉', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 하늘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 하늘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하늘';
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
    VALUES ('동탄 하늘', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 김포유미1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 김포유미1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김포유미1인샵';
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
    VALUES ('김포 김포유미1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 비와그대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 비와그대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비와그대';
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
    VALUES ('수원 비와그대', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 vip 스웨디시&왁싱샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 vip 스웨디시&왁싱샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'vip 스웨디시&왁싱샵';
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
    VALUES ('강남 vip 스웨디시&왁싱샵', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 순천 로로스웨디시 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '순천 로로스웨디시 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로로스웨디시 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '순천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('순천 로로스웨디시 1인샵', '건마', '순천', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 영주1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 영주1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영주1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '23:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 영주1인샵', '건마', '일산', '13:00'::TIME, '23:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 때때타이 안산점
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 때때타이 안산점';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '때때타이 안산점';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 때때타이 안산점', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 하노이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 하노이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하노이';
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
    VALUES ('수원 하노이', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 스타일스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 스타일스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타일스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 스타일스웨디시', '건마', '선릉', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 만수 소라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '만수 소라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '만수'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('만수 소라', '건마', '만수', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 밀키스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 밀키스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀키스웨디시';
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
    VALUES ('은평 밀키스웨디시', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 여우', '건마', '창동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 데이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 데이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데이트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 데이트', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울대 모모1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울대 모모1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모모1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서울대'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서울대 모모1인샵', '건마', '서울대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 면목동 달빛스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '면목동 달빛스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달빛스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '면목동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('면목동 달빛스웨디시', '건마', '면목동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 이드인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 이드인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이드인';
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
    VALUES ('수원 이드인', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 라라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 라라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 라라', '건마', '군산', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 잠실 소은 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 잠실 소은 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잠실 소은 1인샵';
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
    VALUES ('잠실 잠실 소은 1인샵', '건마', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 샴푸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 샴푸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샴푸';
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
    VALUES ('수원 샴푸', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 태릉 태릉 거래처 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '태릉 태릉 거래처 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태릉 거래처 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '태릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('태릉 태릉 거래처 1인샵', '건마', '태릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남 블루스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남 블루스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 블루스';
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
    VALUES ('강남 강남 블루스', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 르블랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 르블랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '르블랑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 르블랑', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 궁마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 궁마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 궁마사지', '건마', '이천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 꿀꺽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 꿀꺽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀꺽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('이천 꿀꺽', '건마', '이천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 명임아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 명임아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명임아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 명임아로마', '건마', '울산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 수완나품 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 수완나품 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수완나품 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '계양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('계양 수완나품 1인샵', '계양', '계양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 1인샵 미란다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 1인샵 미란다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인샵 미란다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 1인샵 미란다', '건마', '선릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 홍콩아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 홍콩아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 홍콩아로마', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 레드스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 레드스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드스웨디시';
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
    VALUES ('고양 레드스웨디시', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 킹스맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 킹스맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹스맨';
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
    VALUES ('전주 킹스맨', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 올림푸스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 올림푸스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올림푸스';
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
    VALUES ('강동 올림푸스', '건마', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 블루타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 블루타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루타이';
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
    VALUES ('동대문 블루타이', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 아레아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 아레아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아레아';
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
    VALUES ('수원 아레아', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 솔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 솔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솔';
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
    VALUES ('마포 솔', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 삼동타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 삼동타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼동타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경기광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경기광주 삼동타이', '건마', '경기광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 핫핑크 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 핫핑크 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫핑크 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 핫핑크 스웨디시', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 레인보우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 레인보우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레인보우';
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
    VALUES ('제주도 레인보우', '건마', '제주도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중구 숲
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중구 숲';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '숲';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '중구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('중구 숲', '건마', '중구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 허테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 허테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '허테라피';
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
    VALUES ('하남 허테라피', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 아이스크림스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 아이스크림스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이스크림스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 아이스크림스웨디시', '건마', '충주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 시크릿 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 시크릿 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿 1인샵';
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
    VALUES ('대전 시크릿 1인샵', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 썸건마실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 썸건마실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸건마실장';
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
    VALUES ('강남 썸건마실장', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 라이크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 라이크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라이크';
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
    VALUES ('평택 라이크', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 솜사탕 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 솜사탕 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('선릉 솜사탕 스웨디시', '건마', '선릉', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 H1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 H1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'H1';
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
    VALUES ('동대문 H1', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 나이키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 나이키';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나이키';
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
    VALUES ('동탄 나이키', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 샤넬 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 샤넬 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬 아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 샤넬 아로마', '건마', '성북', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양재 낙원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양재 낙원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '낙원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '양재'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양재 낙원', '건마', '양재', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원1등';
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
    VALUES ('수원 수원1등', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 춘천 망고스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '춘천 망고스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '망고스웨디시';
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
    VALUES ('춘천 망고스웨디시', '건마', '춘천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 굿 타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 굿 타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '굿 타이';
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
    VALUES ('일산 굿 타이', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 정인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 정인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정인';
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
    VALUES ('수원 정인', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 영종도 놀러와
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 영종도 놀러와';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영종도 놀러와';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 영종도 놀러와', '건마', '영종도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 빨간맛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 빨간맛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨간맛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 빨간맛', '건마', '영종도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 진천 24시꿀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '진천 24시꿀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시꿀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '진천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충청북도 진천군 진천읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('진천 24시꿀', '충청북도 진천군 진천읍', '진천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 필아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 필아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '필아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용산 필아로마', '건마', '용산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 후궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 후궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후궁';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 후궁', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군자 명품마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군자 명품마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군자'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군자 명품마사지', '건마', '군자', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원메가연합
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원메가연합';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원메가연합';
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
    VALUES ('수원 수원메가연합', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 퀸스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 퀸스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀸스웨디시';
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
    VALUES ('수유 퀸스웨디시', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 마포 S 스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 마포 S 스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마포 S 스파';
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
    VALUES ('마포 마포 S 스파', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 해운대 해운대퀄리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '해운대 해운대퀄리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해운대퀄리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '해운대'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('해운대 해운대퀄리티', '건마', '해운대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 아리1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 아리1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아리1인샵';
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
    VALUES ('남양주 아리1인샵', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;