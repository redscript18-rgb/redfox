-- 예약 조회 정책 수정: 모든 인증된 사용자가 예약을 조회할 수 있도록 변경
-- 매니저가 가게 탐색 시 예약 건수를 볼 수 있어야 함

-- 기존 정책 삭제
DROP POLICY IF EXISTS "예약 조회" ON reservations;

-- 새 정책: 모든 인증된 사용자가 조회 가능
CREATE POLICY "예약 조회" ON reservations
  FOR SELECT TO authenticated
  USING (true);

-- 예약 관리(UPDATE) 정책은 기존 그대로 유지 (관련자만 수정 가능)
