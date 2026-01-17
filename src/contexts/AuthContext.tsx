import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
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
  const [initialized, setInitialized] = useState(false);

  // 프로필 가져오기
  const fetchProfile = async (userId: string): Promise<Profile | null> => {
    try {
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', userId)
        .single();

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

  // 초기화 - 한 번만 실행
  useEffect(() => {
    let isMounted = true;

    const initAuth = async () => {
      try {
        const { data: { session }, error } = await supabase.auth.getSession();

        if (error) {
          console.error('세션 조회 실패:', error);
          // 세션 에러 시 로컬 스토리지 정리
          await supabase.auth.signOut();
        } else if (session?.user && isMounted) {
          const profile = await fetchProfile(session.user.id);
          if (isMounted) {
            setUser(profile);
          }
        }
      } catch (err) {
        console.error('인증 초기화 에러:', err);
      } finally {
        if (isMounted) {
          setLoading(false);
          setInitialized(true);
        }
      }
    };

    initAuth();

    // 인증 상태 변경 리스너
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        // 초기화 전에는 무시 (getSession에서 처리)
        if (!initialized && event === 'INITIAL_SESSION') {
          return;
        }

        if (session?.user) {
          const profile = await fetchProfile(session.user.id);
          if (isMounted) {
            setUser(profile);
          }
        } else {
          if (isMounted) {
            setUser(null);
          }
        }
      }
    );

    return () => {
      isMounted = false;
      subscription.unsubscribe();
    };
  }, [initialized]);

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
