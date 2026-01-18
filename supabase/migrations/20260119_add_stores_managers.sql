-- 가게 및 등록 매니저 데이터 추가 (스프레드시트 4번째 시트부터)
-- 생성일: 2026-01-19
-- 총 가게: 39개, 총 매니저: 188명

-- 가게: 가산 야구장 립카페 | 매니저: 서진, 솔아, 현서
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '가산 야구장 립카페';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('가산 야구장 립카페', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '서진', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '서진');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '솔아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '솔아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '현서', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '현서');
END $$;

-- 가게: 강남 페티시코드 | 매니저: 유진
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 페티시코드';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 페티시코드', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유진', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유진');
END $$;

-- 가게: 강남 칠칠립카페 | 매니저: 예지, 해라
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 칠칠립카페';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 칠칠립카페', '주소 미정', '010-4225-2088', v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        UPDATE stores SET phone = '010-4225-2088' WHERE id = v_store_id AND (phone IS NULL OR phone = '');
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '예지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '해라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '해라');
END $$;

-- 가게: 강남 실루엣 | 매니저: 로하
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 실루엣';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 실루엣', '주소 미정', '010-8138-9410', v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        UPDATE stores SET phone = '010-8138-9410' WHERE id = v_store_id AND (phone IS NULL OR phone = '');
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '로하', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '로하');
END $$;

-- 가게: 강남 스캔들 | 매니저: 사랑, 윤아, 세리
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 스캔들';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 스캔들', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '사랑', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '사랑');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '윤아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '윤아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '세리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '세리');
END $$;

-- 가게: 강남 건마 설레임 | 매니저: 코코, 하은, 티모, 온화, 지은, 새벽, 연지, 지현, 루아, 초이, 나예
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 건마 설레임';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 건마 설레임', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '코코', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '코코');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '하은', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하은');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '티모', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '티모');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '온화', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '온화');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지은', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지은');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '새벽', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '새벽');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '연지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지현', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지현');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '루아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '루아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '초이', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '초이');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '나예', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '나예');
END $$;

-- 가게: 가산 야구장 건마 | 매니저: 새롬, 민정, 사랑, 솔지, 서연, 예지, 효선, 채채, 지우, 박하, 지아
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '가산 야구장 건마';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('가산 야구장 건마', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '새롬', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '새롬');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '민정', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '민정');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '사랑', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '사랑');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '솔지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '솔지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '서연', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '서연');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '예지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '효선', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '효선');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '채채', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '채채');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지우', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지우');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '박하', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '박하');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지아');
END $$;

-- 가게: 강동 크림 | 매니저: 유리
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강동 크림';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강동 크림', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유리');
END $$;

-- 가게: 부평 하루 1인샵 | 매니저: 슬기, 나미, 다미, 다혜, 유이, 조현, 로아, 수빈, 이유, 가람, 규리, 은채, 그린, 샛별, 보아
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '부평 하루 1인샵';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('부평 하루 1인샵', '주소 미정', '010-5826-6477', v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        UPDATE stores SET phone = '010-5826-6477' WHERE id = v_store_id AND (phone IS NULL OR phone = '');
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '슬기', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '슬기');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '나미', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '나미');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '다미', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '다미');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '다혜', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '다혜');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유이', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유이');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '조현', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '조현');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '로아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '로아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수빈', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수빈');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이유', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이유');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '가람', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '가람');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '규리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '규리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '은채', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '은채');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '그린', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '그린');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '샛별', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '샛별');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '보아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '보아');
END $$;

-- 가게: 일산 미시신세계VVIP | 매니저: 연아, 비비, 슈가, 리나, 주아, 빛나, 카라, 혜주, 레몬, 소정, 세미
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 미시신세계VVIP';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 미시신세계VVIP', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '연아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '비비', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '비비');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '슈가', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '슈가');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '리나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '리나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '주아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '주아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '빛나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '빛나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '카라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '카라');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '혜주', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '혜주');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '레몬', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '레몬');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소정', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소정');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '세미', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '세미');
END $$;

