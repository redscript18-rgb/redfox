import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface InviteData {
  id: number;
  agency_id: string;
  invite_code: string;
  expires_at: string | null;
  max_uses: number;
  used_count: number;
}

interface Agency {
  id: string;
  name: string;
  email: string;
}

export default function AgencyInviteAccept() {
  const { code } = useParams<{ code: string }>();
  const { user, isAuthenticated } = useAuth();
  const navigate = useNavigate();

  const [inviteData, setInviteData] = useState<InviteData | null>(null);
  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);
  const [accepting, setAccepting] = useState(false);
  const [error, setError] = useState('');
  const [alreadyMember, setAlreadyMember] = useState(false);

  useEffect(() => {
    if (code) {
      fetchInviteData();
    } else {
      setError('잘못된 초대 링크입니다.');
      setLoading(false);
    }
  }, [code]);

  useEffect(() => {
    if (inviteData && isAuthenticated && user) {
      checkIfAlreadyMember();
    }
  }, [inviteData, isAuthenticated, user]);

  const fetchInviteData = async () => {
    if (!code) return;

    const { data: invite, error: inviteError } = await supabase
      .from('agency_invites')
      .select('*')
      .eq('invite_code', code)
      .single();

    if (inviteError || !invite) {
      setError('잘못된 초대 링크입니다.');
      setLoading(false);
      return;
    }

    // Check expiration
    if (invite.expires_at && new Date(invite.expires_at) < new Date()) {
      setError('만료된 초대 링크입니다. 에이전시에게 새 링크를 요청하세요.');
      setLoading(false);
      return;
    }

    // Check max uses
    if (invite.used_count >= invite.max_uses) {
      setError('사용 횟수가 초과된 초대 링크입니다.');
      setLoading(false);
      return;
    }

    setInviteData(invite);

    // Fetch agency info
    const { data: agencyData, error: agencyError } = await supabase
      .from('profiles')
      .select('id, name, email')
      .eq('id', invite.agency_id)
      .single();

    if (agencyError || !agencyData) {
      setError('에이전시 정보를 찾을 수 없습니다.');
      setLoading(false);
      return;
    }

    setAgency(agencyData);
    setLoading(false);
  };

  const checkIfAlreadyMember = async () => {
    if (!inviteData || !user) return;

    const { data } = await supabase
      .from('agency_managers')
      .select('*')
      .eq('agency_id', inviteData.agency_id)
      .eq('manager_id', user.id)
      .single();

    if (data) {
      setAlreadyMember(true);
    }
  };

  const handleAccept = async () => {
    if (!inviteData || !user) return;

    // Check if user is manager
    if (user.role !== 'manager') {
      alert('매니저만 에이전시에 가입할 수 있습니다.');
      return;
    }

    setAccepting(true);

    // Insert into agency_managers
    const { error: insertError } = await supabase
      .from('agency_managers')
      .insert({
        agency_id: inviteData.agency_id,
        manager_id: user.id,
        status: 'pending'
      });

    if (insertError) {
      if (insertError.code === '23505') {
        setAlreadyMember(true);
      } else {
        alert('초대 수락 실패: ' + insertError.message);
      }
      setAccepting(false);
      return;
    }

    // Update invite used_count
    await supabase
      .from('agency_invites')
      .update({ used_count: inviteData.used_count + 1 })
      .eq('id', inviteData.id);

    alert('에이전시 가입 요청을 보냈습니다. 에이전시의 승인을 기다려주세요.');
    navigate('/');
    setAccepting(false);
  };

  const goToLogin = () => {
    sessionStorage.setItem('redirectAfterLogin', window.location.pathname);
    navigate('/login');
  };

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <h1 className="text-2xl font-bold text-slate-900 mb-2">에이전시 초대</h1>
          <p className="text-slate-500 mb-6">초대를 수락하려면 먼저 로그인해주세요.</p>
          <button
            className="w-full py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors"
            onClick={goToLogin}
          >
            로그인하기
          </button>
        </div>
      </div>
    );
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <p className="text-slate-500">로딩 중...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-3xl text-red-500">!</span>
          </div>
          <h1 className="text-2xl font-bold text-slate-900 mb-2">초대 링크 오류</h1>
          <p className="text-red-500 mb-6">{error}</p>
          <button
            className="w-full py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors"
            onClick={() => navigate('/')}
          >
            홈으로 돌아가기
          </button>
        </div>
      </div>
    );
  }

  if (user?.role !== 'manager') {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <div className="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-3xl text-yellow-600">!</span>
          </div>
          <h1 className="text-2xl font-bold text-slate-900 mb-2">매니저 전용</h1>
          <p className="text-slate-500 mb-6">에이전시 가입은 매니저 역할의 사용자만 가능합니다.</p>
          <p className="text-sm text-slate-400 mb-6">현재 역할: {user?.role}</p>
          <button
            className="w-full py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors"
            onClick={() => navigate('/')}
          >
            홈으로 돌아가기
          </button>
        </div>
      </div>
    );
  }

  if (alreadyMember) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-3xl text-green-600">✓</span>
          </div>
          <h1 className="text-2xl font-bold text-slate-900 mb-2">이미 소속되어 있습니다</h1>
          <p className="text-slate-500 mb-4">이미 이 에이전시에 소속되어 있습니다.</p>
          <div className="p-4 bg-slate-50 rounded-lg mb-6">
            <h3 className="font-semibold text-slate-900">{agency?.name}</h3>
            <p className="text-sm text-slate-500">{agency?.email}</p>
          </div>
          <button
            className="w-full py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors"
            onClick={() => navigate('/')}
          >
            홈으로 돌아가기
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
      <div className="bg-white rounded-2xl p-8 max-w-md w-full shadow-lg">
        <h1 className="text-2xl font-bold text-slate-900 mb-2 text-center">에이전시 초대</h1>
        <p className="text-slate-500 mb-6 text-center">아래 에이전시에서 초대되었습니다.</p>

        <div className="p-4 bg-slate-50 rounded-lg mb-4">
          <h3 className="font-semibold text-slate-900">{agency?.name}</h3>
          <p className="text-sm text-slate-500">{agency?.email}</p>
        </div>

        <div className="p-4 bg-orange-50 rounded-lg mb-6">
          <p className="text-sm text-orange-700">
            수락 계정: <strong>{user?.name}</strong> ({user?.email})
          </p>
        </div>

        <div className="p-4 bg-blue-50 rounded-lg mb-6">
          <p className="text-sm text-blue-700">
            가입 요청 후 에이전시의 승인을 기다려야 합니다.
          </p>
        </div>

        <div className="flex gap-3">
          <button
            className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors"
            onClick={() => navigate('/')}
          >
            거절
          </button>
          <button
            className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400"
            onClick={handleAccept}
            disabled={accepting}
          >
            {accepting ? '처리 중...' : '가입 요청'}
          </button>
        </div>
      </div>
    </div>
  );
}
