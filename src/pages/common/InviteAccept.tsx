import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './InviteAccept.css';

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
  owner?: {
    name: string;
  };
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

  useEffect(() => {
    parseInviteCode();
  }, [code]);

  useEffect(() => {
    if (inviteData && isAuthenticated) {
      fetchStoreInfo();
      checkIfAlreadyAdmin();
    }
  }, [inviteData, isAuthenticated, user]);

  // 초대 코드 파싱
  const parseInviteCode = () => {
    if (!code) {
      setError('잘못된 초대 링크입니다.');
      setLoading(false);
      return;
    }

    try {
      const decoded = JSON.parse(atob(code));

      // 유효성 검사
      if (!decoded.storeId || !decoded.ownerId || !decoded.storeName) {
        throw new Error('Invalid invite data');
      }

      // 만료 확인 (7일)
      const sevenDays = 7 * 24 * 60 * 60 * 1000;
      if (Date.now() - decoded.createdAt > sevenDays) {
        setError('만료된 초대 링크입니다. 사장님께 새 링크를 요청하세요.');
        setLoading(false);
        return;
      }

      setInviteData(decoded);
    } catch {
      setError('잘못된 초대 링크입니다.');
      setLoading(false);
    }
  };

  // 가게 정보 조회
  const fetchStoreInfo = async () => {
    if (!inviteData) return;

    const { data, error: fetchError } = await supabase
      .from('stores')
      .select(`
        id,
        name,
        address,
        owner:profiles!stores_owner_id_fkey(name)
      `)
      .eq('id', inviteData.storeId)
      .single();

    if (fetchError || !data) {
      setError('가게 정보를 찾을 수 없습니다.');
    } else {
      // Supabase returns owner as array, extract first item
      const storeData = {
        ...data,
        owner: Array.isArray(data.owner) ? data.owner[0] : data.owner,
      };
      setStore(storeData as Store);
    }
    setLoading(false);
  };

  // 이미 관리자인지 확인
  const checkIfAlreadyAdmin = async () => {
    if (!inviteData || !user) return;

    const { data } = await supabase
      .from('store_admins')
      .select('*')
      .eq('store_id', inviteData.storeId)
      .eq('admin_id', user.id)
      .single();

    if (data) {
      setAlreadyAdmin(true);
    }
  };

  // 초대 수락
  const handleAccept = async () => {
    if (!inviteData || !user) return;

    setAccepting(true);

    // 1. store_admins에 추가
    const { error: insertError } = await supabase
      .from('store_admins')
      .insert({
        store_id: inviteData.storeId,
        admin_id: user.id,
      });

    if (insertError) {
      if (insertError.code === '23505') {
        setAlreadyAdmin(true);
      } else {
        alert('초대 수락 실패: ' + insertError.message);
      }
      setAccepting(false);
      return;
    }

    // 2. customer인 경우에만 역할을 admin으로 변경
    if (user.role === 'customer') {
      const { error: roleError } = await supabase
        .from('profiles')
        .update({ role: 'admin' })
        .eq('id', user.id);

      if (roleError) {
        alert('역할 변경 실패: ' + roleError.message);
        setAccepting(false);
        return;
      }
    }

    alert('초대를 수락했습니다. 이제 이 가게를 관리할 수 있습니다.');
    window.location.href = '/'; // 새로고침하여 반영
    setAccepting(false);
  };

  // 로그인 필요
  if (!isAuthenticated) {
    return (
      <div className="invite-accept">
        <div className="invite-card">
          <h1>관리자 초대</h1>
          <p className="desc">초대를 수락하려면 먼저 로그인해주세요.</p>
          <button className="login-btn" onClick={() => navigate('/login')}>
            로그인하기
          </button>
        </div>
      </div>
    );
  }

  // 로딩 중
  if (loading) {
    return (
      <div className="invite-accept">
        <div className="invite-card">
          <p>로딩 중...</p>
        </div>
      </div>
    );
  }

  // 에러
  if (error) {
    return (
      <div className="invite-accept">
        <div className="invite-card error">
          <h1>초대 링크 오류</h1>
          <p className="error-message">{error}</p>
          <button className="home-btn" onClick={() => navigate('/')}>
            홈으로 돌아가기
          </button>
        </div>
      </div>
    );
  }

  // 이미 관리자인 경우
  if (alreadyAdmin) {
    return (
      <div className="invite-accept">
        <div className="invite-card success">
          <h1>이미 관리자입니다</h1>
          <p className="desc">이미 이 가게의 관리자로 등록되어 있습니다.</p>
          <div className="store-info-box">
            <h3>{store?.name}</h3>
            <p>{store?.address}</p>
          </div>
          <button className="home-btn" onClick={() => navigate('/')}>
            홈으로 돌아가기
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="invite-accept">
      <div className="invite-card">
        <h1>관리자 초대</h1>
        <p className="desc">아래 가게의 관리자로 초대되었습니다.</p>

        <div className="store-info-box">
          <h3>{store?.name}</h3>
          <p className="address">{store?.address}</p>
          {store?.owner && (
            <p className="owner">사장: {store.owner.name}</p>
          )}
        </div>

        <div className="user-info-box">
          <p>수락 계정: <strong>{user?.name}</strong> ({user?.email})</p>
        </div>

        <div className="buttons">
          <button className="decline-btn" onClick={() => navigate('/')}>
            거절
          </button>
          <button
            className="accept-btn"
            onClick={handleAccept}
            disabled={accepting}
          >
            {accepting ? '처리 중...' : '수락하기'}
          </button>
        </div>
      </div>
    </div>
  );
}
