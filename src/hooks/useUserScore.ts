import { useState, useEffect, useCallback } from 'react';
import { supabase } from '../lib/supabase';

interface UserScore {
  user_id: string;
  total_score: number;
  last_login_reward_date: string | null;
  created_at: string;
  updated_at: string;
}

interface ScoreHistory {
  id: number;
  user_id: string;
  amount: number;
  reason: string;
  description: string | null;
  created_at: string;
}

const DAILY_LOGIN_REWARD = 100;

export function useUserScore(userId: string | undefined) {
  const [score, setScore] = useState<UserScore | null>(null);
  const [history, setHistory] = useState<ScoreHistory[]>([]);
  const [loading, setLoading] = useState(true);
  const [historyLoading, setHistoryLoading] = useState(false);

  const fetchScore = useCallback(async () => {
    if (!userId) return;

    try {
      const { data, error } = await supabase
        .from('user_scores')
        .select('*')
        .eq('user_id', userId)
        .single();

      if (error && error.code !== 'PGRST116') {
        console.error('점수 조회 실패:', error);
        return;
      }

      setScore(data);
    } catch (err) {
      console.error('점수 조회 에러:', err);
    } finally {
      setLoading(false);
    }
  }, [userId]);

  const fetchHistory = useCallback(async (limit = 50) => {
    if (!userId) return;

    setHistoryLoading(true);
    try {
      const { data, error } = await supabase
        .from('score_history')
        .select('*')
        .eq('user_id', userId)
        .order('created_at', { ascending: false })
        .limit(limit);

      if (error) {
        console.error('점수 내역 조회 실패:', error);
        return;
      }

      setHistory(data || []);
    } catch (err) {
      console.error('점수 내역 조회 에러:', err);
    } finally {
      setHistoryLoading(false);
    }
  }, [userId]);

  const initializeScore = useCallback(async () => {
    if (!userId) return null;

    try {
      // 이미 레코드가 있는지 확인
      const { data: existing } = await supabase
        .from('user_scores')
        .select('*')
        .eq('user_id', userId)
        .single();

      if (existing) {
        setScore(existing);
        return existing;
      }

      // 없으면 새로 생성
      const { data, error } = await supabase
        .from('user_scores')
        .insert({ user_id: userId, total_score: 0 })
        .select()
        .single();

      if (error) {
        console.error('점수 레코드 생성 실패:', error);
        return null;
      }

      setScore(data);
      return data;
    } catch (err) {
      console.error('점수 초기화 에러:', err);
      return null;
    }
  }, [userId]);

  const canClaimDaily = useCallback(() => {
    if (!score) return true;
    if (!score.last_login_reward_date) return true;

    const today = new Date().toISOString().split('T')[0];
    return score.last_login_reward_date !== today;
  }, [score]);

  const claimDailyReward = useCallback(async () => {
    if (!userId) return { success: false, error: '로그인이 필요합니다.' };
    if (!canClaimDaily()) return { success: false, error: '오늘 이미 보상을 받았습니다.' };

    const today = new Date().toISOString().split('T')[0];

    try {
      // 점수 레코드가 없으면 생성
      let currentScore = score;
      if (!currentScore) {
        currentScore = await initializeScore();
        if (!currentScore) {
          return { success: false, error: '점수 초기화에 실패했습니다.' };
        }
      }

      // 점수 업데이트
      const newTotalScore = (currentScore.total_score || 0) + DAILY_LOGIN_REWARD;

      const { error: updateError } = await supabase
        .from('user_scores')
        .update({
          total_score: newTotalScore,
          last_login_reward_date: today,
          updated_at: new Date().toISOString()
        })
        .eq('user_id', userId);

      if (updateError) {
        console.error('점수 업데이트 실패:', updateError);
        return { success: false, error: '점수 업데이트에 실패했습니다.' };
      }

      // 내역 추가
      const { error: historyError } = await supabase
        .from('score_history')
        .insert({
          user_id: userId,
          amount: DAILY_LOGIN_REWARD,
          reason: 'daily_login',
          description: '일일 로그인 보상'
        });

      if (historyError) {
        console.error('내역 추가 실패:', historyError);
      }

      // 상태 업데이트
      setScore(prev => prev ? {
        ...prev,
        total_score: newTotalScore,
        last_login_reward_date: today,
        updated_at: new Date().toISOString()
      } : null);

      // 내역 새로고침
      fetchHistory();

      return { success: true, error: null };
    } catch (err) {
      console.error('일일 보상 지급 에러:', err);
      return { success: false, error: '보상 지급 중 오류가 발생했습니다.' };
    }
  }, [userId, score, canClaimDaily, initializeScore, fetchHistory]);

  useEffect(() => {
    if (userId) {
      fetchScore();
    }
  }, [userId, fetchScore]);

  return {
    score,
    history,
    loading,
    historyLoading,
    canClaimDaily: canClaimDaily(),
    fetchScore,
    fetchHistory,
    initializeScore,
    claimDailyReward,
    totalScore: score?.total_score || 0
  };
}

export function getReasonLabel(reason: string): string {
  switch (reason) {
    case 'daily_login':
      return '일일 로그인';
    case 'review':
      return '리뷰 작성';
    case 'referral':
      return '추천인 보상';
    case 'reservation':
      return '예약 적립';
    case 'usage':
      return '포인트 사용';
    default:
      return reason;
  }
}
