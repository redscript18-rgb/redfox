-- 등록 매니저(virtual_staff) 프로필 사진 URL 초기화
-- picsum.photos 랜덤 이미지 제거

UPDATE virtual_staff
SET profile_photo_url = NULL
WHERE profile_photo_url LIKE '%picsum.photos%';

-- 확인
SELECT COUNT(*) as cleared_count
FROM virtual_staff
WHERE profile_photo_url IS NULL;
