-- 테스트 데이터 시드
-- 주의: 빠른 로그인 버튼으로 테스트 계정들을 먼저 생성한 후 실행하세요!

-- 1. 가게 생성 (사장 계정 ID로)
INSERT INTO stores (name, address, owner_id) VALUES
  ('뷰티살롱 강남점', '서울시 강남구 테헤란로 123', (SELECT id FROM profiles WHERE email = 'owner@test.com')),
  ('뷰티살롱 홍대점', '서울시 마포구 홍대입구역 456', (SELECT id FROM profiles WHERE email = 'owner@test.com')),
  ('헤어스튜디오 신촌', '서울시 서대문구 신촌로 789', (SELECT id FROM profiles WHERE email = 'owner@test.com'))
ON CONFLICT DO NOTHING;

-- 2. 메뉴 생성
INSERT INTO menus (store_id, name, description, price) VALUES
  -- 강남점 메뉴
  ((SELECT id FROM stores WHERE name = '뷰티살롱 강남점'), '커트', '기본 커트', 30000),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 강남점'), '펌', '일반 펌', 80000),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 강남점'), '염색', '전체 염색', 70000),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 강남점'), '클리닉', '두피 클리닉', 50000),
  -- 홍대점 메뉴
  ((SELECT id FROM stores WHERE name = '뷰티살롱 홍대점'), '커트', '스타일 커트', 25000),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 홍대점'), '펌', '디지털 펌', 90000),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 홍대점'), '염색', '포인트 염색', 50000),
  -- 신촌점 메뉴
  ((SELECT id FROM stores WHERE name = '헤어스튜디오 신촌'), '남성 커트', '남성 전용', 20000),
  ((SELECT id FROM stores WHERE name = '헤어스튜디오 신촌'), '여성 커트', '여성 전용', 30000),
  ((SELECT id FROM stores WHERE name = '헤어스튜디오 신촌'), '셋팅펌', '볼륨 셋팅', 60000)
ON CONFLICT DO NOTHING;

-- 3. 관리자 배정 (admin을 강남점, 홍대점 관리자로)
INSERT INTO store_admins (store_id, admin_id) VALUES
  ((SELECT id FROM stores WHERE name = '뷰티살롱 강남점'), (SELECT id FROM profiles WHERE email = 'admin@test.com')),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 홍대점'), (SELECT id FROM profiles WHERE email = 'admin@test.com'))
ON CONFLICT DO NOTHING;

-- 4. 직원 배정 (staff를 강남점, 홍대점 직원으로)
INSERT INTO store_staff (store_id, staff_id) VALUES
  ((SELECT id FROM stores WHERE name = '뷰티살롱 강남점'), (SELECT id FROM profiles WHERE email = 'staff@test.com')),
  ((SELECT id FROM stores WHERE name = '뷰티살롱 홍대점'), (SELECT id FROM profiles WHERE email = 'staff@test.com'))
ON CONFLICT DO NOTHING;

-- 5. 직원 프로필 업데이트 (전문분야 추가)
UPDATE profiles
SET
  specialties = ARRAY['커트', '펌', '염색'],
  bio = '10년 경력의 헤어 디자이너입니다.'
WHERE email = 'staff@test.com';

-- 6. 오늘 날짜로 출근 스케줄 생성
INSERT INTO schedules (store_id, staff_id, date, start_time, end_time, type, status) VALUES
  (
    (SELECT id FROM stores WHERE name = '뷰티살롱 강남점'),
    (SELECT id FROM profiles WHERE email = 'staff@test.com'),
    CURRENT_DATE,
    '10:00',
    '19:00',
    'self',
    'approved'
  ),
  (
    (SELECT id FROM stores WHERE name = '뷰티살롱 강남점'),
    (SELECT id FROM profiles WHERE email = 'staff@test.com'),
    CURRENT_DATE + 1,
    '10:00',
    '18:00',
    'requested',
    'pending'
  )
ON CONFLICT DO NOTHING;

-- 7. 샘플 예약 생성
INSERT INTO reservations (store_id, staff_id, customer_id, menu_id, date, start_time, end_time, status) VALUES
  (
    (SELECT id FROM stores WHERE name = '뷰티살롱 강남점'),
    (SELECT id FROM profiles WHERE email = 'staff@test.com'),
    (SELECT id FROM profiles WHERE email = 'customer@test.com'),
    (SELECT id FROM menus WHERE name = '커트' AND store_id = (SELECT id FROM stores WHERE name = '뷰티살롱 강남점')),
    CURRENT_DATE,
    '14:00',
    '14:30',
    'confirmed'
  ),
  (
    (SELECT id FROM stores WHERE name = '뷰티살롱 강남점'),
    (SELECT id FROM profiles WHERE email = 'staff@test.com'),
    (SELECT id FROM profiles WHERE email = 'customer@test.com'),
    (SELECT id FROM menus WHERE name = '펌' AND store_id = (SELECT id FROM stores WHERE name = '뷰티살롱 강남점')),
    CURRENT_DATE,
    '15:00',
    '17:00',
    'pending'
  )
ON CONFLICT DO NOTHING;

-- 완료 메시지
SELECT '테스트 데이터 생성 완료!' as message;
