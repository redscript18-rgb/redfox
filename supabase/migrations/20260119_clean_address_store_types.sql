-- Clean store types from address field
-- Store types: 룸, 오피, 휴게텔, 건마, 안마, 출장, 립카페, 핸플, 페티쉬, 스웨디시

-- Remove store type patterns from address
-- Pattern: "업종 - " or " 업종 " or "업종]" etc.

UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*룸\s*[-]?\s*', ' ', 'g')) WHERE address ~ '룸' AND store_type = '룸';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*오피\s*[-]?\s*', ' ', 'g')) WHERE address ~ '오피' AND store_type = '오피';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*휴게텔\s*[-]?\s*', ' ', 'g')) WHERE address ~ '휴게텔' AND store_type = '휴게텔';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*건마\s*[-]?\s*', ' ', 'g')) WHERE address ~ '건마' AND store_type = '건마';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*안마\s*[-]?\s*', ' ', 'g')) WHERE address ~ '안마' AND store_type = '안마';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*출장\s*[-]?\s*', ' ', 'g')) WHERE address ~ '출장' AND store_type = '출장';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*립카페\s*[-]?\s*', ' ', 'g')) WHERE address ~ '립카페' AND store_type = '립카페';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*핸플\s*[-]?\s*', ' ', 'g')) WHERE address ~ '핸플' AND store_type = '핸플';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*페티쉬\s*[-]?\s*', ' ', 'g')) WHERE address ~ '페티쉬' AND store_type = '페티쉬';
UPDATE stores SET address = TRIM(REGEXP_REPLACE(address, '\s*스웨디시\s*[-]?\s*', ' ', 'g')) WHERE address ~ '스웨디시' AND store_type = '스웨디시';

-- Clean up any double spaces left behind
UPDATE stores SET address = REGEXP_REPLACE(address, '\s{2,}', ' ', 'g') WHERE address ~ '\s{2,}';

-- Trim leading/trailing spaces
UPDATE stores SET address = TRIM(address) WHERE address != TRIM(address);
