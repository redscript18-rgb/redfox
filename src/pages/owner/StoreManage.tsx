import { useState, useEffect } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './StoreManage.css';

interface Store {
  id: number;
  name: string;
  address: string;
}

interface Admin {
  id: string;
  name: string;
  email: string;
}

export default function StoreManage() {
  const { user } = useAuth();
  const [stores, setStores] = useState<Store[]>([]);
  const [storeAdmins, setStoreAdmins] = useState<Record<number, Admin[]>>({});
  const [loading, setLoading] = useState(true);

  // 가게 추가/수정 폼
  const [showStoreForm, setShowStoreForm] = useState(false);
  const [editingStore, setEditingStore] = useState<Store | null>(null);
  const [storeName, setStoreName] = useState('');
  const [storeAddress, setStoreAddress] = useState('');
  const [savingStore, setSavingStore] = useState(false);

  // 관리자 추가 (ID/이메일 검색)
  const [addAdminStoreId, setAddAdminStoreId] = useState<number | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState<Admin[]>([]);
  const [searching, setSearching] = useState(false);
  const [addingAdmin, setAddingAdmin] = useState(false);

  // 초대 링크
  const [inviteLinkStoreId, setInviteLinkStoreId] = useState<number | null>(null);
  const [inviteLink, setInviteLink] = useState('');

  useEffect(() => {
    if (user) {
      fetchData();
    }
  }, [user]);

  const fetchData = async () => {
    if (!user) return;

    const { data: storesData } = await supabase
      .from('stores')
      .select('*')
      .eq('owner_id', user.id);

    const myStores = storesData || [];
    setStores(myStores);

    const adminMap: Record<number, Admin[]> = {};
    for (const store of myStores) {
      const { data: storeAdminsData } = await supabase
        .from('store_admins')
        .select(`
          store_id,
          admin_id,
          admin:profiles!store_admins_admin_id_fkey(id, name, email)
        `)
        .eq('store_id', store.id);

      adminMap[store.id] = (storeAdminsData || [])
        .map((sa: any) => sa.admin)
        .filter(Boolean);
    }
    setStoreAdmins(adminMap);
    setLoading(false);
  };

  // 가게 추가/수정 폼 열기
  const openStoreForm = (store?: Store) => {
    if (store) {
      setEditingStore(store);
      setStoreName(store.name);
      setStoreAddress(store.address);
    } else {
      setEditingStore(null);
      setStoreName('');
      setStoreAddress('');
    }
    setShowStoreForm(true);
  };

  // 가게 추가/수정 폼 닫기
  const closeStoreForm = () => {
    setShowStoreForm(false);
    setEditingStore(null);
    setStoreName('');
    setStoreAddress('');
  };

  // 가게 저장 (추가 또는 수정)
  const handleSaveStore = async () => {
    if (!user || !storeName.trim() || !storeAddress.trim()) return;

    setSavingStore(true);

    if (editingStore) {
      // 수정
      const { error } = await supabase
        .from('stores')
        .update({
          name: storeName.trim(),
          address: storeAddress.trim(),
        })
        .eq('id', editingStore.id);

      if (error) {
        alert('가게 수정 실패: ' + error.message);
      } else {
        closeStoreForm();
        fetchData();
      }
    } else {
      // 추가
      const { error } = await supabase
        .from('stores')
        .insert({
          name: storeName.trim(),
          address: storeAddress.trim(),
          owner_id: user.id,
        });

      if (error) {
        alert('가게 추가 실패: ' + error.message);
      } else {
        closeStoreForm();
        fetchData();
      }
    }
    setSavingStore(false);
  };

  // 가게 삭제
  const handleDeleteStore = async (storeId: number) => {
    if (!confirm('이 가게를 삭제하시겠습니까? 관련된 모든 데이터가 삭제됩니다.')) return;

    const { error } = await supabase
      .from('stores')
      .delete()
      .eq('id', storeId);

    if (error) {
      alert('가게 삭제 실패: ' + error.message);
    } else {
      fetchData();
    }
  };

  // 사용자 검색 (이메일 또는 ID로)
  const handleSearchUser = async () => {
    if (!searchQuery.trim()) return;

    setSearching(true);
    const { data } = await supabase
      .from('profiles')
      .select('id, name, email')
      .or(`email.ilike.%${searchQuery}%,name.ilike.%${searchQuery}%`)
      .limit(10);

    setSearchResults(data || []);
    setSearching(false);
  };

  // 관리자 추가
  const handleAddAdmin = async (adminId: string) => {
    if (!addAdminStoreId) return;

    // 이미 연결되어 있는지 확인
    const existingAdmins = storeAdmins[addAdminStoreId] || [];
    if (existingAdmins.some((a) => a.id === adminId)) {
      alert('이미 연결된 관리자입니다.');
      return;
    }

    setAddingAdmin(true);
    const { error } = await supabase
      .from('store_admins')
      .insert({
        store_id: addAdminStoreId,
        admin_id: adminId,
      });

    if (error) {
      alert('관리자 추가 실패: ' + error.message);
    } else {
      setSearchQuery('');
      setSearchResults([]);
      setAddAdminStoreId(null);
      fetchData();
    }
    setAddingAdmin(false);
  };

  // 관리자 해제
  const handleRemoveAdmin = async (storeId: number, adminId: string) => {
    if (!confirm('이 관리자를 해제하시겠습니까?')) return;

    const { error } = await supabase
      .from('store_admins')
      .delete()
      .eq('store_id', storeId)
      .eq('admin_id', adminId);

    if (error) {
      alert('관리자 해제 실패: ' + error.message);
    } else {
      fetchData();
    }
  };

  // 초대 링크 생성
  const generateInviteLink = (storeId: number) => {
    const store = stores.find((s) => s.id === storeId);
    if (!store) return;

    // 초대 코드 생성 (Unicode 지원 base64 인코딩)
    const inviteData = {
      storeId: storeId,
      ownerId: user?.id,
      storeName: store.name,
      createdAt: Date.now(),
    };
    // Unicode를 지원하기 위해 encodeURIComponent 사용
    const inviteCode = btoa(encodeURIComponent(JSON.stringify(inviteData)));
    const link = `${window.location.origin}/invite/${inviteCode}`;

    setInviteLinkStoreId(storeId);
    setInviteLink(link);
  };

  // 링크 복사
  const copyInviteLink = async () => {
    try {
      await navigator.clipboard.writeText(inviteLink);
      alert('초대 링크가 복사되었습니다.');
    } catch {
      alert('복사에 실패했습니다. 링크를 직접 복사해주세요.');
    }
  };

  if (loading) {
    return <div className="store-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="store-manage">
      <div className="page-header">
        <h1>가게 관리</h1>
        <button className="add-store-btn" onClick={() => openStoreForm()}>
          + 가게 추가
        </button>
      </div>

      {/* 가게 추가/수정 모달 */}
      {showStoreForm && (
        <div className="modal-overlay" onClick={closeStoreForm}>
          <div className="modal" onClick={(e) => e.stopPropagation()}>
            <h3>{editingStore ? '가게 수정' : '새 가게 추가'}</h3>
            <div className="form-group">
              <label>가게명</label>
              <input
                type="text"
                value={storeName}
                onChange={(e) => setStoreName(e.target.value)}
                placeholder="가게 이름을 입력하세요"
              />
            </div>
            <div className="form-group">
              <label>주소</label>
              <input
                type="text"
                value={storeAddress}
                onChange={(e) => setStoreAddress(e.target.value)}
                placeholder="가게 주소를 입력하세요"
              />
            </div>
            <div className="modal-buttons">
              <button className="cancel-btn" onClick={closeStoreForm}>
                취소
              </button>
              <button
                className="submit-btn"
                onClick={handleSaveStore}
                disabled={savingStore || !storeName.trim() || !storeAddress.trim()}
              >
                {savingStore ? '저장 중...' : '저장'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* 관리자 추가 모달 */}
      {addAdminStoreId && (
        <div className="modal-overlay" onClick={() => setAddAdminStoreId(null)}>
          <div className="modal" onClick={(e) => e.stopPropagation()}>
            <h3>관리자 추가</h3>
            <p className="modal-desc">이메일 또는 이름으로 검색하세요</p>
            <div className="search-form">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="이메일 또는 이름 검색"
                onKeyDown={(e) => e.key === 'Enter' && handleSearchUser()}
              />
              <button onClick={handleSearchUser} disabled={searching}>
                {searching ? '검색 중...' : '검색'}
              </button>
            </div>

            {searchResults.length > 0 && (
              <div className="search-results">
                {searchResults.map((result) => (
                  <div key={result.id} className="search-result-item">
                    <div className="user-info">
                      <span className="user-name">{result.name}</span>
                      <span className="user-email">{result.email}</span>
                    </div>
                    <button
                      className="add-btn"
                      onClick={() => handleAddAdmin(result.id)}
                      disabled={addingAdmin}
                    >
                      추가
                    </button>
                  </div>
                ))}
              </div>
            )}

            {searchQuery && searchResults.length === 0 && !searching && (
              <p className="no-results">검색 결과가 없습니다.</p>
            )}

            <div className="modal-buttons">
              <button className="cancel-btn" onClick={() => setAddAdminStoreId(null)}>
                닫기
              </button>
            </div>
          </div>
        </div>
      )}

      {/* 초대 링크 모달 */}
      {inviteLinkStoreId && (
        <div className="modal-overlay" onClick={() => setInviteLinkStoreId(null)}>
          <div className="modal" onClick={(e) => e.stopPropagation()}>
            <h3>초대 링크</h3>
            <p className="modal-desc">이 링크를 관리자에게 공유하세요</p>
            <div className="invite-link-box">
              <input type="text" value={inviteLink} readOnly />
              <button onClick={copyInviteLink}>복사</button>
            </div>
            <div className="modal-buttons">
              <button className="cancel-btn" onClick={() => setInviteLinkStoreId(null)}>
                닫기
              </button>
            </div>
          </div>
        </div>
      )}

      {/* 가게 목록 */}
      <section className="section">
        <h2>내 가게 목록</h2>
        {stores.length === 0 ? (
          <p className="empty">소유한 가게가 없습니다.</p>
        ) : (
          <div className="stores-list">
            {stores.map((store) => (
              <div key={store.id} className="store-item">
                <div className="store-header">
                  <div className="store-info">
                    <h3>{store.name}</h3>
                    <p className="address">{store.address}</p>
                  </div>
                  <div className="store-actions">
                    <button className="edit-btn" onClick={() => openStoreForm(store)}>
                      수정
                    </button>
                    <button className="delete-btn" onClick={() => handleDeleteStore(store.id)}>
                      삭제
                    </button>
                  </div>
                </div>

                {/* 관리자 섹션 */}
                <div className="admins-section">
                  <div className="admins-header">
                    <h4>관리자</h4>
                    <div className="admin-actions">
                      <button
                        className="add-admin-btn"
                        onClick={() => {
                          setAddAdminStoreId(store.id);
                          setSearchQuery('');
                          setSearchResults([]);
                        }}
                      >
                        + 검색으로 추가
                      </button>
                      <button
                        className="invite-btn"
                        onClick={() => generateInviteLink(store.id)}
                      >
                        초대 링크
                      </button>
                    </div>
                  </div>

                  <div className="admins-list">
                    {(storeAdmins[store.id] || []).length === 0 ? (
                      <p className="no-admins">연결된 관리자가 없습니다.</p>
                    ) : (
                      (storeAdmins[store.id] || []).map((admin) => (
                        <div key={admin.id} className="admin-item">
                          <div className="admin-info">
                            <span className="admin-name">{admin.name}</span>
                            <span className="admin-email">{admin.email}</span>
                          </div>
                          <button
                            className="disconnect-btn"
                            onClick={() => handleRemoveAdmin(store.id, admin.id)}
                          >
                            해제
                          </button>
                        </div>
                      ))
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </section>
    </div>
  );
}
