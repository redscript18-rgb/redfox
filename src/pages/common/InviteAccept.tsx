import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface InviteData {
  storeId: number;
  ownerId: string;
  storeName: string;
  createdAt: number;
}

interface Store {
  id: number;
  name: string;
  address: string;
  owner?: { name: string };
}

export default function InviteAccept() {
  const { code } = useParams<{ code: string }>();
  const { user, isAuthenticated } = useAuth();
  const navigate = useNavigate();

  const [inviteData, setInviteData] = useState<InviteData | null>(null);
  const [store, setStore] = useState<Store | null>(null);
  const [loading, setLoading] = useState(true);
  const [accepting, setAccepting] = useState(false);
  const [error, setError] = useState('');
  const [alreadyAdmin, setAlreadyAdmin] = useState(false);

  useEffect(() => { parseInviteCode(); }, [code]);
  useEffect(() => { if (inviteData && isAuthenticated) { fetchStoreInfo(); checkIfAlreadyAdmin(); } }, [inviteData, isAuthenticated, user]);

  const parseInviteCode = () => {
    if (!code) { setError('잘못된 초대 링크입니다.'); setLoading(false); return; }
    try {
      const decoded = JSON.parse(decodeURIComponent(atob(code)));
      if (!decoded.storeId || !decoded.ownerId || !decoded.storeName) throw new Error('Invalid invite data');
      const sevenDays = 7 * 24 * 60 * 60 * 1000;
      if (Date.now() - decoded.createdAt > sevenDays) { setError('만료된 초대 링크입니다. 사장님께 새 링크를 요청하세요.'); setLoading(false); return; }
      setInviteData(decoded);
    } catch { setError('잘못된 초대 링크입니다.'); setLoading(false); }
  };

  const fetchStoreInfo = async () => {
    if (!inviteData) return;
    const { data, error: fetchError } = await supabase.from('stores').select(`id, name, address, owner:profiles!stores_owner_id_fkey(name)`).eq('id', inviteData.storeId).single();
    if (fetchError || !data) setError('가게 정보를 찾을 수 없습니다.');
    else {
      const storeData = { ...data, owner: Array.isArray(data.owner) ? data.owner[0] : data.owner };
      setStore(storeData as Store);
    }
    setLoading(false);
  };

  const checkIfAlreadyAdmin = async () => {
    if (!inviteData || !user) return;
    const { data } = await supabase.from('store_admins').select('*').eq('store_id', inviteData.storeId).eq('admin_id', user.id).single();
    if (data) setAlreadyAdmin(true);
  };

  const handleAccept = async () => {
    if (!inviteData || !user) return;
    setAccepting(true);

    const { error: insertError } = await supabase.rpc('accept_admin_invite', { p_store_id: inviteData.storeId });
    if (insertError) {
      if (insertError.code === '23505') setAlreadyAdmin(true);
      else alert('초대 수락 실패: ' + insertError.message);
      setAccepting(false);
      return;
    }

    if (user.role === 'customer') {
      const { error: roleError } = await supabase.from('profiles').update({ role: 'staff' }).eq('id', user.id);
      if (roleError) { alert('역할 변경 실패: ' + roleError.message); setAccepting(false); return; }
    }

    alert('초대를 수락했습니다. 이제 이 가게를 관리할 수 있습니다.');
    window.location.href = '/';
    setAccepting(false);
  };

  const goToLogin = () => { sessionStorage.setItem('redirectAfterLogin', window.location.pathname); navigate('/login'); };

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <h1 className="text-2xl font-bold text-slate-900 mb-2">실장 초대</h1>
          <p className="text-slate-500 mb-6">초대를 수락하려면 먼저 로그인해주세요.</p>
          <button className="w-full py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors" onClick={goToLogin}>로그인하기</button>
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
          <button className="w-full py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors" onClick={() => navigate('/')}>홈으로 돌아가기</button>
        </div>
      </div>
    );
  }

  if (alreadyAdmin) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
        <div className="bg-white rounded-2xl p-8 max-w-md w-full text-center shadow-lg">
          <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-3xl text-green-600">✓</span>
          </div>
          <h1 className="text-2xl font-bold text-slate-900 mb-2">이미 실장입니다</h1>
          <p className="text-slate-500 mb-4">이미 이 가게의 실장으로 등록되어 있습니다.</p>
          <div className="p-4 bg-slate-50 rounded-lg mb-6">
            <h3 className="font-semibold text-slate-900">{store?.name}</h3>
            <p className="text-sm text-slate-500">{store?.address}</p>
          </div>
          <button className="w-full py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors" onClick={() => navigate('/')}>홈으로 돌아가기</button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-50 p-4">
      <div className="bg-white rounded-2xl p-8 max-w-md w-full shadow-lg">
        <h1 className="text-2xl font-bold text-slate-900 mb-2 text-center">실장 초대</h1>
        <p className="text-slate-500 mb-6 text-center">아래 가게의 실장으로 초대되었습니다.</p>

        <div className="p-4 bg-slate-50 rounded-lg mb-4">
          <h3 className="font-semibold text-slate-900">{store?.name}</h3>
          <p className="text-sm text-slate-500">{store?.address}</p>
          {store?.owner && <p className="text-sm text-slate-400 mt-1">사장: {store.owner.name}</p>}
        </div>

        <div className="p-4 bg-orange-50 rounded-lg mb-6">
          <p className="text-sm text-orange-700">수락 계정: <strong>{user?.name}</strong> ({user?.email})</p>
        </div>

        <div className="flex gap-3">
          <button className="flex-1 py-3 bg-slate-100 text-slate-600 rounded-lg font-medium hover:bg-slate-200 transition-colors" onClick={() => navigate('/')}>거절</button>
          <button className="flex-1 py-3 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700 transition-colors disabled:bg-slate-400" onClick={handleAccept} disabled={accepting}>
            {accepting ? '처리 중...' : '수락하기'}
          </button>
        </div>
      </div>
    </div>
  );
}
