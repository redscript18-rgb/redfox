-- Auto-classify stores with null store_type based on name or address

-- 룸
UPDATE stores SET store_type = '룸'
WHERE store_type IS NULL AND (name ILIKE '%룸%' OR address ILIKE '%룸%');

-- 오피
UPDATE stores SET store_type = '오피'
WHERE store_type IS NULL AND (name ILIKE '%오피%' OR address ILIKE '%오피%');

-- 휴게텔
UPDATE stores SET store_type = '휴게텔'
WHERE store_type IS NULL AND (name ILIKE '%휴게텔%' OR address ILIKE '%휴게텔%');

-- 건마
UPDATE stores SET store_type = '건마'
WHERE store_type IS NULL AND (name ILIKE '%건마%' OR address ILIKE '%건마%');

-- 안마
UPDATE stores SET store_type = '안마'
WHERE store_type IS NULL AND (name ILIKE '%안마%' OR address ILIKE '%안마%');

-- 출장
UPDATE stores SET store_type = '출장'
WHERE store_type IS NULL AND (name ILIKE '%출장%' OR address ILIKE '%출장%');

-- 립카페
UPDATE stores SET store_type = '립카페'
WHERE store_type IS NULL AND (name ILIKE '%립카페%' OR address ILIKE '%립카페%' OR name ILIKE '%립까페%' OR address ILIKE '%립까페%');

-- 핸플
UPDATE stores SET store_type = '핸플'
WHERE store_type IS NULL AND (name ILIKE '%핸플%' OR address ILIKE '%핸플%');

-- 페티쉬
UPDATE stores SET store_type = '페티쉬'
WHERE store_type IS NULL AND (name ILIKE '%페티쉬%' OR address ILIKE '%페티쉬%' OR name ILIKE '%페티시%' OR address ILIKE '%페티시%');

-- 스웨디시
UPDATE stores SET store_type = '스웨디시'
WHERE store_type IS NULL AND (name ILIKE '%스웨디시%' OR address ILIKE '%스웨디시%');
