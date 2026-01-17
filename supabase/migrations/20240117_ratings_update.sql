-- ratings 테이블 수정: 스케줄 기반 별점 지원
-- reservation_id를 nullable로 변경하고 schedule_id 추가

ALTER TABLE ratings ALTER COLUMN reservation_id DROP NOT NULL;

ALTER TABLE ratings ADD COLUMN schedule_id INTEGER REFERENCES schedules(id) ON DELETE CASCADE;

-- 인덱스 추가
CREATE INDEX idx_ratings_schedule ON ratings(schedule_id);

-- 제약조건: reservation_id 또는 schedule_id 중 하나는 있어야 함
ALTER TABLE ratings ADD CONSTRAINT ratings_has_reference
  CHECK (reservation_id IS NOT NULL OR schedule_id IS NOT NULL);
