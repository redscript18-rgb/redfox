import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import { supabase } from '../lib/supabase';

interface Profile {
  id: string;
  email: string;
  name: string;
  role: 'owner' | 'admin' | 'staff' | 'customer' | 'superadmin';
  phone?: string;
  profile_image?: string;
  profile_photo_url?: string;
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

  const fetchProfile = async (userId: string): Promise<Profile | null> => {
    try {
      const timeoutPromise = new Promise<null>((resolve) => {
        setTimeout(() => resolve(null), 5000);
      });

      const fetchPromise = supabase
        .from('profiles')
        .select('*')
        .eq('id', userId)
        .single()
        .then(({ data, error }) => {
          if (error) {
            console.error('프로필 조회 실패:', error);
            return null;
          }
          return data as Profile;
        });

      return await Promise.race([fetchPromise, timeoutPromise]);
    } catch (err) {
      console.error('프로필 조회 에러:', err);
      return null;
    }
  };

  useEffect(() => {
    let isMounted = true;

    // 초기 세션 확인 (타임아웃 포함)
    const initAuth = async () => {
      const timeout = setTimeout(() => {
        if (isMounted) {
          setLoading(false);
        }
      }, 1500);

      try {
        const { data: { session } } = await supabase.auth.getSession();

        if (!isMounted) return;

        if (session?.user) {
          const profile = await fetchProfile(session.user.id);
          if (isMounted) {
            setUser(profile);
          }
        }
      } catch (err) {
        console.error('인증 초기화 에러:', err);
      } finally {
        clearTimeout(timeout);
        if (isMounted) {
          setLoading(false);
        }
      }
    };

    initAuth();

    // 인증 상태 변경 리스너
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (_event, session) => {
        if (!isMounted) return;

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
