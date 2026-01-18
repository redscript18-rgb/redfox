-- 전체 가게 및 매니저 마이그레이션

-- 송파 캔디
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 캔디';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송파 캔디', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 병점 자만추
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '병점 자만추';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('병점 자만추', '핸플') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마곡 S 페티쉬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마곡 S 페티쉬';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('마곡 S 페티쉬', '페티쉬', '010-8412-9625') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 텐프로
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 텐프로';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('김포 텐프로', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 신의손
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 신의손';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('인천 신의손', '핸플') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동탄 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동탄 아이돌';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('동탄 아이돌', '핸플') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 스타일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 스타일';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송파 스타일', '페티시') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 89
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 89';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('인천 89', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 베리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 베리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('일산 베리', '페티쉬', '010-7776-8502') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 골드페티쉬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 골드페티쉬';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('인천 골드페티쉬', '페티쉬') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 5월립카페
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 5월립카페';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 5월립카페', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 야구장 립카페
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 야구장 립카페';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('가산 야구장 립카페', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 별다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 별다방';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강동 별다방', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프리티 립카페
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프리티 립카페';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프리티 립카페', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 하트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 하트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('수원 하트', '핸플') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 페티시코드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 페티시코드';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 페티시코드', '페티시') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 시크릿 페티쉬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 시크릿 페티쉬';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 시크릿 페티쉬', '페티쉬') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 칠칠립카페
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 칠칠립카페';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 칠칠립카페', '립카페', '010-4225-2088') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서초 워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서초 워터밤';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('서초 워터밤', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프렌즈 립카페
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프렌즈 립카페';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프렌즈 립카페', '립카페') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 실루엣
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 실루엣';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 실루엣', '페티쉬', '010-8138-9410') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 킹스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 킹스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('김포 킹스', '핸플') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 비누범벅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 비누범벅';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 비누범벅', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 0.5마카롱 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 0.5마카롱 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 0.5마카롱 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 부가티 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 부가티 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 부가티 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 데이지스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 데이지스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 데이지스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야놀자 건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야놀자 건마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 야놀자 건마', '건마', '010-2856-5374') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 시카고 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 시카고 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 시카고 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 비타민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 비타민';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('선릉 비타민', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 홍춘희
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 홍춘희';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 홍춘희', '건마', '010-3458-8254') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 썸';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 썸', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프렌즈 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프렌즈 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프렌즈 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 아이린스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 아이린스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 아이린스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 고야드 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 고야드 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 고야드 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 탑스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 탑스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('구로 탑스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 마포 S 스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '마포 S 스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('마포 S 스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프리티 립스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프리티 립스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프리티 립스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 황금종 아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 황금종 아로마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천호 황금종 아로마', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 신세계 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 신세계 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 신세계 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 純白乙女
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 純白乙女';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 純白乙女', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 모카스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 모카스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송파 모카스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도산대로 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도산대로 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 도산대로 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 올리브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 올리브';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 올리브', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 dior스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 dior스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 dior스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIP데일리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIP데일리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 VVIP데일리', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 Marriott Swedish
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 Marriott Swedish';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 Marriott Swedish', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 당산 M스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '당산 M스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('당산 M스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 에비앙 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 에비앙 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 에비앙 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 REVE
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 REVE';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 REVE', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 0.5르라보스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 0.5르라보스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 0.5르라보스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 크리드 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 크리드 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 크리드 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 라임스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 라임스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 라임스파', '스파', '010-7309-0816') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 스캔들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 스캔들';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 스캔들', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 건마 설레임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 건마 설레임';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 건마 설레임', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도파민스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도파민스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 도파민스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 건대 에브리원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '건대 에브리원';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('건대 에브리원', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 인스타 스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 인스타 스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('잠실 인스타 스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 논현 5월스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '논현 5월스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('논현 5월스파', '스파', '010-8126-5766') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 소울 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 소울 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('영등포 소울 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수유 하리보 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수유 하리보 1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('수유 하리보 1인샵', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 로얄스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 로얄스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강동 로얄스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 성수 티오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '성수 티오피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('성수 티오피', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광진 더블랙스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광진 더블랙스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('광진 더블랙스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 포니 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 포니 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송파 포니 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 코코테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 코코테라피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 코코테라피', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 YOUNG스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 YOUNG스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('영등포 YOUNG스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 워터 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 워터 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 워터 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 타임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 타임';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 타임', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 야구장 건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 야구장 건마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('가산 야구장 건마', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 노원 헬로스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '노원 헬로스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('노원 헬로스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 여의도 an스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '여의도 an스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('여의도 an스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 랜드스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 랜드스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 랜드스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 하인 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 하인 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('홍대 하인 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 히트스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 히트스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 히트스파', '스파', '010-2151-7843') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 갤러리 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 갤러리 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 갤러리 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 골드미스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 골드미스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 골드미스', '건마', '010-4801-2575') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 만수르 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 만수르 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 만수르 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 매직 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 매직 1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('동대문 매직 1인샵', '건마') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '시아샘' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시아샘');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '연정샘' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연정샘');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '고은샘' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '고은샘');
END $$;

-- 천호 별다방
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 별다방';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천호 별다방', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강동 크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강동 크림';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강동 크림', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 마마스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 마마스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 마마스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 장안동 미드림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '장안동 미드림';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('장안동 미드림', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천호 지중해 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천호 지중해 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천호 지중해 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 창동 아우라 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '창동 아우라 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('창동 아우라 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 용산 필아로마스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '용산 필아로마스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('용산 필아로마스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 클로버스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 클로버스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('동대문 클로버스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 길동 올림푸스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '길동 올림푸스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('길동 올림푸스', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 스타';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 스타', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 심쿵 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 심쿵 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 심쿵 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 0.5인스타스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 0.5인스타스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('하남 0.5인스타스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 말랑스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 말랑스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 말랑스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 썸 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 썸 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 썸 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 플러팅
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 플러팅';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 플러팅', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 하루 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 하루 1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('부평 하루 1인샵', '건마', '010-5826-6477') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '미소' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '미소');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '샛별' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '샛별');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '가람' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '가람');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '수빈' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수빈');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '조현' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '조현');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '빛나' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '빛나');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '서아' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '서아');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '은채' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '은채');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '다혜' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '다혜');
END $$;

-- 일산 미시신세계VVIP
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미시신세계VVIP';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 미시신세계VVIP', '건마') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '혜주' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '혜주');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '빛나' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '빛나');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '리나' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '리나');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '비비' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '비비');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '소정' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소정');
END $$;

