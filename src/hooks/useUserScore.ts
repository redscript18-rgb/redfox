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

export interface PendingGift {
  id: number;
  sender_id: string;
  receiver_id: string;
  amount: number;
  message: string | null;
  status: 'pending' | 'accepted' | 'rejected';
  created_at: string;
  processed_at: string | null;
  sender?: { name: string; email: string };
  receiver?: { name: string; email: string };
}

const DAILY_LOGIN_REWARD = 100;

export function useUserScore(userId: string | undefined) {
  const [score, setScore] = useState<UserScore | null>(null);
  const [history, setHistory] = useState<ScoreHistory[]>([]);
  const [pendingGifts, setPendingGifts] = useState<PendingGift[]>([]);
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

  const fetchPendingGifts = useCallback(async () => {
    if (!userId) return;

    try {
      const { data, error } = await supabase
        .from('pending_gifts')
        .select(`
          *,
          sender:profiles!pending_gifts_sender_id_fkey(name, email),
          receiver:profiles!pending_gifts_receiver_id_fkey(name, email)
        `)
        .eq('receiver_id', userId)
        .eq('status', 'pending')
        .order('created_at', { ascending: false });

      if (error) {
        console.error('대기 선물 조회 실패:', error);
        return;
      }

      setPendingGifts(data || []);
    } catch (err) {
      console.error('대기 선물 조회 에러:', err);
    }
  }, [userId]);

  const initializeScore = useCallback(async () => {
    if (!userId) return null;

    try {
      const { data: existing } = await supabase
        .from('user_scores')
        .select('*')
        .eq('user_id', userId)
        .single();

      if (existing) {
        setScore(existing);
        return existing;
      }

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
      let currentScore = score;
      if (!currentScore) {
        currentScore = await initializeScore();
        if (!currentScore) {
          return { success: false, error: '점수 초기화에 실패했습니다.' };
        }
      }

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

      await supabase
        .from('score_history')
        .insert({
          user_id: userId,
          amount: DAILY_LOGIN_REWARD,
          reason: 'daily_login',
          description: '일일 로그인 보상'
        });

      setScore(prev => prev ? {
        ...prev,
        total_score: newTotalScore,
        last_login_reward_date: today,
        updated_at: new Date().toISOString()
      } : null);

      fetchHistory();

      return { success: true, error: null };
    } catch (err) {
      console.error('일일 보상 지급 에러:', err);
      return { success: false, error: '보상 지급 중 오류가 발생했습니다.' };
    }
  }, [userId, score, canClaimDaily, initializeScore, fetchHistory]);

  // 선물 보내기 (대기 상태로 생성, 점수 차감 안함)
  const sendGift = useCallback(async (receiverId: string, _receiverName: string, amount: number, message?: string) => {
    if (!userId) return { success: false, error: '로그인이 필요합니다.' };
    if (amount < 100) return { success: false, error: '최소 100점부터 선물 가능합니다.' };
    if (amount % 100 !== 0) return { success: false, error: '100점 단위로만 선물 가능합니다.' };
    if (!score || score.total_score < amount) return { success: false, error: '보유 점수가 부족합니다.' };
    if (receiverId === userId) return { success: false, error: '자신에게는 선물할 수 없습니다.' };

    try {
      // 대기 선물 생성 (점수 차감 없음)
      const { error: giftError } = await supabase
        .from('pending_gifts')
        .insert({
          sender_id: userId,
          receiver_id: receiverId,
          amount,
          message: message || null,
          status: 'pending'
        });

      if (giftError) {
        console.error('선물 생성 실패:', giftError);
        return { success: false, error: '선물 전송에 실패했습니다.' };
      }

      // 보내는 사람 프로필 조회
      const { data: senderProfile } = await supabase
        .from('profiles')
        .select('name')
        .eq('id', userId)
        .single();

      // 받는 사람에게 알림
      await supabase
        .from('notifications')
        .insert({
          user_id: receiverId,
          type: 'gift_pending',
          title: '선물이 도착했습니다!',
          message: `${senderProfile?.name || '누군가'}님이 ${amount.toLocaleString()}점을 선물했습니다. 수락하시겠습니까?`,
          data: { sender_id: userId, sender_name: senderProfile?.name, amount }
        });

      return { success: true, error: null };
    } catch (err) {
      console.error('선물 전송 에러:', err);
      return { success: false, error: '선물 전송 중 오류가 발생했습니다.' };
    }
  }, [userId, score]);

  // 선물 수락
  const acceptGift = useCallback(async (giftId: number) => {
    if (!userId) return { success: false, error: '로그인이 필요합니다.' };

    try {
      // 선물 정보 조회
      const { data: gift, error: giftError } = await supabase
        .from('pending_gifts')
        .select('*, sender:profiles!pending_gifts_sender_id_fkey(name)')
        .eq('id', giftId)
        .eq('receiver_id', userId)
        .eq('status', 'pending')
        .single();

      if (giftError || !gift) {
        return { success: false, error: '선물을 찾을 수 없습니다.' };
      }

      // 보내는 사람 점수 확인
      const { data: senderScore } = await supabase
        .from('user_scores')
        .select('total_score')
        .eq('user_id', gift.sender_id)
        .single();

      if (!senderScore || senderScore.total_score < gift.amount) {
        // 보내는 사람 점수 부족 - 선물 거절 처리
        await supabase
          .from('pending_gifts')
          .update({ status: 'rejected', processed_at: new Date().toISOString() })
          .eq('id', giftId);

        return { success: false, error: '보내는 분의 점수가 부족하여 선물을 받을 수 없습니다.' };
      }

      // 보내는 사람 점수 차감
      const { error: senderUpdateError } = await supabase
        .from('user_scores')
        .update({
          total_score: senderScore.total_score - gift.amount,
          updated_at: new Date().toISOString()
        })
        .eq('user_id', gift.sender_id);

      if (senderUpdateError) {
        console.error('보내는 사람 점수 차감 실패:', senderUpdateError);
        return { success: false, error: '선물 처리에 실패했습니다.' };
      }

      // 받는 사람 점수 추가
      const currentScore = score?.total_score || 0;
      const { error: receiverUpdateError } = await supabase
        .from('user_scores')
        .update({
          total_score: currentScore + gift.amount,
          updated_at: new Date().toISOString()
        })
        .eq('user_id', userId);

      if (receiverUpdateError) {
        // 롤백: 보내는 사람 점수 복구
        await supabase
          .from('user_scores')
          .update({ total_score: senderScore.total_score })
          .eq('user_id', gift.sender_id);
        console.error('받는 사람 점수 추가 실패:', receiverUpdateError);
        return { success: false, error: '선물 처리에 실패했습니다.' };
      }

      // 선물 상태 업데이트
      await supabase
        .from('pending_gifts')
        .update({ status: 'accepted', processed_at: new Date().toISOString() })
        .eq('id', giftId);

      // 보내는 사람 내역 추가
      const { data: receiverProfile } = await supabase
        .from('profiles')
        .select('name')
        .eq('id', userId)
        .single();

      await supabase
        .from('score_history')
        .insert({
          user_id: gift.sender_id,
          amount: -gift.amount,
          reason: 'gift_sent',
          description: `${receiverProfile?.name || '알 수 없음'}님에게 선물`
        });

      // 받는 사람 내역 추가
      await supabase
        .from('score_history')
        .insert({
          user_id: userId,
          amount: gift.amount,
          reason: 'gift_received',
          description: `${gift.sender?.name || '알 수 없음'}님으로부터 선물`
        });

      // 보내는 사람에게 알림
      await supabase
        .from('notifications')
        .insert({
          user_id: gift.sender_id,
          type: 'gift_accepted',
          title: '선물이 수락되었습니다!',
          message: `${receiverProfile?.name || '누군가'}님이 ${gift.amount.toLocaleString()}점 선물을 수락했습니다.`,
          data: { receiver_id: userId, receiver_name: receiverProfile?.name, amount: gift.amount }
        });

      // 상태 업데이트
      setScore(prev => prev ? {
        ...prev,
        total_score: currentScore + gift.amount,
        updated_at: new Date().toISOString()
      } : null);

      // 대기 선물 목록 새로고침
      fetchPendingGifts();
      fetchHistory();

      return { success: true, error: null };
    } catch (err) {
      console.error('선물 수락 에러:', err);
      return { success: false, error: '선물 수락 중 오류가 발생했습니다.' };
    }
  }, [userId, score, fetchPendingGifts, fetchHistory]);

  // 선물 거절
  const rejectGift = useCallback(async (giftId: number) => {
    if (!userId) return { success: false, error: '로그인이 필요합니다.' };

    try {
      const { data: gift } = await supabase
        .from('pending_gifts')
        .select('*, sender:profiles!pending_gifts_sender_id_fkey(name)')
        .eq('id', giftId)
        .eq('receiver_id', userId)
        .eq('status', 'pending')
        .single();

      if (!gift) {
        return { success: false, error: '선물을 찾을 수 없습니다.' };
      }

      // 선물 상태 업데이트
      await supabase
        .from('pending_gifts')
        .update({ status: 'rejected', processed_at: new Date().toISOString() })
        .eq('id', giftId);

      // 받는 사람 프로필
      const { data: receiverProfile } = await supabase
        .from('profiles')
        .select('name')
        .eq('id', userId)
        .single();

      // 보내는 사람에게 알림
      await supabase
        .from('notifications')
        .insert({
          user_id: gift.sender_id,
          type: 'gift_rejected',
          title: '선물이 거절되었습니다',
          message: `${receiverProfile?.name || '누군가'}님이 ${gift.amount.toLocaleString()}점 선물을 거절했습니다.`,
          data: { receiver_id: userId, receiver_name: receiverProfile?.name, amount: gift.amount }
        });

      fetchPendingGifts();

      return { success: true, error: null };
    } catch (err) {
      console.error('선물 거절 에러:', err);
      return { success: false, error: '선물 거절 중 오류가 발생했습니다.' };
    }
  }, [userId, fetchPendingGifts]);

  useEffect(() => {
    if (userId) {
      fetchScore();
      fetchPendingGifts();
    }
  }, [userId, fetchScore, fetchPendingGifts]);

  return {
    score,
    history,
    pendingGifts,
    loading,
    historyLoading,
    canClaimDaily: canClaimDaily(),
    fetchScore,
    fetchHistory,
    fetchPendingGifts,
    initializeScore,
    claimDailyReward,
    sendGift,
    acceptGift,
    rejectGift,
    totalScore: score?.total_score || 0,
    pendingGiftCount: pendingGifts.length
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
    case 'gift_sent':
      return '선물 보냄';
    case 'gift_received':
      return '선물 받음';
    default:
      return reason;
  }
}
