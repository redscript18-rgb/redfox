import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

// 테스트용 빠른 로그인 계정
const TEST_ACCOUNTS = [
  { username: 'superadmin', password: 'test123456', nickname: '슈퍼관리자', role: 'superadmin', label: 'ADMIN' },
  { username: 'owner', password: 'test123456', nickname: '김사장', role: 'owner', label: '사장' },
  { username: 'admin', password: 'test123456', nickname: '이관리', role: 'staff', label: '실장' },
  { username: 'staff', password: 'test123456', nickname: '박매니저', role: 'manager', label: '매니저' },
  { username: 'customer', password: 'test123456', nickname: '최손님', role: 'customer', label: '손님' },
  { username: 'agency', password: 'test123456', nickname: '정에이전시', role: 'agency', label: '에이전시' },
];

export default function Login() {
  const [isSignup, setIsSignup] = useState(false);
  // 로그인용
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  // 회원가입용 추가 필드
  const [nickname, setNickname] = useState('');
  const [passwordConfirm, setPasswordConfirm] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [role, setRole] = useState('customer');
  // 상태
  const [error, setError] = useState('');
  const [message, setMessage] = useState('');
  const [loading, setLoading] = useState(false);
  const [usernameChecking, setUsernameChecking] = useState(false);
  const [usernameAvailable, setUsernameAvailable] = useState<boolean | null>(null);
  // 비밀번호 찾기
  const [showResetModal, setShowResetModal] = useState(false);
  const [resetUsername, setResetUsername] = useState('');
  const [resetReason, setResetReason] = useState('');
  const [resetLoading, setResetLoading] = useState(false);
  const [resetMessage, setResetMessage] = useState('');
  const [resetError, setResetError] = useState('');
  // 새 비밀번호 설정 (이메일 링크에서 돌아왔을 때)
  const [isPasswordRecovery, setIsPasswordRecovery] = useState(false);
  const [newPassword, setNewPassword] = useState('');
  const [newPasswordConfirm, setNewPasswordConfirm] = useState('');
  const [recoveryLoading, setRecoveryLoading] = useState(false);

  const { login, signup, checkUsername } = useAuth();
  const navigate = useNavigate();

  // 비밀번호 복구 링크 감지
  useEffect(() => {
    const { data: authListener } = supabase.auth.onAuthStateChange(async (event) => {
      if (event === 'PASSWORD_RECOVERY') {
        setIsPasswordRecovery(true);
      }
    });

    return () => {
      authListener.subscription.unsubscribe();
    };
  }, []);

  const handleSetNewPassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (newPassword.length < 6) {
      setError('비밀번호는 6자 이상이어야 합니다.');
      return;
    }
    if (newPassword !== newPasswordConfirm) {
      setError('비밀번호가 일치하지 않습니다.');
      return;
    }

    setRecoveryLoading(true);
    setError('');

    const { error: updateError } = await supabase.auth.updateUser({
      password: newPassword
    });

    if (updateError) {
      setError('비밀번호 변경 중 오류가 발생했습니다.');
      console.error('Password update error:', updateError);
    } else {
      setMessage('비밀번호가 변경되었습니다. 새 비밀번호로 로그인하세요.');
      setIsPasswordRecovery(false);
      setNewPassword('');
      setNewPasswordConfirm('');
      // 로그아웃 처리
      await supabase.auth.signOut();
    }

    setRecoveryLoading(false);
  };

  // 아이디 중복 체크 (디바운스)
  useEffect(() => {
    if (!isSignup || username.length < 3) {
      setUsernameAvailable(null);
      return;
    }

    const timer = setTimeout(async () => {
      setUsernameChecking(true);
      const available = await checkUsername(username);
      setUsernameAvailable(available);
      setUsernameChecking(false);
    }, 500);

    return () => clearTimeout(timer);
  }, [username, isSignup, checkUsername]);

  const handleLoginSuccess = () => {
    const redirectUrl = sessionStorage.getItem('redirectAfterLogin');
    sessionStorage.removeItem('redirectAfterLogin');
    navigate(redirectUrl || '/');
  };

  const validateSignup = (): string | null => {
    if (username.length < 3) {
      return '아이디는 3자 이상이어야 합니다.';
    }
    if (!/^[a-zA-Z0-9_]+$/.test(username)) {
      return '아이디는 영문, 숫자, 밑줄(_)만 사용할 수 있습니다.';
    }
    if (usernameAvailable === false) {
      return '이미 사용 중인 아이디입니다.';
    }
    if (nickname.length < 2) {
      return '닉네임은 2자 이상이어야 합니다.';
    }
    if (password.length < 6) {
      return '비밀번호는 6자 이상이어야 합니다.';
    }
    if (password !== passwordConfirm) {
      return '비밀번호가 일치하지 않습니다.';
    }
    if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      return '올바른 이메일 형식이 아닙니다.';
    }
    return null;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setMessage('');
    setLoading(true);

    try {
      if (isSignup) {
        const validationError = validateSignup();
        if (validationError) {
          setError(validationError);
          setLoading(false);
          return;
        }

        const result = await signup({
          username,
          nickname,
          password,
          role,
          email: email || undefined,
          phone: phone || undefined,
        });
        if (result.error) {
          setError(result.error);
        } else {
          // 사장 가입은 승인 대기 메시지 표시
          setMessage(result.message || '회원가입 완료! 로그인하세요.');
          setIsSignup(false);
          // 회원가입 후 비밀번호 필드만 초기화
          setPassword('');
          setPasswordConfirm('');
        }
      } else {
        const { error } = await login(username, password);
        if (error) {
          setError(error);
        } else {
          handleLoginSuccess();
        }
      }
    } catch {
      setError('오류가 발생했습니다.');
    } finally {
      setLoading(false);
    }
  };

  const handleQuickLogin = async (account: typeof TEST_ACCOUNTS[0]) => {
    setError('');
    setMessage('');
    setLoading(true);

    try {
      const { error: loginError } = await login(account.username, account.password);

      if (loginError) {
        setMessage('계정 생성 중...');
        const { error: signupError } = await signup({
          username: account.username,
          nickname: account.nickname,
          password: account.password,
          role: account.role,
        });

        if (signupError) {
          if (signupError.includes('already')) {
            setError('이미 존재하는 계정입니다. 다시 로그인해보세요.');
          } else {
            setError(signupError);
          }
        } else {
          const { error: retryError } = await login(account.username, account.password);
          if (retryError) {
            setMessage('회원가입 완료! 다시 클릭하세요.');
          } else {
            handleLoginSuccess();
          }
        }
      } else {
        handleLoginSuccess();
      }
    } catch {
      setError('오류가 발생했습니다.');
    } finally {
      setLoading(false);
    }
  };

  const resetForm = () => {
    setUsername('');
    setPassword('');
    setNickname('');
    setPasswordConfirm('');
    setEmail('');
    setPhone('');
    setRole('customer');
    setUsernameAvailable(null);
    setError('');
    setMessage('');
  };

  const handlePasswordResetRequest = async () => {
    if (!resetUsername.trim()) {
      setResetError('아이디를 입력해주세요.');
      return;
    }

    setResetLoading(true);
    setResetError('');
    setResetMessage('');

    try {
      // 먼저 사용자의 이메일 확인
      const { data: userData, error: userError } = await supabase
        .from('profiles')
        .select('email')
        .eq('username', resetUsername.trim().toLowerCase())
        .single();

      if (userError || !userData) {
        setResetError('존재하지 않는 아이디입니다.');
        setResetLoading(false);
        return;
      }

      // 이메일이 있으면 Supabase 이메일 재설정 링크 전송
      if (userData.email) {
        const { error: resetError } = await supabase.auth.resetPasswordForEmail(userData.email, {
          redirectTo: `${window.location.origin}/login`,
        });

        if (resetError) {
          console.error('Password reset email error:', resetError);
          setResetError('이메일 전송 중 오류가 발생했습니다. 다시 시도해주세요.');
        } else {
          setResetMessage(`비밀번호 재설정 링크가 ${userData.email.replace(/(.{2})(.*)(@.*)/, '$1***$3')}로 전송되었습니다. 이메일을 확인해주세요.`);
          setResetUsername('');
        }
      } else {
        // 이메일이 없으면 관리자에게 요청
        const { data, error } = await supabase.rpc('request_password_reset', {
          p_username: resetUsername.trim(),
          p_reason: resetReason.trim() || null
        });

        if (error) {
          setResetError('요청 중 오류가 발생했습니다.');
          console.error('Password reset request error:', error);
        } else if (data === false) {
          setResetError('존재하지 않는 아이디입니다.');
        } else {
          setResetMessage('등록된 이메일이 없어 관리자에게 비밀번호 초기화 요청이 전송되었습니다. 승인 후 새 비밀번호를 안내받을 수 있습니다.');
          setResetUsername('');
          setResetReason('');
        }
      }
    } catch (err) {
      console.error('Password reset error:', err);
      setResetError('오류가 발생했습니다. 다시 시도해주세요.');
    }

    setResetLoading(false);
  };

  // 비밀번호 복구 모드
  if (isPasswordRecovery) {
    return (
      <div className="min-h-screen flex items-center justify-center p-6 bg-white">
        <div className="w-full max-w-[400px] p-8 bg-white border border-slate-200 rounded-2xl shadow-lg">
          <h1 className="mb-8 text-center text-3xl font-bold text-red-600 tracking-tight">
            Red Fox
          </h1>
          <h2 className="text-xl font-semibold text-slate-900 mb-2 text-center">새 비밀번호 설정</h2>
          <p className="text-sm text-slate-500 mb-6 text-center">
            새로운 비밀번호를 입력해주세요.
          </p>

          <form onSubmit={handleSetNewPassword}>
            <div className="mb-4">
              <label htmlFor="newPassword" className="block mb-2 text-sm font-medium text-slate-600">
                새 비밀번호
              </label>
              <input
                type="password"
                id="newPassword"
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                placeholder="6자 이상"
                required
                minLength={6}
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
              />
            </div>

            <div className="mb-4">
              <label htmlFor="newPasswordConfirm" className="block mb-2 text-sm font-medium text-slate-600">
                새 비밀번호 확인
              </label>
              <input
                type="password"
                id="newPasswordConfirm"
                value={newPasswordConfirm}
                onChange={(e) => setNewPasswordConfirm(e.target.value)}
                placeholder="비밀번호를 다시 입력하세요"
                required
                minLength={6}
                className={`w-full px-4 py-3 bg-slate-100 border rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none transition-colors ${
                  newPasswordConfirm && newPassword !== newPasswordConfirm
                    ? 'border-red-500 focus:border-red-500'
                    : 'border-slate-200 focus:border-red-600'
                }`}
              />
              {newPasswordConfirm && newPassword !== newPasswordConfirm && (
                <p className="text-red-500 text-xs mt-1">비밀번호가 일치하지 않습니다.</p>
              )}
            </div>

            {error && <p className="text-red-600 text-sm mb-4">{error}</p>}

            <button
              type="submit"
              disabled={recoveryLoading}
              className="w-full py-4 mt-2 bg-red-600 text-white rounded-lg text-base font-semibold hover:bg-red-700 transition-colors disabled:bg-slate-400 disabled:cursor-not-allowed"
            >
              {recoveryLoading ? '처리 중...' : '비밀번호 변경'}
            </button>
          </form>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center p-6 bg-white">
      <div className="w-full max-w-[400px] p-8 bg-white border border-slate-200 rounded-2xl shadow-lg">
        <h1 className="mb-8 text-center text-3xl font-bold text-red-600 tracking-tight">
          Red Fox
        </h1>

        {/* 빠른 로그인 버튼 - 개발 모드에서만 표시 */}
        {!isSignup && TEST_ACCOUNTS.length > 0 && (
          <div className="mb-6 pb-6 border-b border-slate-200">
            <div className="flex flex-wrap gap-2 justify-center">
              {TEST_ACCOUNTS.map((account) => (
                <button
                  key={account.username}
                  type="button"
                  className="px-4 py-2 border border-slate-300 rounded-lg text-sm font-medium text-slate-600 bg-transparent hover:border-red-600 hover:text-orange-600 transition-colors disabled:opacity-40 disabled:cursor-not-allowed min-w-[80px]"
                  onClick={() => handleQuickLogin(account)}
                  disabled={loading}
                >
                  {account.label}
                </button>
              ))}
            </div>
          </div>
        )}

        <form onSubmit={handleSubmit}>
          {/* 아이디 */}
          <div className="mb-4">
            <label htmlFor="username" className="block mb-2 text-sm font-medium text-slate-600">
              아이디 <span className="text-red-500">*</span>
            </label>
            <div className="relative">
              <input
                type="text"
                id="username"
                value={username}
                onChange={(e) => setUsername(e.target.value.toLowerCase())}
                placeholder="영문, 숫자, 밑줄 사용 가능"
                required
                minLength={3}
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
              />
              {isSignup && username.length >= 3 && (
                <span className="absolute right-3 top-1/2 -translate-y-1/2 text-sm">
                  {usernameChecking ? (
                    <span className="text-slate-400">확인 중...</span>
                  ) : usernameAvailable === true ? (
                    <span className="text-green-600">✓ 사용 가능</span>
                  ) : usernameAvailable === false ? (
                    <span className="text-red-600">✗ 사용 불가</span>
                  ) : null}
                </span>
              )}
            </div>
          </div>

          {/* 회원가입: 닉네임 */}
          {isSignup && (
            <div className="mb-4">
              <label htmlFor="nickname" className="block mb-2 text-sm font-medium text-slate-600">
                닉네임 <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                id="nickname"
                value={nickname}
                onChange={(e) => setNickname(e.target.value)}
                placeholder="사이트에서 표시될 이름"
                required
                minLength={2}
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
              />
            </div>
          )}

          {/* 비밀번호 */}
          <div className="mb-4">
            <label htmlFor="password" className="block mb-2 text-sm font-medium text-slate-600">
              비밀번호 <span className="text-red-500">*</span>
            </label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="6자 이상"
              required
              minLength={6}
              className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
            />
          </div>

          {/* 회원가입: 비밀번호 확인 */}
          {isSignup && (
            <div className="mb-4">
              <label htmlFor="passwordConfirm" className="block mb-2 text-sm font-medium text-slate-600">
                비밀번호 확인 <span className="text-red-500">*</span>
              </label>
              <input
                type="password"
                id="passwordConfirm"
                value={passwordConfirm}
                onChange={(e) => setPasswordConfirm(e.target.value)}
                placeholder="비밀번호를 다시 입력하세요"
                required
                minLength={6}
                className={`w-full px-4 py-3 bg-slate-100 border rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none transition-colors ${
                  passwordConfirm && password !== passwordConfirm
                    ? 'border-red-500 focus:border-red-500'
                    : 'border-slate-200 focus:border-red-600'
                }`}
              />
              {passwordConfirm && password !== passwordConfirm && (
                <p className="text-red-500 text-xs mt-1">비밀번호가 일치하지 않습니다.</p>
              )}
            </div>
          )}

          {/* 회원가입: 이메일 (선택) */}
          {isSignup && (
            <div className="mb-4">
              <label htmlFor="email" className="block mb-2 text-sm font-medium text-slate-600">
                이메일 <span className="text-slate-400 text-xs">(선택)</span>
              </label>
              <input
                type="email"
                id="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="example@email.com"
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
              />
              <p className="text-xs text-slate-400 mt-1">
                이메일을 입력하시면 비밀번호 찾기 기능을 사용할 수 있습니다.
              </p>
            </div>
          )}

          {/* 회원가입: 연락처 (선택) */}
          {isSignup && (
            <div className="mb-4">
              <label htmlFor="phone" className="block mb-2 text-sm font-medium text-slate-600">
                연락처 <span className="text-slate-400 text-xs">(선택)</span>
              </label>
              <input
                type="tel"
                id="phone"
                value={phone}
                onChange={(e) => setPhone(e.target.value)}
                placeholder="010-0000-0000"
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
              />
            </div>
          )}

          {/* 회원가입: 역할 */}
          {isSignup && (
            <div className="mb-4">
              <label htmlFor="role" className="block mb-2 text-sm font-medium text-slate-600">
                역할 <span className="text-red-500">*</span>
              </label>
              <select
                id="role"
                value={role}
                onChange={(e) => setRole(e.target.value)}
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 cursor-pointer appearance-none focus:outline-none focus:border-red-600 transition-colors bg-[url('data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%20fill%3D%22%2371717a%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cpath%20d%3D%22M8%2011L3%206h10l-5%205z%22%2F%3E%3C%2Fsvg%3E')] bg-no-repeat bg-[right_16px_center]"
              >
                <option value="customer">손님</option>
                <option value="manager">매니저</option>
                <option value="staff">실장</option>
                <option value="owner">사장</option>
                <option value="agency">에이전시</option>
              </select>
            </div>
          )}

          {error && <p className="text-red-600 text-sm mb-4">{error}</p>}
          {message && <p className="text-green-600 text-sm mb-4">{message}</p>}

          <button
            type="submit"
            className="w-full py-4 mt-2 bg-red-600 text-white rounded-lg text-base font-semibold hover:bg-red-700 transition-colors disabled:bg-slate-400 disabled:cursor-not-allowed"
            disabled={loading || (isSignup && usernameChecking)}
          >
            {loading ? '처리 중...' : isSignup ? '회원가입' : '로그인'}
          </button>
        </form>

        <div className="mt-6 text-center space-y-2">
          <button
            type="button"
            className="bg-transparent border-none text-slate-400 cursor-pointer text-sm hover:text-orange-600 transition-colors"
            onClick={() => {
              setIsSignup(!isSignup);
              resetForm();
            }}
          >
            {isSignup ? '이미 계정이 있으신가요? 로그인' : '계정이 없으신가요? 회원가입'}
          </button>
          {!isSignup && (
            <div>
              <button
                type="button"
                className="bg-transparent border-none text-slate-400 cursor-pointer text-sm hover:text-orange-600 transition-colors"
                onClick={() => {
                  setShowResetModal(true);
                  setResetError('');
                  setResetMessage('');
                }}
              >
                비밀번호를 잊으셨나요?
              </button>
            </div>
          )}
        </div>
      </div>

      {/* 비밀번호 찾기 모달 */}
      {showResetModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-sm p-6">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-lg font-semibold text-slate-900">비밀번호 찾기</h2>
              <button
                onClick={() => setShowResetModal(false)}
                className="text-slate-400 hover:text-slate-600 text-2xl"
              >
                ×
              </button>
            </div>

            <p className="text-sm text-slate-600 mb-4">
              아이디를 입력하세요. 이메일이 등록되어 있으면 비밀번호 재설정 링크가 이메일로 전송됩니다.
            </p>

            <div className="space-y-4">
              <div>
                <label className="block mb-2 text-sm font-medium text-slate-600">
                  아이디
                </label>
                <input
                  type="text"
                  value={resetUsername}
                  onChange={(e) => setResetUsername(e.target.value.toLowerCase())}
                  placeholder="가입한 아이디 입력"
                  className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
                />
              </div>

              <div>
                <label className="block mb-2 text-sm font-medium text-slate-600">
                  요청 사유 <span className="text-slate-400 text-xs">(선택)</span>
                </label>
                <textarea
                  value={resetReason}
                  onChange={(e) => setResetReason(e.target.value)}
                  placeholder="추가 정보가 있으면 입력해주세요"
                  rows={2}
                  className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors resize-none"
                />
              </div>

              {resetError && <p className="text-red-600 text-sm">{resetError}</p>}
              {resetMessage && <p className="text-green-600 text-sm">{resetMessage}</p>}

              <div className="flex gap-2">
                <button
                  onClick={() => setShowResetModal(false)}
                  className="flex-1 px-4 py-3 border border-slate-300 rounded-lg text-slate-600 font-medium hover:bg-slate-50 transition-colors"
                >
                  취소
                </button>
                <button
                  onClick={handlePasswordResetRequest}
                  disabled={resetLoading}
                  className="flex-1 px-4 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400"
                >
                  {resetLoading ? '요청 중...' : '요청하기'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