-- 일산 럭셔리스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 럭셔리스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 럭셔리스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 소녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 소녀';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 소녀', '건마') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '예인' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예인');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '효쥬' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '효쥬');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '유하' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유하');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '하라' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하라');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '유연' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유연');
END $$;

-- 부평 에이원스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 에이원스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 에이원스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 빠나나 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 빠나나 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 빠나나 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 S스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 S스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('일산 S스웨디시', '건마', '010-4100-0644') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 본능
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 본능';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 본능', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 로즈왁싱테라피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 로즈왁싱테라피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 로즈왁싱테라피', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 인스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 인스타';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 인스타', '건마') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '은유' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '은유');
END $$;

-- 일산 올인원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 올인원';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 올인원', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 시크릿 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 시크릿 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 시크릿 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 미수다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미수다';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 미수다', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 러블리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 러블리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 러블리', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 OK붕어빵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 OK붕어빵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 OK붕어빵', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 G스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 G스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('분당 G스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 BJ 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 BJ 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('김포 BJ 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 제국스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 제국스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 제국스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 마왕스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 마왕스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 마왕스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 황용
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 황용';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 황용', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남동구 미라클 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남동구 미라클 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('남동구 미라클 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 라오스건마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 라오스건마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부천 라오스건마', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 스타벅스 스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 스타벅스 스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부천 스타벅스 스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 터치 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 터치 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 터치 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 맛도리 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 맛도리 1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('수원 맛도리 1인샵', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 의정부 경기1번스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '의정부 경기1번스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('의정부 경기1번스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 라온 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 라온 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('일산 라온 스웨디시', '건마', '010-7502-2101') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 행신궁원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 행신궁원';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 행신궁원', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 스리스리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 스리스리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('분당 스리스리', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 미인 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미인 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 미인 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천상계1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천상계1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천상계1인샵', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 다산 브라더 스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '다산 브라더 스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('다산 브라더 스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 세타마사지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 세타마사지';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천안 세타마사지', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 다산 라온스파
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '다산 라온스파';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('다산 라온스파', '스파') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 황궁
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 황궁';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 황궁', '건마') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '바다' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '바다');
END $$;

-- 일산 미시플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 미시플라워';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 미시플라워', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 올에이스1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 올에이스1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('남양주 올에이스1인샵', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 딸기아로마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 딸기아로마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('안양 딸기아로마', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 양주 샤넬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '양주 샤넬';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('양주 샤넬', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 남양주 다이아스웨디시
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '남양주 다이아스웨디시';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('남양주 다이아스웨디시', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 진주 1인샵
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 진주 1인샵';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 진주 1인샵', '건마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 인스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 인스타';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 인스타', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 올리브
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 올리브';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('선릉 올리브', '오피') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '도화' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '도화');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '미미' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '미미');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '황진이' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '황진이');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '기대주' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '기대주');
END $$;

-- 강남 도파민
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도파민';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 도파민', '오피') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '미연' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '미연');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '카우' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '카우');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '현지' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '현지');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '연구름' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연구름');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '서아' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '서아');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '선우' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '선우');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '연화' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연화');
END $$;

-- 강남 팰리스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 팰리스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 팰리스', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 나카스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 나카스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 나카스', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프렌즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프렌즈';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프렌즈', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 프리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 프리티';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('선릉 프리티', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 VVIPSPON
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 VVIPSPON';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 VVIPSPON', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 임팩트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 임팩트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 임팩트', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 무지개
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 무지개';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 무지개', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 설레임 오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임 오피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 설레임 오피', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 푸르르
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 푸르르';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 푸르르', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 브라더
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 브라더';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 브라더', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 워터밤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 워터밤';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 워터밤', '오피', '010-3492-2790') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 곰돌이네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 곰돌이네';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 곰돌이네', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 롤스로이스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 롤스로이스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 롤스로이스', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야놀자 오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야놀자 오피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 야놀자 오피', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도쿄
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도쿄';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 도쿄', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홍대 한국정력공사
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홍대 한국정력공사';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('홍대 한국정력공사', '오피', '010-2633-7489') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하숙집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하숙집';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 하숙집', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 뿜뿜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 뿜뿜';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 뿜뿜', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 백마방앗간
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 백마방앗간';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 백마방앗간', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 디올
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 디올';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 디올', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 홀인원
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 홀인원';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 홀인원', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 뽀뽀뽀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 뽀뽀뽀';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강서 뽀뽀뽀', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 파티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 파티';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 파티', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 플러스82
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 플러스82';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('구로 플러스82', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 SM플레이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 SM플레이';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 SM플레이', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 앤써
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 앤써';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 앤써', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강서 일품
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강서 일품';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강서 일품', '오피', '010-2403-4224') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 어썸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 어썸';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('영등포 어썸', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 고양 엣지
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '고양 엣지';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('고양 엣지', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 돌핀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 돌핀';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 돌핀', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 신드롬
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 신드롬';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 신드롬', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 솜사탕
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 솜사탕';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 솜사탕', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 스타일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 스타일';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 스타일', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 딸기';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부천 딸기', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 달고나
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 달고나';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 달고나', '오피') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '시아' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시아');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '처음' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '처음');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '아름' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '아름');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '민서' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '민서');
END $$;

