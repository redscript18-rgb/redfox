import { createContext, useContext, useState, useEffect, useRef, type ReactNode } from 'react';
import { supabase } from '../lib/supabase';

interface Profile {
  id: string;
  email: string;
  name: string;
  role: 'owner' | 'admin' | 'staff' | 'customer';
  phone?: string;
  profile_image?: string;
  bio?: string;
  specialties?: string[];
}

interface AuthContextType {
  user: Profile | null;
  loading: boolean;
  login: (email: string, password: string) => Promise<{ error: string | null }>;
  signup: (email: string, password: string, name: string, role: string) => Promise<{ error: string | null }>;
  logout: () => Promise<void>;
  isAuthenticated: boolean;
}

const AuthContext = createContext<AuthContextType | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<Profile | null>(null);
  const [loading, setLoading] = useState(true);
  const initRef = useRef(false);
  const authInitializedRef = useRef(false);

  // 프로필 가져오기 (5초 타임아웃)
  const fetchProfile = async (userId: string): Promise<Profile | null> => {
    try {
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), 5000);

      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', userId)
        .single()
        .abortSignal(controller.signal);

      clearTimeout(timeoutId);

      if (error) {
        console.error('프로필 조회 실패:', error);
        return null;
      }
      return data as Profile;
    } catch (err) {
      console.error('프로필 조회 에러:', err);
      return null;
    }
  };

  // 초기화
  useEffect(() => {
    // 이미 초기화됐으면 스킵
    if (initRef.current) return;
    initRef.current = true;

    let isMounted = true;
    let timeoutId: ReturnType<typeof setTimeout>;

    // 인증 상태 변경 리스너 먼저 설정
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        if (!isMounted) return;

        console.log('Auth event:', event, 'Session:', !!session?.user);

        // 인증 이벤트 수신 시 초기화 완료 표시
        authInitializedRef.current = true;
        clearTimeout(timeoutId);

        try {
          if (session?.user) {
            const profile = await fetchProfile(session.user.id);
            if (isMounted) {
              setUser(profile);
              setLoading(false);
            }
          } else {
            if (isMounted) {
              setUser(null);
              setLoading(false);
            }
          }
        } catch (err) {
          console.error('Auth state change error:', err);
          if (isMounted) {
            setUser(null);
            setLoading(false);
          }
        }
      }
    );

    // 초기 세션 확인
    const initAuth = async () => {
      try {
        const { data: { session }, error } = await supabase.auth.getSession();

        if (!isMounted) return;

        if (error) {
          console.error('세션 조회 실패:', error);
          await supabase.auth.signOut();
          setLoading(false);
          return;
        }

        if (session?.user) {
          const profile = await fetchProfile(session.user.id);
          if (isMounted) {
            setUser(profile);
          }
        }
      } catch (err) {
        console.error('인증 초기화 에러:', err);
        // 에러 발생 시 로컬 스토리지 정리
        try {
          await supabase.auth.signOut();
        } catch {}
      } finally {
        if (isMounted) {
          setLoading(false);
          clearTimeout(timeoutId);
          authInitializedRef.current = true;
        }
      }
    };

    // 3초 타임아웃 - 초기 로딩이 너무 오래 걸리면 강제로 해제하고 세션 정리
    timeoutId = setTimeout(async () => {
      if (isMounted && !authInitializedRef.current) {
        console.warn('인증 초기화 타임아웃 - 세션 정리 및 로딩 해제');
        authInitializedRef.current = true;
        try {
          await supabase.auth.signOut();
        } catch {}
        setUser(null);
        setLoading(false);
      }
    }, 3000);

    initAuth();

    return () => {
      isMounted = false;
      clearTimeout(timeoutId);
      subscription.unsubscribe();
    };
  }, []);

  const login = async (email: string, password: string) => {
    setLoading(true);
    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) {
        setLoading(false);
        return { error: error.message };
      }

      if (data.user) {
        const profile = await fetchProfile(data.user.id);
        setUser(profile);
      }

      setLoading(false);
      return { error: null };
    } catch (err) {
      setLoading(false);
      return { error: '로그인 중 오류가 발생했습니다.' };
    }
  };

  const signup = async (email: string, password: string, name: string, role: string) => {
    setLoading(true);
    try {
      const { error } = await supabase.auth.signUp({
        email,
        password,
        options: {
          data: { name, role },
        },
      });
      setLoading(false);
      return { error: error?.message || null };
    } catch (err) {
      setLoading(false);
      return { error: '회원가입 중 오류가 발생했습니다.' };
    }
  };

  const logout = async () => {
    setLoading(true);
    try {
      await supabase.auth.signOut();
      setUser(null);
    } catch (err) {
      console.error('로그아웃 에러:', err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        loading,
        login,
        signup,
        logout,
        isAuthenticated: user !== null,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider');
  }
  return context;
}
