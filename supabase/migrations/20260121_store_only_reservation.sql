-- 매니저 지정 없이 가게에 직접 예약 가능하도록 제약조건 수정

-- 기존 제약조건 삭제
ALTER TABLE reservations DROP CONSTRAINT IF EXISTS check_staff_or_virtual_staff;

-- 새 제약조건: staff_id와 virtual_staff_id 둘 다 NULL 허용 (가게 직접 예약)
-- 단, 둘 다 값이 있으면 안됨
ALTER TABLE reservations ADD CONSTRAINT check_staff_or_virtual_staff_or_none
  CHECK (
    (staff_id IS NOT NULL AND virtual_staff_id IS NULL) OR
    (staff_id IS NULL AND virtual_staff_id IS NOT NULL) OR
    (staff_id IS NULL AND virtual_staff_id IS NULL)
  );

-- 예약 타입 추가를 위한 코멘트
COMMENT ON TABLE reservations IS '예약 테이블: staff_id/virtual_staff_id 모두 NULL이면 가게 직접 예약';
