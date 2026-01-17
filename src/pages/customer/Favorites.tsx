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
  const [activeTab, setActiveTab] = useState<TabType>('stores');
  const [favoriteStores, setFavoriteStores] = useState<FavoriteStore[]>([]);
  const [favoriteStaff, setFavoriteStaff] = useState<FavoriteStaff[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchFavorites();
    }
  }, [user]);

  const fetchFavorites = async () => {
    if (!user) return;

    // 즐겨찾기한 가게 조회
    const { data: storesData } = await supabase
      .from('favorites')
      .select(`
        id,
        store:stores(id, name, address, store_type)
      `)
      .eq('user_id', user.id)
      .eq('target_type', 'store')
      .not('target_store_id', 'is', null);

    setFavoriteStores((storesData || []).filter(item => item.store) as FavoriteStore[]);

    // 즐겨찾기한 직원 조회
    const { data: staffData } = await supabase
      .from('favorites')
      .select(`
        id,
        staff:profiles(id, name, bio, specialties, profile_image_url)
      `)
      .eq('user_id', user.id)
      .eq('target_type', 'staff')
      .not('target_staff_id', 'is', null);

    setFavoriteStaff((staffData || []).filter(item => item.staff) as FavoriteStaff[]);
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
        <button
          className={`tab ${activeTab === 'stores' ? 'active' : ''}`}
          onClick={() => setActiveTab('stores')}
        >
          가게 ({favoriteStores.length})
        </button>
        <button
          className={`tab ${activeTab === 'staff' ? 'active' : ''}`}
          onClick={() => setActiveTab('staff')}
        >
          직원 ({favoriteStaff.length})
        </button>
      </div>

      {activeTab === 'stores' && (
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

      {activeTab === 'staff' && (
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
