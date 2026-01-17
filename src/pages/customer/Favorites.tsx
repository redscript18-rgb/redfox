import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './Favorites.css';

interface FavoriteStore {
  id: number;
  store: {
    id: number;
    name: string;
    address: string;
    store_type: string | null;
  };
}

interface FavoriteStaff {
  id: number;
  staff: {
    id: string;
    name: string;
    bio: string | null;
    specialties: string[] | null;
    profile_image_url: string | null;
  };
}

type TabType = 'stores' | 'staff';

export default function Favorites() {
  const { user } = useAuth();
  // 역할에 따라 기본 탭 설정: 관리자는 직원탭, 나머지는 가게탭
  const defaultTab: TabType = user?.role === 'admin' ? 'staff' : 'stores';
  const [activeTab, setActiveTab] = useState<TabType>(defaultTab);
  const [favoriteStores, setFavoriteStores] = useState<FavoriteStore[]>([]);
  const [favoriteStaff, setFavoriteStaff] = useState<FavoriteStaff[]>([]);
  const [loading, setLoading] = useState(true);

  // 역할별 표시 가능한 탭
  const canShowStores = user?.role === 'customer' || user?.role === 'staff';
  const canShowStaff = user?.role === 'customer' || user?.role === 'admin';

  useEffect(() => {
    if (user) {
      fetchFavorites();
    }
  }, [user]);

  const fetchFavorites = async () => {
    if (!user) return;

    // 즐겨찾기한 가게 조회
    const { data: storeFavs } = await supabase
      .from('favorites')
      .select('id, target_store_id')
      .eq('user_id', user.id)
      .eq('target_type', 'store')
      .not('target_store_id', 'is', null);

    if (storeFavs && storeFavs.length > 0) {
      const storeIds = storeFavs.map(f => f.target_store_id).filter(Boolean);
      const { data: storesData } = await supabase
        .from('stores')
        .select('id, name, address, store_type')
        .in('id', storeIds);

      if (storesData) {
        const mapped = storeFavs.map(fav => {
          const store = storesData.find(s => s.id === fav.target_store_id);
          return store ? { id: fav.id, store } : null;
        }).filter((item): item is FavoriteStore => item !== null);
        setFavoriteStores(mapped);
      }
    }

    // 즐겨찾기한 직원 조회
    const { data: staffFavs } = await supabase
      .from('favorites')
      .select('id, target_staff_id')
      .eq('user_id', user.id)
      .eq('target_type', 'staff')
      .not('target_staff_id', 'is', null);

    if (staffFavs && staffFavs.length > 0) {
      const staffIds = staffFavs.map(f => f.target_staff_id).filter(Boolean);
      const { data: staffData } = await supabase
        .from('profiles')
        .select('id, name, bio, specialties, profile_image_url')
        .in('id', staffIds);

      if (staffData) {
        const mapped = staffFavs.map(fav => {
          const staff = staffData.find(s => s.id === fav.target_staff_id);
          return staff ? { id: fav.id, staff } : null;
        }).filter((item): item is FavoriteStaff => item !== null);
        setFavoriteStaff(mapped);
      }
    }

    setLoading(false);
  };

  const removeFavoriteStore = async (favoriteId: number) => {
    await supabase.from('favorites').delete().eq('id', favoriteId);
    setFavoriteStores(prev => prev.filter(f => f.id !== favoriteId));
  };

  const removeFavoriteStaff = async (favoriteId: number) => {
    await supabase.from('favorites').delete().eq('id', favoriteId);
    setFavoriteStaff(prev => prev.filter(f => f.id !== favoriteId));
  };

  if (loading) {
    return <div className="favorites-page"><p>로딩 중...</p></div>;
  }

  return (
    <div className="favorites-page">
      <h1>즐겨찾기</h1>

      <div className="tabs">
        {canShowStores && (
          <button
            className={`tab ${activeTab === 'stores' ? 'active' : ''}`}
            onClick={() => setActiveTab('stores')}
          >
            가게 ({favoriteStores.length})
          </button>
        )}
        {canShowStaff && (
          <button
            className={`tab ${activeTab === 'staff' ? 'active' : ''}`}
            onClick={() => setActiveTab('staff')}
          >
            직원 ({favoriteStaff.length})
          </button>
        )}
      </div>

      {canShowStores && activeTab === 'stores' && (
        <div className="favorites-list">
          {favoriteStores.length > 0 ? (
            favoriteStores.map((fav) => (
              <div key={fav.id} className="favorite-card">
                <Link to={`/store/${fav.store.id}`} className="favorite-info">
                  <h3>{fav.store.name}</h3>
                  {fav.store.store_type && (
                    <span className="store-type-badge">{fav.store.store_type}</span>
                  )}
                  <p className="address">{fav.store.address}</p>
                </Link>
                <button
                  className="remove-btn"
                  onClick={() => removeFavoriteStore(fav.id)}
                  title="즐겨찾기 해제"
                >
                  ♥
                </button>
              </div>
            ))
          ) : (
            <p className="empty">즐겨찾기한 가게가 없습니다.</p>
          )}
        </div>
      )}

      {canShowStaff && activeTab === 'staff' && (
        <div className="favorites-list">
          {favoriteStaff.length > 0 ? (
            favoriteStaff.map((fav) => (
              <div key={fav.id} className="favorite-card staff-card">
                <Link to={`/staff/${fav.staff.id}`} className="favorite-info">
                  <div className="staff-avatar">
                    {fav.staff.profile_image_url ? (
                      <img src={fav.staff.profile_image_url} alt={fav.staff.name} />
                    ) : (
                      fav.staff.name.charAt(0)
                    )}
                  </div>
                  <div className="staff-details">
                    <h3>{fav.staff.name}</h3>
                    {fav.staff.bio && <p className="bio">{fav.staff.bio}</p>}
                    {fav.staff.specialties && fav.staff.specialties.length > 0 && (
                      <div className="specialties">
                        {fav.staff.specialties.slice(0, 3).map((s) => (
                          <span key={s} className="specialty-tag">{s}</span>
                        ))}
                      </div>
                    )}
                  </div>
                </Link>
                <button
                  className="remove-btn"
                  onClick={() => removeFavoriteStaff(fav.id)}
                  title="즐겨찾기 해제"
                >
                  ♥
                </button>
              </div>
            ))
          ) : (
            <p className="empty">즐겨찾기한 직원이 없습니다.</p>
          )}
        </div>
      )}
    </div>
  );
}
