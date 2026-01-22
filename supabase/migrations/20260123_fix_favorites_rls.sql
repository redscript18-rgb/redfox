-- 매니저가 자신을 고정한 손님 수를 볼 수 있도록 RLS 정책 추가
-- 기존 정책은 user_id만 조회 가능하여, target_staff_id로 조회 불가

-- 새로운 정책: 매니저가 자신이 타겟인 고정 수를 조회 가능
CREATE POLICY "favorites_select_as_target" ON favorites
  FOR SELECT TO authenticated USING (
    auth.uid() = user_id OR auth.uid() = target_staff_id
  );

-- 기존 정책 삭제 (새 정책으로 대체)
DROP POLICY IF EXISTS "favorites_select" ON favorites;
