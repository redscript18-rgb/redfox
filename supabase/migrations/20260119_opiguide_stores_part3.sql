-- 오피가이드 데이터 마이그레이션 Part 3/7


-- 시흥 스타아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 스타아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 스타아로마', '건마', '시흥', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 야메떼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 야메떼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야메떼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 야메떼', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 디올
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 디올';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올';
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
    VALUES ('평택 디올', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 20대지리는
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 20대지리는';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대지리는';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 20대지리는', '건마', '마포', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 빨간앵두
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 빨간앵두';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빨간앵두';
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
    VALUES ('청주 빨간앵두', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 극락 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 극락 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극락 스웨디시';
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
    VALUES ('신림 극락 스웨디시', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 첫사랑테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 첫사랑테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫사랑테라피';
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
    VALUES ('대전 첫사랑테라피', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 수미아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 수미아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수미아로마';
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
    VALUES ('전주 수미아로마', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 티파니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 티파니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티파니';
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
    VALUES ('평택 티파니', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 청담스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 청담스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청담스웨디시';
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
    VALUES ('신림 청담스웨디시', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁';
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
    VALUES ('청라 궁', '건마', '청라', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 주아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 주아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주아1인샵';
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
    VALUES ('송파 주아1인샵', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 베이글
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 베이글';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이글';
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
    VALUES ('전주 베이글', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 키티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 키티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '키티';
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
    VALUES ('평촌 키티', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 도파민', '룸', '용인', '12:00'::TIME, '04:00'::TIME, '룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 골든스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 골든스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골든스웨디시';
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
    VALUES ('고양 골든스웨디시', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 스테이시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 스테이시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스테이시';
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
    VALUES ('하남 스테이시', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 블라썸(찐20대한국인)1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 블라썸(찐20대한국인)1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블라썸(찐20대한국인)1인샵';
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
    VALUES ('수원 블라썸(찐20대한국인)1인샵', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 타이 샤크라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 타이 샤크라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타이 샤크라';
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
    VALUES ('양주 타이 샤크라', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 델루나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 델루나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '델루나1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '수유' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 델루나1인샵', '수유', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 물GO
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 물GO';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물GO';
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
    VALUES ('김포 물GO', '건마', '김포', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 럭셔리 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 럭셔리 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭셔리 스웨디시';
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
    VALUES ('의정부 럭셔리 스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 사당테라피&스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 사당테라피&스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사당테라피&스웨디시';
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
    VALUES ('성남 사당테라피&스웨디시', '건마', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 만수 만수역 콩아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '만수 만수역 콩아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만수역 콩아로마';
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
    VALUES ('만수 만수역 콩아로마', '건마', '만수', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 유정1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 유정1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유정1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 유정1인샵', '건마', '창동', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 기모기모
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 기모기모';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기모기모';
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
    VALUES ('용인 기모기모', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 미끌미끌(20대한국인)1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 미끌미끌(20대한국인)1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미끌미끌(20대한국인)1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 미끌미끌(20대한국인)1인샵', '충주', '충주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 파라다스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 파라다스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파라다스웨디시';
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
    VALUES ('의정부 파라다스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 투썸스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 투썸스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투썸스웨디시';
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
    VALUES ('남양주 투썸스웨디시', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 은지1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 은지1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '은지1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 은지1인샵', '건마', '강동', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 암캐스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 암캐스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '암캐스웨디시';
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
    VALUES ('주안 암캐스웨디시', '건마', '주안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 코코 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 코코 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '코코 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '송도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 코코 1인샵', '송도', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 인스타스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 인스타스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타스웨디시';
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
    VALUES ('송파 인스타스웨디시', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 꿀벌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 꿀벌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀벌';
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
    VALUES ('오산 꿀벌', '건마', '오산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 더봄 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 더봄 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더봄 스웨디시';
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
    VALUES ('송파 더봄 스웨디시', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 구미식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 구미식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구미식';
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
    VALUES ('구미 구미식', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 벤틀리 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 벤틀리 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벤틀리 스웨디시';
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
    VALUES ('수유 벤틀리 스웨디시', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 중독TOP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 중독TOP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '중독TOP';
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
    VALUES ('안산 중독TOP', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 피치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 피치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '피치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 피치', '건마', '천안', '12:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 워터밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '워터밤';
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
    VALUES ('구미 워터밤', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 빠나나 스웨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 빠나나 스웨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빠나나 스웨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 빠나나 스웨', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 마린 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 마린 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마린 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 마린 스웨디시', '건마', '안산', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 탑걸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 탑걸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탑걸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구월 탑걸', '건마', '구월', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 GRAY
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 GRAY';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'GRAY';
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
    VALUES ('전주 GRAY', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 예스골드플라워스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 예스골드플라워스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예스골드플라워스웨디시';
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
    VALUES ('일산 예스골드플라워스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 샤넬테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 샤넬테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬테라피';
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
    VALUES ('고양 샤넬테라피', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 핑두
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 핑두';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑두';
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
    VALUES ('강서 핑두', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 더블랙스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 더블랙스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더블랙스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광진'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '광진' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광진 더블랙스웨디시', '광진', '광진', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 ꧁✨셀럽1인샵✨꧂
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 ꧁✨셀럽1인샵✨꧂';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꧁✨셀럽1인샵✨꧂';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '청라' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 ꧁✨셀럽1인샵✨꧂', '청라', '청라', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 미시신세계VVIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미시신세계VVIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미시신세계VVIP';
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
    VALUES ('일산 미시신세계VVIP', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 시그니처
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 시그니처';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그니처';
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
    VALUES ('양주 시그니처', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 구찌테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 구찌테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구찌테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 구찌테라피', '건마', '수원', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 처음처럼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 처음처럼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '처음처럼';
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
    VALUES ('청라 처음처럼', '건마', '청라', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 레몬스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 레몬스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레몬스웨디시';
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
    VALUES ('동탄 레몬스웨디시', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 헬로스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 헬로스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헬로스웨디시';
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
    VALUES ('동탄 헬로스웨디시', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 NEW로얄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 NEW로얄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW로얄';
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
    VALUES ('부천 NEW로얄', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 골드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 골드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골드';
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
    VALUES ('평택 골드', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 에스러브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 에스러브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에스러브';
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
    VALUES ('부천 에스러브', '건마', '부천', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중랑 소녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중랑 소녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '중랑'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('중랑 소녀', '건마', '중랑', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 여우테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 여우테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우테라피';
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
    VALUES ('대구 여우테라피', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 청라타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 청라타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청라타이';
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
    VALUES ('청라 청라타이', '건마', '청라', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 아이돌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌';
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
    VALUES ('동탄 아이돌', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 포니스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 포니스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포니스웨디시';
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
    VALUES ('송파 포니스웨디시', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 소녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 소녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소녀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 소녀', '건마', '용인', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 파트너
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 파트너';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파트너';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 파트너', '건마', '평택', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 스캔들 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 스캔들 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스캔들 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 스캔들 스웨디시', '건마', '안산', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 롤링1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 롤링1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '롤링1인샵';
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
    VALUES ('송도 롤링1인샵', '건마', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 메이드 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 메이드 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드 스웨디시';
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
    VALUES ('시흥 메이드 스웨디시', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 중독TOP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 중독TOP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '중독TOP';
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
    VALUES ('구미 중독TOP', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 천안 여학생들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 천안 여학생들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천안 여학생들';
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
    VALUES ('천안 천안 여학생들', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 프리미엄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 프리미엄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리미엄';
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
    VALUES ('평택 프리미엄', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 미소녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 미소녀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미소녀';
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
    VALUES ('화성 미소녀', '건마', '화성', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 밀크스웨디시1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 밀크스웨디시1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크스웨디시1인샵';
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
    VALUES ('건대 밀크스웨디시1인샵', '건마', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 비비고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 비비고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비비고';
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
    VALUES ('분당 비비고', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 하와이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 하와이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하와이';
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
    VALUES ('구미 하와이', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 새콤달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 새콤달콤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '새콤달콤';
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
    VALUES ('부천 새콤달콤', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트';
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
    VALUES ('평촌 하트', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 시그니처
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 시그니처';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그니처';
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
    VALUES ('향남 시그니처', '건마', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광교 광교이지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광교 광교이지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '광교이지';
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
    VALUES ('광교 광교이지', '건마', '광교', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 원소주
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 원소주';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원소주';
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
    VALUES ('동탄 원소주', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 미씨스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 미씨스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미씨스웨디시';
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
    VALUES ('천안 미씨스웨디시', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 디저트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 디저트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디저트';
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
    VALUES ('전주 디저트', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 아이돌테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 아이돌테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌테라피';
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
    VALUES ('천안 아이돌테라피', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 체리1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 체리1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체리1인샵';
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
    VALUES ('천안 체리1인샵', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 런아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 런아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런아로마';
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
    VALUES ('인천 런아로마', '건마', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 하녀II스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 하녀II스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하녀II스웨디시';
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
    VALUES ('주안 하녀II스웨디시', '건마', '주안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 드림스웨디시1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 드림스웨디시1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드림스웨디시1인샵';
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
    VALUES ('수유 드림스웨디시1인샵', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 부르릉
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 부르릉';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부르릉';
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
    VALUES ('평택 부르릉', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 쏘핫
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 쏘핫';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쏘핫';
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
    VALUES ('전주 쏘핫', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 티파니 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 티파니 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티파니 테라피';
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
    VALUES ('구로 티파니 테라피', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 그레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 그레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '그레이스';
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
    VALUES ('구미 그레이스', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 달콤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 달콤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달콤스웨디시';
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
    VALUES ('김포 달콤스웨디시', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 나나테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 나나테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나나테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '경기도 안양 평촌' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 나나테라피', '경기도 안양 평촌', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 오랄스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 오랄스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오랄스웨디시';
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
    VALUES ('의정부 오랄스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 더마치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 더마치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더마치';
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
    VALUES ('대전 더마치', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 일프로스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 일프로스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로스웨디시';
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
    VALUES ('천안 일프로스웨디시', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 포텐스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 포텐스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포텐스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '충주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('충주 포텐스웨디시', '충주', '충주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 지수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 지수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '지수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 지수', '건마', '수원', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 누아르1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 누아르1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '누아르1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '장안' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('장안 누아르1인샵', '장안', '장안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 큐브1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 큐브1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '큐브1인샵';
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
    VALUES ('대전 큐브1인샵', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 하이엔드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 하이엔드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이엔드';
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
    VALUES ('전주 하이엔드', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 유나1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 유나1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유나1인샵';
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
    VALUES ('천안 유나1인샵', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 단골 하우스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 단골 하우스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '단골 하우스';
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
    VALUES ('하남 단골 하우스', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 하트스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 하트스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트스웨디시';
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
    VALUES ('강동 하트스웨디시', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 S RELAX
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 S RELAX';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S RELAX';
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
    VALUES ('노원 S RELAX', '건마', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동두천 킹 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동두천 킹 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동두천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동두천 킹 스웨디시', '건마', '동두천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 존예 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 존예 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '존예 1인샵';
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
    VALUES ('김포 존예 1인샵', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 예린1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 예린1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예린1인샵';
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
    VALUES ('천안 예린1인샵', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 메이드 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 메이드 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '청라' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 메이드 스웨디시', '청라', '청라', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 야당럭셔리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 야당럭셔리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야당럭셔리';
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
    VALUES ('파주 야당럭셔리', '건마', '파주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 1인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 1인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 1인', '건마', '강서', '14:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 뮤 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 뮤 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뮤 테라피';
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
    VALUES ('평택 뮤 테라피', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 극강스웨 유라1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 극강스웨 유라1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강스웨 유라1인샵';
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
    VALUES ('신림 극강스웨 유라1인샵', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 이쁜시현1인샾
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 이쁜시현1인샾';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이쁜시현1인샾';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 이쁜시현1인샾', '건마', '창동', '11:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 헤븐스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 헤븐스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐스웨디시';
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
    VALUES ('전주 헤븐스웨디시', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 대한항공
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 대한항공';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대한항공';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('마포 대한항공', '건마', '마포', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 비비고 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 비비고 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비비고 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍대 비비고 1인샵', '건마', '홍대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 주유소1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 주유소1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주유소1인샵';
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
    VALUES ('구로 주유소1인샵', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 참이슬1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 참이슬1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '참이슬1인샵';
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
    VALUES ('영등포 참이슬1인샵', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 여친1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 여친1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여친1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '여의도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여의도 여친1인샵', '여의도', '여의도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 응급실 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 응급실 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '응급실 1인샵';
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
    VALUES ('마포 응급실 1인샵', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 플러팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 플러팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅';
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
    VALUES ('청주 플러팅', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 키티스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 키티스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '키티스';
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
    VALUES ('광명 키티스', '건마', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 부천릴렉스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 부천릴렉스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천릴렉스';
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
    VALUES ('부천 부천릴렉스', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 아일라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 아일라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아일라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 아일라', '건마', '의정부', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 활어 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 활어 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '활어 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 활어 스웨디시', '건마', '수원', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 ♧해피 아로마♧
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 ♧해피 아로마♧';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♧해피 아로마♧';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 ♧해피 아로마♧', '건마', '전주', '13:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 부비부비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 부비부비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부비부비';
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
    VALUES ('원주 부비부비', '원주', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 ❣️❄️ 아이돌 스웨디시 ❄️❣️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 ❣️❄️ 아이돌 스웨디시 ❄️❣️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❣️❄️ 아이돌 스웨디시 ❄️❣️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 ❣️❄️ 아이돌 스웨디시 ❄️❣️', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 미라쥬 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 미라쥬 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미라쥬 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 미라쥬 스웨디시', '건마', '남동구', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 핫플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 핫플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 핫플', '건마', '광주', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 스타킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 스타킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타킹';
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
    VALUES ('아산 스타킹', '건마', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 유빈1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 유빈1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유빈1인샵';
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
    VALUES ('대전 유빈1인샵', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 에르메스 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 에르메스 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에르메스 스웨디시';
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
    VALUES ('부천 에르메스 스웨디시', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산달리기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산달리기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산달리기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 일산달리기', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 소유1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 소유1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소유1인샵';
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
    VALUES ('남양주 소유1인샵', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 きもち
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 きもち';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'きもち';
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
    VALUES ('남양주 きもち', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 스토리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 스토리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스토리';
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
    VALUES ('분당 스토리', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 험머
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 험머';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '험머';
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
    VALUES ('안양 험머', '건마', '안양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 란다테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 란다테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '란다테라피';
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
    VALUES ('구미 란다테라피', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 체리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '경기남부 안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 체리', '경기남부 안산', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 일본소녀들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 일본소녀들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일본소녀들';
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
    VALUES ('남양주 일본소녀들', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 라이크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 라이크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라이크';
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
    VALUES ('수원 라이크', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 라온
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 라온';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라온';
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
    VALUES ('대전 라온', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 yeong sap
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 yeong sap';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'yeong sap';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 yeong sap', '건마', '영등포', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군자 썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군자 썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '군자'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군자 썸', '건마', '군자', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 삼시쎅기 짭가디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 삼시쎅기 짭가디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼시쎅기 짭가디시';
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
    VALUES ('구리 삼시쎅기 짭가디시', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 썸스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 썸스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '건대' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 썸스웨디시', '건대', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 하노이테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 하노이테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하노이테라피';
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
    VALUES ('김포 하노이테라피', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 드레스룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 드레스룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드레스룸';
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
    VALUES ('의정부 드레스룸', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 메이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 메이트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이트';
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
    VALUES ('구미 메이트', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 캔디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 캔디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캔디';
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
    VALUES ('수원 캔디', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 THE하이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 THE하이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'THE하이드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 THE하이드', '건마', '일산', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 j테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 j테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'j테라피';
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
    VALUES ('구로 j테라피', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 선아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 선아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선아1인샵';
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
    VALUES ('천안 선아1인샵', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 승무원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 승무원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '승무원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('병점 승무원', '건마', '병점', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 NEW하늘1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 NEW하늘1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW하늘1인샵';
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
    VALUES ('노원 NEW하늘1인샵', '건마', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 고은
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 고은';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고은';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 고은', '건마', '남양주', '12:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 감동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 감동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '감동';
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
    VALUES ('천안 감동', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 아드레날린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 아드레날린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아드레날린';
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
    VALUES ('분당 아드레날린', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 달달스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 달달스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달달스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('군산 달달스웨디시', '건마', '군산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 케이테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 케이테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '케이테라피';
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
    VALUES ('동탄 케이테라피', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 스타벅스스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 스타벅스스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타벅스스파';
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
    VALUES ('부천 스타벅스스파', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 새콤달콤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 새콤달콤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '새콤달콤스웨디시';
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
    VALUES ('대전 새콤달콤스웨디시', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 노원24시베트남스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 노원24시베트남스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노원24시베트남스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '노원' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 노원24시베트남스웨디시', '노원', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 라오스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 라오스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라오스';
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
    VALUES ('부천 라오스', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
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
    VALUES ('오산 시크릿', '건마', '오산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 핑크1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 핑크1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크1인샵';
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
    VALUES ('오산 핑크1인샵', '오산', '오산', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 펄스웨디시 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 펄스웨디시 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '펄스웨디시 1인샵';
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
    VALUES ('의정부 펄스웨디시 1인샵', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 란제리 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 란제리 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '란제리 스웨디시';
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
    VALUES ('의정부 란제리 스웨디시', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 디올스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 디올스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올스웨디시';
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
    VALUES ('동탄 디올스웨디시', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 처음처럼 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 처음처럼 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '처음처럼 스웨디시';
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
    VALUES ('안산 처음처럼 스웨디시', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 향남 여고생스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 향남 여고생스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '향남 여고생스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '향남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('향남 향남 여고생스웨디시', '건마', '향남', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 비비고스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 비비고스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비비고스웨디시';
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
    VALUES ('의정부 비비고스웨디시', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 민지1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 민지1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '민지1인샵';
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
    VALUES ('노원 민지1인샵', '건마', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 밤꽃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 밤꽃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밤꽃';
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
    VALUES ('오산 밤꽃', '오산', '오산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 최애의 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 최애의 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최애의 스웨디시';
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
    VALUES ('부천 최애의 스웨디시', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용현동 아로마테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용현동 아로마테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아로마테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용현동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용현동 아로마테라피', '건마', '용현동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 비밀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 비밀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비밀';
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
    VALUES ('구미 비밀', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 레이블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 레이블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 레이블', '건마', '구로', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 전원한국인(L.A)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 전원한국인(L.A)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전원한국인(L.A)';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 전원한국인(L.A)', '건마', '화성', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 상큼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 상큼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상큼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 상큼', '건마', '시흥', '10:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 구찌스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 구찌스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구찌스웨디시';
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
    VALUES ('전주 구찌스웨디시', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 엔젤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 엔젤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤스웨디시';
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
    VALUES ('양주 엔젤스웨디시', '건마', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 베이징
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 베이징';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베이징';
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
    VALUES ('전주 베이징', '건마', '전주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 베트남스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 베트남스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 베트남스웨디시', '건마', '수유', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 한녀1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 한녀1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한녀1인샵';
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
    VALUES ('영등포 한녀1인샵', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 1인샵 골드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 1인샵 골드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인샵 골드';
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
    VALUES ('의정부 1인샵 골드', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 썸바디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 썸바디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸바디';
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
    VALUES ('전주 썸바디', '건마', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 위글위글스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 위글위글스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '위글위글스웨디시';
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
    VALUES ('구로 위글위글스웨디시', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 제주엠지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 제주엠지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제주엠지';
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
    VALUES ('제주도 제주엠지', '건마', '제주도', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 온도스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 온도스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '온도스웨디시';
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
    VALUES ('안산 온도스웨디시', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 수지1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 수지1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수지1인샵';
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
    VALUES ('동대문 수지1인샵', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 유혜련 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 유혜련 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유혜련 1인샵';
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
    VALUES ('강동 유혜련 1인샵', '건마', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 푸딩 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 푸딩 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '푸딩 1인샵';
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
    VALUES ('부평 푸딩 1인샵', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 여우스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 여우스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '마곡' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강서 여우스웨디시', '마곡', '강서', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 맥심시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 맥심시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심시';
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
    VALUES ('이천 맥심시', '건마', '이천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 러시아스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 러시아스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 러시아스웨디시', '건마', '하남', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 쌍문
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 쌍문';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쌍문';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 쌍문', '건마', '천안', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 퍼펙트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 퍼펙트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼펙트';
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
    VALUES ('동탄 퍼펙트', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 일프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 일프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로';
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
    VALUES ('동탄 일프로', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 플러팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 플러팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅';
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
    VALUES ('동탄 플러팅', '건마', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 외모지상주의 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 외모지상주의 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '외모지상주의 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 외모지상주의 스웨디시', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 솜사탕스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 솜사탕스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '화성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 솜사탕스웨디시', '화성', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 메이드테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 메이드테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드테라피';
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
    VALUES ('송파 메이드테라피', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 원타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 원타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원타이';
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
    VALUES ('평촌 원타이', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 코코센슈얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 코코센슈얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '코코센슈얼';
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
    VALUES ('수원 코코센슈얼', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 셀럽스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 셀럽스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셀럽스웨디시';
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
    VALUES ('김포 셀럽스웨디시', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 헤라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 헤라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤라';
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
    VALUES ('구미 헤라', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 디올스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 디올스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디올스웨디시';
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
    VALUES ('강서 디올스웨디시', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 토트넘 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 토트넘 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '토트넘 스웨디시';
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
    VALUES ('남양주 토트넘 스웨디시', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수미니네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수미니네';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수미니네';
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
    VALUES ('수원 수미니네', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 퍼스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 퍼스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼스트';
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
    VALUES ('천안 퍼스트', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 딸기타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 딸기타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기타이';
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
    VALUES ('일산 딸기타이', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 사운드스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 사운드스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사운드스웨디시';
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
    VALUES ('수원 사운드스웨디시', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 샤인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 샤인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 샤인', '건마', '천안', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대';
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
    VALUES ('강서 20대', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 홍고홍짱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 홍고홍짱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍고홍짱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 홍고홍짱', '건마', '청주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 제주핫플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 제주핫플';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제주핫플';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '제주도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제주도 제주핫플', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 러블리스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 러블리스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러블리스웨디시';
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
    VALUES ('용인 러블리스웨디시', '건마', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 24시베트남스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 24시베트남스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시베트남스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('잠실 24시베트남스웨디시', '건마', '잠실', '11:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 샵레인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 샵레인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샵레인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 샵레인', '건마', '용인', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 데자뷰아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 데자뷰아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데자뷰아로마';
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
    VALUES ('주안 데자뷰아로마', '건마', '주안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 란제리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 란제리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '란제리';
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
    VALUES ('대구 란제리', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 msg1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 msg1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'msg1인샵';
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
    VALUES ('청주 msg1인샵', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 해피테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 해피테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해피테라피';
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
    VALUES ('평촌 해피테라피', '평촌', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 달팽이스웨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 달팽이스웨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달팽이스웨';
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
    VALUES ('강동 달팽이스웨', '건마', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 잠실쉬멜스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 잠실쉬멜스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잠실쉬멜스웨디시';
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
    VALUES ('잠실 잠실쉬멜스웨디시', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 마스크바디테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 마스크바디테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마스크바디테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '대구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대구 마스크바디테라피', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 밀크티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 밀크티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밀크티';
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
    VALUES ('평택 밀크티', '건마', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 다니 1인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 다니 1인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다니 1인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '15:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 다니 1인', '건마', '부천', '15:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 Y
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 Y';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Y';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 Y', '건마', '대전', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 천상계
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 천상계';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천상계';
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
    VALUES ('의정부 천상계', '건마', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 원스탑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 원스탑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원스탑';
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
    VALUES ('구미 원스탑', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 힐링타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 힐링타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링타이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 힐링타이', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 꼬카인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 꼬카인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꼬카인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 꼬카인', '건마', '평택', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 윤희1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 윤희1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '윤희1인샵';
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
    VALUES ('창동 윤희1인샵', '건마', '창동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 구찌1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 구찌1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구찌1인샵';
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
    VALUES ('평택 구찌1인샵', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 다정1인샾
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 다정1인샾';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다정1인샾';
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
    VALUES ('수원 다정1인샾', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 도쿄건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 도쿄건마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄건마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 도쿄건마', '건마', '천안', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 바나나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 바나나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나';
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
    VALUES ('구미 바나나', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 눈나난나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 눈나난나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '눈나난나';
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
    VALUES ('구미 눈나난나', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광교 광교 스너글 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광교 광교 스너글 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '광교 스너글 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '광교'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '광교' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광교 광교 스너글 스웨디시', '광교', '광교', '10:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 태양
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 태양';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태양';
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
    VALUES ('분당 태양', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 설렘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 설렘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설렘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 설렘', '건마', '천안', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 뱀사안사스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 뱀사안사스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뱀사안사스웨디시';
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
    VALUES ('계양 뱀사안사스웨디시', '계양', '계양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 루나바디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 루나바디';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루나바디';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 루나바디', '건마', '일산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 바나나스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 바나나스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바나나스웨디시';
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
    VALUES ('수원 바나나스웨디시', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 핫플 멀티플레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 핫플 멀티플레이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플 멀티플레이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 핫플 멀티플레이', '건마', '남양주', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 한국럭셔리스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 한국럭셔리스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국럭셔리스웨디시';
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
    VALUES ('구로 한국럭셔리스웨디시', '건마', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 PARIS스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 PARIS스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'PARIS스웨디시';
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
    VALUES ('강서 PARIS스웨디시', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 별빛 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 별빛 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별빛 아로마';
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
    VALUES ('구미 별빛 아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 에스테소피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 에스테소피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에스테소피';
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
    VALUES ('구미 에스테소피', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 포엠 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 포엠 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포엠 스웨디시';
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
    VALUES ('청주 포엠 스웨디시', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 도파민스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 도파민스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민스웨디시';
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
    VALUES ('익산 도파민스웨디시', '익산', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 헤븐스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 헤븐스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐스웨디시';
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
    VALUES ('수원 헤븐스웨디시', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 미끄덩 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 미끄덩 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미끄덩 스웨디시';
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
    VALUES ('송파 미끄덩 스웨디시', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 혜린1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 혜린1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '혜린1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 혜린1인샵', '건마', '남양주', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 과일가게
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 과일가게';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '과일가게';
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
    VALUES ('구미 과일가게', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 한국매니저 애순이1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 한국매니저 애순이1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국매니저 애순이1인샵';
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
    VALUES ('평촌 한국매니저 애순이1인샵', '평촌', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 백석 황궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 백석 황궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백석 황궁';
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
    VALUES ('일산 백석 황궁', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 엔젤스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 엔젤스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤스웨디시';
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
    VALUES ('김포 엔젤스웨디시', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 만수르 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 만수르 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만수르 스웨디시';
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
    VALUES ('강서 만수르 스웨디시', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 일퍼센트(1인샵)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 일퍼센트(1인샵)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일퍼센트(1인샵)';
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
    VALUES ('의정부 일퍼센트(1인샵)', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 이지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 이지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 이지', '건마', '전주', '13:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 젤리스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 젤리스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '젤리스웨디시';
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
    VALUES ('일산 젤리스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 MVP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 MVP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'MVP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 MVP', '건마', '일산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 샤인 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 샤인 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤인 스웨디시';
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
    VALUES ('대전 샤인 스웨디시', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 하드1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 하드1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드1인샵';
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
    VALUES ('상봉 하드1인샵', '건마', '상봉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 하트', '건마', '동탄', '10:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 밤꽃1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 밤꽃1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밤꽃1인샵';
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
    VALUES ('김포 밤꽃1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP마카롱스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP마카롱스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVIP마카롱스웨디시';
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
    VALUES ('강남 VVIP마카롱스웨디시', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 판타지1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 판타지1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판타지1인샵';
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
    VALUES ('구미 판타지1인샵', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 예서1인샾
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 예서1인샾';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예서1인샾';
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
    VALUES ('남양주 예서1인샾', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 메이드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 메이드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메이드';
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
    VALUES ('김포 메이드', '건마', '김포', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 하남프라다1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 하남프라다1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하남프라다1인샵';
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
    VALUES ('하남 하남프라다1인샵', '하남', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 모찌스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 모찌스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모찌스웨디시';
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
    VALUES ('계양 모찌스웨디시', '건마', '계양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 에비앙 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 에비앙 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에비앙 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '청라'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청라 에비앙 1인샵', '건마', '청라', '10:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 더명품스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 더명품스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더명품스웨디시';
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
    VALUES ('김포 더명품스웨디시', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 리드엠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 리드엠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '리드엠';
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
    VALUES ('청주 리드엠', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 다낭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 다낭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다낭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 다낭', '건마', '대전', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전다낭스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전다낭스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전다낭스웨디시';
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
    VALUES ('대전 대전다낭스웨디시', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 송도S라인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 송도S라인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송도S라인';
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
    VALUES ('송도 송도S라인', '건마', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 ♣ 엣지아로마 ♣
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 ♣ 엣지아로마 ♣';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♣ 엣지아로마 ♣';
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
    VALUES ('전주 ♣ 엣지아로마 ♣', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 soo이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 soo이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'soo이';
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
    VALUES ('평촌 soo이', '건마', '평촌', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 삼송파스텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 삼송파스텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼송파스텔';
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
    VALUES ('고양 삼송파스텔', '건마', '고양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 틱톡테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 틱톡테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '틱톡테라피';
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
    VALUES ('대구 틱톡테라피', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 별 스웨디시 시즌5
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 별 스웨디시 시즌5';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별 스웨디시 시즌5';
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
    VALUES ('부천 별 스웨디시 시즌5', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 솜사탕스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 솜사탕스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 솜사탕스웨디시', '건마', '포항', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 헤븐 스웨디시 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 헤븐 스웨디시 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헤븐 스웨디시 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '포항' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 헤븐 스웨디시 1인샵', '포항', '포항', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 스테이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 스테이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스테이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 스테이', '건마', '포항', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 티아라 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 티아라 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티아라 스웨디시';
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
    VALUES ('광주 티아라 스웨디시', '건마', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 ALL에이스1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 ALL에이스1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ALL에이스1인샵';
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
    VALUES ('남양주 ALL에이스1인샵', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
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
    VALUES ('구미 여우', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 마인드', '건마', '전주', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 Mirror스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 Mirror스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Mirror스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 Mirror스웨디시', '부천', '부천', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 아수라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 아수라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아수라';
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
    VALUES ('병점 아수라', '건마', '병점', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 루미에르1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 루미에르1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루미에르1인샵';
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
    VALUES ('의정부 루미에르1인샵', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 라온스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 라온스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라온스웨디시';
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
    VALUES ('일산 라온스웨디시', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포항 히트테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포항 히트테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히트테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '포항'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('포항 히트테라피', '건마', '포항', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 GOLD CLASS
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 GOLD CLASS';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'GOLD CLASS';
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
    VALUES ('구미 GOLD CLASS', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 단짠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 단짠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '단짠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('장안 단짠', '건마', '장안', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 최지원1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 최지원1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최지원1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('논현 최지원1인샵', '건마', '논현', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 샤넬스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 샤넬스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬스웨디시';
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
    VALUES ('안산 샤넬스웨디시', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 꽃구멍 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 꽃구멍 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꽃구멍 스웨디시';
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
    VALUES ('영등포 꽃구멍 스웨디시', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 달빛아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 달빛아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달빛아로마';
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
    VALUES ('구미 달빛아로마', '건마', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 유리 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 유리 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유리 1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '01:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송파 유리 1인샵', '건마', '송파', '12:00'::TIME, '01:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '동탄' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동탄 시크릿', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 크리드스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 크리드스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크리드스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '역삼' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강남 크리드스웨디시', '역삼', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 아산노리터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 아산노리터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아산노리터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 아산노리터', '건마', '아산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 검단라이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 검단라이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '검단라이즈';
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
    VALUES ('인천 검단라이즈', '인천', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 목구멍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 목구멍';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '목구멍';
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
    VALUES ('송파 목구멍', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 양귀비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 양귀비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양귀비';
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
    VALUES ('대전 양귀비', '건마', '대전', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 림프
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 림프';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '림프';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 림프', '건마', '천안', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 알뜨아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 알뜨아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '알뜨아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 알뜨아로마', '안산', '안산', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 놀러와
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 놀러와';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀러와';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '16:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 놀러와', '건마', '하남', '16:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 스마일스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 스마일스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스마일스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영등포 스마일스웨디시', '건마', '영등포', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 더블타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 더블타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더블타임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 더블타임', '건마', '성남', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 애플아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 애플아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 애플아로마', '일산', '일산', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 원피스1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 원피스1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원피스1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('장안 원피스1인샵', '건마', '장안', '11:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 만나스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 만나스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만나스웨디시';
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
    VALUES ('광명 만나스웨디시', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 핫몸 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 핫몸 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫몸 스웨디시';
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
    VALUES ('성남 핫몸 스웨디시', '성남', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 바니바니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 바니바니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바니바니';
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
    VALUES ('파주 바니바니', '건마', '파주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 방이동 나이스샷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '방이동 나이스샷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나이스샷';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '방이동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('방이동 나이스샷', '건마', '방이동', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광교 향기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광교 향기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '향기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광교'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광교 향기', '건마', '광교', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 마카오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 마카오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마카오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 마카오', '건마', '성북', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 여시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 여시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 여시', '건마', '일산', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 수연1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 수연1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수연1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '02:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '김포' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 수연1인샵', '김포', '김포', '12:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 골드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 골드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 골드', '건마', '양주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연신내 앨리스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연신내 앨리스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '앨리스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '연신내'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('연신내 앨리스', '건마', '연신내', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 마리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 마리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 마리', '건마', '원주', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 맥심스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 맥심스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맥심스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '금천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 맥심스웨디시', '금천', '금천', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 옥정마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 옥정마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '옥정마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 옥정마사지', '양주', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 스위티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 스위티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스위티';
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
    VALUES ('노원 스위티', '건마', '노원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목포 명
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목포 명';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '목포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목포 명', '건마', '목포', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 티파니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 티파니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티파니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 티파니', '건마', '남양주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 777아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 777아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '777아로마';
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
    VALUES ('평택 777아로마', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 CASS스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 CASS스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'CASS스웨디시';
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
    VALUES ('남양주 CASS스웨디시', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 명품
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 명품';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 명품', '건마', '수원', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 스위티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 스위티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스위티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 스위티', '건마', '남양주', '11:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 도아 하드스웨1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 도아 하드스웨1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도아 하드스웨1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '송도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 도아 하드스웨1인샵', '송도', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 프라다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 프라다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프라다';
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
    VALUES ('부천 프라다', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 도쿄1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 도쿄1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도쿄1인샵';
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
    VALUES ('김포 도쿄1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 야구장건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 야구장건마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야구장건마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '21:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('구로 야구장건마', '건마', '구로', '21:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 COCO
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 COCO';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'COCO';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 COCO', '건마', '천안', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 원피스 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 원피스 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원피스 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '남동구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남동구 원피스 스웨디시', '남동구', '남동구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 송도 임윤아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 송도 임윤아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송도 임윤아1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '송도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 송도 임윤아1인샵', '송도', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 굿데이아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 굿데이아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '굿데이아로마';
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
    VALUES ('수원 굿데이아로마', '수원', '수원', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 여우들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 여우들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 여우들', '건마', '평택', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 황제중국전통마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 황제중국전통마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황제중국전통마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광명 황제중국전통마사지', '건마', '광명', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 꾹꾹이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 꾹꾹이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꾹꾹이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('김포 꾹꾹이', '건마', '김포', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 홍콩아로다시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 홍콩아로다시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩아로다시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '성북'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성북 홍콩아로다시', '건마', '성북', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 해바라기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 해바라기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해바라기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '인천 서구 가정동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('인천 해바라기', '인천 서구 가정동', '인천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 짜요 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 짜요 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '짜요 아로마';
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
    VALUES ('일산 짜요 아로마', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 나비아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 나비아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나비아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '파주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('파주 나비아로마', '파주', '파주', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 송도 다영1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 송도 다영1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송도 다영1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '21:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '인천 연수구 송도동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 송도 다영1인샵', '인천 연수구 송도동', '송도', '11:00'::TIME, '21:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 오로라스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 오로라스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오로라스웨디시';
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
    VALUES ('청주 오로라스웨디시', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 S아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 S아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S아로마';
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
    VALUES ('수원 S아로마', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 에스마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 에스마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에스마사지';
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
    VALUES ('광주 에스마사지', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 첫날밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 첫날밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫날밤';
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
    VALUES ('향남 첫날밤', '건마', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 홍콩
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 홍콩';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '은평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('은평 홍콩', '건마', '은평', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 쇼타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 쇼타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쇼타임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '성남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 쇼타임', '성남', '성남', '11:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 연희1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 연희1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연희1인샵';
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
    VALUES ('남양주 연희1인샵', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 다이소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 다이소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '목동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('목동 다이소', '목동', '목동', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 황금종아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 황금종아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황금종아로마';
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
    VALUES ('강동 황금종아로마', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 DIOR디올
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 DIOR디올';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'DIOR디올';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 DIOR디올', '건마', '오산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 상쾌한
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 상쾌한';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상쾌한';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('원주 상쾌한', '건마', '원주', '14:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 쿤타이마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 쿤타이마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쿤타이마사지';
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
    VALUES ('광주 쿤타이마사지', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 럭스 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 럭스 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭스 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 럭스 스웨디시', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 귀족
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 귀족';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '귀족';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 귀족', '건마', '용인', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 러브하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 러브하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러브하트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 러브하트', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 에이스', '건마', '수원', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 뽕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 뽕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뽕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 뽕', '건마', '영종도', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안성 바다1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안성 바다1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바다1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안성'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '안성' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안성 바다1인샵', '안성', '안성', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 SS테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 SS테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'SS테라피';
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
    VALUES ('천안 SS테라피', '건마', '천안', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 버블스웨디시24시베트남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 버블스웨디시24시베트남';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버블스웨디시24시베트남';
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
    VALUES ('수원 버블스웨디시24시베트남', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 야생크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 야생크림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야생크림';
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
    VALUES ('천안 야생크림', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 럭키스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 럭키스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '럭키스타';
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
    VALUES ('의정부 럭키스타', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 황실아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 황실아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황실아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 황실아로마', '건마', '오산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 청담스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 청담스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청담스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('남양주 청담스파', '건마', '남양주', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 몽타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 몽타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '몽타이';
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
    VALUES ('광주 몽타이', '건마', '광주', '13:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 스카이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 스카이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스카이';
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
    VALUES ('평택 스카이', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 사쿠라스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 사쿠라스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사쿠라스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평택' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 사쿠라스웨디시', '평택', '평택', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 에브리원 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 에브리원 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에브리원 아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '건대' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 에브리원 아로마', '건대', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 소녀시대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 소녀시대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소녀시대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '서구' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서구 소녀시대', '서구', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여주 그린 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여주 그린 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '그린 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '여주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여주 그린 스웨디시', '여주', '여주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 조아아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 조아아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조아아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('하남 조아아로마', '건마', '하남', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 왕십리 비너스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '왕십리 비너스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비너스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '왕십리'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('왕십리 비너스', '건마', '왕십리', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 앨리스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 앨리스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '앨리스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 앨리스', '건마', '수유', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 더블루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 더블루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더블루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '평촌' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평촌 더블루', '평촌', '평촌', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 THE SPA
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 THE SPA';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'THE SPA';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('의정부 THE SPA', '건마', '의정부', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 시그널
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 시그널';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시그널';
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
    VALUES ('구미 시그널', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 다이아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 다이아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아';
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
    VALUES ('파주 다이아', '건마', '파주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여수 상하이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여수 상하이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상하이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여수'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '여수' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('여수 상하이', '여수', '여수', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 핫라인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 핫라인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫라인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '안양' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안양 핫라인', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 부평에이원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 부평에이원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부평에이원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 부평에이원', '건마', '부평', '10:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 수테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 수테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수테라피';
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
    VALUES ('부평 수테라피', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 더킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 더킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더킹';
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
    VALUES ('전주 더킹', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 황실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 황실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황실';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부평 황실', '건마', '부평', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 쿵떡쿵떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 쿵떡쿵떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쿵떡쿵떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 쿵떡쿵떡', '건마', '청주', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 황제스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 황제스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황제스웨디시';
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
    VALUES ('파주 황제스웨디시', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 요로시쿠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 요로시쿠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '요로시쿠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 요로시쿠', '건마', '일산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 xo
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 xo';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'xo';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 xo', '건마', '화성', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 비비스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 비비스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비비스웨디시';
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
    VALUES ('제주도 비비스웨디시', '건마', '제주도', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 가인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 가인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가인';
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
    VALUES ('향남 가인', '건마', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 정
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 정';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('울산 정', '건마', '울산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 물결테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 물결테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물결테라피';
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
    VALUES ('수원 물결테라피', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 봄이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 봄이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봄이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '아산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 봄이', '아산', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 원샷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 원샷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원샷';
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
    VALUES ('안산 원샷', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당진 다이아 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당진 다이아 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아 스웨디시';
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
    VALUES ('당진 다이아 스웨디시', '건마', '당진', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 레드샷
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 레드샷';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드샷';
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
    VALUES ('김포 레드샷', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 놀러와
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 놀러와';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀러와';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('청주 놀러와', '건마', '청주', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 궁녀스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 궁녀스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁녀스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '일산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('일산 궁녀스웨디시', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 밤꽃1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 밤꽃1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '밤꽃1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 밤꽃1인샵', '건마', '분당', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 장미꽃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 장미꽃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장미꽃';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '익산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('익산 장미꽃', '건마', '익산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 모델
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 모델';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모델';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('가산 모델', '건마', '가산', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 도시미인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 도시미인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도시미인';
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
    VALUES ('영등포 도시미인', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 S
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 S';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'S';
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
    VALUES ('오산 S', '오산', '오산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 골든 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 골든 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골든 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '용인' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('용인 골든 스웨디시', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중랑 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중랑 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '중랑'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('중랑 여자친구', '건마', '중랑', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '간석'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('간석 에이스', '건마', '간석', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 데이스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 데이스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데이스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '창동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 데이스웨디시', '창동', '창동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 풀하우스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 풀하우스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀하우스';
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
    VALUES ('성남 풀하우스', '성남', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 드라마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 드라마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '드라마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '01:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 드라마', '건마', '천안', '11:00'::TIME, '01:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 들어와
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 들어와';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '들어와';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '양주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('양주 들어와', '양주', '양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 여자친구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 여자친구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여자친구';
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
    VALUES ('강서 여자친구', '건마', '강서', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 핫스팟
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 핫스팟';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫스팟';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '오산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('오산 핫스팟', '건마', '오산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 로즈스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 로즈스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로즈스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '부천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('부천 로즈스웨디시', '부천', '부천', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 신비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 신비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신비';
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
    VALUES ('일산 신비', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 황궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 황궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황궁';
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
    VALUES ('강남 황궁', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 진안동태국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 진안동태국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진안동태국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 진안동태국', '건마', '평택', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 삼다수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 삼다수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼다수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 삼다수', '건마', '아산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 야시시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 야시시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야시시';
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
    VALUES ('시흥 야시시', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 아미1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 아미1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아미1인샵';
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
    VALUES ('안산 아미1인샵', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 예빈1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 예빈1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예빈1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 예빈1인샵', '건마', '송도', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 헬로테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 헬로테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '헬로테라피';
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
    VALUES ('대구 헬로테라피', '건마', '대구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 오아시스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 오아시스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오아시스';
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
    VALUES ('수원 오아시스', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 스타스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 스타스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타스웨디시';
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
    VALUES ('영등포 스타스웨디시', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 로미로미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 로미로미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로미로미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 로미로미', '건마', '분당', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 세종 이끌림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '세종 이끌림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이끌림';
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
    VALUES ('세종 이끌림', '건마', '세종', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 보령 상하이마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '보령 상하이마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상하이마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '보령'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '보령' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('보령 상하이마사지', '보령', '보령', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 제니아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 제니아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('시흥 제니아', '건마', '시흥', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 PARADISE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 PARADISE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'PARADISE';
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
    VALUES ('강남 PARADISE', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 셀리느
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 셀리느';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셀리느';
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
    VALUES ('병점 셀리느', '건마', '병점', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 문정 폭스(FOX)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 문정 폭스(FOX)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '문정 폭스(FOX)';
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
    VALUES ('송파 문정 폭스(FOX)', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 애플힐링샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 애플힐링샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플힐링샵';
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
    VALUES ('경주 애플힐링샵', '경주', '경주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 야래향수완24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 야래향수완24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야래향수완24시';
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
    VALUES ('광주 야래향수완24시', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 왕십리 베스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '왕십리 베스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베스트';
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
    VALUES ('왕십리 베스트', '건마', '왕십리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 아우라스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 아우라스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아우라스웨디시';
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
    VALUES ('수유 아우라스웨디시', '건마', '수유', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 TOKYO1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 TOKYO1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'TOKYO1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 TOKYO1인샵', '건마', '분당', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 맘마미아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 맘마미아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맘마미아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('노원 맘마미아', '건마', '노원', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 블링블링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 블링블링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블링블링';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('분당 블링블링', '건마', '분당', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 해바라기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 해바라기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해바라기';
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
    VALUES ('은평 해바라기', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 별테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 별테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별테라피';
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
    VALUES ('군산 별테라피', '건마', '군산', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 리앤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 리앤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '리앤';
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
    VALUES ('김포 리앤', '건마', '김포', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 스위트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 스위트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스위트';
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
    VALUES ('익산 스위트', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 와우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 와우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '와우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 와우', '건마', '평택', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 여우스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 여우스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우스웨디시';
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
    VALUES ('파주 여우스웨디시', '건마', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화성 하이난아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화성 하이난아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이난아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '화성'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('화성 하이난아로마', '건마', '화성', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 첫키스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 첫키스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫키스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '건대' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('건대 첫키스', '건대', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 탑스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 탑스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탑스파';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '아산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '아산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('아산 탑스파', '아산', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 포승 청춘충전소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '포승 청춘충전소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청춘충전소';
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
    VALUES ('포승 청춘충전소', '포승', '포승', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 인생타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 인생타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인생타이';
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
    VALUES ('광주 인생타이', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 포카리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 포카리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '포카리';
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
    VALUES ('하남 포카리', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 한국셀린느스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 한국셀린느스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국셀린느스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('광주 한국셀린느스웨디시', '광주', '광주', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 천외천
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 천외천';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천외천';
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
    VALUES ('광주 천외천', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 미래
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 미래';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미래';
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
    VALUES ('성남 미래', '성남', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 시크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 시크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크';
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
    VALUES ('하남 시크', '건마', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 베스트아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 베스트아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베스트아로마';
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
    VALUES ('마포 베스트아로마', '건마', '마포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 한국인핫풀스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 한국인핫풀스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국인핫풀스웨디시';
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
    VALUES ('부천 한국인핫풀스웨디시', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 봄이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 봄이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봄이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '금천' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('금천 봄이', '금천', '금천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 블링1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 블링1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블링1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('평택 블링1인샵', '안마', '평택', '12:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 수아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 수아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수아로마';
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
    VALUES ('파주 수아로마', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 차이나클래스 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 차이나클래스 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '차이나클래스 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '송도' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('송도 차이나클래스 스웨디시', '송도', '송도', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크';
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
    VALUES ('부평 핑크', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 해월궁떡집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 해월궁떡집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해월궁떡집';
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
    VALUES ('부천 해월궁떡집', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 수인마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 수인마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수인마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강릉'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '강릉' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강릉 수인마사지', '강릉', '강릉', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 지중해스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 지중해스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '지중해스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('강동 지중해스웨디시', '건마', '강동', '12:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 방이동 moon
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '방이동 moon';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'moon';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '방이동'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('방이동 moon', '건마', '방이동', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 킹아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 킹아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('성남 킹아로마', '건마', '성남', '11:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 크림 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 크림 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크림 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '창동' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창동 크림 스웨디시', '창동', '창동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 JJ테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 JJ테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'JJ테라피';
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
    VALUES ('신림 JJ테라피', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 선민1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 선민1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선민1인샵';
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
    VALUES ('건대 선민1인샵', '건마', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 관악구 향기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '관악구 향기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '향기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '관악구'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('관악구 향기', '건마', '관악구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 나이스타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 나이스타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나이스타이';
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
    VALUES ('광주 나이스타이', '광주', '광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 익산 후궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '익산 후궁';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후궁';
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
    VALUES ('익산 후궁', '건마', '익산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 해바라기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 해바라기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해바라기';
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
    VALUES ('향남 해바라기', '건마', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 0.5 멕켈란 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 0.5 멕켈란 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '0.5 멕켈란 스웨디시';
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
    VALUES ('강남 0.5 멕켈란 스웨디시', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 제니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 제니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니';
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
    VALUES ('분당 제니', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 양귀비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 양귀비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양귀비';
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
    VALUES ('안산 양귀비', '건마', '안산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 벨라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 벨라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벨라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('천안 벨라', '건마', '천안', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 꿀바나나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 꿀바나나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀바나나';
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
    VALUES ('강서 꿀바나나', '건마', '강서', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 아산 샤넬테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '아산 샤넬테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬테라피';
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
    VALUES ('아산 샤넬테라피', '건마', '아산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 라이크바이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 라이크바이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라이크바이';
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
    VALUES ('수원 라이크바이', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 솜사탕스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 솜사탕스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솜사탕스웨디시';
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
    VALUES ('분당 솜사탕스웨디시', '건마', '분당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 킹아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 킹아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹아로마';
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
    VALUES ('향남 킹아로마', '건마', '향남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 레드문 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 레드문 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드문 아로마';
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
    VALUES ('하남 레드문 아로마', '하남', '하남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 명품
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 명품';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명품';
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
    VALUES ('주안 명품', '건마', '주안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 vip한국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 vip한국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'vip한국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '13:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수유 vip한국', '건마', '수유', '13:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 떡치GO
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 떡치GO';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '떡치GO';
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
    VALUES ('대전 떡치GO', '건마', '대전', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;