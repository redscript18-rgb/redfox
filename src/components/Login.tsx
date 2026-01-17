import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './Login.css';

const TEST_ACCOUNTS = [
  { email: 'owner@test.com', password: 'test123456', name: '김사장', role: 'owner', label: '사장' },
  { email: 'admin@test.com', password: 'test123456', name: '이관리', role: 'admin', label: '관리자' },
  { email: 'staff@test.com', password: 'test123456', name: '박직원', role: 'staff', label: '직원' },
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

  // 로그인 후 리다이렉트 처리
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

  // 테스트 계정 빠른 로그인
  const handleQuickLogin = async (account: typeof TEST_ACCOUNTS[0]) => {
    setError('');
    setMessage('');
    setLoading(true);

    try {
      // 먼저 로그인 시도
      const { error: loginError } = await login(account.email, account.password);

      if (loginError) {
        // 로그인 실패시 회원가입 후 로그인
        setMessage('계정 생성 중...');
        const { error: signupError } = await signup(
          account.email,
          account.password,
          account.name,
          account.role
        );

        if (signupError) {
          // 이미 가입됐지만 이메일 확인 안됨
          if (signupError.includes('already')) {
            setError('이메일 확인이 필요합니다. Supabase에서 이메일 확인을 비활성화하세요.');
          } else {
            setError(signupError);
          }
        } else {
          // 회원가입 성공 후 로그인 재시도
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
    <div className="login-container">
      <div className="login-box">
        <h1>{isSignup ? '회원가입' : '로그인'}</h1>

        {/* 빠른 로그인 버튼 */}
        {!isSignup && (
          <div className="quick-login">
            <p className="quick-login-label">테스트 계정으로 빠른 로그인</p>
            <div className="quick-login-buttons">
              {TEST_ACCOUNTS.map((account) => (
                <button
                  key={account.email}
                  type="button"
                  className={`quick-btn quick-btn-${account.role}`}
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
            <div className="form-group">
              <label htmlFor="name">이름</label>
              <input
                type="text"
                id="name"
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="이름을 입력하세요"
                required={isSignup}
              />
            </div>
          )}
          <div className="form-group">
            <label htmlFor="email">이메일</label>
            <input
              type="email"
              id="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="이메일을 입력하세요"
              required
            />
          </div>
          <div className="form-group">
            <label htmlFor="password">비밀번호</label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="비밀번호를 입력하세요"
              required
              minLength={6}
            />
          </div>
          {isSignup && (
            <div className="form-group">
              <label htmlFor="role">역할</label>
              <select
                id="role"
                value={role}
                onChange={(e) => setRole(e.target.value)}
              >
                <option value="customer">손님</option>
                <option value="staff">직원</option>
                <option value="admin">관리자</option>
                <option value="owner">사장</option>
              </select>
            </div>
          )}
          {error && <p className="error">{error}</p>}
          {message && <p className="success">{message}</p>}
          <button type="submit" className="login-btn" disabled={loading}>
            {loading ? '처리 중...' : isSignup ? '회원가입' : '로그인'}
          </button>
        </form>

        <div className="toggle-mode">
          <button
            type="button"
            className="toggle-btn"
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
