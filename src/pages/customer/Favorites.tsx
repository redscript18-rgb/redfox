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

interface FavoriteVirtualStaff {
  id: number;
  virtualStaff: {
    id: string;
    name: string;
    bio: string | null;
    specialties: string[] | null;
    profile_photo_url: string | null;
    store?: { name: string };
  };
}

type TabType = 'stores' | 'staff';

export default function Favorites() {
  const { user } = useAuth();
  const defaultTab: TabType = user?.role === 'staff' ? 'staff' : 'stores';
  const [activeTab, setActiveTab] = useState<TabType>(defaultTab);
  const [favoriteStores, setFavoriteStores] = useState<FavoriteStore[]>([]);
  const [favoriteStaff, setFavoriteStaff] = useState<FavoriteStaff[]>([]);
  const [favoriteVirtualStaff, setFavoriteVirtualStaff] = useState<FavoriteVirtualStaff[]>([]);
  const [loading, setLoading] = useState(true);

  const canShowStores = user?.role === 'customer' || user?.role === 'manager';
  const canShowStaff = user?.role === 'customer' || user?.role === 'staff';

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

    // Fetch virtual staff favorites (등록 매니저)
    const { data: virtualStaffFavs } = await supabase.from('favorites').select('id, target_virtual_staff_id').eq('user_id', user.id).eq('target_type', 'virtual_staff').not('target_virtual_staff_id', 'is', null);

    if (virtualStaffFavs && virtualStaffFavs.length > 0) {
      const virtualStaffIds = virtualStaffFavs.map(f => f.target_virtual_staff_id).filter(Boolean);
      const { data: virtualStaffData } = await supabase.from('virtual_staff').select('id, name, bio, specialties, profile_photo_url, store:stores(name)').in('id', virtualStaffIds);

      if (virtualStaffData) {
        const mapped: FavoriteVirtualStaff[] = [];
        virtualStaffFavs.forEach(fav => {
          const vs = virtualStaffData.find(s => s.id === fav.target_virtual_staff_id);
          if (!vs) return;
          // Supabase returns store as single object (from 1-to-1 relation)
          const storeData = vs.store as unknown as { name: string } | null;
          mapped.push({
            id: fav.id,
            virtualStaff: {
              id: vs.id,
              name: vs.name,
              bio: vs.bio,
              specialties: vs.specialties,
              profile_photo_url: vs.profile_photo_url,
              store: storeData || undefined,
            }
          });
        });
        setFavoriteVirtualStaff(mapped);
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

  const removeFavoriteVirtualStaff = async (favoriteId: number) => {
    await supabase.from('favorites').delete().eq('id', favoriteId);
    setFavoriteVirtualStaff(prev => prev.filter(f => f.id !== favoriteId));
  };

  const totalStaffCount = favoriteStaff.length + favoriteVirtualStaff.length;

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">즐겨찾기</h1>

      <div className="flex gap-2 mb-6">
        {canShowStores && (
          <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'stores' ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('stores')}>
            가게 ({favoriteStores.length})
          </button>
        )}
        {canShowStaff && (
          <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'staff' ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('staff')}>
            매니저 ({totalStaffCount})
          </button>
        )}
      </div>

      {canShowStores && activeTab === 'stores' && (
        <div className="flex flex-col gap-3">
          {favoriteStores.length > 0 ? (
            favoriteStores.map((fav) => (
              <div key={fav.id} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors">
                <Link to={`/store/${fav.store.id}`} className="block">
                  <div className="flex items-center gap-2 mb-1">
                    <h3 className="font-semibold text-slate-900">{fav.store.name}</h3>
                    {fav.store.store_type && (
                      <span className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">{fav.store.store_type}</span>
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
          {/* 등록 매니저 (Virtual Staff) */}
          {favoriteVirtualStaff.map((fav) => (
            <div key={`vs-${fav.id}`} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors">
              <Link to={`/virtual-staff/${fav.virtualStaff.id}`} className="flex gap-4">
                <div className="w-14 h-14 rounded-full bg-gradient-to-br from-purple-600 to-pink-600 flex items-center justify-center text-white font-bold overflow-hidden flex-shrink-0">
                  {fav.virtualStaff.profile_photo_url ? (
                    <img src={fav.virtualStaff.profile_photo_url} alt={fav.virtualStaff.name} className="w-full h-full object-cover" />
                  ) : (
                    fav.virtualStaff.name.charAt(0)
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <h3 className="font-semibold text-slate-900">{fav.virtualStaff.name}</h3>
                    <span className="px-1.5 py-0.5 bg-purple-50 text-purple-600 text-xs rounded">등록</span>
                  </div>
                  {fav.virtualStaff.store?.name && (
                    <p className="text-xs text-slate-400">{fav.virtualStaff.store.name}</p>
                  )}
                  {fav.virtualStaff.bio && <p className="text-sm text-slate-500 line-clamp-1">{fav.virtualStaff.bio}</p>}
                  {fav.virtualStaff.specialties && fav.virtualStaff.specialties.length > 0 && (
                    <div className="flex flex-wrap gap-1 mt-1">
                      {fav.virtualStaff.specialties.slice(0, 3).map((s) => (
                        <span key={s} className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">{s}</span>
                      ))}
                    </div>
                  )}
                </div>
              </Link>
              <button className="absolute top-4 right-4 w-8 h-8 flex items-center justify-center text-xl text-red-500 bg-red-50 rounded-full hover:bg-red-100 transition-colors" onClick={() => removeFavoriteVirtualStaff(fav.id)} title="즐겨찾기 해제">
                ♥
              </button>
            </div>
          ))}

          {/* 프리 매니저 (Real Staff) */}
          {favoriteStaff.map((fav) => (
            <div key={`staff-${fav.id}`} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors">
              <Link to={`/staff/${fav.staff.id}`} className="flex gap-4">
                <div className="w-14 h-14 rounded-full bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-white font-bold overflow-hidden flex-shrink-0">
                  {fav.staff.profile_photo_url ? (
                    <img src={fav.staff.profile_photo_url} alt={fav.staff.name} className="w-full h-full object-cover" />
                  ) : (
                    fav.staff.name.charAt(0)
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <h3 className="font-semibold text-slate-900">{fav.staff.name}</h3>
                    <span className="px-1.5 py-0.5 bg-blue-50 text-blue-600 text-xs rounded">프리</span>
                  </div>
                  {fav.staff.bio && <p className="text-sm text-slate-500 line-clamp-1">{fav.staff.bio}</p>}
                  {fav.staff.specialties && fav.staff.specialties.length > 0 && (
                    <div className="flex flex-wrap gap-1 mt-1">
                      {fav.staff.specialties.slice(0, 3).map((s) => (
                        <span key={s} className="px-2 py-0.5 bg-orange-50 text-orange-600 text-xs rounded">{s}</span>
                      ))}
                    </div>
                  )}
                </div>
              </Link>
              <button className="absolute top-4 right-4 w-8 h-8 flex items-center justify-center text-xl text-red-500 bg-red-50 rounded-full hover:bg-red-100 transition-colors" onClick={() => removeFavoriteStaff(fav.id)} title="즐겨찾기 해제">
                ♥
              </button>
            </div>
          ))}

          {totalStaffCount === 0 && (
            <div className="p-8 bg-slate-50 rounded-xl text-center">
              <p className="text-slate-500">즐겨찾기한 매니저가 없습니다.</p>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
