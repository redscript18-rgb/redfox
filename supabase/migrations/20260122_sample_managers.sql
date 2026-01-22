-- 등록 매니저(virtual_staff) 100명 샘플 데이터 생성
-- 기존 가게들에 다양한 프로필을 가진 매니저 추가

DO $$
DECLARE
    v_store_ids INTEGER[];
    v_store_id INTEGER;
    v_admin_id UUID;
    v_names TEXT[] := ARRAY[
        '서윤', '지안', '하은', '서연', '수아', '지우', '소율', '예은', '지민', '채원',
        '하윤', '소연', '유진', '예린', '시은', '민서', '가은', '나윤', '다은', '라희',
        '미소', '보람', '세라', '아린', '연지', '유나', '은별', '지현', '채린', '하나',
        '가영', '나연', '다솜', '라온', '마린', '바다', '사랑', '아영', '자윤', '차은',
        '카라', '타미', '파랑', '하늘', '가인', '나래', '다정', '라미', '마음', '바름',
        '소망', '아라', '자연', '찬미', '카민', '티아', '피아', '하람', '가희', '나비',
        '단비', '라벨', '마리', '바니', '새봄', '아이', '재인', '채이', '코코', '토리',
        '푸름', '헤나', '가온', '나라', '달리', '라엘', '마야', '벨라', '솔아', '안나',
        '제니', '초아', '클라', '테아', '페이', '해나', '걸', '노아', '델라', '로라',
        '몰리', '베라', '샐리', '엘라', '줄리', '키라', '테라', '폴라', '헬렌', '효린'
    ];
    v_ages INTEGER[] := ARRAY[22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 24, 25, 26, 27, 28, 23, 24, 25,
                              26, 27, 28, 29, 30, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 24, 25, 26, 27, 28,
                              29, 30, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 24, 25, 26, 27, 28, 23, 24,
                              25, 26, 27, 28, 29, 30, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 24, 25, 26, 27,
                              28, 29, 30, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 24, 25, 26, 27, 28, 29];
    v_heights INTEGER[] := ARRAY[160, 162, 164, 165, 166, 167, 168, 169, 170, 158, 159, 161, 163, 165, 167, 168, 170, 160, 162, 164,
                                 165, 166, 167, 168, 169, 170, 158, 159, 161, 163, 165, 167, 168, 170, 160, 162, 164, 165, 166, 167,
                                 168, 169, 170, 158, 159, 161, 163, 165, 167, 168, 170, 160, 162, 164, 165, 166, 167, 168, 169, 170,
                                 158, 159, 161, 163, 165, 167, 168, 170, 160, 162, 164, 165, 166, 167, 168, 169, 170, 158, 159, 161,
                                 163, 165, 167, 168, 170, 160, 162, 164, 165, 166, 167, 168, 169, 170, 158, 159, 161, 163, 165, 167];
    v_weights INTEGER[] := ARRAY[45, 46, 47, 48, 49, 50, 51, 52, 48, 49, 50, 51, 46, 47, 48, 49, 50, 45, 46, 47,
                                 48, 49, 50, 51, 52, 48, 49, 50, 51, 46, 47, 48, 49, 50, 45, 46, 47, 48, 49, 50,
                                 51, 52, 48, 49, 50, 51, 46, 47, 48, 49, 50, 45, 46, 47, 48, 49, 50, 51, 52, 48,
                                 49, 50, 51, 46, 47, 48, 49, 50, 45, 46, 47, 48, 49, 50, 51, 52, 48, 49, 50, 51,
                                 46, 47, 48, 49, 50, 45, 46, 47, 48, 49, 50, 51, 52, 48, 49, 50, 51, 46, 47, 48];
    v_body_sizes TEXT[] := ARRAY['A', 'B', 'C', 'D', 'B', 'C', 'D', 'A', 'B', 'C'];
    v_personalities TEXT[] := ARRAY['활발함', '차분함', '애교많음', '섹시함', '청순함', '도도함', '발랄함', '매력적', '상냥함', '쿨함'];
    v_styles TEXT[] := ARRAY['글래머', '슬림', '귀여운', '섹시한', '청순한', '도도한', '발랄한', '우아한', '시크한', '내추럴'];
    v_skin_tones TEXT[] := ARRAY['백옥', '밝은', '중간', '건강한', '백옥', '밝은', '중간', '건강한', '백옥', '밝은'];
    v_hair_lengths TEXT[] := ARRAY['긴머리', '중간', '단발', '긴머리', '중간', '긴머리', '단발', '긴머리', '중간', '긴머리'];
    v_hair_styles TEXT[] := ARRAY['웨이브', '생머리', '레이어드', 'C컬', '웨이브', '생머리', '히피펌', '볼륨펌', '생머리', '웨이브'];
    v_hair_colors TEXT[] := ARRAY['검정', '갈색', '밝은갈색', '애쉬', '검정', '갈색', '밝은갈색', '다크브라운', '검정', '갈색'];
    v_mbtis TEXT[] := ARRAY['ENFP', 'INFJ', 'ENFJ', 'INFP', 'ENTP', 'INTP', 'ENTJ', 'INTJ', 'ESFP', 'ISFP'];
    v_jobs TEXT[] := ARRAY['학생', '직장인', '프리랜서', '모델', '배우 지망생', '댄서', '요가 강사', '헬스 트레이너', '뷰티 아티스트', '인플루언서'];
    v_bios TEXT[] := ARRAY[
        '편안한 분위기를 만들어드려요',
        '정성을 다해 케어해드립니다',
        '밝은 에너지로 힐링을 선사해요',
        '섬세한 터치가 자랑이에요',
        '따뜻한 마음으로 모시겠습니다',
        '프로페셔널한 서비스를 약속드려요',
        '당신의 휴식을 책임질게요',
        '최고의 만족을 드리겠습니다',
        '편안하게 쉬다 가세요',
        '행복한 시간 만들어드릴게요'
    ];
    i INTEGER;
    v_is_smoker BOOLEAN;
    v_is_waxed BOOLEAN;
    v_nationalities TEXT[];
    v_languages TEXT[];
    v_mod INTEGER;
    v_store_count INTEGER;
