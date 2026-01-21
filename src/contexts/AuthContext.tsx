import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import { supabase } from '../lib/supabase';

interface Profile {
  id: string;
  email: string;
  username: string;
  nickname: string;
  name: string;
  role: 'owner' | 'admin' | 'staff' | 'manager' | 'customer' | 'superadmin' | 'agency';
  phone?: string;
  profile_image?: string;
  profile_photo_url?: string;
  bio?: string;
  specialties?: string[];
}

interface SignupData {
  username: string;
  nickname: string;
  password: string;
  role: string;
  email?: string;
  phone?: string;
}

interface AuthContextType {
  user: Profile | null;
  loading: boolean;
  login: (username: string, password: string) => Promise<{ error: string | null }>;
  signup: (data: SignupData) => Promise<{ error: string | null; message?: string }>;
  checkUsername: (username: string) => Promise<boolean>;
  logout: () => Promise<void>;
  isAuthenticated: boolean;
}

const AuthContext = createContext<AuthContextType | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<Profile | null>(null);
  const [loading, setLoading] = useState(true);

  const initializeUserScore = async (userId: string) => {
    try {
      // 점수 레코드가 있는지 확인
      const { data: existing } = await supabase
        .from('user_scores')
        .select('user_id')
        .eq('user_id', userId)
        .single();

      // 없으면 생성
      if (!existing) {
        await supabase
          .from('user_scores')
          .insert({ user_id: userId, total_score: 0 });
      }
    } catch (err) {
      // PGRST116은 레코드가 없을 때 발생하는 에러이므로 무시하고 생성 시도
      if ((err as { code?: string })?.code !== 'PGRST116') {
        console.error('점수 초기화 에러:', err);
      }
    }
  };

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
          // 프로필 조회 성공 시 점수 레코드 초기화
          initializeUserScore(userId);
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

  // 아이디 중복 체크
  const checkUsername = async (username: string): Promise<boolean> => {
    try {
      const { data, error } = await supabase.rpc('check_username_available', {
        p_username: username
      });
      if (error) {
        console.error('Username check error:', error);
        return false;
      }
      return data === true;
    } catch {
      return false;
    }
  };

  // 아이디로 가짜 이메일 생성 (Supabase Auth용)
  const generateFakeEmail = (username: string) => `${username.toLowerCase()}@redfox.local`;

  const login = async (username: string, password: string) => {
    setLoading(true);
    try {
      // 먼저 username으로 사용자 조회하여 이메일 확인
      const { data: userData } = await supabase.rpc('get_user_by_username', {
        p_username: username
      });

      let email: string;
      if (userData && userData.length > 0) {
        // 기존 사용자의 실제 이메일 사용
        email = userData[0].email;
      } else {
        // 새 형식의 가짜 이메일로 시도
        email = generateFakeEmail(username);
      }

      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) {
        setLoading(false);
        if (error.message.includes('Invalid login credentials')) {
          return { error: '아이디 또는 비밀번호가 올바르지 않습니다.' };
        }
        return { error: error.message };
      }

      if (data.user) {
        const profile = await fetchProfile(data.user.id);

        // 사장 계정 승인 여부 확인
        if (profile?.role === 'owner') {
          const { data: approvalData } = await supabase
            .from('profiles')
            .select('is_approved')
            .eq('id', data.user.id)
            .single();

          if (approvalData && approvalData.is_approved === false) {
            // 승인 대기 중인 사장은 로그아웃 처리
            await supabase.auth.signOut();
            setLoading(false);
            return { error: '가입 승인 대기 중입니다. 관리자 승인 후 로그인 가능합니다.' };
          }
        }

        setUser(profile);
      }

      setLoading(false);
      return { error: null };
    } catch {
      setLoading(false);
      return { error: '로그인 중 오류가 발생했습니다.' };
    }
  };

  const signup = async (data: SignupData) => {
    setLoading(true);
    try {
      // 아이디 중복 체크
      const isAvailable = await checkUsername(data.username);
      if (!isAvailable) {
        setLoading(false);
        return { error: '이미 사용 중인 아이디입니다.' };
      }

      // 이메일이 제공되면 실제 이메일 사용, 아니면 가짜 이메일 생성
      const email = data.email || generateFakeEmail(data.username);

      // 사장 역할은 승인 대기 상태로 시작
      const isOwner = data.role === 'owner';

      const { data: signupData, error } = await supabase.auth.signUp({
        email,
        password: data.password,
        options: {
          data: {
            name: data.nickname,
            username: data.username,
            nickname: data.nickname,
            role: data.role,
            phone: data.phone || null,
            is_approved: !isOwner, // 사장은 false, 나머지는 true
          },
        },
      });

      if (error) {
        setLoading(false);
        return { error: error.message };
      }

      // 사장인 경우 프로필의 is_approved를 false로 설정
      if (isOwner && signupData?.user) {
        await supabase
          .from('profiles')
          .update({ is_approved: false })
          .eq('id', signupData.user.id);
      }

      setLoading(false);

      // 사장은 승인 대기 메시지 반환
      if (isOwner) {
        return { error: null, message: '가입 신청이 완료되었습니다. 관리자 승인 후 로그인 가능합니다.' };
      }

      return { error: null };
    } catch {
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
        checkUsername,
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
