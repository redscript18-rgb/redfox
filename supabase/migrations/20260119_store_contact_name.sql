-- stores 테이블에 담당자 이름 컬럼 추가
ALTER TABLE stores ADD COLUMN IF NOT EXISTS contact_name TEXT;

-- virtual_staff에서 관리자(실장/마담/대표/부장/사원/이사)의 이름을 stores.contact_name으로 복사
-- 한 가게에 여러 관리자가 있을 수 있으므로 쉼표로 연결
UPDATE stores s
SET contact_name = (
  SELECT string_agg(vs.name, ', ')
  FROM virtual_staff vs
  WHERE vs.store_id = s.id
    AND vs.name ~ '(실장|마담|대표|부장|사원|이사)'
)
WHERE EXISTS (
  SELECT 1 FROM virtual_staff vs
  WHERE vs.store_id = s.id
    AND vs.name ~ '(실장|마담|대표|부장|사원|이사)'
);

-- virtual_staff에서 관리자 레코드 삭제
DELETE FROM virtual_staff
WHERE name ~ '(실장|마담|대표|부장|사원|이사)';