BEGIN
    -- 가게 ID 목록 가져오기
    SELECT ARRAY_AGG(id ORDER BY id) INTO v_store_ids FROM stores LIMIT 20;
    SELECT COUNT(*) INTO v_store_count FROM stores;

    IF v_store_count = 0 THEN
        RAISE NOTICE '가게가 없습니다. 먼저 가게를 생성해주세요.';
        RETURN;
    END IF;

    -- admin_id 가져오기
    SELECT id INTO v_admin_id FROM profiles WHERE role IN ('superadmin', 'owner', 'staff') LIMIT 1;

    FOR i IN 1..100 LOOP
        -- 가게 순환 배정
        v_store_id := v_store_ids[((i - 1) % array_length(v_store_ids, 1)) + 1];

        v_is_smoker := (i % 5 = 0);
        v_is_waxed := (i % 3 != 0);
        v_mod := (i - 1) % 10;

        -- 국적 및 언어 설정
        CASE v_mod
            WHEN 0 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어'];
            WHEN 1 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어', '영어'];
            WHEN 2 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어'];
            WHEN 3 THEN v_nationalities := ARRAY['한국', '일본']; v_languages := ARRAY['한국어', '일본어'];
            WHEN 4 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어', '영어'];
            WHEN 5 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어'];
            WHEN 6 THEN v_nationalities := ARRAY['한국', '중국']; v_languages := ARRAY['한국어', '중국어'];
            WHEN 7 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어', '영어'];
            WHEN 8 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어'];
            WHEN 9 THEN v_nationalities := ARRAY['한국']; v_languages := ARRAY['한국어', '영어', '일본어'];
        END CASE;

        -- 같은 가게에 같은 이름이 없으면 추가
        IF NOT EXISTS (SELECT 1 FROM virtual_staff WHERE store_id = v_store_id AND name = v_names[i]) THEN
            INSERT INTO virtual_staff (
                store_id, name, bio,
                age, height, weight, body_size,
                is_smoker, personality, style,
                skin_tone, hair_length, hair_style, is_waxed, hair_color,
                job, mbti,
                nationalities, languages,
                is_visible, created_by_admin_id,
                created_at
            ) VALUES (
                v_store_id,
                v_names[i],
                v_bios[v_mod + 1],
                v_ages[i],
                v_heights[i],
                v_weights[i],
                v_body_sizes[v_mod + 1],
                v_is_smoker,
                v_personalities[v_mod + 1],
                v_styles[v_mod + 1],
                v_skin_tones[v_mod + 1],
                v_hair_lengths[v_mod + 1],
                v_hair_styles[v_mod + 1],
                v_is_waxed,
                v_hair_colors[v_mod + 1],
                v_jobs[v_mod + 1],
                v_mbtis[v_mod + 1],
                v_nationalities,
                v_languages,
                true,
                v_admin_id,
                NOW() - (random() * interval '90 days')
            );
        END IF;
    END LOOP;
END $$;

-- 생성된 등록 매니저 수 확인
SELECT COUNT(*) as total_virtual_staff FROM virtual_staff;