-- 가게: 일산 소녀 | 매니저: 하예솔, 사랑, 하나, 최애, 유하, 효쥬, 유연, 예인, 하라
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 소녀';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 소녀', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '하예솔', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하예솔');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '사랑', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '사랑');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '하나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '최애', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '최애');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유하', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유하');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '효쥬', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '효쥬');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유연', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유연');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '예인', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예인');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '하라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하라');
END $$;

-- 가게: 일산 로즈왁싱테라피 | 매니저: 수연
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 로즈왁싱테라피';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 로즈왁싱테라피', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수연', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수연');
END $$;

-- 가게: 일산 인스타 | 매니저: 현아, 은별, 세빈, 예지, 하은, 주영, 로제, 유라, 미나, 시아, 신비, 레몬, 지우, 아영, 루비
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 인스타';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 인스타', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '현아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '현아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '은별', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '은별');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '세빈', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '세빈');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '예지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '하은', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하은');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '주영', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '주영');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '로제', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '로제');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유라');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '미나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '미나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '시아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '신비', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '신비');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '레몬', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '레몬');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지우', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지우');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '아영', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '아영');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '루비', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '루비');
END $$;

-- 가게: 일산 미수다 | 매니저: 유라, 루나, 아리, 연우, 옥빈, 이수
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 미수다';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 미수다', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유라');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '루나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '루나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '아리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '아리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '연우', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연우');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '옥빈', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '옥빈');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이수', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이수');
END $$;

-- 가게: 일산 러블리 | 매니저: 지니
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 러블리';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 러블리', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지니', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지니');
END $$;

-- 가게: 일산 황용 | 매니저: 초이, 지은, 세라, 연지, 유정, 유라
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 황용';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 황용', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '초이', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '초이');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지은', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지은');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '세라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '세라');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '연지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유정', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유정');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유라');
END $$;

-- 가게: 일산 터치 스웨디시 | 매니저: 미코
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 터치 스웨디시';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 터치 스웨디시', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '미코', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '미코');
END $$;

-- 가게: 의정부 경기1번스웨디시 | 매니저: 유나, 연주
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '의정부 경기1번스웨디시';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('의정부 경기1번스웨디시', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '연주', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연주');
END $$;

-- 가게: 일산 행신궁원 | 매니저: 세라, 은서
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 행신궁원';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 행신궁원', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '세라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '세라');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '은서', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '은서');
END $$;

-- 가게: 일산 황궁 | 매니저: 애리, 연수, 바다, 수정, 여름, 유진, 이슬, 가희
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 황궁';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 황궁', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '애리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '애리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '연수', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '연수');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '바다', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '바다');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수정', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수정');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '여름', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '여름');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유진', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유진');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이슬', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이슬');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '가희', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '가희');
END $$;

-- 가게: 강남 임팩트 | 매니저: 뽀미
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 임팩트';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 임팩트', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '뽀미', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '뽀미');
END $$;

-- 가게: 강남 무지개 | 매니저: 정다솜, 소유, 이그린, 시연
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 무지개';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 무지개', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '정다솜', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '정다솜');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소유', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소유');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이그린', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이그린');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '시연', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시연');
END $$;

-- 가게: 강남 설레임 오피 | 매니저: 서아, 샤샤, 로아, 헤라, 비비안, 유리, 솔지, 수이, 여름, 이엘, 조아, 아름, 윤희, 예나, 유소나
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임 오피';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 설레임 오피', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '서아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '서아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '샤샤', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '샤샤');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '로아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '로아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '헤라', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '헤라');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '비비안', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '비비안');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '솔지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '솔지');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수이', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수이');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '여름', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '여름');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이엘', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이엘');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '조아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '조아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '아름', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '아름');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '윤희', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '윤희');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '예나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유소나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유소나');
END $$;

-- 가게: 강남 롤스로이스 | 매니저: 백금화, 천이슬, 민채아, 이도아, 주고빈
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 롤스로이스';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 롤스로이스', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '백금화', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '백금화');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '천이슬', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '천이슬');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '민채아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '민채아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이도아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이도아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '주고빈', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '주고빈');
END $$;

-- 가게: 강남 하숙집 | 매니저: 규리
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 하숙집';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 하숙집', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '규리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '규리');
END $$;

-- 가게: 강남 디올 | 매니저: 다솜, 소희, 유리
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 디올';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 디올', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '다솜', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '다솜');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소희', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소희');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유리');
END $$;

