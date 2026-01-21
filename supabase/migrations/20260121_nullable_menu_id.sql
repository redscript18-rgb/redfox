-- 메뉴 없이 예약 가능하도록 menu_id NULL 허용

-- menu_id 컬럼이 NOT NULL이면 NULL 허용으로 변경
ALTER TABLE reservations ALTER COLUMN menu_id DROP NOT NULL;

-- 코멘트 추가
COMMENT ON COLUMN reservations.menu_id IS '메뉴 ID (선택사항 - NULL이면 메뉴 미지정 예약)';