-- 부평 거래소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 거래소';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 거래소', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 발리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 발리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 발리', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 광명 신데렐라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '광명 신데렐라';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('광명 신데렐라', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 시그널
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 시그널';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 시그널', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 쁨쁨
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 쁨쁨';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 쁨쁨', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 애플
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 애플';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('하남 애플', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대전 메이저
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대전 메이저';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('대전 메이저', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 스토리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 스토리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('청주 스토리', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 체리
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 체리';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('시흥 체리', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 예술관
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 예술관';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('안산 예술관', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 존예
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 존예';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('분당 존예', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안양 국산
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안양 국산';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('안양 국산', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청주 누피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청주 누피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('청주 누피', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 시에스타
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 시에스타';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('분당 시에스타', '오피') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 하숙집 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 하숙집 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 하숙집 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 야놀자 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 야놀자 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 야놀자 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 선릉 마돈나클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '선릉 마돈나클럽';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('선릉 마돈나클럽', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 섯다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 섯다';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 섯다', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프렌즈 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프렌즈 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프렌즈 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 교대 워터밤 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '교대 워터밤 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('교대 워터밤 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 사쿠라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 사쿠라';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('부천 사쿠라', '휴계텔', '010-8269-9284') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '나미' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '나미');
END $$;

-- 부평 자두
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 자두';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 자두', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 가산 야구장 휴게
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '가산 야구장 휴게';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('가산 야구장 휴게', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 스테이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 스테이';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 스테이', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '마리' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '마리');
  INSERT INTO virtual_staff (store_id, name) SELECT v_store_id, '우연' WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '우연');
