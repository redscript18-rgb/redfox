-- stores 테이블에 phone 컬럼 추가 (없으면)
ALTER TABLE stores ADD COLUMN IF NOT EXISTS phone TEXT;

-- 1. 연락처 업데이트 (카톡 ID 또는 전화번호)
UPDATE stores SET phone = 'cozyy' WHERE name = '코지' AND region = '부천';
UPDATE stores SET phone = 'ACE4979' WHERE name = '에이스' AND region = '잠실';
UPDATE stores SET phone = 'SH7970' WHERE name = '스타' AND region = '계양';
UPDATE stores SET phone = 'PH3174' WHERE name = '랜드마크' AND region = '부천';
UPDATE stores SET phone = '01083297469' WHERE name = '크라운K' AND region = '신림';
UPDATE stores SET phone = 'mirage2' WHERE name = '미라지' AND region = '강남';
UPDATE stores SET phone = 'aloharu' WHERE name = '헤븐' AND region = '마곡';
UPDATE stores SET phone = 'COCOCO2103' WHERE name = '코코' AND region = '강서';
UPDATE stores SET phone = 'sig0777' WHERE name = '시그니처' AND region = '일산';

-- 2. 가상 매니저 등록
INSERT INTO virtual_staff (store_id, name) VALUES
  -- 부천 여사친
  ((SELECT id FROM stores WHERE name = '여사친' AND region = '부천' LIMIT 1), '전이담'),
  ((SELECT id FROM stores WHERE name = '여사친' AND region = '부천' LIMIT 1), '새로'),
  ((SELECT id FROM stores WHERE name = '여사친' AND region = '부천' LIMIT 1), '유설아'),
  ((SELECT id FROM stores WHERE name = '여사친' AND region = '부천' LIMIT 1), '소율'),
  ((SELECT id FROM stores WHERE name = '여사친' AND region = '부천' LIMIT 1), '백단비'),
  -- 부천 띵동
  ((SELECT id FROM stores WHERE name = '띵동' AND region = '부천' LIMIT 1), '연두'),
  ((SELECT id FROM stores WHERE name = '띵동' AND region = '부천' LIMIT 1), '차차'),
  ((SELECT id FROM stores WHERE name = '띵동' AND region = '부천' LIMIT 1), '참조아'),
  -- 구로 SODA
  ((SELECT id FROM stores WHERE name = 'SODA' AND region = '구로' LIMIT 1), '아리'),
  ((SELECT id FROM stores WHERE name = 'SODA' AND region = '구로' LIMIT 1), '이슬'),
  -- 부천 비둘기
  ((SELECT id FROM stores WHERE name = '비둘기' AND region = '부천' LIMIT 1), '유하'),
  ((SELECT id FROM stores WHERE name = '비둘기' AND region = '부천' LIMIT 1), '봄'),
  ((SELECT id FROM stores WHERE name = '비둘기' AND region = '부천' LIMIT 1), '서우'),
  ((SELECT id FROM stores WHERE name = '비둘기' AND region = '부천' LIMIT 1), '예슬'),
  -- 역삼 웨이브
  ((SELECT id FROM stores WHERE name = '웨이브' AND region = '역삼' LIMIT 1), '레미'),
  ((SELECT id FROM stores WHERE name = '웨이브' AND region = '역삼' LIMIT 1), '한세라'),
  ((SELECT id FROM stores WHERE name = '웨이브' AND region = '역삼' LIMIT 1), '아린'),
  ((SELECT id FROM stores WHERE name = '웨이브' AND region = '역삼' LIMIT 1), '신시아'),
  -- 잠실 러브
  ((SELECT id FROM stores WHERE name = '러브' AND region = '잠실' LIMIT 1), '하이'),
  ((SELECT id FROM stores WHERE name = '러브' AND region = '잠실' LIMIT 1), '하니'),
  ((SELECT id FROM stores WHERE name = '러브' AND region = '잠실' LIMIT 1), '김소현'),
  ((SELECT id FROM stores WHERE name = '러브' AND region = '잠실' LIMIT 1), '루리'),
  -- 상봉 밀키스
  ((SELECT id FROM stores WHERE name = '밀키스' AND region = '상봉' LIMIT 1), '예나'),
  ((SELECT id FROM stores WHERE name = '밀키스' AND region = '상봉' LIMIT 1), '나은'),
  -- 부천 상동 스토리
  ((SELECT id FROM stores WHERE name = '상동 스토리' AND region = '부천' LIMIT 1), '가희'),
  ((SELECT id FROM stores WHERE name = '상동 스토리' AND region = '부천' LIMIT 1), '신하얀'),
  ((SELECT id FROM stores WHERE name = '상동 스토리' AND region = '부천' LIMIT 1), '강규리'),
  ((SELECT id FROM stores WHERE name = '상동 스토리' AND region = '부천' LIMIT 1), '하나'),
  ((SELECT id FROM stores WHERE name = '상동 스토리' AND region = '부천' LIMIT 1), '채도은'),
  -- 일산 큐브
  ((SELECT id FROM stores WHERE name = '큐브' AND region = '일산' LIMIT 1), '채원'),
  ((SELECT id FROM stores WHERE name = '큐브' AND region = '일산' LIMIT 1), '슬아'),
  ((SELECT id FROM stores WHERE name = '큐브' AND region = '일산' LIMIT 1), '예리'),
  ((SELECT id FROM stores WHERE name = '큐브' AND region = '일산' LIMIT 1), '보미'),
  -- 잠실 에이스
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '잠실' LIMIT 1), '라부부'),
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '잠실' LIMIT 1), '제니'),
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '잠실' LIMIT 1), '아린'),
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '잠실' LIMIT 1), '유나'),
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '잠실' LIMIT 1), '공주'),
  -- 안양 필굿
  ((SELECT id FROM stores WHERE name = '필굿' AND region = '안양' LIMIT 1), '은하'),
  ((SELECT id FROM stores WHERE name = '필굿' AND region = '안양' LIMIT 1), '애니'),
  -- 강서 W
  ((SELECT id FROM stores WHERE name = 'W' AND region = '강서' LIMIT 1), '가은'),
  -- 홍대 나는솔로
  ((SELECT id FROM stores WHERE name = '나는솔로' AND region = '홍대' LIMIT 1), '리아퀸'),
  ((SELECT id FROM stores WHERE name = '나는솔로' AND region = '홍대' LIMIT 1), '이엘'),
  ((SELECT id FROM stores WHERE name = '나는솔로' AND region = '홍대' LIMIT 1), '다빈'),
  ((SELECT id FROM stores WHERE name = '나는솔로' AND region = '홍대' LIMIT 1), '하나'),
  ((SELECT id FROM stores WHERE name = '나는솔로' AND region = '홍대' LIMIT 1), '장미'),
  -- 부천 상동 나인
  ((SELECT id FROM stores WHERE name = '상동 나인' AND region = '부천' LIMIT 1), '쏭이'),
  ((SELECT id FROM stores WHERE name = '상동 나인' AND region = '부천' LIMIT 1), '장세빈'),
  ((SELECT id FROM stores WHERE name = '상동 나인' AND region = '부천' LIMIT 1), '이선아'),
  -- 부천 히어로
  ((SELECT id FROM stores WHERE name = '히어로' AND region = '부천' LIMIT 1), '이지유'),
  ((SELECT id FROM stores WHERE name = '히어로' AND region = '부천' LIMIT 1), '체리'),
  ((SELECT id FROM stores WHERE name = '히어로' AND region = '부천' LIMIT 1), '토리'),
  ((SELECT id FROM stores WHERE name = '히어로' AND region = '부천' LIMIT 1), '서윤아'),
  ((SELECT id FROM stores WHERE name = '히어로' AND region = '부천' LIMIT 1), '에리카'),
  -- 부천 랜드마크
  ((SELECT id FROM stores WHERE name = '랜드마크' AND region = '부천' LIMIT 1), '수지'),
  ((SELECT id FROM stores WHERE name = '랜드마크' AND region = '부천' LIMIT 1), '유민'),
  ((SELECT id FROM stores WHERE name = '랜드마크' AND region = '부천' LIMIT 1), '이다혜'),
  ((SELECT id FROM stores WHERE name = '랜드마크' AND region = '부천' LIMIT 1), '카이린'),
  ((SELECT id FROM stores WHERE name = '랜드마크' AND region = '부천' LIMIT 1), '조아라'),
  -- 신림 디즈니
  ((SELECT id FROM stores WHERE name = '디즈니' AND region = '신림' LIMIT 1), '권나라'),
  ((SELECT id FROM stores WHERE name = '디즈니' AND region = '신림' LIMIT 1), '실버'),
  ((SELECT id FROM stores WHERE name = '디즈니' AND region = '신림' LIMIT 1), '주디'),
  ((SELECT id FROM stores WHERE name = '디즈니' AND region = '신림' LIMIT 1), '쿠로'),
  -- 부천 프라다
  ((SELECT id FROM stores WHERE name = '프라다' AND region = '부천' LIMIT 1), '도이'),
  ((SELECT id FROM stores WHERE name = '프라다' AND region = '부천' LIMIT 1), '테란'),
  -- 잠실 블라썸
  ((SELECT id FROM stores WHERE name = '블라썸' AND region = '잠실' LIMIT 1), '이주은'),
  ((SELECT id FROM stores WHERE name = '블라썸' AND region = '잠실' LIMIT 1), '설윤아'),
  ((SELECT id FROM stores WHERE name = '블라썸' AND region = '잠실' LIMIT 1), '세정'),
  ((SELECT id FROM stores WHERE name = '블라썸' AND region = '잠실' LIMIT 1), '우유정'),
  ((SELECT id FROM stores WHERE name = '블라썸' AND region = '잠실' LIMIT 1), '이유요'),
  -- 부천 옴옴
  ((SELECT id FROM stores WHERE name = '옴옴' AND region = '부천' LIMIT 1), '유나'),
  ((SELECT id FROM stores WHERE name = '옴옴' AND region = '부천' LIMIT 1), '아지'),
  -- 부천 에이전시
  ((SELECT id FROM stores WHERE name = '에이전시' AND region = '부천' LIMIT 1), '새봄'),
  ((SELECT id FROM stores WHERE name = '에이전시' AND region = '부천' LIMIT 1), '이사라'),
  -- 부천 시네마
  ((SELECT id FROM stores WHERE name = '시네마' AND region = '부천' LIMIT 1), '미치코'),
  -- 부천 봉봉
  ((SELECT id FROM stores WHERE name = '봉봉' AND region = '부천' LIMIT 1), '유소예'),
  -- 철산 은하철산999
  ((SELECT id FROM stores WHERE name = '은하철산999' AND region = '철산' LIMIT 1), '지나'),
  ((SELECT id FROM stores WHERE name = '은하철산999' AND region = '철산' LIMIT 1), '유에린'),
  ((SELECT id FROM stores WHERE name = '은하철산999' AND region = '철산' LIMIT 1), '백도하'),
  -- 신림 크라운K
  ((SELECT id FROM stores WHERE name = '크라운K' AND region = '신림' LIMIT 1), '리아'),
  ((SELECT id FROM stores WHERE name = '크라운K' AND region = '신림' LIMIT 1), '히메카'),
  ((SELECT id FROM stores WHERE name = '크라운K' AND region = '신림' LIMIT 1), '예슬'),
  ((SELECT id FROM stores WHERE name = '크라운K' AND region = '신림' LIMIT 1), '룰루'),
  -- 영등포 어피치
  ((SELECT id FROM stores WHERE name = '어피치' AND region = '영등포' LIMIT 1), '아지'),
  ((SELECT id FROM stores WHERE name = '어피치' AND region = '영등포' LIMIT 1), '소은'),
  -- 부천 원츄
  ((SELECT id FROM stores WHERE name = '원츄' AND region = '부천' LIMIT 1), '하츄핑'),
  ((SELECT id FROM stores WHERE name = '원츄' AND region = '부천' LIMIT 1), '헤으응'),
  -- 강남 미라지
  ((SELECT id FROM stores WHERE name = '미라지' AND region = '강남' LIMIT 1), '담비'),
  ((SELECT id FROM stores WHERE name = '미라지' AND region = '강남' LIMIT 1), '유니'),
  ((SELECT id FROM stores WHERE name = '미라지' AND region = '강남' LIMIT 1), '나희도'),
  ((SELECT id FROM stores WHERE name = '미라지' AND region = '강남' LIMIT 1), '수빈'),
  ((SELECT id FROM stores WHERE name = '미라지' AND region = '강남' LIMIT 1), '참치'),
  -- 부천 예쁜하루
  ((SELECT id FROM stores WHERE name = '예쁜하루' AND region = '부천' LIMIT 1), '이지'),
  -- 마곡 헤븐
  ((SELECT id FROM stores WHERE name = '헤븐' AND region = '마곡' LIMIT 1), '서은수'),
  ((SELECT id FROM stores WHERE name = '헤븐' AND region = '마곡' LIMIT 1), '유하늘'),
  ((SELECT id FROM stores WHERE name = '헤븐' AND region = '마곡' LIMIT 1), '보라'),
  ((SELECT id FROM stores WHERE name = '헤븐' AND region = '마곡' LIMIT 1), '가희'),
  ((SELECT id FROM stores WHERE name = '헤븐' AND region = '마곡' LIMIT 1), '소미'),
  -- 상동 헬로우
  ((SELECT id FROM stores WHERE name = '헬로우' AND region = '상동' LIMIT 1), '민영'),
  ((SELECT id FROM stores WHERE name = '헬로우' AND region = '상동' LIMIT 1), '진희'),
  ((SELECT id FROM stores WHERE name = '헬로우' AND region = '상동' LIMIT 1), '설하윤'),
  -- 영등포 스쿨
  ((SELECT id FROM stores WHERE name = '스쿨' AND region = '영등포' LIMIT 1), '서아'),
  ((SELECT id FROM stores WHERE name = '스쿨' AND region = '영등포' LIMIT 1), '로즈'),
  -- 주안 카와이
  ((SELECT id FROM stores WHERE name = '카와이' AND region = '주안' LIMIT 1), '천예슬'),
  ((SELECT id FROM stores WHERE name = '카와이' AND region = '주안' LIMIT 1), '반하늘'),
  ((SELECT id FROM stores WHERE name = '카와이' AND region = '주안' LIMIT 1), '사랑'),
  ((SELECT id FROM stores WHERE name = '카와이' AND region = '주안' LIMIT 1), '아영'),
  ((SELECT id FROM stores WHERE name = '카와이' AND region = '주안' LIMIT 1), '신예나'),
  -- 동암 에이스
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '동암' LIMIT 1), '류지혜'),
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '동암' LIMIT 1), '한지윤'),
  ((SELECT id FROM stores WHERE name = '에이스' AND region = '동암' LIMIT 1), '애니'),
  -- 부천 사탕
  ((SELECT id FROM stores WHERE name = '사탕' AND region = '부천' LIMIT 1), '세란'),
  ((SELECT id FROM stores WHERE name = '사탕' AND region = '부천' LIMIT 1), '아연'),
  -- 안양 민트
  ((SELECT id FROM stores WHERE name = '민트' AND region = '안양' LIMIT 1), '초연'),
  ((SELECT id FROM stores WHERE name = '민트' AND region = '안양' LIMIT 1), '현서'),
  ((SELECT id FROM stores WHERE name = '민트' AND region = '안양' LIMIT 1), '채원'),
  ((SELECT id FROM stores WHERE name = '민트' AND region = '안양' LIMIT 1), '지연'),
  -- 부천 블링
  ((SELECT id FROM stores WHERE name = '블링' AND region = '부천' LIMIT 1), '소진'),
  ((SELECT id FROM stores WHERE name = '블링' AND region = '부천' LIMIT 1), '예서'),
  ((SELECT id FROM stores WHERE name = '블링' AND region = '부천' LIMIT 1), '유하'),
  -- 신림 스위트
  ((SELECT id FROM stores WHERE name = '스위트' AND region = '신림' LIMIT 1), '슈'),
  ((SELECT id FROM stores WHERE name = '스위트' AND region = '신림' LIMIT 1), '새론'),
  ((SELECT id FROM stores WHERE name = '스위트' AND region = '신림' LIMIT 1), '금명이'),
  ((SELECT id FROM stores WHERE name = '스위트' AND region = '신림' LIMIT 1), '나라'),
  -- 안양 굿모닝
  ((SELECT id FROM stores WHERE name = '굿모닝' AND region = '안양' LIMIT 1), '민서'),
  ((SELECT id FROM stores WHERE name = '굿모닝' AND region = '안양' LIMIT 1), '이설'),
  ((SELECT id FROM stores WHERE name = '굿모닝' AND region = '안양' LIMIT 1), '유민'),
  -- 구의 츄릅
  ((SELECT id FROM stores WHERE name = '츄릅' AND region = '구의' LIMIT 1), '은지'),
  ((SELECT id FROM stores WHERE name = '츄릅' AND region = '구의' LIMIT 1), '주예나'),
  ((SELECT id FROM stores WHERE name = '츄릅' AND region = '구의' LIMIT 1), '은비'),
  ((SELECT id FROM stores WHERE name = '츄릅' AND region = '구의' LIMIT 1), '서윤'),
  ((SELECT id FROM stores WHERE name = '츄릅' AND region = '구의' LIMIT 1), '지아'),
  -- 부천 피플
  ((SELECT id FROM stores WHERE name = '피플' AND region = '부천' LIMIT 1), '연서'),
  ((SELECT id FROM stores WHERE name = '피플' AND region = '부천' LIMIT 1), '봄'),
  ((SELECT id FROM stores WHERE name = '피플' AND region = '부천' LIMIT 1), '혜진'),
  ((SELECT id FROM stores WHERE name = '피플' AND region = '부천' LIMIT 1), '해린'),
  -- 신림 칵테일
  ((SELECT id FROM stores WHERE name = '칵테일' AND region = '신림' LIMIT 1), '김청하'),
  ((SELECT id FROM stores WHERE name = '칵테일' AND region = '신림' LIMIT 1), '옥보단'),
  ((SELECT id FROM stores WHERE name = '칵테일' AND region = '신림' LIMIT 1), '하비비'),
  ((SELECT id FROM stores WHERE name = '칵테일' AND region = '신림' LIMIT 1), '차주영'),
  -- 신림 아자스
  ((SELECT id FROM stores WHERE name = '아자스' AND region = '신림' LIMIT 1), '단풍이'),
  ((SELECT id FROM stores WHERE name = '아자스' AND region = '신림' LIMIT 1), '춘식이'),
  -- 역곡 아이디
  ((SELECT id FROM stores WHERE name = '아이디' AND region = '역곡' LIMIT 1), '보영'),
  -- 잠실 페이트
  ((SELECT id FROM stores WHERE name = '페이트' AND region = '잠실' LIMIT 1), '새미'),
  ((SELECT id FROM stores WHERE name = '페이트' AND region = '잠실' LIMIT 1), '하린'),
  -- 신대방 프렌즈
  ((SELECT id FROM stores WHERE name = '프렌즈' AND region = '신대방' LIMIT 1), '메루'),
  ((SELECT id FROM stores WHERE name = '프렌즈' AND region = '신대방' LIMIT 1), '이솔'),
  ((SELECT id FROM stores WHERE name = '프렌즈' AND region = '신대방' LIMIT 1), '새린'),
  -- 주안 CU
  ((SELECT id FROM stores WHERE name = 'CU' AND region = '주안' LIMIT 1), '소다'),
  ((SELECT id FROM stores WHERE name = 'CU' AND region = '주안' LIMIT 1), '채연'),
  ((SELECT id FROM stores WHERE name = 'CU' AND region = '주안' LIMIT 1), '주아'),
  ((SELECT id FROM stores WHERE name = 'CU' AND region = '주안' LIMIT 1), '보미'),
  ((SELECT id FROM stores WHERE name = 'CU' AND region = '주안' LIMIT 1), '고아라'),
  -- 상동 베이글
  ((SELECT id FROM stores WHERE name = '베이글' AND region = '상동' LIMIT 1), '지은'),
  ((SELECT id FROM stores WHERE name = '베이글' AND region = '상동' LIMIT 1), '베르사체'),
  -- 강서 강아지
  ((SELECT id FROM stores WHERE name = '강아지' AND region = '강서' LIMIT 1), '천혜향'),
  ((SELECT id FROM stores WHERE name = '강아지' AND region = '강서' LIMIT 1), '아이'),
  ((SELECT id FROM stores WHERE name = '강아지' AND region = '강서' LIMIT 1), '유소나'),
  ((SELECT id FROM stores WHERE name = '강아지' AND region = '강서' LIMIT 1), '윤미'),
  ((SELECT id FROM stores WHERE name = '강아지' AND region = '강서' LIMIT 1), '유리'),
  -- 군포 은하수
  ((SELECT id FROM stores WHERE name = '은하수' AND region = '군포' LIMIT 1), '유화'),
  ((SELECT id FROM stores WHERE name = '은하수' AND region = '군포' LIMIT 1), '유시연'),
  ((SELECT id FROM stores WHERE name = '은하수' AND region = '군포' LIMIT 1), '하리'),
  ((SELECT id FROM stores WHERE name = '은하수' AND region = '군포' LIMIT 1), '설아'),
  -- 신림 클래식
  ((SELECT id FROM stores WHERE name = '클래식' AND region = '신림' LIMIT 1), '나애리'),
  -- 구로 교감
  ((SELECT id FROM stores WHERE name = '교감' AND region = '구로' LIMIT 1), '지안'),
  ((SELECT id FROM stores WHERE name = '교감' AND region = '구로' LIMIT 1), '핑구'),
  ((SELECT id FROM stores WHERE name = '교감' AND region = '구로' LIMIT 1), '류하선'),
  ((SELECT id FROM stores WHERE name = '교감' AND region = '구로' LIMIT 1), '얼음'),
  ((SELECT id FROM stores WHERE name = '교감' AND region = '구로' LIMIT 1), '이아윤'),
  -- 문래동 라휴
  ((SELECT id FROM stores WHERE name = '라휴' AND region = '문래동' LIMIT 1), '설화'),
  -- 분당 베이글
  ((SELECT id FROM stores WHERE name = '베이글' AND region = '분당' LIMIT 1), '나라'),
  ((SELECT id FROM stores WHERE name = '베이글' AND region = '분당' LIMIT 1), '지유'),
  -- 구로 댕이
  ((SELECT id FROM stores WHERE name = '댕이' AND region = '구로' LIMIT 1), '승연'),
  -- 영등포 럭스
  ((SELECT id FROM stores WHERE name = '럭스' AND region = '영등포' LIMIT 1), '세레나'),
  ((SELECT id FROM stores WHERE name = '럭스' AND region = '영등포' LIMIT 1), '백아진'),
  -- 구로 티키타카
  ((SELECT id FROM stores WHERE name = '티키타카' AND region = '구로' LIMIT 1), '은효'),
  ((SELECT id FROM stores WHERE name = '티키타카' AND region = '구로' LIMIT 1), '가비'),
  ((SELECT id FROM stores WHERE name = '티키타카' AND region = '구로' LIMIT 1), '소이'),
  -- 강서 만월
  ((SELECT id FROM stores WHERE name = '만월' AND region = '강서' LIMIT 1), '연우'),
  ((SELECT id FROM stores WHERE name = '만월' AND region = '강서' LIMIT 1), '레몬'),
  ((SELECT id FROM stores WHERE name = '만월' AND region = '강서' LIMIT 1), '서하'),
  ((SELECT id FROM stores WHERE name = '만월' AND region = '강서' LIMIT 1), '유화'),
  ((SELECT id FROM stores WHERE name = '만월' AND region = '강서' LIMIT 1), '예슬'),
  -- 부평 라이크
  ((SELECT id FROM stores WHERE name = '라이크' AND region = '부평' LIMIT 1), '버들'),
  ((SELECT id FROM stores WHERE name = '라이크' AND region = '부평' LIMIT 1), '윤이서'),
  ((SELECT id FROM stores WHERE name = '라이크' AND region = '부평' LIMIT 1), '이루'),
  ((SELECT id FROM stores WHERE name = '라이크' AND region = '부평' LIMIT 1), '수연'),
  -- 강서 코코
  ((SELECT id FROM stores WHERE name = '코코' AND region = '강서' LIMIT 1), '김채원'),
  -- 연신내 스머프
  ((SELECT id FROM stores WHERE name = '스머프' AND region = '연신내' LIMIT 1), '루나'),
  ((SELECT id FROM stores WHERE name = '스머프' AND region = '연신내' LIMIT 1), '딸기'),
  ((SELECT id FROM stores WHERE name = '스머프' AND region = '연신내' LIMIT 1), '다윤'),
  -- 홍대 뷰티K
  ((SELECT id FROM stores WHERE name = '뷰티K' AND region = '홍대' LIMIT 1), '맑음');