-- 가게: 강남 앤써 | 매니저: 정원
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 앤써';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 앤써', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '정원', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '정원');
END $$;

-- 가게: 부평 달고나 | 매니저: 혜림
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '부평 달고나';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('부평 달고나', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '혜림', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '혜림');
END $$;

-- 가게: 분당 시에스타 | 매니저: 송라은, 민지유
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '분당 시에스타';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('분당 시에스타', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '송라은', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '송라은');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '민지유', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '민지유');
END $$;

-- 가게: 선릉 마돈나클럽 | 매니저: 슬기, 서예지
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '선릉 마돈나클럽';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('선릉 마돈나클럽', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '슬기', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '슬기');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '서예지', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '서예지');
END $$;

-- 가게: 일산 섯다 | 매니저: 수아
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 섯다';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 섯다', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수아');
END $$;

-- 가게: 가산 야구장 휴게 | 매니저: 혜선, 소진, 효진, 젤리, 이솔, 단비, 미도리, 수아, 리아, 새영, 가영, 겨울, 소이, 시현
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '가산 야구장 휴게';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('가산 야구장 휴게', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '혜선', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '혜선');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소진', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소진');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '효진', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '효진');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '젤리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '젤리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '이솔', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '이솔');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '단비', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '단비');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '미도리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '미도리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '리아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '리아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '새영', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '새영');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '가영', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '가영');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '겨울', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '겨울');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소이', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소이');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '시현', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시현');
END $$;

-- 가게: 강남 스테이 | 매니저: 채영, 깜찍, 우연
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 스테이';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 스테이', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '채영', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '채영');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '깜찍', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '깜찍');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '우연', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '우연');
END $$;

-- 가게: 일산 드림 | 매니저: 마리아, 바비, 제니, 가인, 소다
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 드림';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 드림', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '마리아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '마리아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '바비', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '바비');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '제니', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '제니');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '가인', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '가인');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소다', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소다');
END $$;

-- 가게: 강남 설레임 휴게텔 | 매니저: 유림, 수현, 시아, 나나, 예솔, 은하, 지니, 밀크, 단사랑, 세아, 도리, 시영, 영채, 고은
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 설레임 휴게텔';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 설레임 휴게텔', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '유림', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '유림');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '수현', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '수현');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '시아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '나나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '나나');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '예솔', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '예솔');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '은하', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '은하');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지니', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지니');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '밀크', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '밀크');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '단사랑', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '단사랑');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '세아', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '세아');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '도리', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '도리');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '시영', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '시영');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '영채', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '영채');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '고은', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '고은');
END $$;

-- 가게: 파주 디저트 | 매니저: 하나
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '파주 디저트';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('파주 디저트', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '하나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '하나');
END $$;

-- 가게: 부천 쎅카데미 | 매니저: 나나
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '부천 쎅카데미';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('부천 쎅카데미', '주소 미정', '010-4402-8558', v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        UPDATE stores SET phone = '010-4402-8558' WHERE id = v_store_id AND (phone IS NULL OR phone = '');
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '나나', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '나나');
END $$;

-- 가게: 강남 테토녀 | 매니저: 루비, 소원, 혜인
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '강남 테토녀';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('강남 테토녀', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '루비', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '루비');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '소원', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '소원');
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '혜인', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '혜인');
END $$;

-- 가게: 일산 빰빰 | 매니저: 지연
DO $$
DECLARE
    v_store_id INTEGER;
    v_admin_id UUID;
BEGIN
    SELECT id INTO v_store_id FROM stores WHERE name = '일산 빰빰';
    
    IF v_store_id IS NULL THEN
        SELECT id INTO v_admin_id FROM profiles WHERE role IN ('admin', 'owner') LIMIT 1;
        INSERT INTO stores (name, address, phone, owner_id)
        VALUES ('일산 빰빰', '주소 미정', NULL, v_admin_id)
        RETURNING id INTO v_store_id;
    ELSE
        SELECT owner_id INTO v_admin_id FROM stores WHERE id = v_store_id;
        
    END IF;
    
    INSERT INTO virtual_staff (store_id, name, created_by_admin_id)
    SELECT v_store_id, '지연', v_admin_id
    WHERE NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = '지연');
END $$;