END $$;

-- 계양 섹스타그램
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '계양 섹스타그램';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('계양 섹스타그램', '휴계텔', '010-3905-4122') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 힐링
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 힐링';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 힐링', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 프리티 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 프리티 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 프리티 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 드림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 드림';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 드림', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 설레임 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 설레임 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 루트66
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 루트66';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('분당 루트66', '휴계텔', '010-6528-3741') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 복숭아
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 복숭아';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 복숭아', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 딸기';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('이천 딸기', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 레이블
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 레이블';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('이천 레이블', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 허니
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 허니';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('인천 허니', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 금천 아지트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '금천 아지트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('금천 아지트', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 클래스+쉬멜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 클래스+쉬멜';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 클래스+쉬멜', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 러브미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 러브미';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천안 러브미', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 루이비통
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 루이비통';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송도 루이비통', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송도 안내상
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송도 안내상';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송도 안내상', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 이천 려
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '이천 려';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('이천 려', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 세븐일레븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 세븐일레븐';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천안 세븐일레븐', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 베트남
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 베트남';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부천 베트남', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 하남 철용이네
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '하남 철용이네';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('하남 철용이네', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 프리티
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 프리티';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('인천 프리티', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 오산 사운드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '오산 사운드';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('오산 사운드', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 파주 디저트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '파주 디저트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('파주 디저트', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 쎅카데미
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 쎅카데미';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('부천 쎅카데미', '휴계텔', '010-4402-8558') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 짝꿍
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 짝꿍';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천안 짝꿍', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 김포 싸이즈
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '김포 싸이즈';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('김포 싸이즈', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 천안 휴게소
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '천안 휴게소';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('천안 휴게소', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 장난감
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 장난감';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('인천 장난감', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 청라 그린라이트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '청라 그린라이트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('청라 그린라이트', '휴계텔', '010-3902-4819') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 쿠키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 쿠키';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('구로 쿠키', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 플라워
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 플라워';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('영등포 플라워', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 요거트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 요거트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('구로 요거트', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로 츄파춥스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로 츄파춥스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('구로 츄파춥스', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 와이키키
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 와이키키';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('부천 와이키키', '휴계텔', '010-9751-6603') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 이쁘다
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 이쁘다';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 이쁘다', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 구로디지털 레전드
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '구로디지털 레전드';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('구로디지털 레전드', '휴계텔', '010-2156-4445') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 베어스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 베어스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 베어스', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 테토녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 테토녀';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 테토녀', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부천 땡초
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부천 땡초';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('부천 땡초', '휴계텔', '010-6466-9110') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 야구장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 야구장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('잠실 야구장', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 안산 새콤달콤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '안산 새콤달콤';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('안산 새콤달콤', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 아이스크림
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 아이스크림';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 아이스크림', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 다산 휴게텔
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '다산 휴게텔';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('다산 휴게텔', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 간석 백마&타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '간석 백마&타이';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('간석 백마&타이', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 시흥 기생집
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '시흥 기생집';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('시흥 기생집', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 화곡 스위트
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '화곡 스위트';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('화곡 스위트', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 잠실 톰브라운
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '잠실 톰브라운';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('잠실 톰브라운', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 인천 여우
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '인천 여우';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('인천 여우', '휴계텔', '010-6609-0641') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 분당 매칭
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '분당 매칭';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('분당 매칭', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 신도림 하녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '신도림 하녀';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('신도림 하녀', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 대림 아이돌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '대림 아이돌';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('대림 아이돌', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 영등포 설레임
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '영등포 설레임';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('영등포 설레임', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 스타일
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 스타일';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('주안 스타일', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 엔젤
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 엔젤';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('부평 엔젤', '휴계텔', '010-8383-2776') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 주안 타짜
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '주안 타짜';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('주안 타짜', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부평 헤븐
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부평 헤븐';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부평 헤븐', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 구찌
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 구찌';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('동대문 구찌', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 수원 바닐라
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '수원 바닐라';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('수원 바닐라', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 여사친
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 여사친';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 여사친', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 동대문 딸기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '동대문 딸기';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('동대문 딸기', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 첫사랑
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 첫사랑';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송파 첫사랑', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일산 빰빰
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일산 빰빰';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일산 빰빰', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 송파 밀크
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '송파 밀크';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('송파 밀크', '휴계텔') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 캔디안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 캔디안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 캔디안마', '안마', '010-9816-9406') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 도쿄100%
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 도쿄100%';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 도쿄100%', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 24시 T팬티섹년따먹기
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '24시 T팬티섹년따먹기';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('24시 T팬티섹년따먹기', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 홀딱벗은스시녀출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '홀딱벗은스시녀출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('홀딱벗은스시녀출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남안마', '안마', '010-4453-9987') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일본야르떼출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일본야르떼출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일본야르떼출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 AV-딜도
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 AV-딜도';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 AV-딜도', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 24시 오이시일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '24시 오이시일본출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('24시 오이시일본출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 레드안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 레드안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 레드안마', '안마', '010-4349-0816') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울경기 심쿵출장오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울경기 심쿵출장오피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('서울경기 심쿵출장오피', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 모또모또 니뽄출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '모또모또 니뽄출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('모또모또 니뽄출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울경기 시크출장오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울경기 시크출장오피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('서울경기 시크출장오피', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 1프로홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 1프로홈타이';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 1프로홈타이', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 카사노바
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 카사노바';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 카사노바', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일본 스시천국
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일본 스시천국';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일본 스시천국', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 우마이 일본스시녀
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '우마이 일본스시녀';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('우마이 일본스시녀', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 24시 나고야출장홈타이
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '24시 나고야출장홈타이';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('24시 나고야출장홈타이', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 스와핑안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 스와핑안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 스와핑안마', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 나만 맛보는s급출장녀들
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '나만 맛보는s급출장녀들';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('나만 맛보는s급출장녀들', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 원탑러시아출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '원탑러시아출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('원탑러시아출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 892백마출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '892백마출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('892백마출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 비키니클럽
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 비키니클럽';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 비키니클럽', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 명품 유앤미 출장오피
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '명품 유앤미 출장오피';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('명품 유앤미 출장오피', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 ぬるぴた
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 ぬるぴた';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 ぬるぴた', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- MZ어린T팬티출장콜걸
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = 'MZ어린T팬티출장콜걸';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('MZ어린T팬티출장콜걸', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 서울경기 하트출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '서울경기 하트출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('서울경기 하트출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 가인안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 가인안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 가인안마', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 일프로안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 일프로안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 일프로안마', '안마', '010-9955-2558') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 일본 섹스과외
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '일본 섹스과외';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('일본 섹스과외', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 다와안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 다와안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 다와안마', '안마', '010-8246-0292') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 착즙병동 일본출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '착즙병동 일본출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('착즙병동 일본출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 혼또니 일본 출장
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '혼또니 일본 출장';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('혼또니 일본 출장', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 부산 센스
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '부산 센스';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('부산 센스', '출장') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 오페라안마
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 오페라안마';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address, phone) VALUES ('강남 오페라안마', '안마', '010-6522-4885') RETURNING id INTO v_store_id;
  END IF;
END $$;

-- 강남 아마존
DO $$
DECLARE
  v_store_id INTEGER;
BEGIN
  SELECT id INTO v_store_id FROM stores WHERE name = '강남 아마존';
  IF v_store_id IS NULL THEN
    INSERT INTO stores (name, address) VALUES ('강남 아마존', '안마') RETURNING id INTO v_store_id;
  END IF;
END $$;
