-- 오피가이드 데이터 마이그레이션 Part 6/7


-- 해운대 문채원팀장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '해운대 문채원팀장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '문채원팀장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '해운대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '문채원팀장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('해운대 문채원팀장', '룸', '해운대', '10:00'::TIME, '05:00'::TIME, '룸', '문채원팀장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 이벤트총판
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 이벤트총판';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이벤트총판';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이벤트총판')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 이벤트총판', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '이벤트총판')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 정다운대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 정다운대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정다운대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정다운대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 정다운대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '정다운대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 24시', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 강력추천업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 강력추천업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강력추천업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강력추천업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 강력추천업소', '룸', '광명', '10:00'::TIME, '05:00'::TIME, '룸', '강력추천업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 광명최저가인13
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 광명최저가인13';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '광명최저가인13';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '광명최저가인13')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 광명최저가인13', '룸', '광명', '10:00'::TIME, '05:00'::TIME, '룸', '광명최저가인13')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 1프로하이퍼블릭셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 1프로하이퍼블릭셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1프로하이퍼블릭셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '분당' ELSE address END
      , contact_name = COALESCE(contact_name, '1프로하이퍼블릭셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 1프로하이퍼블릭셔츠룸', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '1프로하이퍼블릭셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 벗고놀자인당12-
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 벗고놀자인당12-';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벗고놀자인당12-';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '안양' ELSE address END
      , contact_name = COALESCE(contact_name, '벗고놀자인당12-')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 벗고놀자인당12-', '안양', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '벗고놀자인당12-')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 유흥부장관-잘서용실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 유흥부장관-잘서용실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유흥부장관-잘서용실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '광명' ELSE address END
      , contact_name = COALESCE(contact_name, '유흥부장관-잘서용실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 유흥부장관-잘서용실장', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '룸', '유흥부장관-잘서용실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림no.1-선우대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림no.1-선우대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림no.1-선우대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, '신림no.1-선우대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림no.1-선우대표', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림no.1-선우대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 보자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 보자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '15:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '보자')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 보자', '룸', '선릉', '18:00'::TIME, '15:00'::TIME, '룸', '보자')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 패티시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 패티시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '패티시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '15:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '패티시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 패티시', '룸', '삼성', '18:00'::TIME, '15:00'::TIME, '룸', '패티시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 장원영실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 장원영실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장원영실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '장원영실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 장원영실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '장원영실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 런닝맨풀싸롱
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 런닝맨풀싸롱';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런닝맨풀싸롱';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '런닝맨풀싸롱')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 런닝맨풀싸롱', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '런닝맨풀싸롱')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '금천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '금천' ELSE address END
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('금천 24시', '금천', '금천', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 다벗는셔츠룸업주직영서수길대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 다벗는셔츠룸업주직영서수길대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다벗는셔츠룸업주직영서수길대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다벗는셔츠룸업주직영서수길대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('잠실 다벗는셔츠룸업주직영서수길대표', '룸', '잠실', '10:00'::TIME, '05:00'::TIME, '룸', '다벗는셔츠룸업주직영서수길대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 1등출근종로사이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 1등출근종로사이즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등출근종로사이즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1등출근종로사이즈')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 1등출근종로사이즈', '룸', '종로', '24:00'::TIME, '24:00'::TIME, '룸', '1등출근종로사이즈')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 다국적 룸클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 다국적 룸클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다국적 룸클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강서' ELSE address END
      , contact_name = COALESCE(contact_name, '다국적 룸클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 다국적 룸클럽', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '다국적 룸클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 풀코스조태오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 풀코스조태오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀코스조태오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '파주' ELSE address END
      , contact_name = COALESCE(contact_name, '풀코스조태오')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 풀코스조태오', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '풀코스조태오')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 박장군
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 박장군';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '박장군';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '박장군')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 박장군', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '박장군')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 우부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 우부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '우부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강릉' ELSE address END
      , contact_name = COALESCE(contact_name, '우부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강릉 우부장', '강릉', '강릉', '10:00'::TIME, '05:00'::TIME, '룸', '우부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 하트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 하트', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '하트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 하루
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 하루';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하루';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '천안' ELSE address END
      , contact_name = COALESCE(contact_name, '하루')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 하루', '천안', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '하루')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 가락-맛도리-예나실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 가락-맛도리-예나실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가락-맛도리-예나실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '가락' ELSE address END
      , contact_name = COALESCE(contact_name, '가락-맛도리-예나실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 가락-맛도리-예나실장', '가락', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '가락-맛도리-예나실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 1인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 1인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1인')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 1인', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '1인')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 미술관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 미술관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미술관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '미술관')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 미술관', '룸', '천안', '20:00'::TIME, '06:00'::TIME, '룸', '미술관')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 투썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 투썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '투썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '투썸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 투썸', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '투썸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신림')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 찐마포
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 찐마포';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐마포';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '찐마포')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 찐마포', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '찐마포')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산 연아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산 연아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산 연아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '울산 연아')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산 연아', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '울산 연아')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 VVVIP셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 VVVIP셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VVVIP셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, 'VVVIP셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 VVVIP셔츠룸', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', 'VVVIP셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산 고구려
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산 고구려';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산 고구려';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '울산 고구려')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산 고구려', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '울산 고구려')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 크럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 크럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '크럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 크럽', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '크럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 아이비
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 아이비';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이비';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아이비')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강릉 아이비', '룸', '강릉', '10:00'::TIME, '05:00'::TIME, '룸', '아이비')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 야구장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 야구장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야구장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '야구장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 야구장', '룸', '부천', '19:00'::TIME, '05:00'::TIME, '룸', '야구장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 조보아팀장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 조보아팀장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조보아팀장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '조보아팀장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 조보아팀장', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '조보아팀장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 바니바니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 바니바니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바니바니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '바니바니')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 바니바니', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '바니바니')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 아자아자 가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 아자아자 가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아자아자 가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아자아자 가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 아자아자 가라오케', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '아자아자 가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 ♡부천 올터치 풀싸롱♡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 ♡부천 올터치 풀싸롱♡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '♡부천 올터치 풀싸롱♡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, '♡부천 올터치 풀싸롱♡')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 ♡부천 올터치 풀싸롱♡', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '♡부천 올터치 풀싸롱♡')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 미추홀구 오빠잠깐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '미추홀구 오빠잠깐';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오빠잠깐';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '미추홀구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '오빠잠깐')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('미추홀구 오빠잠깐', '룸', '미추홀구', '10:00'::TIME, '05:00'::TIME, '룸', '오빠잠깐')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 인당13
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 인당13';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인당13';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인당13')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 인당13', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '인당13')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 부천No.1 수근이형
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 부천No.1 수근이형';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천No.1 수근이형';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, '부천No.1 수근이형')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 부천No.1 수근이형', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '부천No.1 수근이형')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 미나실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 미나실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미나실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '미나실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 미나실장', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '미나실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 핫스팟
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 핫스팟';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫스팟';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '핫스팟')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 핫스팟', '룸', '천안', '19:00'::TIME, '09:00'::TIME, '룸', '핫스팟')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 인증
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 인증';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인증';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '15:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인증')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 인증', '룸', '선릉', '18:00'::TIME, '15:00'::TIME, '룸', '인증')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 종로마빡이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 종로마빡이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '종로마빡이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '종로마빡이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 종로마빡이', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '종로마빡이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연수구 야구장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연수구 야구장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야구장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연수구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '야구장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('연수구 야구장', '룸', '연수구', '10:00'::TIME, '05:00'::TIME, '룸', '야구장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 함자영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 함자영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '함자영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '함자영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 함자영', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '함자영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✴️❎전국걸레총집합 [이안 찐여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✴️❎전국걸레총집합 [이안 찐여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✴️❎전국걸레총집합 [이안 찐여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '❎✴️ ]강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✴️❎전국걸레총집합 [이안 찐여실장]❎✴️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✴️❎전국걸레총집합 [이안 찐여실장', '❎✴️ ]강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✴️❎전국걸레총집합 [이안 찐여실장]❎✴️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원최저가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원최저가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원최저가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수원최저가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 수원최저가', '룸', '수원', '18:00'::TIME, '06:00'::TIME, '룸', '수원최저가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✡️존예실사 엘리트✡️룸빵왕루피대장✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✡️존예실사 엘리트✡️룸빵왕루피대장✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️존예실사 엘리트✡️룸빵왕루피대장✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✡️존예실사 엘리트✡️룸빵왕루피대장✡️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✡️존예실사 엘리트✡️룸빵왕루피대장✡️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✡️존예실사 엘리트✡️룸빵왕루피대장✡️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 A다국적노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 A다국적노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'A다국적노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'A다국적노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 A다국적노래클럽', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', 'A다국적노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 인정
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 인정';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인정';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '인정')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 인정', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '인정')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 다이소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 다이소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다이소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 다이소', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '다이소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 하퍼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 하퍼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하퍼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '10:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하퍼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 하퍼', '룸', '천안', '20:00'::TIME, '10:00'::TIME, '룸', '하퍼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 초롱이실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 초롱이실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초롱이실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '초롱이실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 초롱이실장', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '초롱이실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 MESSE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 MESSE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'MESSE';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '08:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, 'MESSE')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 MESSE', '부천', '부천', '17:00'::TIME, '08:00'::TIME, '룸', 'MESSE')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전 야구장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전 야구장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전 야구장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '대전 야구장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 대전 야구장', '룸', '대전', '10:00'::TIME, '05:00'::TIME, '룸', '대전 야구장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 100프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 100프로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '100프로';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '100프로')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 100프로', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '100프로')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 ⭐야구장셔츠룸&하퍼⭐❤️차범근❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 ⭐야구장셔츠룸&하퍼⭐❤️차범근❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⭐야구장셔츠룸&하퍼⭐❤️차범근❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '역삼' ELSE address END
      , contact_name = COALESCE(contact_name, '⭐야구장셔츠룸&하퍼⭐❤️차범근❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 ⭐야구장셔츠룸&하퍼⭐❤️차범근❤️', '역삼', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '⭐야구장셔츠룸&하퍼⭐❤️차범근❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 Ⓜ️24시 엘리트Ⓜ️룸빵왕 루피대장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 Ⓜ️24시 엘리트Ⓜ️룸빵왕 루피대장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️24시 엘리트Ⓜ️룸빵왕 루피대장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️24시 엘리트Ⓜ️룸빵왕 루피대장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 Ⓜ️24시 엘리트Ⓜ️룸빵왕 루피대장', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️24시 엘리트Ⓜ️룸빵왕 루피대장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 미아 김연아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '미아 김연아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김연아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '미아'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김연아')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('미아 김연아', '룸', '미아', '10:00'::TIME, '05:00'::TIME, '룸', '김연아')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 런닝레빗 달토는토끼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 런닝레빗 달토는토끼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런닝레빗 달토는토끼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '런닝레빗 달토는토끼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 런닝레빗 달토는토끼', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '런닝레빗 달토는토끼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ✡️⏩걸레총집합 [이안 찐여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ✡️⏩걸레총집합 [이안 찐여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️⏩걸레총집합 [이안 찐여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '⏪✡️ ]선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '✡️⏩걸레총집합 [이안 찐여실장]⏪✡️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ✡️⏩걸레총집합 [이안 찐여실장', '⏪✡️ ]선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '✡️⏩걸레총집합 [이안 찐여실장]⏪✡️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 질퍽한20대여대생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 질퍽한20대여대생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '질퍽한20대여대생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '질퍽한20대여대생')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 질퍽한20대여대생', '강남', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '질퍽한20대여대생')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 김종국상무
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 김종국상무';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김종국상무';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김종국상무')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 김종국상무', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '김종국상무')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남매직미러풀싸롱 손석구대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남매직미러풀싸롱 손석구대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남매직미러풀싸롱 손석구대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남매직미러풀싸롱 손석구대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남매직미러풀싸롱 손석구대표', '룸', '강남', '19:00'::TIME, '06:00'::TIME, '룸', '강남매직미러풀싸롱 손석구대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남매직미러풀싸롱 손예진실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남매직미러풀싸롱 손예진실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남매직미러풀싸롱 손예진실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남매직미러풀싸롱 손예진실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남매직미러풀싸롱 손예진실장', '룸', '강남', '19:00'::TIME, '06:00'::TIME, '룸', '강남매직미러풀싸롱 손예진실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 해운대 선미실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '해운대 선미실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선미실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '해운대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '선미실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('해운대 선미실장', '룸', '해운대', '10:00'::TIME, '05:00'::TIME, '룸', '선미실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 여실장', '룸', '홍대', '18:00'::TIME, '09:00'::TIME, '룸', '여실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 20대 노마진
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 20대 노마진';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대 노마진';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '건대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대 노마진')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('건대 20대 노마진', '룸', '건대', '10:00'::TIME, '05:00'::TIME, '룸', '20대 노마진')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 고구려-주몽실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 고구려-주몽실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고구려-주몽실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '고구려-주몽실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 고구려-주몽실장', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '고구려-주몽실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 킹스맨 홍구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 킹스맨 홍구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹스맨 홍구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '킹스맨 홍구')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 킹스맨 홍구', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '킹스맨 홍구')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산판도라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산판도라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산판도라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '일산판도라')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 일산판도라', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '일산판도라')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 태수대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 태수대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태수대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '태수대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 태수대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '태수대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 다국적
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 다국적';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다국적';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다국적')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 다국적', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '다국적')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연신내 셔하3
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연신내 셔하3';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔하3';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '05:00'::TIME,
      close_time = '14:00'::TIME,
      region = COALESCE(region, '연신내'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔하3')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('연신내 셔하3', '룸', '연신내', '05:00'::TIME, '14:00'::TIME, '룸', '셔하3')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 맛도리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 맛도리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '맛도리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '맛도리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 맛도리', '룸', '평택', '18:00'::TIME, '06:00'::TIME, '룸', '맛도리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 ✅✅민솔여자실장✅✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 ✅✅민솔여자실장✅✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅✅민솔여자실장✅✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '✅✅민솔여자실장✅✅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 ✅✅민솔여자실장✅✅', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '✅✅민솔여자실장✅✅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산백대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산백대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산백대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '울산백대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산백대표', '룸', '울산', '19:00'::TIME, '06:00'::TIME, '룸', '울산백대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산별실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산별실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산별실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '울산별실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산별실장', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '울산별실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 분당터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 분당터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '용인' ELSE address END
      , contact_name = COALESCE(contact_name, '분당터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용인 분당터치룸', '용인', '용인', '10:00'::TIME, '05:00'::TIME, '룸', '분당터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 ❤️‍바니바니최저가❤️‍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 ❤️‍바니바니최저가❤️‍';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️‍바니바니최저가❤️‍';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '분당' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️‍바니바니최저가❤️‍')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 ❤️‍바니바니최저가❤️‍', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '❤️‍바니바니최저가❤️‍')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 예쁜연우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 예쁜연우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예쁜연우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '예쁜연우')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 예쁜연우', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '예쁜연우')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 HIGHEND
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 HIGHEND';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'HIGHEND';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '대전' ELSE address END
      , contact_name = COALESCE(contact_name, 'HIGHEND')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 HIGHEND', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '룸', 'HIGHEND')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서구009
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서구009';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서구009';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서구009')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서구009', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '강서구009')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 어때
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 어때';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어때';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '어때')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 어때', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '어때')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 ██▓ৡ༻ 빨통터치룸❤️셔츠룸 ༺ৡ▓██
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 ██▓ৡ༻ 빨통터치룸❤️셔츠룸 ༺ৡ▓██';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '██▓ৡ༻ 빨통터치룸❤️셔츠룸 ༺ৡ▓██';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '주안' ELSE address END
      , contact_name = COALESCE(contact_name, '██▓ৡ༻ 빨통터치룸❤️셔츠룸 ༺ৡ▓██')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 ██▓ৡ༻ 빨통터치룸❤️셔츠룸 ༺ৡ▓██', '주안', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '██▓ৡ༻ 빨통터치룸❤️셔츠룸 ༺ৡ▓██')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 체리앤포샤인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 체리앤포샤인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체리앤포샤인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '체리앤포샤인')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 체리앤포샤인', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '체리앤포샤인')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 땅콩
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 땅콩';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '땅콩';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '땅콩')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 땅콩', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '땅콩')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 유리실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 유리실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유리실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유리실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 유리실장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '유리실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 가락워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 가락워터밤';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가락워터밤';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '가락워터밤')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 가락워터밤', '룸', '가락', '06:00'::TIME, '06:00'::TIME, '룸', '가락워터밤')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 초원의집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 초원의집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초원의집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '초원의집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 초원의집', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '초원의집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 디오 하이퍼블릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 디오 하이퍼블릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '디오 하이퍼블릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '디오 하이퍼블릭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 디오 하이퍼블릭', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '디오 하이퍼블릭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울대 바이킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울대 바이킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바이킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서울대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '서울대' ELSE address END
      , contact_name = COALESCE(contact_name, '바이킹')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서울대 바이킹', '서울대', '서울대', '10:00'::TIME, '05:00'::TIME, '룸', '바이킹')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 엘리트짱구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 엘리트짱구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '엘리트짱구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '엘리트짱구')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 엘리트짱구', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '엘리트짱구')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창원 창원일등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창원 창원일등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '창원일등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '창원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '창원일등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('창원 창원일등', '룸', '창원', '10:00'::TIME, '05:00'::TIME, '룸', '창원일등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 함주리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 함주리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '함주리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '함주리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 함주리', '룸', '수원', '18:00'::TIME, '11:00'::TIME, '룸', '함주리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 유엔미1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 유엔미1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유엔미1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유엔미1등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 유엔미1등', '룸', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '유엔미1등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 출근
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 출근';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '출근';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '출근')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 출근', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '출근')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 권지용 전국1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 권지용 전국1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '권지용 전국1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '권지용 전국1등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 권지용 전국1등', '룸', '논현', '10:00'::TIME, '05:00'::TIME, '룸', '권지용 전국1등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 형돈 실시간 1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 형돈 실시간 1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '형돈 실시간 1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '형돈 실시간 1등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 형돈 실시간 1등', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '형돈 실시간 1등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 갤러리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 갤러리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갤러리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '갤러리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 갤러리', '일산', '파주', '07:00'::TIME, '11:00'::TIME, '룸', '갤러리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 P9
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 P9';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'P9';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신림' ELSE address END
      , contact_name = COALESCE(contact_name, 'P9')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 P9', '신림', '신림', '10:00'::TIME, '05:00'::TIME, '룸', 'P9')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 재방1위
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 재방1위';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재방1위';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '재방1위')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부평 재방1위', '룸', '부평', '10:00'::TIME, '05:00'::TIME, '룸', '재방1위')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 나비노래
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 나비노래';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '나비노래';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '나비노래')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 나비노래', '룸', '평택', '18:00'::TIME, '05:00'::TIME, '룸', '나비노래')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 아영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 아영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 아영', '룸', '부산', '18:00'::TIME, '06:00'::TIME, '룸', '아영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 베트남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 베트남';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베트남')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 베트남', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '베트남')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 no.1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 no.1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'no.1';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'no.1')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 no.1', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', 'no.1')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남하퍼 황정민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남하퍼 황정민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남하퍼 황정민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남하퍼 황정민')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남하퍼 황정민', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남하퍼 황정민')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 예쁜한소희
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 예쁜한소희';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '예쁜한소희';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '예쁜한소희')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 예쁜한소희', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '예쁜한소희')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 UNIQUE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 UNIQUE';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'UNIQUE';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'UNIQUE')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 UNIQUE', '룸', '부천', '20:00'::TIME, '06:00'::TIME, '룸', 'UNIQUE')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 달수', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '달수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 bj엑셀터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 bj엑셀터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'bj엑셀터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'bj엑셀터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 bj엑셀터치룸', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', 'bj엑셀터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ⚡ ⚡ 강남 셔츠룸 ⚡ ⚡
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ⚡ ⚡ 강남 셔츠룸 ⚡ ⚡';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⚡ ⚡ 강남 셔츠룸 ⚡ ⚡';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '⚡ ⚡ 강남 셔츠룸 ⚡ ⚡')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ⚡ ⚡ 강남 셔츠룸 ⚡ ⚡', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '⚡ ⚡ 강남 셔츠룸 ⚡ ⚡')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 365베트남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 365베트남';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '365베트남';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '365베트남')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 365베트남', '룸', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '365베트남')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 청주햄버거
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 청주햄버거';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청주햄버거';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '청주' ELSE address END
      , contact_name = COALESCE(contact_name, '청주햄버거')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 청주햄버거', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '룸', '청주햄버거')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 판도라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 판도라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '판도라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '판도라')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 판도라', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '판도라')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 셔츠하퍼1
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 셔츠하퍼1';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼1';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼1')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 셔츠하퍼1', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼1')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✅✡️✅페레이라대표✅✡️✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✅✡️✅페레이라대표✅✡️✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅✡️✅페레이라대표✅✡️✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✅✡️✅페레이라대표✅✡️✅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✅✡️✅페레이라대표✅✡️✅', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✅✡️✅페레이라대표✅✡️✅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 미슐랭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 미슐랭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미슐랭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구리' ELSE address END
      , contact_name = COALESCE(contact_name, '미슐랭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 미슐랭', '구리', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '미슐랭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 오빠 다국적주점
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 오빠 다국적주점';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오빠 다국적주점';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:30'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '오빠 다국적주점')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 오빠 다국적주점', '룸', '대구', '19:30'::TIME, '07:00'::TIME, '룸', '오빠 다국적주점')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연수구 재방1위
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연수구 재방1위';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재방1위';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연수구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '재방1위')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('연수구 재방1위', '룸', '연수구', '10:00'::TIME, '05:00'::TIME, '룸', '재방1위')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 체리체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 체리체리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '체리체리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '체리체리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 체리체리', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '체리체리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하드코어 카리나실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하드코어 카리나실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드코어 카리나실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '하드코어 카리나실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 하드코어 카리나실장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '하드코어 카리나실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 ➡️❤️No1메이저풀싸롱❤️⬅️☎️박찬호상무☎️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 ➡️❤️No1메이저풀싸롱❤️⬅️☎️박찬호상무☎️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '➡️❤️No1메이저풀싸롱❤️⬅️☎️박찬호상무☎️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '➡️❤️No1메이저풀싸롱❤️⬅️☎️박찬호상무☎️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 ➡️❤️No1메이저풀싸롱❤️⬅️☎️박찬호상무☎️', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '➡️❤️No1메이저풀싸롱❤️⬅️☎️박찬호상무☎️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 베리엔굿 임영웅대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 베리엔굿 임영웅대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베리엔굿 임영웅대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베리엔굿 임영웅대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 베리엔굿 임영웅대', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '베리엔굿 임영웅대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 탐방기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 탐방기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탐방기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '탐방기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부평 탐방기', '룸', '부평', '06:00'::TIME, '06:00'::TIME, '룸', '탐방기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 ❤️‍정자바니터치룸❤️‍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 ❤️‍정자바니터치룸❤️‍';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️‍정자바니터치룸❤️‍';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '분당' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️‍정자바니터치룸❤️‍')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 ❤️‍정자바니터치룸❤️‍', '분당', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '❤️‍정자바니터치룸❤️‍')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 짱구
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 짱구';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '짱구';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '짱구')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 짱구', '룸', '평택', '10:00'::TIME, '05:00'::TIME, '룸', '짱구')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 젤리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 젤리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '젤리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동탄' ELSE address END
      , contact_name = COALESCE(contact_name, '젤리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 젤리', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '룸', '젤리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 유앤미육대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 유앤미육대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유앤미육대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '유앤미육대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 유앤미육대표', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '유앤미육대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 주안 넘버원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 주안 넘버원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '주안 넘버원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '주안 넘버원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 주안 넘버원', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '주안 넘버원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달리는토끼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달리는토끼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달리는토끼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달리는토끼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 달리는토끼', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '달리는토끼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 신프로사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 신프로사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신프로사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신프로사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 신프로사장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '신프로사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 찢는미러룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 찢는미러룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찢는미러룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '찢는미러룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 찢는미러룸', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '찢는미러룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 유흥지도사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 유흥지도사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유흥지도사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '10:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유흥지도사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 유흥지도사', '룸', '광명', '19:00'::TIME, '10:00'::TIME, '룸', '유흥지도사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 신유빈실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 신유빈실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신유빈실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신유빈실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 신유빈실장', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '신유빈실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 김포시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 김포시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김포시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김포시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 김포시', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '김포시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 1프로24시터치룸메랍실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 1프로24시터치룸메랍실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1프로24시터치룸메랍실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1프로24시터치룸메랍실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 1프로24시터치룸메랍실장', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '1프로24시터치룸메랍실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 기모노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 기모노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '기모노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '기모노')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 기모노', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '기모노')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 고구려 광수
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 고구려 광수';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고구려 광수';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '고구려 광수')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 고구려 광수', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '고구려 광수')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 올인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 올인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '올인')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 올인', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '올인')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 비쥬얼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 비쥬얼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비쥬얼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '비쥬얼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 비쥬얼', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '비쥬얼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 노래클럽', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 더킹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 더킹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더킹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '더킹')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 더킹', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '더킹')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 장대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 장대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '장대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 장대표', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '장대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 태국 노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 태국 노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태국 노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '태국 노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 태국 노래방', '룸', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '태국 노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 하우스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 하우스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하우스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하우스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 하우스', '룸', '수원', '19:00'::TIME, '11:00'::TIME, '룸', '하우스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 하드 BJ룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 하드 BJ룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드 BJ룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '건대' ELSE address END
      , contact_name = COALESCE(contact_name, '하드 BJ룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 하드 BJ룸', '건대', '성남', '10:00'::TIME, '05:00'::TIME, '룸', '하드 BJ룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림다국적
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림다국적';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림다국적';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신림다국적')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림다국적', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림다국적')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 ❤️유흥다잇소❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 ❤️유흥다잇소❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️유흥다잇소❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️유흥다잇소❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 ❤️유흥다잇소❤️', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '❤️유흥다잇소❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계산 다국적 노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계산 다국적 노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다국적 노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다국적 노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계산 다국적 노래클럽', '룸', '계산', '10:00'::TIME, '05:00'::TIME, '룸', '다국적 노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 분당하이터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 분당하이터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당하이터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분당하이터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 분당하이터치룸', '룸', '성남', '06:00'::TIME, '06:00'::TIME, '룸', '분당하이터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 영업중
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 영업중';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영업중';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '영업중')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 영업중', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '영업중')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 극강하드코어
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 극강하드코어';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강하드코어';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '북창' ELSE address END
      , contact_name = COALESCE(contact_name, '극강하드코어')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 극강하드코어', '북창', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '극강하드코어')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 77노래
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 77노래';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '77노래';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '77노래')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 77노래', '룸', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '77노래')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 하드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 하드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 하드', '룸', '여의도', '18:00'::TIME, '05:00'::TIME, '룸', '하드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 달토 신동엽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 달토 신동엽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '달토 신동엽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '달토 신동엽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 달토 신동엽', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '달토 신동엽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서구 재방1위
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서구 재방1위';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '재방1위';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '서구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '재방1위')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('서구 재방1위', '룸', '서구', '10:00'::TIME, '05:00'::TIME, '룸', '재방1위')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 스위트노래주점
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 스위트노래주점';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스위트노래주점';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '스위트노래주점')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 스위트노래주점', '룸', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '스위트노래주점')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 20대티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 20대티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대티')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 20대티', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '20대티')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 쩜오아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 쩜오아로마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쩜오아로마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '건마')
      , contact_name = COALESCE(contact_name, '쩜오아로마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 쩜오아로마', '건마', '구미', '18:00'::TIME, '05:00'::TIME, '건마', '쩜오아로마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 탁재훈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 탁재훈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탁재훈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '탁재훈')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 탁재훈', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '탁재훈')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 대박짱 가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 대박짱 가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대박짱 가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '대박짱 가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 대박짱 가라오케', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '대박짱 가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 여대생
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 여대생';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여대생';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여대생')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 여대생', '룸', '강서', '06:00'::TIME, '06:00'::TIME, '룸', '여대생')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 찐20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 찐20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '찐20대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 찐20대', '룸', '천안', '18:00'::TIME, '07:00'::TIME, '룸', '찐20대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 인동다국적클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 인동다국적클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인동다국적클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구미' ELSE address END
      , contact_name = COALESCE(contact_name, '인동다국적클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 인동다국적클럽', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '인동다국적클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 추카추카
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 추카추카';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '추카추카';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '의정부' ELSE address END
      , contact_name = COALESCE(contact_name, '추카추카')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('의정부 추카추카', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '룸', '추카추카')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남도파민하이퍼블릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남도파민하이퍼블릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남도파민하이퍼블릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '강남도파민하이퍼블릭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남도파민하이퍼블릭', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남도파민하이퍼블릭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 장웅희노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 장웅희노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장웅희노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '장웅희노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 장웅희노래클럽', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '장웅희노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남엘리트하이퍼블릭이태임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남엘리트하이퍼블릭이태임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남엘리트하이퍼블릭이태임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남엘리트하이퍼블릭이태임')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남엘리트하이퍼블릭이태임', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남엘리트하이퍼블릭이태임')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남엘리트하이퍼블릭손나은
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남엘리트하이퍼블릭손나은';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남엘리트하이퍼블릭손나은';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남엘리트하이퍼블릭손나은')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남엘리트하이퍼블릭손나은', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남엘리트하이퍼블릭손나은')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 초콜렛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 초콜렛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초콜렛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '파주' ELSE address END
      , contact_name = COALESCE(contact_name, '초콜렛')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 초콜렛', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '초콜렛')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 놀이터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 놀이터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀이터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '놀이터')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 놀이터', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '놀이터')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 가성비술집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 가성비술집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가성비술집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '남양주' ELSE address END
      , contact_name = COALESCE(contact_name, '가성비술집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('남양주 가성비술집', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '룸', '가성비술집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 프라이빗 놀이터 하이쩜오 홍탁대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 프라이빗 놀이터 하이쩜오 홍탁대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '프라이빗 놀이터 하이쩜오 홍탁대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '프라이빗 놀이터 하이쩜오 홍탁대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 프라이빗 놀이터 하이쩜오 홍탁대표', '강남', '역삼', '18:00'::TIME, '06:00'::TIME, '룸', '프라이빗 놀이터 하이쩜오 홍탁대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신림동')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림동', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림동')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 람세스2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 람세스2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '람세스2';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '대구' ELSE address END
      , contact_name = COALESCE(contact_name, '람세스2')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 람세스2', '대구', '대구', '10:00'::TIME, '05:00'::TIME, '룸', '람세스2')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 유빈실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 유빈실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유빈실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '08:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유빈실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 유빈실장', '룸', '일산', '19:00'::TIME, '08:00'::TIME, '룸', '유빈실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 준기대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 준기대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '준기대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '준기대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 준기대표', '룸', '제주도', '06:00'::TIME, '06:00'::TIME, '룸', '준기대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 설탕 베트남 다국적 노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 설탕 베트남 다국적 노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설탕 베트남 다국적 노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '설탕 베트남 다국적 노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 설탕 베트남 다국적 노래클럽', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '설탕 베트남 다국적 노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 유흥snl
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 유흥snl';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유흥snl';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유흥snl')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 유흥snl', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '유흥snl')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 메칸더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 메칸더';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '메칸더';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '메칸더')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 메칸더', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '메칸더')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 군산 김실장 20대접대부들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '군산 김실장 20대접대부들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김실장 20대접대부들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '군산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '군산' ELSE address END
      , contact_name = COALESCE(contact_name, '김실장 20대접대부들')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('군산 김실장 20대접대부들', '군산', '군산', '10:00'::TIME, '05:00'::TIME, '룸', '김실장 20대접대부들')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 고윤정
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 고윤정';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고윤정';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '고윤정')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 고윤정', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '고윤정')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 아이돌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아이돌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '주안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아이돌')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('주안 아이돌', '룸', '주안', '10:00'::TIME, '05:00'::TIME, '룸', '아이돌')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 자이언트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 자이언트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자이언트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '자이언트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 자이언트', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '자이언트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 다잇소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 다잇소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다잇소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다잇소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 다잇소', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '다잇소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ✅✅오픈이벤트✅✅✅⭕️❤️하드쩜오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ✅✅오픈이벤트✅✅✅⭕️❤️하드쩜오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅✅오픈이벤트✅✅✅⭕️❤️하드쩜오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '✅✅오픈이벤트✅✅✅⭕️❤️하드쩜오')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ✅✅오픈이벤트✅✅✅⭕️❤️하드쩜오', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '✅✅오픈이벤트✅✅✅⭕️❤️하드쩜오')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 호텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 호텔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '호텔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '호텔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 호텔', '룸', '대전', '06:00'::TIME, '06:00'::TIME, '룸', '호텔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 속초 속초 문화
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '속초 속초 문화';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '속초 문화';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '속초'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '속초 문화')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('속초 속초 문화', '룸', '속초', '10:00'::TIME, '05:00'::TIME, '룸', '속초 문화')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '대전1등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 대전1등', '룸', '대전', '06:00'::TIME, '06:00'::TIME, '룸', '대전1등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 구구단안유진
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 구구단안유진';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구구단안유진';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구구단안유진')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 구구단안유진', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '구구단안유진')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 운동장음악홀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 운동장음악홀';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '운동장음악홀';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '운동장음악홀')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 운동장음악홀', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '운동장음악홀')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 와니이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 와니이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '와니이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '와니이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 와니이사', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '와니이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 20대 퍼블릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 20대 퍼블릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대 퍼블릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대 퍼블릭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 20대 퍼블릭', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '20대 퍼블릭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 봉준대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 봉준대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '봉준대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '봉준대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 봉준대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '봉준대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 월드 다국적
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 월드 다국적';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '월드 다국적';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '월드 다국적')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 월드 다국적', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '월드 다국적')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원인계동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원인계동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원인계동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수원인계동')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 수원인계동', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '수원인계동')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 버닝
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 버닝';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '버닝';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구미' ELSE address END
      , contact_name = COALESCE(contact_name, '버닝')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 버닝', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '버닝')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 깐따삐야
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 깐따삐야';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '깐따삐야';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '깐따삐야')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 깐따삐야', '룸', '대구', '10:00'::TIME, '05:00'::TIME, '룸', '깐따삐야')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 열정범대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 열정범대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '열정범대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '열정범대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 열정범대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '열정범대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 수지여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 수지여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수지여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수지여실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 수지여실장', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '수지여실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남 사라있네 현재사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남 사라있네 현재사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 사라있네 현재사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남 사라있네 현재사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남 사라있네 현재사장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남 사라있네 현재사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 24시', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 구미sky
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 구미sky';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구미sky';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구미sky')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용인 구미sky', '룸', '용인', '10:00'::TIME, '05:00'::TIME, '룸', '구미sky')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 20대이쁜암캐들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 20대이쁜암캐들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대이쁜암캐들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '20대이쁜암캐들')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 20대이쁜암캐들', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '20대이쁜암캐들')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 잠실
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 잠실';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잠실';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '잠실')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('송파 잠실', '룸', '송파', '10:00'::TIME, '05:00'::TIME, '룸', '잠실')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 플러팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 플러팅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '플러팅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 플러팅', '룸', '평택', '19:00'::TIME, '07:00'::TIME, '룸', '플러팅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 노래클럽', '룸', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 크크강마담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 크크강마담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크크강마담';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '크크강마담')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 크크강마담', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '크크강마담')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 진서연
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 진서연';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진서연';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '진서연')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 진서연', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '진서연')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 조보아실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 조보아실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조보아실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '조보아실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 조보아실장', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '조보아실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 부천 클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 부천 클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천 클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '부천 클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 부천 클럽', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '부천 클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 정대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 정대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 정대표', '룸', '안산', '10:00'::TIME, '05:00'::TIME, '룸', '정대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 진구부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 진구부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진구부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '진구부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 진구부장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '진구부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 추천업소 인당15
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 추천업소 인당15';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '추천업소 인당15';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '홍대' ELSE address END
      , contact_name = COALESCE(contact_name, '추천업소 인당15')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 추천업소 인당15', '홍대', '홍대', '24:00'::TIME, '24:00'::TIME, '룸', '추천업소 인당15')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 산토끼가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 산토끼가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '산토끼가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '창동'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '창동' ELSE address END
      , contact_name = COALESCE(contact_name, '산토끼가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('창동 산토끼가라오케', '창동', '창동', '20:00'::TIME, '07:00'::TIME, '룸', '산토끼가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신촌 무한터치 셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신촌 무한터치 셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '무한터치 셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '신촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '무한터치 셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신촌 무한터치 셔츠룸', '룸', '신촌', '24:00'::TIME, '24:00'::TIME, '룸', '무한터치 셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ✡️도✡️파✡️민✡️업✡️주✡️직✡️영✡️최✡️저✡️가✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ✡️도✡️파✡️민✡️업✡️주✡️직✡️영✡️최✡️저✡️가✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️도✡️파✡️민✡️업✡️주✡️직✡️영✡️최✡️저✡️가✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '✡️도✡️파✡️민✡️업✡️주✡️직✡️영✡️최✡️저✡️가✡️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ✡️도✡️파✡️민✡️업✡️주✡️직✡️영✡️최✡️저✡️가✡️', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '✡️도✡️파✡️민✡️업✡️주✡️직✡️영✡️최✡️저✡️가✡️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ✅20대✅쫄깃✅탱탱✅D컵✅최저가✅셔츠룸✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ✅20대✅쫄깃✅탱탱✅D컵✅최저가✅셔츠룸✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅20대✅쫄깃✅탱탱✅D컵✅최저가✅셔츠룸✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '✅20대✅쫄깃✅탱탱✅D컵✅최저가✅셔츠룸✅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ✅20대✅쫄깃✅탱탱✅D컵✅최저가✅셔츠룸✅', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '✅20대✅쫄깃✅탱탱✅D컵✅최저가✅셔츠룸✅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 바다대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 바다대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '바다대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '바다대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 바다대표', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '바다대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 ✅쩜오✅상탈✅물빨✅풀발✅걸레✅쩜오✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 ✅쩜오✅상탈✅물빨✅풀발✅걸레✅쩜오✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅쩜오✅상탈✅물빨✅풀발✅걸레✅쩜오✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '역삼' ELSE address END
      , contact_name = COALESCE(contact_name, '✅쩜오✅상탈✅물빨✅풀발✅걸레✅쩜오✅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 ✅쩜오✅상탈✅물빨✅풀발✅걸레✅쩜오✅', '역삼', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '✅쩜오✅상탈✅물빨✅풀발✅걸레✅쩜오✅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신논현 Ⓜ️24시Ⓜ️C컵Ⓜ️핑두Ⓜ️핑보Ⓜ️무한터치Ⓜ️셔츠룸Ⓜ️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신논현 Ⓜ️24시Ⓜ️C컵Ⓜ️핑두Ⓜ️핑보Ⓜ️무한터치Ⓜ️셔츠룸Ⓜ️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️24시Ⓜ️C컵Ⓜ️핑두Ⓜ️핑보Ⓜ️무한터치Ⓜ️셔츠룸Ⓜ️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신논현' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️24시Ⓜ️C컵Ⓜ️핑두Ⓜ️핑보Ⓜ️무한터치Ⓜ️셔츠룸Ⓜ️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신논현 Ⓜ️24시Ⓜ️C컵Ⓜ️핑두Ⓜ️핑보Ⓜ️무한터치Ⓜ️셔츠룸Ⓜ️', '신논현', '신논현', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️24시Ⓜ️C컵Ⓜ️핑두Ⓜ️핑보Ⓜ️무한터치Ⓜ️셔츠룸Ⓜ️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 ✅✅텐카페✅프라이빗✅수질최상✅텐카페✅✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 ✅✅텐카페✅프라이빗✅수질최상✅텐카페✅✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅✅텐카페✅프라이빗✅수질최상✅텐카페✅✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '역삼' ELSE address END
      , contact_name = COALESCE(contact_name, '✅✅텐카페✅프라이빗✅수질최상✅텐카페✅✅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 ✅✅텐카페✅프라이빗✅수질최상✅텐카페✅✅', '역삼', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '✅✅텐카페✅프라이빗✅수질최상✅텐카페✅✅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 Ⓜ️Ⓜ️24시Ⓜ️극강 마인드Ⓜ️하이 풀 터치룸Ⓜ️Ⓜ️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 Ⓜ️Ⓜ️24시Ⓜ️극강 마인드Ⓜ️하이 풀 터치룸Ⓜ️Ⓜ️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️Ⓜ️24시Ⓜ️극강 마인드Ⓜ️하이 풀 터치룸Ⓜ️Ⓜ️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️Ⓜ️24시Ⓜ️극강 마인드Ⓜ️하이 풀 터치룸Ⓜ️Ⓜ️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 Ⓜ️Ⓜ️24시Ⓜ️극강 마인드Ⓜ️하이 풀 터치룸Ⓜ️Ⓜ️', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️Ⓜ️24시Ⓜ️극강 마인드Ⓜ️하이 풀 터치룸Ⓜ️Ⓜ️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신논현 Ⓜ️비키니 룸Ⓜ️자연산 가슴Ⓜ️무한 풀 터치Ⓜ️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신논현 Ⓜ️비키니 룸Ⓜ️자연산 가슴Ⓜ️무한 풀 터치Ⓜ️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️비키니 룸Ⓜ️자연산 가슴Ⓜ️무한 풀 터치Ⓜ️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신논현' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️비키니 룸Ⓜ️자연산 가슴Ⓜ️무한 풀 터치Ⓜ️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신논현 Ⓜ️비키니 룸Ⓜ️자연산 가슴Ⓜ️무한 풀 터치Ⓜ️', '신논현', '신논현', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️비키니 룸Ⓜ️자연산 가슴Ⓜ️무한 풀 터치Ⓜ️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 ✴️24시✴️티팬티 룸✴️오피가이드 추천업소✴️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 ✴️24시✴️티팬티 룸✴️오피가이드 추천업소✴️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✴️24시✴️티팬티 룸✴️오피가이드 추천업소✴️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '삼성' ELSE address END
      , contact_name = COALESCE(contact_name, '✴️24시✴️티팬티 룸✴️오피가이드 추천업소✴️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 ✴️24시✴️티팬티 룸✴️오피가이드 추천업소✴️', '삼성', '삼성', '10:00'::TIME, '05:00'::TIME, '룸', '✴️24시✴️티팬티 룸✴️오피가이드 추천업소✴️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ✡️24시✡️달토✡️업주직영✡️최저가✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ✡️24시✡️달토✡️업주직영✡️최저가✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️24시✡️달토✡️업주직영✡️최저가✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '✡️24시✡️달토✡️업주직영✡️최저가✡️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ✡️24시✡️달토✡️업주직영✡️최저가✡️', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '✡️24시✡️달토✡️업주직영✡️최저가✡️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 삼성 ⚜️도파민24❣️깐부❤️이병헌⚜️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '삼성 ⚜️도파민24❣️깐부❤️이병헌⚜️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⚜️도파민24❣️깐부❤️이병헌⚜️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '삼성'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '삼성' ELSE address END
      , contact_name = COALESCE(contact_name, '⚜️도파민24❣️깐부❤️이병헌⚜️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('삼성 ⚜️도파민24❣️깐부❤️이병헌⚜️', '삼성', '삼성', '10:00'::TIME, '05:00'::TIME, '룸', '⚜️도파민24❣️깐부❤️이병헌⚜️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 진구부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 진구부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '진구부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '진구부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 진구부장', '룸', '노원', '06:00'::TIME, '06:00'::TIME, '룸', '진구부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 홍부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 홍부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '홍부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 홍부장', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '홍부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대구 테라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대구 테라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '테라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '테라')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대구 테라', '룸', '대구', '10:00'::TIME, '05:00'::TIME, '룸', '테라')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마인드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 마인드', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '마인드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 마인드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 마인드';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마인드';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마인드')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 마인드', '룸', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '마인드')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도파민 터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도파민 터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민 터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '도파민 터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 도파민 터치룸', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '도파민 터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 하이브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 하이브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이브';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이브')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 하이브', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '하이브')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 송중기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 송중기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '송중기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '송중기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 송중기', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '송중기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 핫플레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 핫플레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '20:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '핫플레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 핫플레이스', '룸', '수원', '20:00'::TIME, '11:00'::TIME, '룸', '핫플레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 최지우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 최지우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최지우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '최지우')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 최지우', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '최지우')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 뮤 셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 뮤 셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '뮤 셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '뮤 셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 뮤 셔츠룸', '수원', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '뮤 셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 태수사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 태수사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태수사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '태수사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 태수사장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '태수사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 강력추천업소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 강력추천업소';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강력추천업소';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강력추천업소')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 강력추천업소', '룸', '분당', '17:00'::TIME, '09:00'::TIME, '룸', '강력추천업소')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 대전타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 대전타임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대전타임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '대전' ELSE address END
      , contact_name = COALESCE(contact_name, '대전타임')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 대전타임', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '룸', '대전타임')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남 - 쩜오 앤클레이브 - 제이스대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남 - 쩜오 앤클레이브 - 제이스대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 - 쩜오 앤클레이브 - 제이스대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '강남 - 쩜오 앤클레이브 - 제이스대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남 - 쩜오 앤클레이브 - 제이스대표', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남 - 쩜오 앤클레이브 - 제이스대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 홍대파레스가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 홍대파레스가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍대파레스가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '홍대파레스가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 홍대파레스가라오케', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '홍대파레스가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 김민기대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 김민기대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김민기대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김민기대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 김민기대표', '룸', '대전', '10:00'::TIME, '05:00'::TIME, '룸', '김민기대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 보라실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 보라실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '보라실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '보라실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 보라실장', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '보라실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 놀이터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 놀이터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀이터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '놀이터')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 놀이터', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '놀이터')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 인계동1등술무제한
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 인계동1등술무제한';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인계동1등술무제한';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수원' ELSE address END
      , contact_name = COALESCE(contact_name, '인계동1등술무제한')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 인계동1등술무제한', '수원', '수원', '12:00'::TIME, '06:00'::TIME, '룸', '인계동1등술무제한')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 BUNNY
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 BUNNY';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BUNNY';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'BUNNY')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 BUNNY', '룸', '계양', '10:00'::TIME, '05:00'::TIME, '룸', 'BUNNY')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 마포최저가셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 마포최저가셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마포최저가셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '마포최저가셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 마포최저가셔츠룸', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '마포최저가셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 영화대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 영화대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영화대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '영화대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 영화대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '영화대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강릉 상실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강릉 상실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '상실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강릉 상실장', '룸', '강릉', '10:00'::TIME, '05:00'::TIME, '룸', '상실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 천안오르실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 천안오르실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '천안오르실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '천안오르실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 천안오르실장', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '천안오르실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 극강조개맛집 쫄깃쫄깃
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 극강조개맛집 쫄깃쫄깃';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강조개맛집 쫄깃쫄깃';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '극강조개맛집 쫄깃쫄깃')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 극강조개맛집 쫄깃쫄깃', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '극강조개맛집 쫄깃쫄깃')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 극강쫄깃조개맛집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 극강쫄깃조개맛집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강쫄깃조개맛집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강쫄깃조개맛집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 극강쫄깃조개맛집', '룸', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '극강쫄깃조개맛집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 초극강
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 초극강';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '초극강';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '초극강')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 초극강', '룸', '강서', '19:00'::TIME, '04:00'::TIME, '룸', '초극강')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 ෆ채영실장ෆ
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 ෆ채영실장ෆ';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'ෆ채영실장ෆ';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부산' ELSE address END
      , contact_name = COALESCE(contact_name, 'ෆ채영실장ෆ')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부산 ෆ채영실장ෆ', '부산', '부산', '10:00'::TIME, '05:00'::TIME, '룸', 'ෆ채영실장ෆ')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 플러팅 하진사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 플러팅 하진사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플러팅 하진사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '플러팅 하진사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 플러팅 하진사장', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '플러팅 하진사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 조실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 조실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '조실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '조실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 조실장', '룸', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '조실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 1등초콜렛
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 1등초콜렛';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등초콜렛';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1등초콜렛')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 1등초콜렛', '룸', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '1등초콜렛')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 트럼프
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 트럼프';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '트럼프';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '트럼프')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 트럼프', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '트럼프')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 의정부 1등 룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 의정부 1등 룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '의정부 1등 룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '의정부' ELSE address END
      , contact_name = COALESCE(contact_name, '의정부 1등 룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('의정부 의정부 1등 룸', '의정부', '의정부', '10:00'::TIME, '05:00'::TIME, '룸', '의정부 1등 룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 마포하정우실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 마포하정우실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마포하정우실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '마포하정우실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 마포하정우실장', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '마포하정우실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 극강더티7no
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 극강더티7no';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강더티7no';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '김포' ELSE address END
      , contact_name = COALESCE(contact_name, '극강더티7no')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 극강더티7no', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '극강더티7no')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 강서최고석부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 강서최고석부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서최고석부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강서최고석부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 강서최고석부장', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '강서최고석부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 김부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 김부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '여의도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('여의도 김부장', '룸', '여의도', '10:00'::TIME, '05:00'::TIME, '룸', '김부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 이부장네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 이부장네';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이부장네';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이부장네')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 이부장네', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '이부장네')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 화곡동 이부장집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 화곡동 이부장집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '화곡동 이부장집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구로'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '화곡동 이부장집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구로 화곡동 이부장집', '룸', '구로', '10:00'::TIME, '05:00'::TIME, '룸', '화곡동 이부장집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 수유셔츠김대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 수유셔츠김대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수유셔츠김대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '수유' ELSE address END
      , contact_name = COALESCE(contact_name, '수유셔츠김대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 수유셔츠김대표', '수유', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '수유셔츠김대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 윈저
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 윈저';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '윈저';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '윈저')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 윈저', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '윈저')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 멕켈란
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 멕켈란';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '멕켈란';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '멕켈란')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 멕켈란', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '멕켈란')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 언니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 언니';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '언니';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '언니')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 언니', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '언니')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계산 알리바바
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계산 알리바바';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '알리바바';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '계산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '알리바바')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계산 알리바바', '룸', '계산', '06:00'::TIME, '06:00'::TIME, '룸', '알리바바')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 노마진
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 노마진';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노마진';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노마진')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 노마진', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '노마진')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 퀄리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 퀄리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀄리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수유'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '퀄리티')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수유 퀄리티', '룸', '수유', '10:00'::TIME, '05:00'::TIME, '룸', '퀄리티')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 노원퀄리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 노원퀄리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노원퀄리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노원퀄리티')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 노원퀄리티', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '노원퀄리티')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 수원 하퍼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 수원 하퍼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수원 하퍼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수원 하퍼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 수원 하퍼', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '수원 하퍼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 폭스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 폭스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '폭스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '폭스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 폭스', '룸', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '폭스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 양상국실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 양상국실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '양상국실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '양상국실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 양상국실장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '양상국실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 하정실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 하정실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하정실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하정실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 하정실장', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '하정실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 김아린실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 김아린실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김아린실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '김아린실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 김아린실장', '룸', '강남', '17:00'::TIME, '06:00'::TIME, '룸', '김아린실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 풍자실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 풍자실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풍자실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '풍자실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 풍자실장', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '풍자실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 다국적노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 다국적노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다국적노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '광명' ELSE address END
      , contact_name = COALESCE(contact_name, '다국적노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 다국적노래클럽', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '룸', '다국적노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 연수구 연수동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '연수구 연수동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연수동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '연수구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '연수동')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('연수구 연수동', '룸', '연수구', '10:00'::TIME, '05:00'::TIME, '룸', '연수동')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 종로 웰빙
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '종로 웰빙';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '웰빙';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '종로'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '종로' ELSE address END
      , contact_name = COALESCE(contact_name, '웰빙')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('종로 웰빙', '종로', '종로', '10:00'::TIME, '05:00'::TIME, '룸', '웰빙')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 셔츠하퍼2
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 셔츠하퍼2';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼2';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼2')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('고양 셔츠하퍼2', '룸', '고양', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼2')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 여신들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 여신들';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여신들';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '17:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여신들')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 여신들', '룸', '성남', '17:00'::TIME, '09:00'::TIME, '룸', '여신들')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 다국적섹쉬클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 다국적섹쉬클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다국적섹쉬클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '김포' ELSE address END
      , contact_name = COALESCE(contact_name, '다국적섹쉬클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 다국적섹쉬클럽', '김포', '강서', '18:00'::TIME, '05:00'::TIME, '룸', '다국적섹쉬클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 ✡️극강하드더티클럽5NO장원영✡️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 ✡️극강하드더티클럽5NO장원영✡️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✡️극강하드더티클럽5NO장원영✡️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '고양' ELSE address END
      , contact_name = COALESCE(contact_name, '✡️극강하드더티클럽5NO장원영✡️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('고양 ✡️극강하드더티클럽5NO장원영✡️', '고양', '고양', '10:00'::TIME, '05:00'::TIME, '룸', '✡️극강하드더티클럽5NO장원영✡️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 장원영실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 장원영실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장원영실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '장원영실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 장원영실장', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '장원영실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 올방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 올방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '올방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 올방', '룸', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '올방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 방석
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 방석';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방석';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '방석')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 방석', '룸', '일산', '19:00'::TIME, '04:00'::TIME, '룸', '방석')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 종성사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 종성사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '종성사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '종성사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 종성사장', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '종성사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 다이아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 다이아';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다이아';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다이아')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 다이아', '룸', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '다이아')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 10만
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 10만';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '10만';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '10만')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 10만', '룸', '마포', '06:00'::TIME, '06:00'::TIME, '룸', '10만')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 팔레스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 팔레스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '팔레스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '팔레스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 팔레스', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '팔레스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 탈셔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 탈셔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '탈셔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '탈셔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 탈셔', '룸', '마포', '06:00'::TIME, '06:00'::TIME, '룸', '탈셔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 방방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 방방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '방방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '방방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 방방', '룸', '마포', '06:00'::TIME, '06:00'::TIME, '룸', '방방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 지서실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 지서실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '지서실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '지서실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 지서실장', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '지서실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 베리엔굿 정유미대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 베리엔굿 정유미대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베리엔굿 정유미대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베리엔굿 정유미대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 베리엔굿 정유미대표', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '베리엔굿 정유미대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 태양대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 태양대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '태양대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '08:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '태양대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 태양대표', '룸', '홍대', '18:00'::TIME, '08:00'::TIME, '룸', '태양대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 황제
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 황제';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '황제';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '황제')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 황제', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '황제')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 대한항공
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 대한항공';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대한항공';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구리' ELSE address END
      , contact_name = COALESCE(contact_name, '대한항공')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 대한항공', '구리', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '대한항공')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 얼굴
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 얼굴';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '얼굴';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '얼굴')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 얼굴', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '얼굴')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 대학생bar
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 대학생bar';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '대학생bar';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '홍대' ELSE address END
      , contact_name = COALESCE(contact_name, '대학생bar')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 대학생bar', '홍대', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '대학생bar')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 t팬티셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 t팬티셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 't팬티셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, 't팬티셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 t팬티셔츠룸', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', 't팬티셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 핫플레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 핫플레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '핫플레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 핫플레이스', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '핫플레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 퀄리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 퀄리티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퀄리티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '퀄리티')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용인 퀄리티', '룸', '용인', '10:00'::TIME, '05:00'::TIME, '룸', '퀄리티')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 핫플레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 핫플레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '핫플레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 핫플레이스', '룸', '성남', '10:00'::TIME, '05:00'::TIME, '룸', '핫플레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '20대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 20대', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '20대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 런닝맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 런닝맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런닝맨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '대전' ELSE address END
      , contact_name = COALESCE(contact_name, '런닝맨')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 런닝맨', '대전', '대전', '18:00'::TIME, '06:00'::TIME, '룸', '런닝맨')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 유대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 유대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 유대표', '룸', '부천', '06:00'::TIME, '06:00'::TIME, '룸', '유대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 일산 전부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 일산 전부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 전부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '일산 전부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 일산 전부장', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '일산 전부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서 셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서 셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서 셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강서' ELSE address END
      , contact_name = COALESCE(contact_name, '강서 셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서 셔츠룸', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '강서 셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 한결대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 한결대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한결대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '한결대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 한결대표', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '한결대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 안산1등
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 안산1등';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안산1등';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '08:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '안산1등')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 안산1등', '룸', '안산', '19:00'::TIME, '08:00'::TIME, '룸', '안산1등')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 합정 Ⓜ️Ⓜ️무한초이스Ⓜ️Ⓜ️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '합정 Ⓜ️Ⓜ️무한초이스Ⓜ️Ⓜ️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️Ⓜ️무한초이스Ⓜ️Ⓜ️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '합정'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '합정' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️Ⓜ️무한초이스Ⓜ️Ⓜ️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('합정 Ⓜ️Ⓜ️무한초이스Ⓜ️Ⓜ️', '합정', '합정', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️Ⓜ️무한초이스Ⓜ️Ⓜ️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 합정 솔로클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '합정 솔로클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '솔로클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '합정'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '합정' ELSE address END
      , contact_name = COALESCE(contact_name, '솔로클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('합정 솔로클럽', '합정', '합정', '10:00'::TIME, '05:00'::TIME, '룸', '솔로클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 이하니대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 이하니대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이하니대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이하니대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 이하니대표', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '이하니대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 장원영실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 장원영실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '장원영실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '장원영실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 장원영실장', '룸', '천안', '19:00'::TIME, '11:00'::TIME, '룸', '장원영실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 위너스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 위너스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '위너스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '위너스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 위너스', '룸', '부천', '18:00'::TIME, '05:00'::TIME, '룸', '위너스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 마포김대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 마포김대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마포김대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '마포김대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 마포김대표', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '마포김대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 카푸치노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 카푸치노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카푸치노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '카푸치노')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 카푸치노', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '카푸치노')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 아자아자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 아자아자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아자아자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '08:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아자아자')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 아자아자', '룸', '분당', '18:00'::TIME, '08:00'::TIME, '룸', '아자아자')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 1등 강대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 1등 강대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '1등 강대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '1등 강대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 1등 강대표', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '1등 강대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 셔츠퍼블릭룸옆집보다쌉니다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 셔츠퍼블릭룸옆집보다쌉니다';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠퍼블릭룸옆집보다쌉니다';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠퍼블릭룸옆집보다쌉니다')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 셔츠퍼블릭룸옆집보다쌉니다', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠퍼블릭룸옆집보다쌉니다')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 북창 발렌시아가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '북창 발렌시아가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '발렌시아가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '북창'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '발렌시아가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('북창 발렌시아가', '룸', '북창', '10:00'::TIME, '05:00'::TIME, '룸', '발렌시아가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 높은
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 높은';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '높은';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '높은')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 높은', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '높은')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 강서마곡1등가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 강서마곡1등가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강서마곡1등가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강서' ELSE address END
      , contact_name = COALESCE(contact_name, '강서마곡1등가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 강서마곡1등가라오케', '강서', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '강서마곡1등가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 풀싸롱 이수근대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 풀싸롱 이수근대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀싸롱 이수근대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '풀싸롱 이수근대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 풀싸롱 이수근대표', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '풀싸롱 이수근대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 최저가
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 최저가';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '최저가';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '최저가')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 최저가', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '최저가')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 찐20대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 찐20대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐20대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '찐20대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 찐20대', '룸', '일산', '06:00'::TIME, '09:00'::TIME, '룸', '찐20대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 핫플레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 핫플레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '파주' ELSE address END
      , contact_name = COALESCE(contact_name, '핫플레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 핫플레이스', '파주', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '핫플레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 핫플레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 핫플레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '김포' ELSE address END
      , contact_name = COALESCE(contact_name, '핫플레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 핫플레이스', '김포', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '핫플레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 핫플레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 핫플레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핫플레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '고양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '고양' ELSE address END
      , contact_name = COALESCE(contact_name, '핫플레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('고양 핫플레이스', '고양', '고양', '10:00'::TIME, '05:00'::TIME, '룸', '핫플레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 찐20대하이터치
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 찐20대하이터치';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐20대하이터치';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '찐20대하이터치')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 찐20대하이터치', '일산', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '찐20대하이터치')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 니즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 니즈';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '니즈';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '홍대'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '니즈')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('홍대 니즈', '룸', '홍대', '10:00'::TIME, '05:00'::TIME, '룸', '니즈')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 bar11club
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 bar11club';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'bar11club';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, 'bar11club')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 bar11club', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', 'bar11club')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 분당풀싸롱정점
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 분당풀싸롱정점';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당풀싸롱정점';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분당풀싸롱정점')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 분당풀싸롱정점', '룸', '성남', '10:00'::TIME, '05:00'::TIME, '룸', '분당풀싸롱정점')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 레깅스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 레깅스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레깅스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '레깅스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 레깅스', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '레깅스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 해롱이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 해롱이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '해롱이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '해롱이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 해롱이', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '해롱이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평촌 안양1등 셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평촌 안양1등 셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안양1등 셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평촌'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '안양1등 셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평촌 안양1등 셔츠룸', '룸', '평촌', '10:00'::TIME, '05:00'::TIME, '룸', '안양1등 셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 cnn
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 cnn';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'cnn';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'cnn')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 cnn', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', 'cnn')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 유흥의달인
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 유흥의달인';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유흥의달인';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유흥의달인')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 유흥의달인', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '유흥의달인')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 선물
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 선물';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '선물';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '선물')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 선물', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '선물')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 썸데이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 썸데이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '썸데이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '썸데이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 썸데이', '룸', '강남', '06:00'::TIME, '04:00'::TIME, '룸', '썸데이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 한번만 읽어주세요
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 한번만 읽어주세요';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한번만 읽어주세요';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '한번만 읽어주세요')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 한번만 읽어주세요', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '한번만 읽어주세요')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 가라오케', '룸', '평택', '19:00'::TIME, '07:00'::TIME, '룸', '가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 구구단지우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 구구단지우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구구단지우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구구단지우')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 구구단지우', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '구구단지우')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 영상
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 영상';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '영상';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '영상')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 영상', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '영상')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 런닝
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 런닝';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런닝';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '런닝')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 런닝', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '런닝')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 평택 평택찐1번퍼블릭앤쓰리노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '평택 평택찐1번퍼블릭앤쓰리노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '평택찐1번퍼블릭앤쓰리노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '평택'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '평택' ELSE address END
      , contact_name = COALESCE(contact_name, '평택찐1번퍼블릭앤쓰리노')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('평택 평택찐1번퍼블릭앤쓰리노', '평택', '평택', '10:00'::TIME, '05:00'::TIME, '룸', '평택찐1번퍼블릭앤쓰리노')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 연주실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 연주실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '연주실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '연주실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 연주실장', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '연주실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 이태곤대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 이태곤대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이태곤대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이태곤대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 이태곤대표', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '이태곤대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 쩜오
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 쩜오';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '쩜오';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '쩜오')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 쩜오', '룸', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', '쩜오')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 Ⓜ️Ⓜ️한미모Ⓜ️하는 찐 여실장Ⓜ️풀터치룸Ⓜ️Ⓜ️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 Ⓜ️Ⓜ️한미모Ⓜ️하는 찐 여실장Ⓜ️풀터치룸Ⓜ️Ⓜ️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️Ⓜ️한미모Ⓜ️하는 찐 여실장Ⓜ️풀터치룸Ⓜ️Ⓜ️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '역삼' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️Ⓜ️한미모Ⓜ️하는 찐 여실장Ⓜ️풀터치룸Ⓜ️Ⓜ️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 Ⓜ️Ⓜ️한미모Ⓜ️하는 찐 여실장Ⓜ️풀터치룸Ⓜ️Ⓜ️', '역삼', '역삼', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️Ⓜ️한미모Ⓜ️하는 찐 여실장Ⓜ️풀터치룸Ⓜ️Ⓜ️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 Ⓜ️Ⓜ️복 종 하 는 년Ⓜ️ ⚛️코 스 프 레 룸⚛️⚛️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 Ⓜ️Ⓜ️복 종 하 는 년Ⓜ️ ⚛️코 스 프 레 룸⚛️⚛️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Ⓜ️Ⓜ️복 종 하 는 년Ⓜ️ ⚛️코 스 프 레 룸⚛️⚛️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '논현' ELSE address END
      , contact_name = COALESCE(contact_name, 'Ⓜ️Ⓜ️복 종 하 는 년Ⓜ️ ⚛️코 스 프 레 룸⚛️⚛️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 Ⓜ️Ⓜ️복 종 하 는 년Ⓜ️ ⚛️코 스 프 레 룸⚛️⚛️', '논현', '논현', '10:00'::TIME, '05:00'::TIME, '룸', 'Ⓜ️Ⓜ️복 종 하 는 년Ⓜ️ ⚛️코 스 프 레 룸⚛️⚛️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 유희왕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 유희왕';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '유희왕';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '유희왕')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 유희왕', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '유희왕')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 자전거 왕전무
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 자전거 왕전무';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '자전거 왕전무';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '자전거 왕전무')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 자전거 왕전무', '룸', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '자전거 왕전무')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ⛔️Ⓜ️IMPACT 우부장Ⓜ️⛔️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ⛔️Ⓜ️IMPACT 우부장Ⓜ️⛔️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '⛔️Ⓜ️IMPACT 우부장Ⓜ️⛔️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '⛔️Ⓜ️IMPACT 우부장Ⓜ️⛔️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ⛔️Ⓜ️IMPACT 우부장Ⓜ️⛔️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '⛔️Ⓜ️IMPACT 우부장Ⓜ️⛔️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 갤러리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 갤러리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '갤러리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '07:00'::TIME,
      close_time = '11:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '일산' ELSE address END
      , contact_name = COALESCE(contact_name, '갤러리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 갤러리', '일산', '일산', '07:00'::TIME, '11:00'::TIME, '룸', '갤러리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 소은실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 소은실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '소은실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '파주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '소은실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('파주 소은실장', '룸', '파주', '10:00'::TIME, '05:00'::TIME, '룸', '소은실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 킹스맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 킹스맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '킹스맨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '킹스맨')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 킹스맨', '룸', '강서', '18:00'::TIME, '05:00'::TIME, '룸', '킹스맨')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 큐브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 큐브';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '큐브';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구리' ELSE address END
      , contact_name = COALESCE(contact_name, '큐브')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 큐브', '구리', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '큐브')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 노홍철사원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 노홍철사원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '노홍철사원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '노홍철사원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 노홍철사원', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '노홍철사원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 루이스바
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 루이스바';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '루이스바';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '루이스바')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 루이스바', '룸', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '루이스바')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 찐 20대 터치룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 찐 20대 터치룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '찐 20대 터치룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강동' ELSE address END
      , contact_name = COALESCE(contact_name, '찐 20대 터치룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강동 찐 20대 터치룸', '강동', '강동', '10:00'::TIME, '05:00'::TIME, '룸', '찐 20대 터치룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 길동
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 길동';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '길동';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '길동')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강동 길동', '룸', '강동', '06:00'::TIME, '06:00'::TIME, '룸', '길동')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 플레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 플레이';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '플레이';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '마포' ELSE address END
      , contact_name = COALESCE(contact_name, '플레이')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 플레이', '마포', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '플레이')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 VERY & GOOD
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 VERY & GOOD';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VERY & GOOD';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '대전' ELSE address END
      , contact_name = COALESCE(contact_name, 'VERY & GOOD')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 VERY & GOOD', '대전', '대전', '12:00'::TIME, '06:00'::TIME, '룸', 'VERY & GOOD')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양천 셔츠하퍼10
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양천 셔츠하퍼10';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼10';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼10')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('양천 셔츠하퍼10', '룸', '양천', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼10')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ☀️하드코어☀️✴️한소희실장✴️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ☀️하드코어☀️✴️한소희실장✴️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '☀️하드코어☀️✴️한소희실장✴️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '☀️하드코어☀️✴️한소희실장✴️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ☀️하드코어☀️✴️한소희실장✴️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '☀️하드코어☀️✴️한소희실장✴️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 방이동 물빨 하드룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '방이동 물빨 하드룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '물빨 하드룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '방이동'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '건대' ELSE address END
      , contact_name = COALESCE(contact_name, '물빨 하드룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('방이동 물빨 하드룸', '건대', '방이동', '10:00'::TIME, '05:00'::TIME, '룸', '물빨 하드룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 목동 셔츠하퍼9
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '목동 셔츠하퍼9';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠하퍼9';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '목동'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '셔츠하퍼9')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('목동 셔츠하퍼9', '룸', '목동', '10:00'::TIME, '05:00'::TIME, '룸', '셔츠하퍼9')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 마블다국적노래
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 마블다국적노래';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '마블다국적노래';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '남동구'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '마블다국적노래')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('남동구 마블다국적노래', '룸', '남동구', '06:00'::TIME, '06:00'::TIME, '룸', '마블다국적노래')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 계양 하퍼&셔츠1등 - 대표구좌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 하퍼&셔츠1등 - 대표구좌';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하퍼&셔츠1등 - 대표구좌';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '계양'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '계양' ELSE address END
      , contact_name = COALESCE(contact_name, '하퍼&셔츠1등 - 대표구좌')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('계양 하퍼&셔츠1등 - 대표구좌', '계양', '계양', '10:00'::TIME, '05:00'::TIME, '룸', '하퍼&셔츠1등 - 대표구좌')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 시크릿
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 시크릿';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '시크릿';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '청주' ELSE address END
      , contact_name = COALESCE(contact_name, '시크릿')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 시크릿', '청주', '청주', '18:00'::TIME, '05:00'::TIME, '룸', '시크릿')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 제니스 셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 제니스 셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니스 셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '청주' ELSE address END
      , contact_name = COALESCE(contact_name, '제니스 셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 제니스 셔츠룸', '청주', '청주', '10:00'::TIME, '05:00'::TIME, '룸', '제니스 셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 슈퍼맨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 슈퍼맨';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈퍼맨';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '일산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '슈퍼맨')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('일산 슈퍼맨', '룸', '일산', '10:00'::TIME, '05:00'::TIME, '룸', '슈퍼맨')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 안산
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 안산';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '안산';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '시흥'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '안산')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('시흥 안산', '룸', '시흥', '10:00'::TIME, '05:00'::TIME, '룸', '안산')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 슈퍼맨 황이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 슈퍼맨 황이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '슈퍼맨 황이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '간석'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '슈퍼맨 황이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('간석 슈퍼맨 황이사', '룸', '간석', '10:00'::TIME, '05:00'::TIME, '룸', '슈퍼맨 황이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 구리레츠고 장원영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 구리레츠고 장원영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구리레츠고 장원영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구리레츠고 장원영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 구리레츠고 장원영', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '구리레츠고 장원영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 남양주 다산
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 남양주 다산';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '남양주 다산';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '남양주 다산')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('남양주 남양주 다산', '룸', '남양주', '10:00'::TIME, '05:00'::TIME, '룸', '남양주 다산')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 하남 노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 하남 노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하남 노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하남 노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('하남 하남 노래방', '룸', '하남', '10:00'::TIME, '05:00'::TIME, '룸', '하남 노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 상봉 망우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 상봉 망우';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상봉 망우';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '상봉 망우')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('상봉 상봉 망우', '룸', '상봉', '10:00'::TIME, '05:00'::TIME, '룸', '상봉 망우')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 강동 장원영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 강동 장원영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강동 장원영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강동'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강동 장원영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강동 강동 장원영', '룸', '강동', '10:00'::TIME, '05:00'::TIME, '룸', '강동 장원영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 구리셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 구리셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구리셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구리' ELSE address END
      , contact_name = COALESCE(contact_name, '구리셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 구리셔츠룸', '구리', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '구리셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 카리나셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 카리나셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카리나셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '하남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '하남' ELSE address END
      , contact_name = COALESCE(contact_name, '카리나셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('하남 카리나셔츠룸', '하남', '하남', '10:00'::TIME, '05:00'::TIME, '룸', '카리나셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 카리나셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 카리나셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카리나셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '남양주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '남양주' ELSE address END
      , contact_name = COALESCE(contact_name, '카리나셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('남양주 카리나셔츠룸', '남양주', '남양주', '10:00'::TIME, '05:00'::TIME, '룸', '카리나셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 상봉 카리나셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '상봉 카리나셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카리나셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '상봉'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '카리나셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('상봉 카리나셔츠룸', '룸', '상봉', '10:00'::TIME, '05:00'::TIME, '룸', '카리나셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 카리나셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 카리나셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카리나셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천호'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '천호' ELSE address END
      , contact_name = COALESCE(contact_name, '카리나셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천호 카리나셔츠룸', '천호', '천호', '10:00'::TIME, '05:00'::TIME, '룸', '카리나셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 24시홍진영
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 24시홍진영';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '24시홍진영';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '24시홍진영')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 24시홍진영', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '24시홍진영')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 너어
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 너어';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '너어';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '너어')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 너어', '룸', '구리', '06:00'::TIME, '06:00'::TIME, '룸', '너어')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 러시아노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 러시아노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러시아노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '울산' ELSE address END
      , contact_name = COALESCE(contact_name, '러시아노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 러시아노래방', '울산', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '러시아노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 도파민레전드대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 도파민레전드대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민레전드대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '도파민레전드대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 도파민레전드대표', '강남', '선릉', '24:00'::TIME, '24:00'::TIME, '룸', '도파민레전드대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구미 오늘노래주점
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구미 오늘노래주점';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오늘노래주점';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구미'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '구미' ELSE address END
      , contact_name = COALESCE(contact_name, '오늘노래주점')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구미 오늘노래주점', '구미', '구미', '10:00'::TIME, '05:00'::TIME, '룸', '오늘노래주점')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 퍼펙트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 퍼펙트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼펙트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '퍼펙트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 퍼펙트', '룸', '전주', '18:00'::TIME, '05:00'::TIME, '룸', '퍼펙트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 아우라 가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 아우라 가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아우라 가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아우라 가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 아우라 가라오케', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '아우라 가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 정실장픽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 정실장픽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정실장픽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정실장픽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 정실장픽', '룸', '전주', '19:00'::TIME, '05:00'::TIME, '룸', '정실장픽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 러태한
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 러태한';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '러태한';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '러태한')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 러태한', '룸', '전주', '18:00'::TIME, '06:00'::TIME, '룸', '러태한')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 인천부평24시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 인천부평24시';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인천부평24시';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부평'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부평' ELSE address END
      , contact_name = COALESCE(contact_name, '인천부평24시')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부평 인천부평24시', '부평', '부평', '10:00'::TIME, '05:00'::TIME, '룸', '인천부평24시')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 비행기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 비행기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '비행기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '비행기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('병점 비행기', '룸', '병점', '10:00'::TIME, '05:00'::TIME, '룸', '비행기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 퍼블릭레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 퍼블릭레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼블릭레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '부천' ELSE address END
      , contact_name = COALESCE(contact_name, '퍼블릭레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 퍼블릭레이스', '부천', '부천', '10:00'::TIME, '05:00'::TIME, '룸', '퍼블릭레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 블루9
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 블루9';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '블루9';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '양주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '블루9')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('양주 블루9', '룸', '양주', '10:00'::TIME, '05:00'::TIME, '룸', '블루9')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 홈런
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 홈런';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홈런';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '홈런')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('의정부 홈런', '룸', '의정부', '19:00'::TIME, '06:00'::TIME, '룸', '홈런')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 제주 박아라 실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 제주 박아라 실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제주 박아라 실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '제주도' ELSE address END
      , contact_name = COALESCE(contact_name, '제주 박아라 실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 제주 박아라 실장', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '제주 박아라 실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 에이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 에이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '에이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 에이스', '룸', '동탄', '18:00'::TIME, '06:00'::TIME, '룸', '에이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 제니실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 제니실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '제니실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '제니실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 제니실장', '룸', '대전', '06:00'::TIME, '06:00'::TIME, '룸', '제니실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 분당노랙크럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 분당노랙크럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당노랙크럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분당노랙크럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 분당노랙크럽', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '분당노랙크럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 런닝레빗
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 런닝레빗';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '런닝레빗';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '런닝레빗')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 런닝레빗', '룸', '역삼', '06:00'::TIME, '06:00'::TIME, '룸', '런닝레빗')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광주 광주1등놀이터
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광주 광주1등놀이터';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '광주1등놀이터';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '광주1등놀이터')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광주 광주1등놀이터', '룸', '광주', '10:00'::TIME, '05:00'::TIME, '룸', '광주1등놀이터')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 써니실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 써니실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '써니실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '써니실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 써니실장', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', '써니실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 역삼 클래식
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '역삼 클래식';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '클래식';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '역삼'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '클래식')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('역삼 클래식', '룸', '역삼', '06:00'::TIME, '06:00'::TIME, '룸', '클래식')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 놀자
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 놀자';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '놀자';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '놀자')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 놀자', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '놀자')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 채사장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 채사장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '채사장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '채사장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 채사장', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '채사장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 더신라류이사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 더신라류이사';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '더신라류이사';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '더신라류이사')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 더신라류이사', '룸', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '더신라류이사')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 극강
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 극강';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 극강', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '극강')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 위스키-봉부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 위스키-봉부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '위스키-봉부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '위스키-봉부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('대전 위스키-봉부장', '룸', '대전', '10:00'::TIME, '05:00'::TIME, '룸', '위스키-봉부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 분당
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 분당';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분당')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 분당', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '분당')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 전주다국적
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 전주다국적';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '전주다국적';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '전주다국적')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 전주다국적', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '전주다국적')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가락 에르메스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가락 에르메스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에르메스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '가락'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '에르메스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('가락 에르메스', '룸', '가락', '10:00'::TIME, '05:00'::TIME, '룸', '에르메스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 하이퍼블릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 하이퍼블릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이퍼블릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '하이퍼블릭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 하이퍼블릭', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '하이퍼블릭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 인스타노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 인스타노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '인스타노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '전주' ELSE address END
      , contact_name = COALESCE(contact_name, '인스타노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 인스타노래방', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '인스타노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 VIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 VIP';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'VIP';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'VIP')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 VIP', '룸', '청주', '10:00'::TIME, '05:00'::TIME, '룸', 'VIP')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 정자셔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 정자셔';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '정자셔';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '정자셔')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 정자셔', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '정자셔')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 울산 울산퍼블릭룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '울산 울산퍼블릭룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '울산퍼블릭룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '울산'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '울산' ELSE address END
      , contact_name = COALESCE(contact_name, '울산퍼블릭룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('울산 울산퍼블릭룸', '울산', '울산', '10:00'::TIME, '05:00'::TIME, '룸', '울산퍼블릭룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 풀코스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 풀코스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '풀코스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '풀코스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 풀코스', '룸', '청주', '10:00'::TIME, '05:00'::TIME, '룸', '풀코스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 이천실버노래클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 이천실버노래클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '이천실버노래클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '이천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '이천실버노래클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('이천 이천실버노래클럽', '룸', '이천', '18:00'::TIME, '06:00'::TIME, '룸', '이천실버노래클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남카지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남카지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남카지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '강남카지')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 강남카지', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '강남카지')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 잠실 헤븐 이순신
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 잠실 헤븐 이순신';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '잠실 헤븐 이순신';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송파'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '잠실 헤븐 이순신')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('송파 잠실 헤븐 이순신', '룸', '송파', '10:00'::TIME, '05:00'::TIME, '룸', '잠실 헤븐 이순신')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 퍼스트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 퍼스트';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '퍼스트';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '퍼스트')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 퍼스트', '룸', '청주', '10:00'::TIME, '05:00'::TIME, '룸', '퍼스트')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 설레임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 설레임';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '설레임';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '설레임')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 설레임', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '설레임')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 베를린
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 베를린';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베를린';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '베를린')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 베를린', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '베를린')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 여실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 여실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 여실장', '룸', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '여실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 한결실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 한결실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '한결실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '한결실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 한결실장', '룸', '동탄', '10:00'::TIME, '05:00'::TIME, '룸', '한결실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 굿대표
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 굿대표';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '굿대표';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '굿대표')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 굿대표', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '굿대표')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원주 원주쌀집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원주 원주쌀집';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '원주쌀집';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '원주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '원주쌀집')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('원주 원주쌀집', '룸', '원주', '10:00'::TIME, '05:00'::TIME, '룸', '원주쌀집')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 야탑동 1등한결
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 야탑동 1등한결';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '야탑동 1등한결';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '야탑동 1등한결')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 야탑동 1등한결', '룸', '성남', '10:00'::TIME, '05:00'::TIME, '룸', '야탑동 1등한결')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 올챙이해적단
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 올챙이해적단';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '올챙이해적단';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안양'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '올챙이해적단')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안양 올챙이해적단', '룸', '안양', '10:00'::TIME, '05:00'::TIME, '룸', '올챙이해적단')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 분당드래곤볼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 분당드래곤볼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당드래곤볼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '분당드래곤볼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 분당드래곤볼', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '분당드래곤볼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 ✅24시✅젖가슴✅무한터치룸✅풀발보장업소✅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 ✅24시✅젖가슴✅무한터치룸✅풀발보장업소✅';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '✅24시✅젖가슴✅무한터치룸✅풀발보장업소✅';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '선릉'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '선릉' ELSE address END
      , contact_name = COALESCE(contact_name, '✅24시✅젖가슴✅무한터치룸✅풀발보장업소✅')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('선릉 ✅24시✅젖가슴✅무한터치룸✅풀발보장업소✅', '선릉', '선릉', '10:00'::TIME, '05:00'::TIME, '룸', '✅24시✅젖가슴✅무한터치룸✅풀발보장업소✅')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 파티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 파티';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '파티';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '전주' ELSE address END
      , contact_name = COALESCE(contact_name, '파티')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 파티', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '파티')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 제주도 에이원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '제주도 에이원';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '에이원';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '제주도'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '제주도' ELSE address END
      , contact_name = COALESCE(contact_name, '에이원')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('제주도 에이원', '제주도', '제주도', '10:00'::TIME, '05:00'::TIME, '룸', '에이원')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신논현 김재롱 실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신논현 김재롱 실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '김재롱 실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신논현'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '신논현' ELSE address END
      , contact_name = COALESCE(contact_name, '김재롱 실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신논현 김재롱 실장', '신논현', '신논현', '10:00'::TIME, '05:00'::TIME, '룸', '김재롱 실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 미술관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 미술관';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '미술관';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동탄' ELSE address END
      , contact_name = COALESCE(contact_name, '미술관')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 미술관', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '룸', '미술관')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 딸기실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 딸기실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딸기실장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '김포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '딸기실장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('김포 딸기실장', '룸', '김포', '10:00'::TIME, '05:00'::TIME, '룸', '딸기실장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 극강딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 극강딸기';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '극강딸기';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '극강딸기')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 극강딸기', '룸', '강서', '10:00'::TIME, '05:00'::TIME, '룸', '극강딸기')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 구부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 구부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '마포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마포 구부장', '룸', '마포', '10:00'::TIME, '05:00'::TIME, '룸', '구부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 위너하이퍼블릭기모노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 위너하이퍼블릭기모노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '위너하이퍼블릭기모노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '병점'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '병점' ELSE address END
      , contact_name = COALESCE(contact_name, '위너하이퍼블릭기모노')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('병점 위너하이퍼블릭기모노', '병점', '병점', '10:00'::TIME, '05:00'::TIME, '룸', '위너하이퍼블릭기모노')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 하이퍼브릭&기모노
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 하이퍼브릭&기모노';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '하이퍼브릭&기모노';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '10:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동탄' ELSE address END
      , contact_name = COALESCE(contact_name, '하이퍼브릭&기모노')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 하이퍼브릭&기모노', '동탄', '동탄', '19:00'::TIME, '10:00'::TIME, '룸', '하이퍼브릭&기모노')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 성지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 성지';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '성지';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '04:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '성지')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 성지', '룸', '청주', '18:00'::TIME, '04:00'::TIME, '룸', '성지')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 아우라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 아우라';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아우라';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아우라')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('수원 아우라', '룸', '수원', '10:00'::TIME, '05:00'::TIME, '룸', '아우라')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 짝
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 짝';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '짝';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '청주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '짝')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('청주 짝', '룸', '청주', '06:00'::TIME, '06:00'::TIME, '룸', '짝')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 상큼이천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 상큼이천국';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '상큼이천국';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '상큼이천국')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용인 상큼이천국', '룸', '용인', '10:00'::TIME, '05:00'::TIME, '룸', '상큼이천국')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 아자아자룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 아자아자룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아자아자룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '분당'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '아자아자룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('분당 아자아자룸', '룸', '분당', '10:00'::TIME, '05:00'::TIME, '룸', '아자아자룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 구구단
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 구구단';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구구단';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '논현'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구구단')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('논현 구구단', '룸', '논현', '19:00'::TIME, '05:00'::TIME, '룸', '구구단')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 어썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 어썸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '어썸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '어썸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 어썸', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '어썸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 고잔대
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 고잔대';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '고잔대';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '고잔대')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('안산 고잔대', '룸', '안산', '10:00'::TIME, '05:00'::TIME, '룸', '고잔대')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 no.01
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 no.01';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'no.01';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '천안'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'no.01')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('천안 no.01', '룸', '천안', '10:00'::TIME, '05:00'::TIME, '룸', 'no.01')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 여신BAR
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 여신BAR';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '여신BAR';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '송도'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '여신BAR')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('송도 여신BAR', '룸', '송도', '10:00'::TIME, '05:00'::TIME, '룸', '여신BAR')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마곡 딥디크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마곡 딥디크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '딥디크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '09:00'::TIME,
      region = COALESCE(region, '마곡'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '딥디크')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('마곡 딥디크', '룸', '마곡', '19:00'::TIME, '09:00'::TIME, '룸', '딥디크')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 홍부장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 홍부장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '홍부장';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '홍부장')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 홍부장', '룸', '동탄', '10:00'::TIME, '05:00'::TIME, '룸', '홍부장')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신림 신림 룸퍼블릭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신림 신림 룸퍼블릭';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림 룸퍼블릭';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '신림'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신림 룸퍼블릭')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('신림 신림 룸퍼블릭', '룸', '신림', '10:00'::TIME, '05:00'::TIME, '룸', '신림 룸퍼블릭')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '스타')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 스타', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '스타')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 아레나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 아레나';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '아레나';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '노원'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '노원' ELSE address END
      , contact_name = COALESCE(contact_name, '아레나')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('노원 아레나', '노원', '노원', '10:00'::TIME, '05:00'::TIME, '룸', '아레나')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ❤️유앤미 하지원대표❤️
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ❤️유앤미 하지원대표❤️';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '❤️유앤미 하지원대표❤️';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '강남' ELSE address END
      , contact_name = COALESCE(contact_name, '❤️유앤미 하지원대표❤️')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 ❤️유앤미 하지원대표❤️', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '룸', '❤️유앤미 하지원대표❤️')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 신림하퍼창모
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 신림하퍼창모';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '신림하퍼창모';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '영등포'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '신림하퍼창모')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('영등포 신림하퍼창모', '룸', '영등포', '10:00'::TIME, '05:00'::TIME, '룸', '신림하퍼창모')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 수작뮤직타운
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 수작뮤직타운';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '수작뮤직타운';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '수작뮤직타운')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 수작뮤직타운', '룸', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '수작뮤직타운')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 카스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '카스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '카스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용인 카스', '룸', '용인', '18:00'::TIME, '06:00'::TIME, '룸', '카스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 빠담빠담 러시아 다국적클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 빠담빠담 러시아 다국적클럽';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '빠담빠담 러시아 다국적클럽';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '의정부'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '의정부' ELSE address END
      , contact_name = COALESCE(contact_name, '빠담빠담 러시아 다국적클럽')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('의정부 빠담빠담 러시아 다국적클럽', '의정부', '의정부', '18:00'::TIME, '05:00'::TIME, '룸', '빠담빠담 러시아 다국적클럽')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 레이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 레이스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '레이스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '07:00'::TIME,
      region = COALESCE(region, '부천'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '레이스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('부천 레이스', '룸', '부천', '19:00'::TIME, '07:00'::TIME, '룸', '레이스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 도파민';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '도파민';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '광명'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '광명' ELSE address END
      , contact_name = COALESCE(contact_name, '도파민')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('광명 도파민', '광명', '광명', '10:00'::TIME, '05:00'::TIME, '룸', '도파민')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구리 구리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구리 구리';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '구리';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '구리'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '구리')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('구리 구리', '룸', '구리', '10:00'::TIME, '05:00'::TIME, '룸', '구리')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성남 셔츠룸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성남 셔츠룸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '셔츠룸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '성남'),
      store_type = COALESCE(store_type, '휴게텔')
      , contact_name = COALESCE(contact_name, '셔츠룸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('성남 셔츠룸', '휴게텔', '성남', '10:00'::TIME, '05:00'::TIME, '휴게텔', '셔츠룸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 베트남 노래방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 베트남 노래방';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '베트남 노래방';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '전주' ELSE address END
      , contact_name = COALESCE(contact_name, '베트남 노래방')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('전주 베트남 노래방', '전주', '전주', '10:00'::TIME, '05:00'::TIME, '룸', '베트남 노래방')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 할리퀸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 할리퀸';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '할리퀸';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '동탄'),
      store_type = COALESCE(store_type, '룸')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '룸' THEN '동탄' ELSE address END
      , contact_name = COALESCE(contact_name, '할리퀸')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동탄 할리퀸', '동탄', '동탄', '10:00'::TIME, '05:00'::TIME, '룸', '할리퀸')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 사라있네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 사라있네';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '사라있네';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '강남'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '사라있네')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강남 사라있네', '룸', '강남', '06:00'::TIME, '06:00'::TIME, '룸', '사라있네')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 다국적
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 다국적';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '다국적';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '18:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '강서'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '다국적')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('강서 다국적', '룸', '강서', '18:00'::TIME, '05:00'::TIME, '룸', '다국적')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동해 벌떼
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동해 벌떼';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '벌떼';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '19:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '동해'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '벌떼')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('동해 벌떼', '룸', '동해', '19:00'::TIME, '06:00'::TIME, '룸', '벌떼')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용인 용인원피스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용인 용인원피스';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '용인원피스';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '용인'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, '용인원피스')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('용인 용인원피스', '룸', '용인', '10:00'::TIME, '05:00'::TIME, '룸', '용인원피스')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 Win가라오케
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 Win가라오케';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'Win가라오케';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '잠실'),
      store_type = COALESCE(store_type, '룸')
      , contact_name = COALESCE(contact_name, 'Win가라오케')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type, contact_name)
    VALUES ('잠실 Win가라오케', '룸', '잠실', '10:00'::TIME, '05:00'::TIME, '룸', 'Win가라오케')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 청담
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 청담';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '청담';
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
    VALUES ('대전 청담', '안마', '대전', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 스타';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스타';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 스타', '대전', '대전', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 BJ안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 BJ안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BJ안마';
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
    VALUES ('대전 BJ안마', '안마', '대전', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 BJ안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 BJ안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'BJ안마';
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
    VALUES ('강남 BJ안마', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남안마';
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
    VALUES ('강남 강남안마', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 크림안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 크림안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '크림안마';
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
    VALUES ('강남 크림안마', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 강남클럽안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 강남클럽안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남클럽안마';
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
    VALUES ('강남 강남클럽안마', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 うるヌル실장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 うるヌル실장';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'うるヌル실장';
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
    VALUES ('강남 うるヌル실장', '강남', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 일프로안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 일프로안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '일프로안마';
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
    VALUES ('강남 일프로안마', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 오마카섹
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 오마카섹';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '오마카섹';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '12:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '수원'),
      store_type = COALESCE(store_type, '건마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('수원 오마카섹', '건마', '수원', '12:00'::TIME, '06:00'::TIME, '건마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 히어로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 히어로';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '히어로';
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
    VALUES ('강남 히어로', '안마', '강남', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 핑크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 핑크';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '핑크';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '10:00'::TIME,
      close_time = '05:00'::TIME,
      region = COALESCE(region, '안산'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '안산' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('안산 핑크', '안산', '안산', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 전주 bj안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '전주 bj안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = 'bj안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '전주'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '전주' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('전주 bj안마', '전주', '전주', '24:00'::TIME, '24:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 로티플안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 로티플안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '로티플안마';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '24:00'::TIME,
      close_time = '24:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '안마')
      , address = CASE WHEN address IS NULL OR address = '' OR address = '안마' THEN '대전' ELSE address END
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 로티플안마', '대전', '대전', '24:00'::TIME, '24:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 샤넬';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '샤넬';
  END IF;

  IF v_store_id IS NOT NULL THEN
    UPDATE stores SET
      open_time = '06:00'::TIME,
      close_time = '06:00'::TIME,
      region = COALESCE(region, '대전'),
      store_type = COALESCE(store_type, '안마')
    WHERE id = v_store_id;
  ELSE
    INSERT INTO stores (name, address, region, open_time, close_time, store_type)
    VALUES ('대전 샤넬', '안마', '대전', '06:00'::TIME, '06:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 스페셜 안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 스페셜 안마';
  IF v_store_id IS NULL THEN
    SELECT id INTO v_store_id FROM stores WHERE name = '스페셜 안마';
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
    VALUES ('대전 스페셜 안마', '안마', '대전', '10:00'::TIME, '05:00'::TIME, '안마')
    RETURNING id INTO v_store_id;
  END IF;
END $$;