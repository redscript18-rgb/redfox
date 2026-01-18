import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

export default function AccountSettings() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  // Profile form
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [profileLoading, setProfileLoading] = useState(false);
  const [profileMessage, setProfileMessage] = useState('');

  // Password form
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [passwordLoading, setPasswordLoading] = useState(false);
  const [passwordMessage, setPasswordMessage] = useState('');
  const [passwordError, setPasswordError] = useState('');

  // Delete account
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false);
  const [deleteConfirmText, setDeleteConfirmText] = useState('');
  const [deleteLoading, setDeleteLoading] = useState(false);

  useEffect(() => {
    if (user) {
      setName(user.name || '');
      setPhone(user.phone || '');
    }
  }, [user]);

  const updateProfile = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!user) return;

    setProfileLoading(true);
    setProfileMessage('');

    const { error } = await supabase
      .from('profiles')
      .update({ name, phone: phone || null })
      .eq('id', user.id);

    if (error) {
      setProfileMessage('프로필 업데이트에 실패했습니다.');
    } else {
      setProfileMessage('프로필이 업데이트되었습니다.');
      // Reload to update user context
      setTimeout(() => window.location.reload(), 1000);
    }

    setProfileLoading(false);
  };

  const changePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    setPasswordLoading(true);
    setPasswordMessage('');
    setPasswordError('');

    if (newPassword !== confirmPassword) {
      setPasswordError('새 비밀번호가 일치하지 않습니다.');
      setPasswordLoading(false);
      return;
    }

    if (newPassword.length < 6) {
      setPasswordError('비밀번호는 6자 이상이어야 합니다.');
      setPasswordLoading(false);
      return;
    }

    const { error } = await supabase.auth.updateUser({
      password: newPassword
    });

    if (error) {
      setPasswordError('비밀번호 변경에 실패했습니다: ' + error.message);
    } else {
      setPasswordMessage('비밀번호가 변경되었습니다.');
      setNewPassword('');
      setConfirmPassword('');
    }

    setPasswordLoading(false);
  };

  const deleteAccount = async () => {
    if (deleteConfirmText !== '계정삭제') return;
    if (!user) return;

    setDeleteLoading(true);

    // Delete profile (this will cascade to related data due to ON DELETE CASCADE)
    const { error } = await supabase
      .from('profiles')
      .delete()
      .eq('id', user.id);

    if (error) {
      alert('계정 삭제에 실패했습니다: ' + error.message);
      setDeleteLoading(false);
      return;
    }

    // Sign out
    await logout();
    navigate('/login');
  };

  const getRoleName = (role: string) => {
    switch (role) {
      case 'superadmin': return '서비스관리자';
      case 'owner': return '사장';
      case 'admin': return '관리자';
      case 'staff': return '매니저';
      case 'customer': return '손님';
      default: return role;
    }
  };

  return (
    <div className="max-w-2xl mx-auto">
      <h1 className="text-2xl font-bold text-slate-900 mb-6">계정 설정</h1>

      {/* Account Info */}
      <section className="p-6 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">계정 정보</h2>
        <div className="space-y-3">
          <div className="flex justify-between py-2 border-b border-slate-100">
            <span className="text-slate-500">이메일</span>
            <span className="text-slate-900">{user?.email}</span>
          </div>
          <div className="flex justify-between py-2 border-b border-slate-100">
            <span className="text-slate-500">역할</span>
            <span className="px-2 py-1 bg-orange-50 text-orange-600 text-sm rounded">
              {getRoleName(user?.role || '')}
            </span>
          </div>
        </div>
      </section>

      {/* Profile Edit */}
      <section className="p-6 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">프로필 수정</h2>
        <form onSubmit={updateProfile} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-600 mb-1">이름</label>
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-600 mb-1">전화번호</label>
            <input
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="010-0000-0000"
              className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
            />
          </div>
          {profileMessage && (
            <p className={`text-sm ${profileMessage.includes('실패') ? 'text-red-600' : 'text-green-600'}`}>
              {profileMessage}
            </p>
          )}
          <button
            type="submit"
            disabled={profileLoading}
            className="px-6 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:opacity-50"
          >
            {profileLoading ? '저장 중...' : '저장'}
          </button>
        </form>
      </section>

      {/* Password Change */}
      <section className="p-6 bg-white border border-slate-200 rounded-xl mb-6">
        <h2 className="text-lg font-semibold text-slate-900 mb-4">비밀번호 변경</h2>
        <form onSubmit={changePassword} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-600 mb-1">새 비밀번호</label>
            <input
              type="password"
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
              required
              minLength={6}
              className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-600 mb-1">새 비밀번호 확인</label>
            <input
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
              minLength={6}
              className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600"
            />
          </div>
          {passwordError && <p className="text-sm text-red-600">{passwordError}</p>}
          {passwordMessage && <p className="text-sm text-green-600">{passwordMessage}</p>}
          <button
            type="submit"
            disabled={passwordLoading}
            className="px-6 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:opacity-50"
          >
            {passwordLoading ? '변경 중...' : '비밀번호 변경'}
          </button>
        </form>
      </section>

      {/* Delete Account */}
      <section className="p-6 bg-white border border-red-200 rounded-xl">
        <h2 className="text-lg font-semibold text-red-600 mb-2">계정 삭제</h2>
        <p className="text-sm text-slate-500 mb-4">
          계정을 삭제하면 모든 데이터가 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.
        </p>

        {!showDeleteConfirm ? (
          <button
            onClick={() => setShowDeleteConfirm(true)}
            className="px-6 py-2 border border-red-300 text-red-600 font-medium rounded-lg hover:bg-red-50 transition-colors"
          >
            계정 삭제
          </button>
        ) : (
          <div className="p-4 bg-red-50 rounded-lg">
            <p className="text-sm text-red-600 mb-3">
              계정을 삭제하려면 아래에 <strong>계정삭제</strong>를 입력하세요.
            </p>
            <input
              type="text"
              value={deleteConfirmText}
              onChange={(e) => setDeleteConfirmText(e.target.value)}
              placeholder="계정삭제"
              className="w-full px-4 py-2 bg-white border border-red-200 rounded-lg mb-3 focus:outline-none focus:ring-2 focus:ring-red-600"
            />
            <div className="flex gap-2">
              <button
                onClick={() => { setShowDeleteConfirm(false); setDeleteConfirmText(''); }}
                className="px-4 py-2 border border-slate-300 text-slate-600 rounded-lg hover:bg-slate-50 transition-colors"
              >
                취소
              </button>
              <button
                onClick={deleteAccount}
                disabled={deleteConfirmText !== '계정삭제' || deleteLoading}
                className="px-4 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {deleteLoading ? '삭제 중...' : '영구 삭제'}
              </button>
            </div>
          </div>
        )}
      </section>
    </div>
  );
}
