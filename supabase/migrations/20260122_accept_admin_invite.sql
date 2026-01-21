-- 실장 초대 수락 함수 생성
CREATE OR REPLACE FUNCTION accept_admin_invite(p_store_id INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user_id UUID := auth.uid();
BEGIN
  -- 이미 등록된 실장인지 확인
  IF EXISTS (
    SELECT 1 FROM store_admins
    WHERE store_id = p_store_id AND admin_id = v_user_id
  ) THEN
    RETURN TRUE; -- 이미 실장임
  END IF;

  -- store_admins에 추가
  INSERT INTO store_admins (store_id, admin_id)
  VALUES (p_store_id, v_user_id);

  RETURN TRUE;
EXCEPTION
  WHEN unique_violation THEN
    RETURN TRUE; -- 이미 존재함
  WHEN OTHERS THEN
    RAISE;
END;
$$;

-- 함수 실행 권한 부여
GRANT EXECUTE ON FUNCTION accept_admin_invite(INTEGER) TO authenticated;
