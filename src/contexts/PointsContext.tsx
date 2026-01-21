import { createContext, useContext, useState, useEffect, useCallback, type ReactNode } from 'react';
import { useAuth } from './AuthContext';
import { supabase } from '../lib/supabase';

interface UserPoints {
  balance: number;
  totalEarned: number;
  totalSpent: number;
  streakDays: number;
  lastCheckinDate: string | null;
  canCheckinToday: boolean;
}

interface PointHistoryItem {
  id: number;
  amount: number;
  type: string;
  description: string | null;
  createdAt: string;
}

interface CheckinResult {
  success: boolean;
  pointsEarned: number;
  streak: number;
  message: string;
}

interface PointsContextType {
  points: UserPoints | null;
  history: PointHistoryItem[];
  loading: boolean;
  fetchPoints: () => Promise<void>;
  fetchHistory: (limit?: number) => Promise<void>;
  doCheckin: () => Promise<CheckinResult>;
}

const PointsContext = createContext<PointsContextType | null>(null);

export function PointsProvider({ children }: { children: ReactNode }) {
  const { user } = useAuth();
  const [points, setPoints] = useState<UserPoints | null>(null);
  const [history, setHistory] = useState<PointHistoryItem[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchPoints = useCallback(async () => {
    if (!user) {
      setPoints(null);
      setLoading(false);
      return;
    }

    try {
      const { data, error } = await supabase
        .from('user_points')
        .select('*')
        .eq('user_id', user.id)
        .single();

      if (error && error.code !== 'PGRST116') {
        // PGRST116 = no rows returned (new user)
        console.error('Error fetching points:', error);
      }

      if (data) {
        // 한국 시간 기준으로 오늘 날짜 계산 (YYYY-MM-DD 형식)
        const now = new Date();
        const koreaTime = new Date(now.toLocaleString('en-US', { timeZone: 'Asia/Seoul' }));
        const today = `${koreaTime.getFullYear()}-${String(koreaTime.getMonth() + 1).padStart(2, '0')}-${String(koreaTime.getDate()).padStart(2, '0')}`;
        setPoints({
          balance: data.balance,
          totalEarned: data.total_earned,
          totalSpent: data.total_spent,
          streakDays: data.streak_days,
          lastCheckinDate: data.last_checkin_date,
          canCheckinToday: data.last_checkin_date !== today,
        });
      } else {
        // 새 사용자
        setPoints({
          balance: 0,
          totalEarned: 0,
          totalSpent: 0,
          streakDays: 0,
          lastCheckinDate: null,
          canCheckinToday: true,
        });
      }
    } catch (err) {
      console.error('Error in fetchPoints:', err);
      // 에러 발생 시에도 기본값 설정 (출석 가능)
      setPoints({
        balance: 0,
        totalEarned: 0,
        totalSpent: 0,
        streakDays: 0,
        lastCheckinDate: null,
        canCheckinToday: true,
      });
    }

    setLoading(false);
  }, [user]);

  const fetchHistory = useCallback(async (limit = 20) => {
    if (!user) return;

    const { data } = await supabase
      .from('point_history')
      .select('*')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (data) {
      setHistory(data.map(item => ({
        id: item.id,
        amount: item.amount,
        type: item.type,
        description: item.description,
        createdAt: item.created_at,
      })));
    }
  }, [user]);

  const doCheckin = useCallback(async (): Promise<CheckinResult> => {
    if (!user) {
      return { success: false, pointsEarned: 0, streak: 0, message: '로그인이 필요합니다.' };
    }

    try {
      const { data, error } = await supabase.rpc('do_daily_checkin', {
        p_user_id: user.id
      });

      console.log('Checkin RPC response:', { data, error });

      if (error) {
        console.error('Checkin error:', error);
        // 함수가 없는 경우
        if (error.code === '42883' || error.message?.includes('does not exist')) {
          return { success: false, pointsEarned: 0, streak: 0, message: '출석 기능이 아직 설정되지 않았습니다.' };
        }
        return { success: false, pointsEarned: 0, streak: 0, message: error.message || '출석체크 중 오류가 발생했습니다.' };
      }

      if (!data || data.length === 0) {
        console.error('Checkin returned no data');
        return { success: false, pointsEarned: 0, streak: 0, message: '출석체크 응답이 없습니다.' };
      }

      const result = data[0];

      // 포인트 데이터 새로고침
      await fetchPoints();
      await fetchHistory();

      return {
        success: result.success,
        pointsEarned: result.points_earned,
        streak: result.streak,
        message: result.message,
      };
    } catch (err) {
      console.error('Checkin exception:', err);
      return { success: false, pointsEarned: 0, streak: 0, message: '출석체크 중 예외가 발생했습니다.' };
    }
  }, [user, fetchPoints, fetchHistory]);

  useEffect(() => {
    fetchPoints();
  }, [fetchPoints]);

  return (
    <PointsContext.Provider
      value={{
        points,
        history,
        loading,
        fetchPoints,
        fetchHistory,
        doCheckin,
      }}
    >
      {children}
    </PointsContext.Provider>
  );
}

export function usePoints() {
  const context = useContext(PointsContext);
  if (!context) {
    throw new Error('usePoints must be used within PointsProvider');
  }
  return context;
}
