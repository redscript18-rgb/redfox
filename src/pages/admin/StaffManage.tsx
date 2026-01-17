import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Staff {
  id: string;
  name: string;
  email: string;
  phone: string | null;
  bio: string | null;
  specialties: string[] | null;
  profile_photo_url: string | null;
  age: number | null;
  height: number | null;
  weight: number | null;
}

export default function StaffManage() {
  const { user } = useAuth();
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [favoriteStaff, setFavoriteStaff] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchStaff();
      fetchFavorites();
    }
  }, [user]);

  const fetchFavorites = async () => {
    if (!user) return;
    const { data } = await supabase
      .from('favorites')
      .select('target_staff_id')
      .eq('user_id', user.id)
      .eq('target_type', 'staff');

    if (data) {
      setFavoriteStaff(new Set(data.map(f => f.target_staff_id).filter(Boolean)));
    }
  };

  const toggleFavorite = async (staffId: string) => {
    if (!user) return;

    const isFavorite = favoriteStaff.has(staffId);

    if (isFavorite) {
      await supabase
        .from('favorites')
        .delete()
        .eq('user_id', user.id)
        .eq('target_type', 'staff')
        .eq('target_staff_id', staffId);

      setFavoriteStaff(prev => {
        const next = new Set(prev);
        next.delete(staffId);
        return next;
      });
    } else {
      await supabase
        .from('favorites')
        .insert({ user_id: user.id, target_type: 'staff', target_staff_id: staffId });

      setFavoriteStaff(prev => new Set([...prev, staffId]));
    }
  };

  const fetchStaff = async () => {
    if (!user) return;

    const { data: adminStores } = await supabase
      .from('store_admins')
      .select('store_id')
      .eq('admin_id', user.id);

    const storeIds = adminStores?.map(s => s.store_id) || [];

    if (storeIds.length > 0) {
      const { data: storeStaff } = await supabase
        .from('store_staff')
        .select('staff_id')
        .in('store_id', storeIds);

      const staffIds = [...new Set(storeStaff?.map(s => s.staff_id) || [])];

      if (staffIds.length > 0) {
        const { data: staffData } = await supabase
          .from('profiles')
          .select('*')
          .in('id', staffIds);
        setStaffList(staffData || []);
      }
    }

    setLoading(false);
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/" className="inline-block mb-4 text-blue-600 text-sm hover:underline">← 대시보드</Link>

      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">직원 관리</h1>
      </div>

      <div className="mb-4">
        <span className="text-sm text-slate-500">총 {staffList.length}명</span>
      </div>

      <div className="flex flex-col gap-3">
        {staffList.map((staff) => (
          <div key={staff.id} className="relative p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-600 hover:shadow-md transition-all">
            <Link to={`/staff/${staff.id}`} className="flex gap-4">
              <div className="w-16 h-16 rounded-xl bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-lg font-bold text-white overflow-hidden flex-shrink-0">
                {staff.profile_photo_url ? (
                  <img src={staff.profile_photo_url} alt={staff.name} className="w-full h-full object-cover" />
                ) : (
                  staff.name.charAt(0)
                )}
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <h3 className="font-semibold text-slate-900">{staff.name}</h3>
                  <div className="flex gap-1 text-xs text-slate-500">
                    {staff.age && <span>{staff.age}세</span>}
                    {staff.height && <span>{staff.height}cm</span>}
                    {staff.weight && <span>{staff.weight}kg</span>}
                  </div>
                </div>
                <p className="text-sm text-slate-600 line-clamp-1 mb-1">{staff.bio || '소개 없음'}</p>
                {staff.phone && <span className="text-xs text-slate-400">{staff.phone}</span>}
                {staff.specialties && staff.specialties.length > 0 && (
                  <div className="flex flex-wrap gap-1 mt-2">
                    {staff.specialties.map((s) => (
                      <span key={s} className="px-2 py-0.5 bg-blue-50 text-blue-600 rounded text-xs">{s}</span>
                    ))}
                  </div>
                )}
              </div>
            </Link>
            <button
              className={`absolute top-4 right-4 w-8 h-8 flex items-center justify-center text-xl rounded-full transition-colors ${
                favoriteStaff.has(staff.id) ? 'text-red-500 bg-red-50' : 'text-slate-300 hover:text-red-500 hover:bg-red-50'
              }`}
              onClick={(e) => { e.preventDefault(); toggleFavorite(staff.id); }}
            >
              {favoriteStaff.has(staff.id) ? '♥' : '♡'}
            </button>
          </div>
        ))}
      </div>

      {staffList.length === 0 && (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">등록된 직원이 없습니다.</p>
        </div>
      )}
    </div>
  );
}
