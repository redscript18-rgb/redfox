-- 샘플 정보공유 게시글 20개 추가

DO $$
DECLARE
  v_manager_id UUID;
  v_store_ids INTEGER[];
BEGIN
  -- 매니저 계정 가져오기
  SELECT id INTO v_manager_id FROM profiles WHERE role = 'manager' LIMIT 1;

  IF v_manager_id IS NULL THEN
    RAISE NOTICE 'No manager found, skipping sample posts';
    RETURN;
  END IF;

  -- 랜덤 가게 5개 가져오기 (태그용)
  SELECT ARRAY_AGG(id) INTO v_store_ids
  FROM (SELECT id FROM stores ORDER BY RANDOM() LIMIT 5) s;

  -- 잡담/일반
  INSERT INTO info_posts (author_id, title, content, tags, is_anonymous, store_id, created_at) VALUES
  (v_manager_id, '신입 매니저입니다 잘 부탁드려요', '안녕하세요! 이번에 처음 시작하게 된 신입입니다. 선배님들 많이 알려주세요~ 열심히 하겠습니다!', ARRAY['잡담', '신입'], false, NULL, NOW() - interval '20 hours'),
  (v_manager_id, '다들 쉬는 날 뭐하세요?', '쉬는 날에 뭐하시나요? 저는 집에서 넷플릭스 보는데 다른 분들은 어떻게 시간 보내시는지 궁금해요', ARRAY['잡담'], true, NULL, NOW() - interval '18 hours'),
  (v_manager_id, '요즘 손님이 많아졌네요', '연말이라 그런지 예약이 많아졌어요. 다들 바쁘시죠? 화이팅입니다!', ARRAY['잡담'], false, NULL, NOW() - interval '15 hours'),
  (v_manager_id, '오늘 날씨가 너무 춥네요', '출근길에 얼어죽는 줄 알았어요 ㅠㅠ 다들 따뜻하게 입고 다니세요~', ARRAY['잡담'], true, NULL, NOW() - interval '12 hours');

  -- 팁/노하우
  INSERT INTO info_posts (author_id, title, content, tags, is_anonymous, store_id, created_at) VALUES
  (v_manager_id, '손님 응대 꿀팁 공유해요', '제가 3년 동안 일하면서 터득한 노하우인데요, 첫인상이 정말 중요해요. 밝은 미소와 눈맞춤, 그리고 이름을 기억해주면 단골이 됩니다!', ARRAY['팁', '응대'], false, NULL, NOW() - interval '19 hours'),
  (v_manager_id, '피부 관리 이렇게 해요', '일 끝나고 꼭 클렌징 2번 하고, 수분크림 듬뿍 바르세요. 그리고 일주일에 한번은 팩 필수! 피부가 확 달라져요', ARRAY['팁', '피부관리'], false, NULL, NOW() - interval '17 hours'),
  (v_manager_id, '체력 관리 비법', '저는 출근 전에 꼭 가벼운 스트레칭하고, 비타민 챙겨 먹어요. 그리고 물 많이 마시는 게 진짜 중요해요!', ARRAY['팁', '건강'], true, NULL, NOW() - interval '14 hours'),
  (v_manager_id, '스케줄 관리 노하우', '저는 일주일 단위로 미리 스케줄 짜놓고, 컨디션 안 좋은 날은 과감하게 쉬어요. 무리하면 오래 못해요', ARRAY['팁'], false, NULL, NOW() - interval '11 hours'),
  (v_manager_id, '단골 손님 만드는 법', '손님 취향 메모해두세요! 좋아하는 음료, 대화 주제 등 기억해두면 다음에 오실 때 감동받으세요', ARRAY['팁', '응대'], false, NULL, NOW() - interval '8 hours');

  -- 질문
  INSERT INTO info_posts (author_id, title, content, tags, is_anonymous, store_id, created_at) VALUES
  (v_manager_id, '세금 신고 어떻게 하세요?', '프리랜서로 일하는데 세금 신고를 어떻게 해야 하는지 모르겠어요. 경험 있으신 분 알려주세요!', ARRAY['질문', '세금'], true, NULL, NOW() - interval '16 hours'),
  (v_manager_id, '다른 가게로 옮기려면?', '지금 가게에서 1년 정도 일했는데, 다른 곳도 경험해보고 싶어요. 옮길 때 어떻게 하면 좋을까요?', ARRAY['질문'], true, NULL, NOW() - interval '13 hours'),
  (v_manager_id, '에이전시 가입하면 좋나요?', '에이전시 통해서 일하시는 분들 계시면 장단점 알려주세요~ 고민 중이에요', ARRAY['질문', '에이전시'], false, NULL, NOW() - interval '10 hours'),
  (v_manager_id, '첫 출근인데 뭘 준비해야 할까요?', '이번 주에 첫 출근인데 긴장되네요. 뭘 준비해가면 좋을까요? 선배님들 조언 부탁드려요!', ARRAY['질문', '신입'], false, NULL, NOW() - interval '7 hours'),
  (v_manager_id, '손님이 연락처 달라고 하면?', '가끔 손님이 개인 연락처 물어보시는데 어떻게 대처하세요? 거절하기 애매해서요', ARRAY['질문', '응대'], true, NULL, NOW() - interval '5 hours');

  -- 후기 (가게 태그 포함)
  IF v_store_ids IS NOT NULL AND array_length(v_store_ids, 1) >= 5 THEN
    INSERT INTO info_posts (author_id, title, content, tags, is_anonymous, store_id, created_at) VALUES
    (v_manager_id, '여기 분위기 진짜 좋아요', '처음 출근해봤는데 시설도 깔끔하고 실장님도 친절하세요. 추천합니다!', ARRAY['후기'], false, v_store_ids[1], NOW() - interval '9 hours'),
    (v_manager_id, '이 가게 급여 정산 빨라요', '다른 데는 월말에 주는데 여기는 주급으로 줘서 좋아요. 시스템이 잘 되어있어요', ARRAY['후기', '급여'], true, v_store_ids[2], NOW() - interval '6 hours'),
    (v_manager_id, '손님 퀄리티가 좋은 곳', '위치가 좋아서 그런지 손님들이 매너가 좋아요. 일하기 편합니다', ARRAY['후기'], false, v_store_ids[3], NOW() - interval '4 hours'),
    (v_manager_id, '여기 대기실이 넓어요', '다른 곳은 대기실이 좁아서 불편했는데 여기는 널널해서 좋아요', ARRAY['후기', '시설'], false, v_store_ids[4], NOW() - interval '3 hours'),
    (v_manager_id, '신입한테 추천하는 가게', '처음 시작하는 분들한테 추천해요. 선배들이 잘 알려주고 분위기가 좋아요', ARRAY['후기', '신입'], true, v_store_ids[5], NOW() - interval '2 hours');
  ELSE
    -- 가게가 없으면 태그 없이 추가
    INSERT INTO info_posts (author_id, title, content, tags, is_anonymous, store_id, created_at) VALUES
    (v_manager_id, '좋은 가게 찾았어요', '처음 출근해봤는데 시설도 깔끔하고 실장님도 친절하세요. 추천합니다!', ARRAY['후기'], false, NULL, NOW() - interval '9 hours'),
    (v_manager_id, '급여 정산 빠른 곳 좋아요', '다른 데는 월말에 주는데 주급으로 주는 곳이 좋더라고요', ARRAY['후기', '급여'], true, NULL, NOW() - interval '6 hours'),
    (v_manager_id, '손님 퀄리티가 중요해요', '위치 좋은 곳이 손님 매너도 좋은 것 같아요', ARRAY['후기'], false, NULL, NOW() - interval '4 hours'),
    (v_manager_id, '대기실 넓은 곳 추천', '대기실 좁으면 불편한데 널널한 곳이 좋아요', ARRAY['후기', '시설'], false, NULL, NOW() - interval '3 hours'),
    (v_manager_id, '신입한테 좋은 가게란', '처음 시작하는 분들은 분위기 좋고 선배들이 잘 알려주는 곳으로 가세요', ARRAY['후기', '신입'], true, NULL, NOW() - interval '2 hours');
  END IF;

  -- 추가 일반글
  INSERT INTO info_posts (author_id, title, content, tags, is_anonymous, store_id, created_at) VALUES
  (v_manager_id, '다들 새해 목표 있으세요?', '저는 올해 저축 목표 세웠어요! 다들 새해 목표 뭔가요?', ARRAY['잡담'], false, NULL, NOW() - interval '1 hour');

  RAISE NOTICE 'Sample info posts added successfully';
END $$;
