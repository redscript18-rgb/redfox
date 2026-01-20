-- 슈퍼어드민 점수를 10억점으로 설정
UPDATE user_scores
SET total_score = 1000000000, updated_at = NOW()
WHERE user_id IN (
  SELECT id FROM profiles WHERE role = 'superadmin'
);

-- 슈퍼어드민 점수 레코드가 없으면 생성
INSERT INTO user_scores (user_id, total_score)
SELECT id, 1000000000 FROM profiles
WHERE role = 'superadmin'
AND id NOT IN (SELECT user_id FROM user_scores)
ON CONFLICT (user_id) DO UPDATE SET total_score = 1000000000;

-- 내역 기록
INSERT INTO score_history (user_id, amount, reason, description)
SELECT id, 1000000000, 'admin_grant', '관리자 지급'
FROM profiles WHERE role = 'superadmin';
