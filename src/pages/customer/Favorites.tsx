import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

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
    profile_photo_url: string | null;
  };
}

type TabType = 'stores' | 'staff';

export default function Favorites() {
  const { user } = useAuth();
  const defaultTab: TabType = user?.role === 'admin' ? 'staff' : 'stores';
  const [activeTab, setActiveTab] = useState<TabType>(defaultTab);
  const [favoriteStores, setFavoriteStores] = useState<FavoriteStore[]>([]);
  const [favoriteStaff, setFavoriteStaff] = useState<FavoriteStaff[]>([]);
  const [loading, setLoading] = useState(true);

  const canShowStores = user?.role === 'customer' || user?.role === 'staff';
  const canShowStaff = user?.role === 'customer' || user?.role === 'admin';

  useEffect(() => { if (user) fetchFavorites(); }, [user]);

  const fetchFavorites = async () => {
    if (!user) return;

    const { data: storeFavs } = await supabase.from('favorites').select('id, target_store_id').eq('user_id', user.id).eq('target_type', 'store').not('target_store_id', 'is', null);

    if (storeFavs && storeFavs.length > 0) {
      const storeIds = storeFavs.map(f => f.target_store_id).filter(Boolean);
      const { data: storesData } = await supabase.from('stores').select('id, name, address, store_type').in('id', storeIds);

      if (storesData) {
        const mapped = storeFavs.map(fav => {
          const store = storesData.find(s => s.id === fav.target_store_id);
          return store ? { id: fav.id, store } : null;
        }).filter((item): item is FavoriteStore => item !== null);
        setFavoriteStores(mapped);
      }
    }

    const { data: staffFavs } = await supabase.from('favorites').select('id, target_staff_id').eq('user_id', user.id).eq('target_type', 'staff').not('target_staff_id', 'is', null);

    if (staffFavs && staffFavs.length > 0) {
      const staffIds = staffFavs.map(f => f.target_staff_id).filter(Boolean);
      const { data: staffData } = await supabase.from('profiles').select('id, name, bio, specialties, profile_photo_url').in('id', staffIds);

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

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">즐겨찾기</h1>

      <div className="flex gap-2 mb-6">
        {canShowStores && (
          <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'stores' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('stores')}>
            가게 ({favoriteStores.length})
          </button>
        )}
        {canShowStaff && (
          <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'staff' ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('staff')}>
            직원 ({favoriteStaff.length})
          </button>
        )}
      </div>

      {canShowStores && activeTab === 'stores' && (
        <div className="flex flex-col gap-3">
          {favoriteStores.length > 0 ? (
            favoriteStores.map((fav) => (
              <div key={fav.id} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-600 transition-colors">
                <Link to={`/store/${fav.store.id}`} className="block">
                  <div className="flex items-center gap-2 mb-1">
                    <h3 className="font-semibold text-slate-900">{fav.store.name}</h3>
                    {fav.store.store_type && (
                      <span className="px-2 py-0.5 bg-blue-50 text-blue-600 text-xs rounded">{fav.store.store_type}</span>
                    )}
                  </div>
                  <p className="text-sm text-slate-500">{fav.store.address}</p>
                </Link>
                <button className="absolute top-4 right-4 w-8 h-8 flex items-center justify-center text-xl text-red-500 bg-red-50 rounded-full hover:bg-red-100 transition-colors" onClick={() => removeFavoriteStore(fav.id)} title="즐겨찾기 해제">
                  ♥
                </button>
              </div>
            ))
          ) : (
            <div className="p-8 bg-slate-50 rounded-xl text-center">
              <p className="text-slate-500">즐겨찾기한 가게가 없습니다.</p>
            </div>
          )}
        </div>
      )}

      {canShowStaff && activeTab === 'staff' && (
        <div className="flex flex-col gap-3">
          {favoriteStaff.length > 0 ? (
            favoriteStaff.map((fav) => (
              <div key={fav.id} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-600 transition-colors">
                <Link to={`/staff/${fav.staff.id}`} className="flex gap-4">
                  <div className="w-14 h-14 rounded-full bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-white font-bold overflow-hidden flex-shrink-0">
                    {fav.staff.profile_photo_url ? (
                      <img src={fav.staff.profile_photo_url} alt={fav.staff.name} className="w-full h-full object-cover" />
                    ) : (
                      fav.staff.name.charAt(0)
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-semibold text-slate-900">{fav.staff.name}</h3>
                    {fav.staff.bio && <p className="text-sm text-slate-500 line-clamp-1">{fav.staff.bio}</p>}
                    {fav.staff.specialties && fav.staff.specialties.length > 0 && (
                      <div className="flex flex-wrap gap-1 mt-1">
                        {fav.staff.specialties.slice(0, 3).map((s) => (
                          <span key={s} className="px-2 py-0.5 bg-blue-50 text-blue-600 text-xs rounded">{s}</span>
                        ))}
                      </div>
                    )}
                  </div>
                </Link>
                <button className="absolute top-4 right-4 w-8 h-8 flex items-center justify-center text-xl text-red-500 bg-red-50 rounded-full hover:bg-red-100 transition-colors" onClick={() => removeFavoriteStaff(fav.id)} title="즐겨찾기 해제">
                  ♥
                </button>
              </div>
            ))
          ) : (
            <div className="p-8 bg-slate-50 rounded-xl text-center">
              <p className="text-slate-500">즐겨찾기한 직원이 없습니다.</p>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
