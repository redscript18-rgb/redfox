-- 오피가이드 데이터 마이그레이션 Part 5/7


-- 일산 미시플라워 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미시플라워 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미시플라워 아로마';
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
    VALUES ('일산 미시플라워 아로마', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 G스파실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 G스파실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'G스파실장';
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
    VALUES ('선릉 G스파실장', '건마', '선릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 미소녀s
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 미소녀s';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미소녀s';
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
    VALUES ('천안 미소녀s', '건마', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 콩콩
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 콩콩';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '콩콩';
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
    VALUES ('신림 콩콩', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 누드마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 누드마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '누드마사지';
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
    VALUES ('선릉 누드마사지', '건마', '선릉', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 무궁화
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 무궁화';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '무궁화';
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
    VALUES ('용산 무궁화', '건마', '용산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 구리KING스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 구리KING스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구리KING스웨디시';
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
    VALUES ('구리 구리KING스웨디시', '건마', '구리', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 외로운늑대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 외로운늑대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '외로운늑대';
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
    VALUES ('구로 외로운늑대', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 다산 유주1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 다산 유주1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다산 유주1인샵';
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
    VALUES ('남양주 다산 유주1인샵', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 NEW남주1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 NEW남주1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW남주1인샵';
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
    VALUES ('일산 NEW남주1인샵', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 느루스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 느루스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '느루스파';
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
    VALUES ('건대 느루스파', '건마', '건대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 벙커
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 벙커';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벙커';
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
    VALUES ('계양 벙커', '건마', '계양', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 다이쏘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 다이쏘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이쏘';
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
    VALUES ('원주 다이쏘', '건마', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 캐슬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 캐슬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '캐슬';
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
    VALUES ('원주 캐슬', '건마', '원주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 미수다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미수다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미수다';
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
    VALUES ('일산 미수다', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 세븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 세븐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세븐';
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
    VALUES ('경기광주 세븐', '건마', '경기광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링';
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
    VALUES ('부평 힐링', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제기 매직1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제기 매직1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '매직1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제기'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('제기 매직1인샵', '건마', '제기', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 방콕타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 방콕타이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방콕타이';
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
    VALUES ('송파 방콕타이', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 로망스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 로망스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로망스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '간석'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('간석 로망스', '건마', '간석', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 홍춘희
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 홍춘희';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍춘희';
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
    VALUES ('강남 홍춘희', '건마', '강남', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 텐프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 텐프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '텐프로';
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
    VALUES ('군산 텐프로', '건마', '군산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양재 타이스토리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양재 타이스토리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '타이스토리';
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
    VALUES ('양재 타이스토리', '건마', '양재', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 골드스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 골드스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '골드스타';
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
    VALUES ('부평 골드스타', '건마', '부평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원레전드';
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
    VALUES ('수원 수원레전드', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 플라워';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플라워';
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
    VALUES ('양주 플라워', '건마', '양주', '12:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 슈가스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 슈가스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈가스웨디시';
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
    VALUES ('강릉 슈가스웨디시', '건마', '강릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 APPLE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 APPLE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'APPLE';
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
    VALUES ('시흥 APPLE', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 딸기데이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 딸기데이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기데이';
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
    VALUES ('시흥 딸기데이', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 멤버쉽스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 멤버쉽스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멤버쉽스웨디시';
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
    VALUES ('강릉 멤버쉽스웨디시', '건마', '강릉', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 청포도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 청포도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청포도';
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
    VALUES ('청주 청포도', '건마', '청주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 힐아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 힐아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐아로마';
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
    VALUES ('군산 힐아로마', '건마', '군산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 조개비비기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 조개비비기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조개비비기';
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
    VALUES ('천안 조개비비기', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 미인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 미인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인';
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
    VALUES ('영등포 미인', '건마', '영등포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 부천물바다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 부천물바다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천물바다';
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
    VALUES ('부천 부천물바다', '건마', '부천', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 베스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 베스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베스트';
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
    VALUES ('경주 베스트', '건마', '경주', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 순천 미인천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '순천 미인천국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미인천국';
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
    VALUES ('순천 미인천국', '건마', '순천', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 홍콩spa
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 홍콩spa';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍콩spa';
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
    VALUES ('시흥 홍콩spa', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 충주 궁 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '충주 궁 아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '궁 아로마';
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
    VALUES ('충주 궁 아로마', '건마', '충주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 망고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 망고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '망고';
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
    VALUES ('시흥 망고', '건마', '시흥', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 간질간질
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 간질간질';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '간질간질';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 간질간질', '건마', '안산', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 엔젤라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 엔젤라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤라';
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
    VALUES ('동대문 엔젤라', '건마', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 여우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우';
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
    VALUES ('시흥 여우', '건마', '시흥', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 하나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 하나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하나';
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
    VALUES ('남양주 하나', '건마', '남양주', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 진로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 진로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진로';
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
    VALUES ('수원 진로', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 구래탑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 구래탑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구래탑';
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
    VALUES ('김포 구래탑', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 서지연1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 서지연1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서지연1인샵';
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
    VALUES ('일산 서지연1인샵', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안성 방콕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안성 방콕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방콕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '14:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '안성'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안성 방콕', '건마', '안성', '14:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서대문 수아1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서대문 수아1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수아1인샵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서대문'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('서대문 수아1인샵', '건마', '서대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 첫눈애1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 첫눈애1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '첫눈애1인샵';
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
    VALUES ('천안 첫눈애1인샵', '건마', '천안', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 소다 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 소다 1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소다 1인샵';
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
    VALUES ('김포 소다 1인샵', '건마', '김포', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디시';
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
    VALUES ('수원 디시', '건마', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 천상계1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 천상계1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천상계1인샵';
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
    VALUES ('구월 천상계1인샵', '건마', '구월', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 라온스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 라온스파';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라온스파';
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
    VALUES ('남양주 라온스파', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 허니 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 허니 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '허니 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 허니 스웨디시', '건마', '동대문', '10:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍성 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍성 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '홍성'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충청남도 홍성군 홍성읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('홍성 샤넬', '충청남도 홍성군 홍성읍', '홍성', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 한국인스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 한국인스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한국인스웨디시';
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
    VALUES ('홍대 한국인스웨디시', '건마', '홍대', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
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
    VALUES ('수원 도파민', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 다락방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 다락방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다락방';
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
    VALUES ('일산 다락방', '건마', '일산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경주 발렌타인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경주 발렌타인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '발렌타인';
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
    VALUES ('경주 발렌타인', '건마', '경주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 오늘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 오늘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오늘';
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
    VALUES ('역삼 오늘', '건마', '역삼', '11:00'::TIME, '02:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논산 달콤 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논산 달콤 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달콤 스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논산'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '논산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('논산 달콤 스웨디시', '논산', '논산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 방이동 오로라 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '방이동 오로라 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오로라 스웨디시';
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
    VALUES ('방이동 오로라 스웨디시', '건마', '방이동', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 힐링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링';
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
    VALUES ('은평 힐링', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 일프로스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 일프로스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로스웨디시';
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
    VALUES ('사당 일프로스웨디시', '건마', '사당', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 속초 엔젤테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '속초 엔젤테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엔젤테라피';
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
    VALUES ('속초 엔젤테라피', '건마', '속초', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 야몽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 야몽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야몽';
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
    VALUES ('송파 야몽', '건마', '송파', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 인조이스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 인조이스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인조이스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '동대문' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('동대문 인조이스웨디시', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 힐링 (황금손마사지)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 힐링 (황금손마사지)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '힐링 (황금손마사지)';
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
    VALUES ('신림 힐링 (황금손마사지)', '건마', '신림', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기';
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
    VALUES ('울산 딸기', '건마', '울산', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영종도 야몽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영종도 야몽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야몽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '03:00'::TIME,
      region = COALESCE(region, '영종도'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('영종도 야몽', '건마', '영종도', '12:00'::TIME, '03:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 속초 Chill 테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '속초 Chill 테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Chill 테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '속초'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('속초 Chill 테라피', '건마', '속초', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 미시수애1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 미시수애1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미시수애1인샵';
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
    VALUES ('강남 미시수애1인샵', '건마', '강남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원1인샵초희
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원1인샵초희';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원1인샵초희';
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
    VALUES ('수원 수원1인샵초희', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 순정테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 순정테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '순정테라피';
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
    VALUES ('성남 순정테라피', '건마', '성남', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 향남 여우마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '향남 여우마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여우마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '향남'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '향남' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('향남 여우마사지', '향남', '향남', '24:00'::TIME, '24:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 보령 몽 마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '보령 몽 마사지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '몽 마사지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '보령'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('보령 몽 마사지', '건마', '보령', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 은평 태후
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '은평 태후';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태후';
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
    VALUES ('은평 태후', '건마', '은평', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 오로라앤데이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 오로라앤데이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오로라앤데이';
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
    VALUES ('수원 오로라앤데이', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성북 가인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성북 가인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가인';
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
    VALUES ('성북 가인', '건마', '성북', '06:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 애플 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 애플 스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '애플 스웨디시';
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
    VALUES ('서구 애플 스웨디시', '서구', '서구', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 음성 꿀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '음성 꿀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '꿀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '음성'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '충청북도 음성군 음성읍' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('음성 꿀', '충청북도 음성군 음성읍', '음성', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 시우1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 시우1인샵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시우1인샵';
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
    VALUES ('남양주 시우1인샵', '건마', '남양주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 경기광주 방콕스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '경기광주 방콕스웨디시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방콕스웨디시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '경기광주'),
      store_type = COALESCE(store_type, '건마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '건마' THEN '경기광주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('경기광주 방콕스웨디시', '경기광주', '경기광주', '10:00'::TIME, '05:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 라임테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 라임테라피';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라임테라피';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '11:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('창원 라임테라피', '건마', '창원', '11:00'::TIME, '04:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 24시극강마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 24시극강마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시극강마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시극강마인드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 24시극강마인드', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '24시극강마인드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 신세경실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 신세경실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신세경실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신세경실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 신세경실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '신세경실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 전지현실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 전지현실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전지현실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '전지현실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 전지현실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '전지현실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 천안어벤져스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 천안어벤져스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천안어벤져스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '천안어벤져스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 천안어벤져스', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '천안어벤져스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 마징가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 마징가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마징가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마징가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 마징가', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '마징가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 텐프로 K실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 텐프로 K실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '텐프로 K실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '텐프로 K실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 텐프로 K실장', '룸', '대전', '24:00'::TIME, '24:00'::TIME, '룸', '텐프로 K실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 김부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 김부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 김부장', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '김부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 김사랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 김사랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김사랑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김사랑')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 김사랑', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '김사랑')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 황태자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 황태자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황태자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '황태자')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 황태자', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '황태자')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 이쁜김다미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 이쁜김다미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이쁜김다미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이쁜김다미')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 이쁜김다미', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '이쁜김다미')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 신세경실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 신세경실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신세경실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신세경실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 신세경실장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '신세경실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 현아실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 현아실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '현아실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '현아실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 현아실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '현아실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 별밤스타실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 별밤스타실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '별밤스타실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '별밤스타실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 별밤스타실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '별밤스타실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 장원영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 장원영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장원영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '장원영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 장원영', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '장원영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 신민아실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 신민아실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신민아실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신민아실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 신민아실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '신민아실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 색종이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 색종이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '색종이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '색종이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 색종이', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '색종이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강철중
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강철중';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강철중';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강철중')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강철중', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '강철중')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 만져줘
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 만져줘';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만져줘';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '만져줘')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 만져줘', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '만져줘')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 강대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 강대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 강대표', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '강대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 라운드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 라운드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '라운드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '라운드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 라운드', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '라운드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 이하늘실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 이하늘실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이하늘실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이하늘실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 이하늘실장', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '이하늘실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 한별미녀실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 한별미녀실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한별미녀실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '한별미녀실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 한별미녀실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '한별미녀실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 국가대표 유리실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 국가대표 유리실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '국가대표 유리실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '국가대표 유리실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 국가대표 유리실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '국가대표 유리실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 전지현
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 전지현';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전지현';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '전지현')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 전지현', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '전지현')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 삼보
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 삼보';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삼보';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '삼보')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 삼보', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '삼보')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 송윤아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 송윤아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송윤아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '송윤아')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 송윤아', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '송윤아')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 베스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 베스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베스트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베스트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('인천 베스트', '룸', '인천', '10:00'::TIME, '05:00'::TIME, '룸', '베스트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 매직미러 백지영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 매직미러 백지영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '매직미러 백지영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '매직미러 백지영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 매직미러 백지영', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '매직미러 백지영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달토
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달토';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달토';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달토')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 달토', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '달토')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 스타킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 스타킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '스타킹')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 스타킹', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '스타킹')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 베테랑지상무
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 베테랑지상무';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베테랑지상무';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베테랑지상무')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 베테랑지상무', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '베테랑지상무')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 노래방', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 아이콘룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 아이콘룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이콘룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아이콘룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 아이콘룸', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '아이콘룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 이슬실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 이슬실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이슬실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이슬실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 이슬실장', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '이슬실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 금영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 금영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '금영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '금영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 금영', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '금영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 아이린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 아이린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이린';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아이린')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 아이린', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '아이린')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 정마담 유흥의꽃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 정마담 유흥의꽃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정마담 유흥의꽃';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정마담 유흥의꽃')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 정마담 유흥의꽃', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '정마담 유흥의꽃')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 강력추천업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 강력추천업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강력추천업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강력추천업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 강력추천업소', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '강력추천업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 민아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 민아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '민아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '민아')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('인천 민아', '룸', '인천', '10:00'::TIME, '05:00'::TIME, '룸', '민아')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 예쁜하린실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 예쁜하린실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예쁜하린실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '예쁜하린실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 예쁜하린실장', '룸', '대전', '06:00'::TIME, '06:00'::TIME, '룸', '예쁜하린실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 동탄1등 노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 동탄1등 노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '동탄1등 노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '동탄1등 노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 동탄1등 노래방', '룸', '동탄', '10:00'::TIME, '05:00'::TIME, '룸', '동탄1등 노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 삿포로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 삿포로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '삿포로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '삿포로')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('고양 삿포로', '룸', '고양', '10:00'::TIME, '05:00'::TIME, '룸', '삿포로')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 강력추천
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 강력추천';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강력추천';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강력추천')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 강력추천', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '강력추천')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 해운대 고구려
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 해운대 고구려';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해운대 고구려';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '해운대 고구려')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 해운대 고구려', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '해운대 고구려')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 김프로대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 김프로대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김프로대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김프로대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 김프로대표', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '김프로대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 박우리실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 박우리실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박우리실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '박우리실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 박우리실장', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '박우리실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 매직미러
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 매직미러';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '매직미러';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '매직미러')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 매직미러', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '매직미러')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 안석구실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 안석구실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안석구실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '안석구실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 안석구실장', '룸', '대전', '06:00'::TIME, '06:00'::TIME, '룸', '안석구실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 1등', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '1등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 아사히
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 아사히';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아사히';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아사히')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 아사히', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '아사히')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 하이네켄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 하이네켄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이네켄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이네켄')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 하이네켄', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '하이네켄')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연수구 연수동대식이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연수구 연수동대식이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연수동대식이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연수구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '연수동대식이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('연수구 연수동대식이', '룸', '연수구', '10:00'::TIME, '05:00'::TIME, '룸', '연수동대식이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 명월관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 명월관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '명월관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '명월관')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 명월관', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '명월관')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 우사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 우사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '우사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 우사장', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '우사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 정다운대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 정다운대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정다운대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정다운대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 정다운대표', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '정다운대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 레전드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레전드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '레전드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 레전드', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '레전드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달토예쁜수정
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달토예쁜수정';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달토예쁜수정';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달토예쁜수정')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 달토예쁜수정', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '달토예쁜수정')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 소지섭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 소지섭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소지섭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '소지섭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 소지섭', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '소지섭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 강남최초코스프레쩜오실사인증
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 강남최초코스프레쩜오실사인증';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남최초코스프레쩜오실사인증';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남최초코스프레쩜오실사인증')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 강남최초코스프레쩜오실사인증', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '강남최초코스프레쩜오실사인증')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 김레이너
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 김레이너';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김레이너';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김레이너')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 김레이너', '룸', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '김레이너')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 강남유앤미 예쁜여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 강남유앤미 예쁜여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남유앤미 예쁜여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '논현' ELSE address END
      , contact_name = COALESCE(contact_name, '강남유앤미 예쁜여실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 강남유앤미 예쁜여실장', '논현', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '강남유앤미 예쁜여실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 H에이치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 H에이치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'H에이치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'H에이치')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 H에이치', '룸', '대구', '10:00'::TIME, '05:00'::TIME, '룸', 'H에이치')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 투데이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 투데이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투데이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '투데이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 투데이', '룸', '대구', '10:00'::TIME, '05:00'::TIME, '룸', '투데이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 텐프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 텐프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '텐프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '텐프로')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 텐프로', '룸', '대구', '10:00'::TIME, '05:00'::TIME, '룸', '텐프로')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 탐방기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 탐방기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탐방기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '탐방기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 탐방기', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '탐방기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 ☀️일산 해롱이☀️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 ☀️일산 해롱이☀️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☀️일산 해롱이☀️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '☀️일산 해롱이☀️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 ☀️일산 해롱이☀️', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '☀️일산 해롱이☀️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '샤넬')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 샤넬', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '샤넬')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 달리는 토끼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 달리는 토끼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달리는 토끼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '역삼' ELSE address END
      , contact_name = COALESCE(contact_name, '달리는 토끼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 달리는 토끼', '역삼', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '달리는 토끼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 도파민24시터치룸 업주직영 우성대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 도파민24시터치룸 업주직영 우성대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민24시터치룸 업주직영 우성대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '도파민24시터치룸 업주직영 우성대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 도파민24시터치룸 업주직영 우성대표', '룸', '삼성', '10:00'::TIME, '05:00'::TIME, '룸', '도파민24시터치룸 업주직영 우성대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 하이쩜오3
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 하이쩜오3';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오3';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오3')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 하이쩜오3', '룸', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오3')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 ✨⎝⎛ 재방1등 ⎞⎠✨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 ✨⎝⎛ 재방1등 ⎞⎠✨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✨⎝⎛ 재방1등 ⎞⎠✨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '여의도' ELSE address END
      , contact_name = COALESCE(contact_name, '✨⎝⎛ 재방1등 ⎞⎠✨')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 ✨⎝⎛ 재방1등 ⎞⎠✨', '여의도', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '✨⎝⎛ 재방1등 ⎞⎠✨')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 인당15', '룸', '일산', '20:00'::TIME, '12:00'::TIME, '룸', '인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 2부
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 2부';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '2부';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '2부')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 2부', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '2부')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 ⭕성추행⭕하러오세요⭕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 ⭕성추행⭕하러오세요⭕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭕성추행⭕하러오세요⭕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신촌' ELSE address END
      , contact_name = COALESCE(contact_name, '⭕성추행⭕하러오세요⭕')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 ⭕성추행⭕하러오세요⭕', '신촌', '신촌', '10:00'::TIME, '05:00'::TIME, '룸', '⭕성추행⭕하러오세요⭕')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달토 지예은
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달토 지예은';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달토 지예은';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달토 지예은')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 달토 지예은', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '달토 지예은')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 셔츠룸 차은우 대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 셔츠룸 차은우 대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠룸 차은우 대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '셔츠룸 차은우 대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 셔츠룸 차은우 대표', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠룸 차은우 대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 이달의업
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 이달의업';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이달의업';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이달의업')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 이달의업', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '이달의업')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 24시 송이실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 24시 송이실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시 송이실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시 송이실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 24시 송이실장', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '24시 송이실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✴️달토✴️수위조전문✴️배정남대표✴️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✴️달토✴️수위조전문✴️배정남대표✴️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✴️달토✴️수위조전문✴️배정남대표✴️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✴️달토✴️수위조전문✴️배정남대표✴️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✴️달토✴️수위조전문✴️배정남대표✴️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✴️달토✴️수위조전문✴️배정남대표✴️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ♀️퍼펙트♀️♀️젠더♀️♀️아가씨보유1위♀️마동석형♀️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ♀️퍼펙트♀️♀️젠더♀️♀️아가씨보유1위♀️마동석형♀️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♀️퍼펙트♀️♀️젠더♀️♀️아가씨보유1위♀️마동석형♀️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '♀️퍼펙트♀️♀️젠더♀️♀️아가씨보유1위♀️마동석형♀️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ♀️퍼펙트♀️♀️젠더♀️♀️아가씨보유1위♀️마동석형♀️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '♀️퍼펙트♀️♀️젠더♀️♀️아가씨보유1위♀️마동석형♀️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✴️달토✴️⛔️터치자유기철부장⛔️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✴️달토✴️⛔️터치자유기철부장⛔️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✴️달토✴️⛔️터치자유기철부장⛔️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✴️달토✴️⛔️터치자유기철부장⛔️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✴️달토✴️⛔️터치자유기철부장⛔️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✴️달토✴️⛔️터치자유기철부장⛔️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 caffeine
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 caffeine';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'caffeine';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'caffeine')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 caffeine', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', 'caffeine')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 카페인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 카페인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카페인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, '카페인')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 카페인', '부천', '부천', '24:00'::TIME, '24:00'::TIME, '룸', '카페인')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 10만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 10만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '10만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '사당' ELSE address END
      , contact_name = COALESCE(contact_name, '10만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 10만원', '사당', '사당', '10:00'::TIME, '05:00'::TIME, '룸', '10만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 추천
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 추천';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '추천';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '추천')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 추천', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '추천')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 사당동 윤프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 사당동 윤프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사당동 윤프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '사당동 윤프로')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 사당동 윤프로', '룸', '사당', '24:00'::TIME, '24:00'::TIME, '룸', '사당동 윤프로')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 건대셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 건대셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '건대셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '건대' ELSE address END
      , contact_name = COALESCE(contact_name, '건대셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 건대셔츠룸', '건대', '건대', '24:00'::TIME, '24:00'::TIME, '룸', '건대셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 분당
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 분당';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분당')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 분당', '룸', '선릉', '06:00'::TIME, '06:00'::TIME, '룸', '분당')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 유호사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 유호사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유호사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유호사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 유호사장', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '유호사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 박대표1번
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 박대표1번';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박대표1번';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '평택' ELSE address END
      , contact_name = COALESCE(contact_name, '박대표1번')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 박대표1번', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '룸', '박대표1번')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 민정
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 민정';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '민정';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '민정')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 민정', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '민정')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 비키니룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 비키니룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비키니룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '비키니룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 비키니룸', '강남', '강남', '24:00'::TIME, '24:00'::TIME, '룸', '비키니룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 REINA
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 REINA';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'REINA';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'REINA')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 REINA', '룸', '계양', '06:00'::TIME, '06:00'::TIME, '룸', 'REINA')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 퍼펙트텐사이즈양주10만
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 퍼펙트텐사이즈양주10만';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼펙트텐사이즈양주10만';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '퍼펙트텐사이즈양주10만')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 퍼펙트텐사이즈양주10만', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '퍼펙트텐사이즈양주10만')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 셔츠하퍼3
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠하퍼3';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼3';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼3')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 셔츠하퍼3', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼3')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 강남구구단정통쩜오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 강남구구단정통쩜오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남구구단정통쩜오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남구구단정통쩜오')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 강남구구단정통쩜오', '룸', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '강남구구단정통쩜오')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 1인 8만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 1인 8만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인 8만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1인 8만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 1인 8만원', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '1인 8만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 영등포포차
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 영등포포차';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영등포포차';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '영등포포차')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 영등포포차', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '영등포포차')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 ▶⭐재방문 1등⭐◀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 ▶⭐재방문 1등⭐◀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▶⭐재방문 1등⭐◀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '▶⭐재방문 1등⭐◀')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 ▶⭐재방문 1등⭐◀', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '▶⭐재방문 1등⭐◀')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 하이셔츠룸1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 하이셔츠룸1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이셔츠룸1';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이셔츠룸1')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 하이셔츠룸1', '룸', '신촌', '10:00'::TIME, '05:00'::TIME, '룸', '하이셔츠룸1')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 하이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 하이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 하이', '룸', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '하이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 하드 BJ룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 하드 BJ룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드 BJ룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동대문' ELSE address END
      , contact_name = COALESCE(contact_name, '하드 BJ룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 하드 BJ룸', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '하드 BJ룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 하퍼&셔츠 홈런왕 오타니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 하퍼&셔츠 홈런왕 오타니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하퍼&셔츠 홈런왕 오타니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '계양' ELSE address END
      , contact_name = COALESCE(contact_name, '하퍼&셔츠 홈런왕 오타니')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 하퍼&셔츠 홈런왕 오타니', '계양', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '하퍼&셔츠 홈런왕 오타니')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 영등포
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 영등포';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영등포';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '영등포')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 영등포', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '영등포')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 20대', '룸', '영등포', '06:00'::TIME, '06:00'::TIME, '룸', '20대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 9시이전 특가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 9시이전 특가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '9시이전 특가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '9시이전 특가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 9시이전 특가', '룸', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '9시이전 특가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 셔츠하퍼2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 셔츠하퍼2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼2';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼2')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 셔츠하퍼2', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼2')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 9시이전특가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 9시이전특가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '9시이전특가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '9시이전특가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 9시이전특가', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '9시이전특가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 레드체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 레드체리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레드체리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '레드체리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 레드체리', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '레드체리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 24시', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 ➡️『❤️신림역2번출구❤️』⬅️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 ➡️『❤️신림역2번출구❤️』⬅️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '➡️『❤️신림역2번출구❤️』⬅️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '➡️『❤️신림역2번출구❤️』⬅️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 ➡️『❤️신림역2번출구❤️』⬅️', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '➡️『❤️신림역2번출구❤️』⬅️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 유흥가탐방기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 유흥가탐방기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유흥가탐방기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, '유흥가탐방기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 유흥가탐방기', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '유흥가탐방기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 찐구로 최저가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 찐구로 최저가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐구로 최저가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구로' ELSE address END
      , contact_name = COALESCE(contact_name, '찐구로 최저가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 찐구로 최저가', '구로', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '찐구로 최저가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 벗고노는동대문룸빵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 벗고노는동대문룸빵';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벗고노는동대문룸빵';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동대문' ELSE address END
      , contact_name = COALESCE(contact_name, '벗고노는동대문룸빵')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 벗고노는동대문룸빵', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '벗고노는동대문룸빵')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 최저가룸빵번개실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 최저가룸빵번개실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최저가룸빵번개실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동대문' ELSE address END
      , contact_name = COALESCE(contact_name, '최저가룸빵번개실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 최저가룸빵번개실장', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '최저가룸빵번개실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 긴급하드터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 긴급하드터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '긴급하드터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '긴급하드터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 긴급하드터치룸', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '긴급하드터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 셔츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 셔츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 셔츠', '룸', '신촌', '07:00'::TIME, '12:00'::TIME, '룸', '셔츠')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 블랙체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 블랙체리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙체리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '블랙체리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 블랙체리', '룸', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '블랙체리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 추천업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 추천업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '추천업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '추천업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 추천업소', '룸', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '추천업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 왕조개벌려터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 왕조개벌려터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '왕조개벌려터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '왕조개벌려터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 왕조개벌려터치룸', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '왕조개벌려터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '용산' ELSE address END
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 24시', '용산', '용산', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 벗고노는 긴급터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 벗고노는 긴급터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벗고노는 긴급터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '벗고노는 긴급터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 벗고노는 긴급터치룸', '룸', '신촌', '10:00'::TIME, '05:00'::TIME, '룸', '벗고노는 긴급터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연신내 1등최저가하드터치셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연신내 1등최저가하드터치셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등최저가하드터치셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연신내'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '연신내' ELSE address END
      , contact_name = COALESCE(contact_name, '1등최저가하드터치셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('연신내 1등최저가하드터치셔츠룸', '연신내', '연신내', '10:00'::TIME, '05:00'::TIME, '룸', '1등최저가하드터치셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 ❤️우수업소❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 ❤️우수업소❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️우수업소❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '종로' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️우수업소❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 ❤️우수업소❤️', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '❤️우수업소❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 ⭐️우수업체⭐️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 ⭐️우수업체⭐️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭐️우수업체⭐️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '종로' ELSE address END
      , contact_name = COALESCE(contact_name, '⭐️우수업체⭐️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 ⭐️우수업체⭐️', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '⭐️우수업체⭐️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 20대 풀싸롱 최저가보장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 20대 풀싸롱 최저가보장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대 풀싸롱 최저가보장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '20대 풀싸롱 최저가보장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 20대 풀싸롱 최저가보장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '20대 풀싸롱 최저가보장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 레이스', '룸', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 NEW
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 NEW';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'NEW')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 NEW', '룸', '삼성', '10:00'::TIME, '05:00'::TIME, '룸', 'NEW')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 ♥️최저가추천업소♥️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 ♥️최저가추천업소♥️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♥️최저가추천업소♥️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '용산' ELSE address END
      , contact_name = COALESCE(contact_name, '♥️최저가추천업소♥️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 ♥️최저가추천업소♥️', '용산', '용산', '10:00'::TIME, '05:00'::TIME, '룸', '♥️최저가추천업소♥️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 배드로전무
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 배드로전무';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '배드로전무';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '배드로전무')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 배드로전무', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '배드로전무')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 하드코어식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 하드코어식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드코어식';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드코어식')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 하드코어식', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '하드코어식')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 13만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 13만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '13만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '13만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 13만원', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '13만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 구로디지털단지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 구로디지털단지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구로디지털단지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구로디지털단지')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 구로디지털단지', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '구로디지털단지')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 1인전문
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 1인전문';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인전문';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1인전문')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 1인전문', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '1인전문')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 줄넘기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 줄넘기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '줄넘기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '줄넘기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 줄넘기', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '줄넘기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 13만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 13만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '13만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '13만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 13만원', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '13만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 ☀️최우수업소☀️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 ☀️최우수업소☀️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☀️최우수업소☀️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '☀️최우수업소☀️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 ☀️최우수업소☀️', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '☀️최우수업소☀️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 노라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 노라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노라')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 노라', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '노라')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 인당12
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 인당12';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당12';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '인당12')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 인당12', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '인당12')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️미슐랭하이퍼블릭❤️안성재대표❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️미슐랭하이퍼블릭❤️안성재대표❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️미슐랭하이퍼블릭❤️안성재대표❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️미슐랭하이퍼블릭❤️안성재대표❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ❤️미슐랭하이퍼블릭❤️안성재대표❤️', '강남', '강남', '24:00'::TIME, '24:00'::TIME, '룸', '❤️미슐랭하이퍼블릭❤️안성재대표❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 상무24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 상무24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상무24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '상무24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('송파 상무24시', '룸', '송파', '10:00'::TIME, '05:00'::TIME, '룸', '상무24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 티팬티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 티팬티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '티팬티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '티팬티')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 티팬티', '룸', '용산', '24:00'::TIME, '24:00'::TIME, '룸', '티팬티')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 최저가인당12
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 최저가인당12';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최저가인당12';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '최저가인당12')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 최저가인당12', '룸', '안양', '18:00'::TIME, '06:00'::TIME, '룸', '최저가인당12')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 최저가박대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 최저가박대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최저가박대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '최저가박대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 최저가박대표', '룸', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '최저가박대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 우수업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 우수업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우수업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '우수업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가산 우수업소', '룸', '가산', '10:00'::TIME, '05:00'::TIME, '룸', '우수업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 가성비 끝판왕 가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 가성비 끝판왕 가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가성비 끝판왕 가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '송파' ELSE address END
      , contact_name = COALESCE(contact_name, '가성비 끝판왕 가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('송파 가성비 끝판왕 가라오케', '송파', '송파', '10:00'::TIME, '05:00'::TIME, '룸', '가성비 끝판왕 가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 24시하이셔츠룸챌린지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 24시하이셔츠룸챌린지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시하이셔츠룸챌린지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시하이셔츠룸챌린지')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 24시하이셔츠룸챌린지', '룸', '구로', '18:00'::TIME, '06:00'::TIME, '룸', '24시하이셔츠룸챌린지')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 최저가인당12
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 최저가인당12';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최저가인당12';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '최저가인당12')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 최저가인당12', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '최저가인당12')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 24시', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 ✨✨이달의1등맛집✨✨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 ✨✨이달의1등맛집✨✨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✨✨이달의1등맛집✨✨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '✨✨이달의1등맛집✨✨')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 ✨✨이달의1등맛집✨✨', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '✨✨이달의1등맛집✨✨')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 여의도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 여의도';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여의도';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여의도')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 여의도', '룸', '여의도', '07:00'::TIME, '12:00'::TIME, '룸', '여의도')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 여대생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 여대생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여대생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여대생')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가산 여대생', '룸', '가산', '07:00'::TIME, '12:00'::TIME, '룸', '여대생')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 20대합법성추행
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 20대합법성추행';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대합법성추행';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대합법성추행')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 20대합법성추행', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '20대합법성추행')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 여대생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 여대생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여대생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여대생')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 여대생', '룸', '용산', '07:00'::TIME, '12:00'::TIME, '룸', '여대생')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 섹시채린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 섹시채린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹시채린';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '섹시채린')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 섹시채린', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '섹시채린')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 박부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 박부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '박부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 박부장', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '박부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 뷔페
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 뷔페';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뷔페';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '뷔페')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('의정부 뷔페', '룸', '의정부', '10:00'::TIME, '05:00'::TIME, '룸', '뷔페')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 독고환영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 독고환영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '독고환영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '독고환영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 독고환영', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '독고환영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 하이셔츠룸2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 하이셔츠룸2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이셔츠룸2';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이셔츠룸2')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 하이셔츠룸2', '룸', '신촌', '10:00'::TIME, '05:00'::TIME, '룸', '하이셔츠룸2')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 인증업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 인증업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인증업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인증업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 인증업소', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '인증업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 입금가부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 입금가부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '입금가부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '입금가부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 입금가부장', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '입금가부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 ✴█강남퍼펙트█✴제일예쁜✴Ⓜ️빡우리Ⓜ️✴여마담✴
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 ✴█강남퍼펙트█✴제일예쁜✴Ⓜ️빡우리Ⓜ️✴여마담✴';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✴█강남퍼펙트█✴제일예쁜✴Ⓜ️빡우리Ⓜ️✴여마담✴';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '논현' ELSE address END
      , contact_name = COALESCE(contact_name, '✴█강남퍼펙트█✴제일예쁜✴Ⓜ️빡우리Ⓜ️✴여마담✴')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 ✴█강남퍼펙트█✴제일예쁜✴Ⓜ️빡우리Ⓜ️✴여마담✴', '논현', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '✴█강남퍼펙트█✴제일예쁜✴Ⓜ️빡우리Ⓜ️✴여마담✴')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ▓✡️✴24시유앤미✴✡️마인드룸✡️최저가격✡️최대표✡️▓
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ▓✡️✴24시유앤미✴✡️마인드룸✡️최저가격✡️최대표✡️▓';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '▓✡️✴24시유앤미✴✡️마인드룸✡️최저가격✡️최대표✡️▓';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '▓✡️✴24시유앤미✴✡️마인드룸✡️최저가격✡️최대표✡️▓')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ▓✡️✴24시유앤미✴✡️마인드룸✡️최저가격✡️최대표✡️▓', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '▓✡️✴24시유앤미✴✡️마인드룸✡️최저가격✡️최대표✡️▓')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 1인전문 최우식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 1인전문 최우식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인전문 최우식';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1인전문 최우식')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 1인전문 최우식', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '1인전문 최우식')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 달리는토끼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 달리는토끼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달리는토끼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달리는토끼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 달리는토끼', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '달리는토끼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 수유 라스트셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 수유 라스트셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수유 라스트셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수유 라스트셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 수유 라스트셔츠룸', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '수유 라스트셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산하루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산하루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산하루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '울산하루')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산하루', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '울산하루')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하정우대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하정우대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하정우대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하정우대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 하정우대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '하정우대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 영등포-인당14하드한터☑️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 영등포-인당14하드한터☑️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영등포-인당14하드한터☑️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '영등포-인당14하드한터☑️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 영등포-인당14하드한터☑️', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '영등포-인당14하드한터☑️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 바로가기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 바로가기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바로가기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '바로가기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 바로가기', '룸', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '바로가기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 놀자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 놀자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '15:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '놀자')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 놀자', '룸', '삼성', '18:00'::TIME, '15:00'::TIME, '룸', '놀자')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신논현 보자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신논현 보자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '15:00'::TIME,
      region = COALESCE(region, '신논현'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '보자')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신논현 보자', '룸', '신논현', '18:00'::TIME, '15:00'::TIME, '룸', '보자')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 추천업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 추천업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '추천업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '추천업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 추천업소', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '추천업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 벗고놀아야지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 벗고놀아야지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벗고놀아야지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '벗고놀아야지')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 벗고놀아야지', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '벗고놀아야지')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 마동석대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 마동석대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마동석대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마동석대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 마동석대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '마동석대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 우수업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 우수업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우수업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '우수업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 우수업소', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '우수업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 NO.1 BJ터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 NO.1 BJ터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NO.1 BJ터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'NO.1 BJ터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 NO.1 BJ터치룸', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', 'NO.1 BJ터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 1인전문
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 1인전문';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인전문';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1인전문')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 1인전문', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '1인전문')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 수유셔츠룸탁재훈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 수유셔츠룸탁재훈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수유셔츠룸탁재훈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수유' ELSE address END
      , contact_name = COALESCE(contact_name, '수유셔츠룸탁재훈')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 수유셔츠룸탁재훈', '수유', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '수유셔츠룸탁재훈')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 수유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 수유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수유')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 수유', '룸', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '수유')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 부천유흥미슐랭영부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 부천유흥미슐랭영부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천유흥미슐랭영부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, '부천유흥미슐랭영부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 부천유흥미슐랭영부장', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '부천유흥미슐랭영부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 셔하1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 셔하1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔하1';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔하1')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 셔하1', '룸', '신촌', '17:00'::TIME, '04:00'::TIME, '룸', '셔하1')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 셔츠하퍼15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 셔츠하퍼15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 셔츠하퍼15', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 하이퍼블릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 하이퍼블릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이퍼블릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '고양' ELSE address END
      , contact_name = COALESCE(contact_name, '하이퍼블릭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 하이퍼블릭', '고양', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '하이퍼블릭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남매직미러풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남매직미러풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남매직미러풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '강남매직미러풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남매직미러풀싸롱', '강남', '강남', '17:00'::TIME, '06:00'::TIME, '룸', '강남매직미러풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '안양' ELSE address END
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 24시', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 10만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 10만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '10만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구로' ELSE address END
      , contact_name = COALESCE(contact_name, '10만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 10만원', '구로', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '10만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 베리굿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 베리굿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베리굿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베리굿')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 베리굿', '룸', '역삼', '06:00'::TIME, '06:00'::TIME, '룸', '베리굿')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 정우대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 정우대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정우대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정우대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 정우대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '정우대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구010
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구010';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구010';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구010')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구010', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '강서구010')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 잇뽕셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 잇뽕셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잇뽕셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '잇뽕셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 잇뽕셔츠룸', '룸', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '잇뽕셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 하드터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 하드터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 하드터치룸', '룸', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '하드터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 유희실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 유희실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유희실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유희실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 유희실장', '룸', '건대', '06:00'::TIME, '06:00'::TIME, '룸', '유희실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 버니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 버니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '버니')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 버니', '룸', '계양', '06:00'::TIME, '06:00'::TIME, '룸', '버니')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 백두산대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 백두산대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백두산대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '백두산대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 백두산대표', '룸', '동대문', '06:00'::TIME, '06:00'::TIME, '룸', '백두산대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 미러룸하이풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 미러룸하이풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미러룸하이풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '미러룸하이풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 미러룸하이풀싸롱', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '미러룸하이풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 프리미엄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 프리미엄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리미엄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '프리미엄')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 프리미엄', '룸', '사당', '06:00'::TIME, '06:00'::TIME, '룸', '프리미엄')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 하이쩜오8
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 하이쩜오8';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오8';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오8')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 하이쩜오8', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오8')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서초 독고
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서초 독고';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '독고';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '서초'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '독고')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서초 독고', '룸', '서초', '18:00'::TIME, '09:00'::TIME, '룸', '독고')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성수동 10만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성수동 10만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '10만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성수동'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '10만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성수동 10만원', '룸', '성수동', '10:00'::TIME, '05:00'::TIME, '룸', '10만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 문의 필수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 문의 필수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '문의 필수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '문의 필수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 문의 필수', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '문의 필수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 ROOM떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 ROOM떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ROOM떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'ROOM떡')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 ROOM떡', '룸', '사당', '10:00'::TIME, '05:00'::TIME, '룸', 'ROOM떡')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동대문'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동대문' ELSE address END
      , contact_name = COALESCE(contact_name, '풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동대문 풀싸롱', '동대문', '동대문', '10:00'::TIME, '05:00'::TIME, '룸', '풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 잠실셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 잠실셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잠실셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '잠실' ELSE address END
      , contact_name = COALESCE(contact_name, '잠실셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('잠실 잠실셔츠룸', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '룸', '잠실셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 ROOM떡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 ROOM떡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ROOM떡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, 'ROOM떡')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 ROOM떡', '마포', '마포', '12:00'::TIME, '06:00'::TIME, '룸', 'ROOM떡')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성수동 성수동1등셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성수동 성수동1등셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '성수동1등셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성수동'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '성수동' ELSE address END
      , contact_name = COALESCE(contact_name, '성수동1등셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성수동 성수동1등셔츠룸', '성수동', '성수동', '10:00'::TIME, '05:00'::TIME, '룸', '성수동1등셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울대 구멍집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울대 구멍집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구멍집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '서울대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '서울대' ELSE address END
      , contact_name = COALESCE(contact_name, '구멍집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서울대 구멍집', '서울대', '서울대', '24:00'::TIME, '24:00'::TIME, '룸', '구멍집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 수위괴물
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 수위괴물';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수위괴물';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수위괴물')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('금천 수위괴물', '룸', '금천', '10:00'::TIME, '05:00'::TIME, '룸', '수위괴물')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 섹 ㅁ ㅏ스터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 섹 ㅁ ㅏ스터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '섹 ㅁ ㅏ스터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '광명' ELSE address END
      , contact_name = COALESCE(contact_name, '섹 ㅁ ㅏ스터')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 섹 ㅁ ㅏ스터', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '룸', '섹 ㅁ ㅏ스터')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 왕조셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 왕조셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '왕조셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '왕조셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 왕조셔츠룸', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '왕조셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❣️강남 최고수질❣️정통 쩜오 블렌딩❣️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❣️강남 최고수질❣️정통 쩜오 블렌딩❣️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❣️강남 최고수질❣️정통 쩜오 블렌딩❣️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '❣️강남 최고수질❣️정통 쩜오 블렌딩❣️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ❣️강남 최고수질❣️정통 쩜오 블렌딩❣️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '❣️강남 최고수질❣️정통 쩜오 블렌딩❣️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 주빈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 주빈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주빈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '주빈')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 주빈', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '주빈')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️➡️정통쩜오 임팩트⬅️윤서마담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️➡️정통쩜오 임팩트⬅️윤서마담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️➡️정통쩜오 임팩트⬅️윤서마담';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️➡️정통쩜오 임팩트⬅️윤서마담')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ❤️➡️정통쩜오 임팩트⬅️윤서마담', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '❤️➡️정통쩜오 임팩트⬅️윤서마담')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 ❤️퍼펙트❤️잘대주는여실장❤️서은실장❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 ❤️퍼펙트❤️잘대주는여실장❤️서은실장❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️퍼펙트❤️잘대주는여실장❤️서은실장❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '논현' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️퍼펙트❤️잘대주는여실장❤️서은실장❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 ❤️퍼펙트❤️잘대주는여실장❤️서은실장❤️', '논현', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '❤️퍼펙트❤️잘대주는여실장❤️서은실장❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 인트로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 인트로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인트로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인트로')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 인트로', '룸', '강남', '12:00'::TIME, '06:00'::TIME, '룸', '인트로')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 하이쩜오4
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 하이쩜오4';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오4';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오4')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 하이쩜오4', '룸', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오4')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 어리고이쁨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 어리고이쁨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어리고이쁨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '어리고이쁨')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 어리고이쁨', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '어리고이쁨')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 모든것
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 모든것';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '모든것';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '모든것')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 모든것', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '모든것')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 세아실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 세아실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세아실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '인천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '세아실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('인천 세아실장', '룸', '인천', '10:00'::TIME, '05:00'::TIME, '룸', '세아실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 찐20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 찐20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '찐20대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부평 찐20대', '룸', '부평', '10:00'::TIME, '05:00'::TIME, '룸', '찐20대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구월 세아실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구월 세아실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세아실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구월'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '세아실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구월 세아실장', '룸', '구월', '10:00'::TIME, '05:00'::TIME, '룸', '세아실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 극강하퍼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 극강하퍼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강하퍼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강하퍼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 극강하퍼', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '극강하퍼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 수질보장미러룸하이풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 수질보장미러룸하이풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수질보장미러룸하이풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '오피')
      , contact_name = COALESCE(contact_name, '수질보장미러룸하이풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 수질보장미러룸하이풀싸롱', '오피', '강남', '10:00'::TIME, '05:00'::TIME, '오피', '수질보장미러룸하이풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 부천1등하퍼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 부천1등하퍼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천1등하퍼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '부천1등하퍼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 부천1등하퍼', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '부천1등하퍼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드터치룸✨인당10만원❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드터치룸✨인당10만원❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드터치룸✨인당10만원❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '홍대' ELSE address END
      , contact_name = COALESCE(contact_name, '하드터치룸✨인당10만원❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드터치룸✨인당10만원❤️', '홍대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하드터치룸✨인당10만원❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 100실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 100실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '100실';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '100실')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 100실', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '100실')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 인당15', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 24시', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 인당15', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드꼴릿셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드꼴릿셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드꼴릿셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드꼴릿셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드꼴릿셔츠룸', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하드꼴릿셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 셔츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 셔츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '12:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가산 셔츠', '룸', '가산', '07:00'::TIME, '12:00'::TIME, '룸', '셔츠')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 신촌 캐슬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 신촌 캐슬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신촌 캐슬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '신촌 캐슬')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 신촌 캐슬', '마포', '신촌', '12:00'::TIME, '06:00'::TIME, '룸', '신촌 캐슬')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️⭐️원영실장⭐️❤️몸보신하러 오세요❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️⭐️원영실장⭐️❤️몸보신하러 오세요❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️⭐️원영실장⭐️❤️몸보신하러 오세요❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️⭐️원영실장⭐️❤️몸보신하러 오세요❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ❤️⭐️원영실장⭐️❤️몸보신하러 오세요❤️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '❤️⭐️원영실장⭐️❤️몸보신하러 오세요❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 독도대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 독도대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '독도대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '독도대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 독도대표', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '독도대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 재경실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 재경실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재경실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '재경실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 재경실장', '룸', '강남', '24:00'::TIME, '24:00'::TIME, '룸', '재경실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✡️⏩선녀와 박아꾼⏪✡️❤️짜릿한 신세계 경험❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✡️⏩선녀와 박아꾼⏪✡️❤️짜릿한 신세계 경험❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️⏩선녀와 박아꾼⏪✡️❤️짜릿한 신세계 경험❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✡️⏩선녀와 박아꾼⏪✡️❤️짜릿한 신세계 경험❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✡️⏩선녀와 박아꾼⏪✡️❤️짜릿한 신세계 경험❤️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✡️⏩선녀와 박아꾼⏪✡️❤️짜릿한 신세계 경험❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 셔하
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 셔하';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔하';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '14:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔하')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 셔하', '룸', '신촌', '17:00'::TIME, '14:00'::TIME, '룸', '셔하')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 퍼펙트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 퍼펙트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼펙트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '퍼펙트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 퍼펙트', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '퍼펙트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 인당13
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 인당13';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당13';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당13')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 인당13', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '인당13')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 하이쩜오3
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 하이쩜오3';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오3';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오3')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 하이쩜오3', '룸', '용산', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오3')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 CNN 민대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 CNN 민대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'CNN 민대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'CNN 민대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 CNN 민대표', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', 'CNN 민대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 메쎄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 메쎄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메쎄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '21:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '메쎄')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 메쎄', '룸', '부천', '21:00'::TIME, '09:00'::TIME, '룸', '메쎄')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 20대 김민수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 20대 김민수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대 김민수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대 김민수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 20대 김민수', '룸', '역삼', '17:00'::TIME, '06:00'::TIME, '룸', '20대 김민수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 백프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 백프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '백프로')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 백프로', '룸', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '백프로')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 구구단
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 구구단';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구구단';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:30'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '구구단')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 구구단', '강남', '강남', '18:00'::TIME, '06:30'::TIME, '룸', '구구단')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 셔츠하퍼8
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠하퍼8';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼8';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼8')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 셔츠하퍼8', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼8')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 극강하
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 극강하';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강하';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강하')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 극강하', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '극강하')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 마동석
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 마동석';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마동석';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마동석')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 마동석', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '마동석')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 발렌타인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 발렌타인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '발렌타인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '발렌타인')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 발렌타인', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '발렌타인')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 데 드 풀 부 장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 데 드 풀 부 장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '데 드 풀 부 장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '데 드 풀 부 장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 데 드 풀 부 장', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '데 드 풀 부 장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 가락별밤우리실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 가락별밤우리실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가락별밤우리실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '가락별밤우리실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 가락별밤우리실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '가락별밤우리실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 유앤미최이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 유앤미최이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유앤미최이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유앤미최이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 유앤미최이사', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '유앤미최이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 REINA
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 REINA';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'REINA';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'REINA')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 REINA', '룸', '부천', '06:00'::TIME, '06:00'::TIME, '룸', 'REINA')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 사당 채영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 사당 채영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사당 채영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '사당 채영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 사당 채영', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '사당 채영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산 주대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산 주대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산 주대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '울산 주대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산 주대표', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '울산 주대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ❤️최저가❤️추천업소❤️룸빵❤️실물파❤️엘리트❤️내상치유❤️무한초이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ❤️최저가❤️추천업소❤️룸빵❤️실물파❤️엘리트❤️내상치유❤️무한초이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️최저가❤️추천업소❤️룸빵❤️실물파❤️엘리트❤️내상치유❤️무한초이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️최저가❤️추천업소❤️룸빵❤️실물파❤️엘리트❤️내상치유❤️무한초이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ❤️최저가❤️추천업소❤️룸빵❤️실물파❤️엘리트❤️내상치유❤️무한초이스', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '❤️최저가❤️추천업소❤️룸빵❤️실물파❤️엘리트❤️내상치유❤️무한초이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드코어식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드코어식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드코어식';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '건대' ELSE address END
      , contact_name = COALESCE(contact_name, '하드코어식')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드코어식', '건대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하드코어식')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 오징어게임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 오징어게임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오징어게임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '오징어게임')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 오징어게임', '룸', '사당', '10:00'::TIME, '05:00'::TIME, '룸', '오징어게임')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 양주무한
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 양주무한';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양주무한';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '양주무한')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 양주무한', '룸', '사당', '10:00'::TIME, '05:00'::TIME, '룸', '양주무한')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 이상형 초이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 이상형 초이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이상형 초이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '이상형 초이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 이상형 초이스', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '이상형 초이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 잘주는룸빵- 두산대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 잘주는룸빵- 두산대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잘주는룸빵- 두산대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '사당' ELSE address END
      , contact_name = COALESCE(contact_name, '잘주는룸빵- 두산대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 잘주는룸빵- 두산대표', '사당', '사당', '10:00'::TIME, '05:00'::TIME, '룸', '잘주는룸빵- 두산대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 서은실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 서은실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서은실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '서은실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 서은실장', '룸', '홍대', '06:00'::TIME, '06:00'::TIME, '룸', '서은실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 셔츠하퍼17
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 셔츠하퍼17';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼17';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼17')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서구 셔츠하퍼17', '룸', '서구', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼17')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 셔츠하퍼12
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 셔츠하퍼12';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼12';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼12')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 셔츠하퍼12', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼12')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 셔츠하퍼14
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 셔츠하퍼14';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼14';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼14')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 셔츠하퍼14', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼14')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '건대' ELSE address END
      , contact_name = COALESCE(contact_name, '인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 인당15', '건대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 야릇꼴릿셔츠
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 야릇꼴릿셔츠';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야릇꼴릿셔츠';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '주안' ELSE address END
      , contact_name = COALESCE(contact_name, '야릇꼴릿셔츠')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 야릇꼴릿셔츠', '주안', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '야릇꼴릿셔츠')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하이2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하이2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이2';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이2')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하이2', '룸', '홍대', '06:00'::TIME, '06:00'::TIME, '룸', '하이2')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 셔츠하퍼7
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠하퍼7';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼7';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼7')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 셔츠하퍼7', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼7')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 BEST
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 BEST';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BEST';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'BEST')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 BEST', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', 'BEST')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 베리앤굿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 베리앤굿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베리앤굿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베리앤굿')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 베리앤굿', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '베리앤굿')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 하드코어식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 하드코어식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드코어식';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드코어식')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가산 하드코어식', '룸', '가산', '10:00'::TIME, '05:00'::TIME, '룸', '하드코어식')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 100퍼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 100퍼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '100퍼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '100퍼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 100퍼', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '100퍼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 하이쩜오10
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 하이쩜오10';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오10';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오10')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 하이쩜오10', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오10')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 전문
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 전문';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전문';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '가산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '전문')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가산 전문', '룸', '가산', '06:00'::TIME, '06:00'::TIME, '룸', '전문')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 ♨️벗기는맛♨️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 ♨️벗기는맛♨️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♨️벗기는맛♨️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '♨️벗기는맛♨️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 ♨️벗기는맛♨️', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '♨️벗기는맛♨️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 사당 사당술
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '사당 사당술';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사당술';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '사당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '사당술')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('사당 사당술', '룸', '사당', '06:00'::TIME, '06:00'::TIME, '룸', '사당술')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 퍼블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 퍼블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '퍼블')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 퍼블', '룸', '구로', '06:00'::TIME, '06:00'::TIME, '룸', '퍼블')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 sss
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 sss';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'sss';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'sss')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 sss', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', 'sss')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 권은비실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 권은비실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '권은비실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '권은비실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 권은비실장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '권은비실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 셔츠하퍼6
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠하퍼6';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼6';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼6')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 셔츠하퍼6', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼6')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구008
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구008';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구008';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구008')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구008', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구008')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 노브라룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 노브라룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노브라룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '안양' ELSE address END
      , contact_name = COALESCE(contact_name, '노브라룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 노브라룸', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '노브라룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 블랙체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 블랙체리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블랙체리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '블랙체리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 블랙체리', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '블랙체리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하셔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하셔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하셔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하셔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하셔', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하셔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 Av하드터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 Av하드터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Av하드터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'Av하드터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 Av하드터치룸', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', 'Av하드터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 정성
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 정성';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정성';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정성')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 정성', '룸', '안산', '20:00'::TIME, '06:00'::TIME, '룸', '정성')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 만지면서 빨고놀자-극강하드터치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 만지면서 빨고놀자-극강하드터치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '만지면서 빨고놀자-극강하드터치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '만지면서 빨고놀자-극강하드터치')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 만지면서 빨고놀자-극강하드터치', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '만지면서 빨고놀자-극강하드터치')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 극강하드터치룸주대무료-춘향이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 극강하드터치룸주대무료-춘향이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강하드터치룸주대무료-춘향이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강하드터치룸주대무료-춘향이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 극강하드터치룸주대무료-춘향이', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '극강하드터치룸주대무료-춘향이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 세븐 노래
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 세븐 노래';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세븐 노래';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '세븐 노래')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 세븐 노래', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '세븐 노래')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구007
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구007';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구007';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구007')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구007', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구007')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 걸스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 걸스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '걸스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '걸스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 걸스', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '걸스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 진짜찐20
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 진짜찐20';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진짜찐20';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '진짜찐20')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 진짜찐20', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '진짜찐20')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 초특가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 초특가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초특가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '초특가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 초특가', '룸', '영등포', '06:00'::TIME, '06:00'::TIME, '룸', '초특가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 예쁜아이유
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 예쁜아이유';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예쁜아이유';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '예쁜아이유')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 예쁜아이유', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '예쁜아이유')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 24시 터치룸 마인드보장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 24시 터치룸 마인드보장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시 터치룸 마인드보장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '24시 터치룸 마인드보장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 24시 터치룸 마인드보장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '24시 터치룸 마인드보장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 이정재
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 이정재';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이정재';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이정재')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 이정재', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '이정재')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구006
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구006';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구006';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구006')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구006', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구006')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 인당15', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 숭구리당당
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 숭구리당당';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '숭구리당당';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '숭구리당당')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 숭구리당당', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '숭구리당당')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 런닝터틀가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 런닝터틀가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런닝터틀가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '런닝터틀가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 런닝터틀가라오케', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '런닝터틀가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 인증업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 인증업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인증업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인증업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 인증업소', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '인증업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하이', '룸', '홍대', '06:00'::TIME, '06:00'::TIME, '룸', '하이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 ⭕100,000⭕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 ⭕100,000⭕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭕100,000⭕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '⭕100,000⭕')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 ⭕100,000⭕', '룸', '용산', '06:00'::TIME, '06:00'::TIME, '룸', '⭕100,000⭕')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ☑️폭룡적1등 엘리트하퍼룸☑️화성부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ☑️폭룡적1등 엘리트하퍼룸☑️화성부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☑️폭룡적1등 엘리트하퍼룸☑️화성부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '☑️폭룡적1등 엘리트하퍼룸☑️화성부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ☑️폭룡적1등 엘리트하퍼룸☑️화성부장', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '☑️폭룡적1등 엘리트하퍼룸☑️화성부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드셔츠룸3
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드셔츠룸3';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드셔츠룸3';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드셔츠룸3')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드셔츠룸3', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하드셔츠룸3')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드', '룸', '홍대', '06:00'::TIME, '06:00'::TIME, '룸', '하드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 셔츠하퍼5
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠하퍼5';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼5';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼5')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 셔츠하퍼5', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼5')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구005
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구005';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구005';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구005')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구005', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구005')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 제니실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 제니실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '제니실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 제니실장', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '제니실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드셔츠룸2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드셔츠룸2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드셔츠룸2';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드셔츠룸2')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드셔츠룸2', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하드셔츠룸2')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 New시스템 민대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 New시스템 민대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'New시스템 민대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'New시스템 민대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 New시스템 민대표', '룸', '삼성', '10:00'::TIME, '05:00'::TIME, '룸', 'New시스템 민대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구004
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구004';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구004';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구004')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구004', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구004')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 연두이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 연두이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연두이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '연두이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 연두이사', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '연두이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 서구청 아찔한3NO
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 서구청 아찔한3NO';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서구청 아찔한3NO';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '서구' ELSE address END
      , contact_name = COALESCE(contact_name, '서구청 아찔한3NO')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서구 서구청 아찔한3NO', '서구', '서구', '10:00'::TIME, '05:00'::TIME, '룸', '서구청 아찔한3NO')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구003
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구003';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구003';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구003')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구003', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구003')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 마블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 마블';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마블';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마블')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 마블', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '마블')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 인당13최저가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 인당13최저가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당13최저가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당13최저가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 인당13최저가', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '인당13최저가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 셔츠하퍼4
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠하퍼4';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼4';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼4')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 셔츠하퍼4', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼4')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 하이쩜오7
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 하이쩜오7';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오7';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오7')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 하이쩜오7', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오7')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 잘대주는하이퍼블릭-유흥조각사-
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 잘대주는하이퍼블릭-유흥조각사-';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잘대주는하이퍼블릭-유흥조각사-';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '잘대주는하이퍼블릭-유흥조각사-')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 잘대주는하이퍼블릭-유흥조각사-', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '잘대주는하이퍼블릭-유흥조각사-')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구002
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구002';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구002';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구002')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구002', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '강서구002')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 상한가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 상한가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상한가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '상한가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 상한가', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '상한가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 정이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 정이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 정이사', '룸', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '정이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 진구대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 진구대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진구대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '진구대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 진구대표', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '진구대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 하드코어식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 하드코어식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드코어식';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '용산' ELSE address END
      , contact_name = COALESCE(contact_name, '하드코어식')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 하드코어식', '용산', '용산', '10:00'::TIME, '05:00'::TIME, '룸', '하드코어식')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 세미텐퍼블릭인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 세미텐퍼블릭인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '세미텐퍼블릭인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '용산' ELSE address END
      , contact_name = COALESCE(contact_name, '세미텐퍼블릭인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용산 세미텐퍼블릭인당15', '용산', '용산', '10:00'::TIME, '05:00'::TIME, '룸', '세미텐퍼블릭인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 잘대주는서은실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 잘대주는서은실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잘대주는서은실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '노원' ELSE address END
      , contact_name = COALESCE(contact_name, '잘대주는서은실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 잘대주는서은실장', '노원', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '잘대주는서은실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원유흥주박사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원유흥주박사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원유흥주박사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '수원유흥주박사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 수원유흥주박사', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '수원유흥주박사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 핵마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 핵마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핵마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '핵마인드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 핵마인드', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '핵마인드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 서면광안리해운대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 서면광안리해운대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서면광안리해운대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '서면광안리해운대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 서면광안리해운대', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '서면광안리해운대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계산 인천BUNNY강대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계산 인천BUNNY강대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인천BUNNY강대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인천BUNNY강대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계산 인천BUNNY강대표', '룸', '계산', '10:00'::TIME, '05:00'::TIME, '룸', '인천BUNNY강대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 레이나 가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 레이나 가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이나 가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '레이나 가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 레이나 가라오케', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '레이나 가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 박서준이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 박서준이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박서준이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '박서준이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 박서준이사', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '박서준이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 1프로한복
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 1프로한복';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1프로한복';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1프로한복')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 1프로한복', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '1프로한복')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 유앤미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 유앤미';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유앤미';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '유앤미')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 유앤미', '강남', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '유앤미')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 은비실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 은비실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '은비실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '은비실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 은비실장', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '은비실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 언더락
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 언더락';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '언더락';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '언더락')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 언더락', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '언더락')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 야구장풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 야구장풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야구장풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '야구장풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 야구장풀싸롱', '룸', '부산', '18:00'::TIME, '05:00'::TIME, '룸', '야구장풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 오실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 오실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '오실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 오실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '오실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 가락달밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 가락달밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가락달밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '가락달밤')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 가락달밤', '룸', '가락', '06:00'::TIME, '06:00'::TIME, '룸', '가락달밤')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 오가리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 오가리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오가리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '오가리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 오가리', '룸', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '오가리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 하이쩜오5
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 하이쩜오5';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오5';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이쩜오5')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 하이쩜오5', '룸', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '하이쩜오5')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 하이퀄리티인당14-백두산대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 하이퀄리티인당14-백두산대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이퀄리티인당14-백두산대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '종로' ELSE address END
      , contact_name = COALESCE(contact_name, '하이퀄리티인당14-백두산대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 하이퀄리티인당14-백두산대표', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '하이퀄리티인당14-백두산대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 극강하드터치룸주대무료
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 극강하드터치룸주대무료';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강하드터치룸주대무료';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '종로' ELSE address END
      , contact_name = COALESCE(contact_name, '극강하드터치룸주대무료')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 극강하드터치룸주대무료', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '극강하드터치룸주대무료')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 하이쩜오9
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 하이쩜오9';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이쩜오9';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '오피')
      , contact_name = COALESCE(contact_name, '하이쩜오9')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 하이쩜오9', '오피', '마포', '10:00'::TIME, '05:00'::TIME, '오피', '하이쩜오9')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 J
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 J';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'J';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'J')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 J', '룸', '대구', '10:00'::TIME, '05:00'::TIME, '룸', 'J')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 노마진대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 노마진대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노마진대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노마진대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 노마진대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '노마진대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 자이언트실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 자이언트실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자이언트실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '대전' ELSE address END
      , contact_name = COALESCE(contact_name, '자이언트실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 자이언트실장', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '룸', '자이언트실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계산 더킹하드코어
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계산 더킹하드코어';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더킹하드코어';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '더킹하드코어')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계산 더킹하드코어', '룸', '계산', '10:00'::TIME, '05:00'::TIME, '룸', '더킹하드코어')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 셔츠하퍼13
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 셔츠하퍼13';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼13';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼13')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 셔츠하퍼13', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼13')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 연부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 연부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '연부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('의정부 연부장', '룸', '의정부', '10:00'::TIME, '05:00'::TIME, '룸', '연부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림1번최저가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림1번최저가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림1번최저가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '신림1번최저가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림1번최저가', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림1번최저가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림신규오픈인당15만
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림신규오픈인당15만';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림신규오픈인당15만';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '신림신규오픈인당15만')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림신규오픈인당15만', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림신규오픈인당15만')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 주사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 주사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '주사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 주사장', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '주사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 강력추천업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 강력추천업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강력추천업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '강력추천업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 강력추천업소', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '강력추천업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 KTV만세대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 KTV만세대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'KTV만세대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'KTV만세대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 KTV만세대표', '룸', '대전', '10:00'::TIME, '05:00'::TIME, '룸', 'KTV만세대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 주실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 주실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '주실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 주실장', '룸', '대전', '06:00'::TIME, '06:00'::TIME, '룸', '주실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 백두대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 백두대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '백두대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '백두대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 백두대표', '룸', '여의도', '06:00'::TIME, '06:00'::TIME, '룸', '백두대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 네거리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 네거리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '네거리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '네거리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 네거리', '룸', '안산', '10:00'::TIME, '05:00'::TIME, '룸', '네거리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 셔츠하퍼11
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 셔츠하퍼11';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼11';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼11')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 셔츠하퍼11', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼11')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 셔츠하퍼16
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 셔츠하퍼16';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼16';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼16')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 셔츠하퍼16', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼16')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하드셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하드셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 하드셔츠룸', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '하드셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 초원의집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 초원의집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초원의집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '초원의집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 초원의집', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '초원의집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 쉼터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 쉼터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쉼터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '울산' ELSE address END
      , contact_name = COALESCE(contact_name, '쉼터')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 쉼터', '울산', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '쉼터')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 10만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 10만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '10만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '장안' ELSE address END
      , contact_name = COALESCE(contact_name, '10만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('장안 10만원', '장안', '장안', '10:00'::TIME, '05:00'::TIME, '룸', '10만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 후배위하는선배3NO(후배위실장)
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 후배위하는선배3NO(후배위실장)';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '후배위하는선배3NO(후배위실장)';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '후배위하는선배3NO(후배위실장)')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부평 후배위하는선배3NO(후배위실장)', '룸', '부평', '10:00'::TIME, '05:00'::TIME, '룸', '후배위하는선배3NO(후배위실장)')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 조아죽네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 조아죽네';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조아죽네';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '조아죽네')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('장안 조아죽네', '룸', '장안', '10:00'::TIME, '05:00'::TIME, '룸', '조아죽네')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 양성소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 양성소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양성소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '홍대' ELSE address END
      , contact_name = COALESCE(contact_name, '양성소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 양성소', '홍대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '양성소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 내상치유전문-향단이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 내상치유전문-향단이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '내상치유전문-향단이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '홍대' ELSE address END
      , contact_name = COALESCE(contact_name, '내상치유전문-향단이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 내상치유전문-향단이', '홍대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '내상치유전문-향단이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 극강하드터치룸-백박사님
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 극강하드터치룸-백박사님';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강하드터치룸-백박사님';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '홍대' ELSE address END
      , contact_name = COALESCE(contact_name, '극강하드터치룸-백박사님')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 극강하드터치룸-백박사님', '홍대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '극강하드터치룸-백박사님')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 홈런
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 홈런';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '홈런')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 홈런', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '홈런')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 24시 하드룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 24시 하드룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시 하드룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '잠실' ELSE address END
      , contact_name = COALESCE(contact_name, '24시 하드룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('잠실 24시 하드룸', '잠실', '잠실', '10:00'::TIME, '05:00'::TIME, '룸', '24시 하드룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 1등 여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 1등 여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등 여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1등 여실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 1등 여실장', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '1등 여실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 박유천
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 박유천';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박유천';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '박유천')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 박유천', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '박유천')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 유진실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 유진실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유진실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유진실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 유진실장', '룸', '일산', '20:00'::TIME, '11:00'::TIME, '룸', '유진실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 AURA-수위룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 AURA-수위룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'AURA-수위룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '01:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'AURA-수위룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 AURA-수위룸', '룸', '수원', '19:00'::TIME, '01:00'::TIME, '룸', 'AURA-수위룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 ██ ☀️하퍼☀️사이즈굿☀️15만 최저가☀️ ██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 ██ ☀️하퍼☀️사이즈굿☀️15만 최저가☀️ ██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '██ ☀️하퍼☀️사이즈굿☀️15만 최저가☀️ ██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '파주' ELSE address END
      , contact_name = COALESCE(contact_name, '██ ☀️하퍼☀️사이즈굿☀️15만 최저가☀️ ██')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 ██ ☀️하퍼☀️사이즈굿☀️15만 최저가☀️ ██', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '██ ☀️하퍼☀️사이즈굿☀️15만 최저가☀️ ██')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 NEW구로셔츠룸-박아더실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 NEW구로셔츠룸-박아더실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW구로셔츠룸-박아더실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'NEW구로셔츠룸-박아더실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 NEW구로셔츠룸-박아더실장', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', 'NEW구로셔츠룸-박아더실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 우수제휴
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 우수제휴';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우수제휴';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '우수제휴')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('잠실 우수제휴', '룸', '잠실', '10:00'::TIME, '05:00'::TIME, '룸', '우수제휴')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 NEW잠실셔츠룸-박아더실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 NEW잠실셔츠룸-박아더실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'NEW잠실셔츠룸-박아더실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'NEW잠실셔츠룸-박아더실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('잠실 NEW잠실셔츠룸-박아더실장', '룸', '잠실', '10:00'::TIME, '05:00'::TIME, '룸', 'NEW잠실셔츠룸-박아더실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 동래글램bar
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 동래글램bar';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '동래글램bar';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '동래글램bar')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 동래글램bar', '룸', '부산', '10:00'::TIME, '05:00'::TIME, '룸', '동래글램bar')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 안산찐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 안산찐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안산찐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '안산찐')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 안산찐', '룸', '안산', '10:00'::TIME, '05:00'::TIME, '룸', '안산찐')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 보이노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 보이노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보이노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '보이노')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 보이노', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '보이노')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 박카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 박카스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박카스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구미' ELSE address END
      , contact_name = COALESCE(contact_name, '박카스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 박카스', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '박카스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 g부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 g부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'g부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '08:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'g부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 g부장', '룸', '천안', '18:00'::TIME, '08:00'::TIME, '룸', 'g부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 베테랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 베테랑';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베테랑';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베테랑')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 베테랑', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '베테랑')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 찐 20대 터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 찐 20대 터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐 20대 터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '찐 20대 터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 찐 20대 터치룸', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '찐 20대 터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 엘리트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 엘리트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엘리트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '엘리트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 엘리트', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '엘리트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '도파민')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 도파민', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '도파민')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 행주실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 행주실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '행주실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '행주실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 행주실장', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '행주실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서면 부산20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서면 부산20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부산20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서면'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '부산20대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서면 부산20대', '룸', '서면', '10:00'::TIME, '05:00'::TIME, '룸', '부산20대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서면 하이퍼블릭풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서면 하이퍼블릭풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이퍼블릭풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서면'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이퍼블릭풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서면 하이퍼블릭풀싸롱', '룸', '서면', '10:00'::TIME, '05:00'::TIME, '룸', '하이퍼블릭풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 안산상위
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 안산상위';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안산상위';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '안산상위')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 안산상위', '룸', '안산', '10:00'::TIME, '05:00'::TIME, '룸', '안산상위')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 GYM
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 GYM';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'GYM';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'GYM')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 GYM', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', 'GYM')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 구리리24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 구리리24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구리리24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구리리24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 구리리24시', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '구리리24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 홈런볼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 홈런볼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런볼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '홈런볼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 홈런볼', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '홈런볼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 블링블링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 블링블링';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블링블링';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '블링블링')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 블링블링', '룸', '부천', '19:00'::TIME, '06:00'::TIME, '룸', '블링블링')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 김미김미 강두대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 김미김미 강두대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김미김미 강두대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김미김미 강두대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 김미김미 강두대표', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '김미김미 강두대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 떡잎마을
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 떡잎마을';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '떡잎마을';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '떡잎마을')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 떡잎마을', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '떡잎마을')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 분수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 분수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 분수', '룸', '마포', '24:00'::TIME, '24:00'::TIME, '룸', '분수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 프리미엄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 프리미엄';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프리미엄';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '프리미엄')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 프리미엄', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '프리미엄')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 24시 하드룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 24시 하드룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시 하드룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시 하드룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('하남 24시 하드룸', '룸', '하남', '10:00'::TIME, '05:00'::TIME, '룸', '24시 하드룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 제니실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 제니실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '제니실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 제니실장', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '제니실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 방앗간
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 방앗간';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방앗간';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '방앗간')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 방앗간', '룸', '신림', '06:00'::TIME, '06:00'::TIME, '룸', '방앗간')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 10만원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 10만원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '10만원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천호'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '천호' ELSE address END
      , contact_name = COALESCE(contact_name, '10만원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천호 10만원', '천호', '천호', '10:00'::TIME, '05:00'::TIME, '룸', '10만원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 ♀️풀싸롱♀️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 ♀️풀싸롱♀️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♀️풀싸롱♀️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '♀️풀싸롱♀️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 ♀️풀싸롱♀️', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '♀️풀싸롱♀️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 일급수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 일급수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일급수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천호'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '일급수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천호 일급수', '룸', '천호', '10:00'::TIME, '05:00'::TIME, '룸', '일급수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 중랑 일급수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '중랑 일급수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일급수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '중랑'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '일급수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('중랑 일급수', '룸', '중랑', '10:00'::TIME, '05:00'::TIME, '룸', '일급수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원별밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원별밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원별밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '수원별밤')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 수원별밤', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '수원별밤')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 일급수전담마크제니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 일급수전담마크제니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일급수전담마크제니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '일급수전담마크제니')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('하남 일급수전담마크제니', '룸', '하남', '10:00'::TIME, '05:00'::TIME, '룸', '일급수전담마크제니')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 극강제니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 극강제니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강제니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강제니')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('남양주 극강제니', '룸', '남양주', '10:00'::TIME, '05:00'::TIME, '룸', '극강제니')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 구리24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 구리24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구리24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구리24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 구리24시', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '구리24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안 제니살장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안 제니살장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니살장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '장안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '제니살장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('장안 제니살장', '룸', '장안', '10:00'::TIME, '05:00'::TIME, '룸', '제니살장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서면 서면정우대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서면 서면정우대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '서면정우대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서면'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '서면정우대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서면 서면정우대표', '룸', '서면', '10:00'::TIME, '05:00'::TIME, '룸', '서면정우대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;