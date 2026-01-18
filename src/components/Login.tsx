import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

const TEST_ACCOUNTS = [
  { email: 'owner@test.com', password: 'test123456', name: '김사장', role: 'owner', label: '사장' },
  { email: 'admin@test.com', password: 'test123456', name: '이관리', role: 'admin', label: '관리자' },
  { email: 'staff@test.com', password: 'test123456', name: '박매니저', role: 'staff', label: '매니저' },
  { email: 'customer@test.com', password: 'test123456', name: '최손님', role: 'customer', label: '손님' },
];

export default function Login() {
  const [isSignup, setIsSignup] = useState(false);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [name, setName] = useState('');
  const [role, setRole] = useState('customer');
  const [error, setError] = useState('');
  const [message, setMessage] = useState('');
  const [loading, setLoading] = useState(false);
  const { login, signup } = useAuth();
  const navigate = useNavigate();

  const handleLoginSuccess = () => {
    const redirectUrl = sessionStorage.getItem('redirectAfterLogin');
    sessionStorage.removeItem('redirectAfterLogin');
    navigate(redirectUrl || '/');
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setMessage('');
    setLoading(true);

    try {
      if (isSignup) {
        const { error } = await signup(email, password, name, role);
        if (error) {
          setError(error);
        } else {
          setMessage('회원가입 완료! 이메일 확인 후 로그인하세요.');
          setIsSignup(false);
        }
      } else {
        const { error } = await login(email, password);
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
      const { error: loginError } = await login(account.email, account.password);

      if (loginError) {
        setMessage('계정 생성 중...');
        const { error: signupError } = await signup(
          account.email,
          account.password,
          account.name,
          account.role
        );

        if (signupError) {
          if (signupError.includes('already')) {
            setError('이메일 확인이 필요합니다. Supabase에서 이메일 확인을 비활성화하세요.');
          } else {
            setError(signupError);
          }
        } else {
          const { error: retryError } = await login(account.email, account.password);
          if (retryError) {
            setMessage('회원가입 완료! 이메일 확인 후 다시 클릭하세요.');
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

  return (
    <div className="min-h-screen flex items-center justify-center p-6 bg-white">
      <div className="w-full max-w-[400px] p-8 bg-white border border-slate-200 rounded-2xl shadow-lg">
        <h1 className="mb-8 text-center text-3xl font-bold text-red-600 tracking-tight">
          Red Fox
        </h1>

        {/* 빠른 로그인 버튼 */}
        {!isSignup && (
          <div className="mb-6 pb-6 border-b border-slate-200">
            <div className="grid grid-cols-2 gap-2">
              {TEST_ACCOUNTS.map((account) => (
                <button
                  key={account.email}
                  type="button"
                  className="px-4 py-2 border border-slate-300 rounded-lg text-sm font-medium text-slate-600 bg-transparent hover:border-red-600 hover:text-orange-600 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
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
          {isSignup && (
            <div className="mb-4">
              <label htmlFor="name" className="block mb-2 text-sm font-medium text-slate-600">
                이름
              </label>
              <input
                type="text"
                id="name"
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="이름을 입력하세요"
                required={isSignup}
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
              />
            </div>
          )}

          <div className="mb-4">
            <label htmlFor="email" className="block mb-2 text-sm font-medium text-slate-600">
              이메일
            </label>
            <input
              type="email"
              id="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="이메일을 입력하세요"
              required
              className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
            />
          </div>

          <div className="mb-4">
            <label htmlFor="password" className="block mb-2 text-sm font-medium text-slate-600">
              비밀번호
            </label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="비밀번호를 입력하세요"
              required
              minLength={6}
              className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-red-600 transition-colors"
            />
          </div>

          {isSignup && (
            <div className="mb-4">
              <label htmlFor="role" className="block mb-2 text-sm font-medium text-slate-600">
                역할
              </label>
              <select
                id="role"
                value={role}
                onChange={(e) => setRole(e.target.value)}
                className="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-lg text-slate-900 cursor-pointer appearance-none focus:outline-none focus:border-red-600 transition-colors bg-[url('data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%20fill%3D%22%2371717a%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cpath%20d%3D%22M8%2011L3%206h10l-5%205z%22%2F%3E%3C%2Fsvg%3E')] bg-no-repeat bg-[right_16px_center]"
              >
                <option value="customer">손님</option>
                <option value="staff">매니저</option>
                <option value="admin">관리자</option>
                <option value="owner">사장</option>
              </select>
            </div>
          )}

          {error && <p className="text-red-600 text-sm mb-4">{error}</p>}
          {message && <p className="text-green-600 text-sm mb-4">{message}</p>}

          <button
            type="submit"
            className="w-full py-4 mt-2 bg-red-600 text-white rounded-lg text-base font-semibold hover:bg-red-700 transition-colors disabled:bg-slate-400 disabled:cursor-not-allowed"
            disabled={loading}
          >
            {loading ? '처리 중...' : isSignup ? '회원가입' : '로그인'}
          </button>
        </form>

        <div className="mt-6 text-center">
          <button
            type="button"
            className="bg-transparent border-none text-slate-400 cursor-pointer text-sm hover:text-orange-600 transition-colors"
            onClick={() => {
              setIsSignup(!isSignup);
              setError('');
              setMessage('');
            }}
          >
            {isSignup ? '이미 계정이 있으신가요? 로그인' : '계정이 없으신가요? 회원가입'}
          </button>
        </div>
      </div>
    </div>
  );
}
