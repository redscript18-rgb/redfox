import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './StaffManage.css';

interface Staff {
  id: string;
  name: string;
  email: string;
  phone: string | null;
  bio: string | null;
  specialties: string[] | null;
}

export default function StaffManage() {
  const { user } = useAuth();
  const [staffList, setStaffList] = useState<Staff[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchStaff();
    }
  }, [user]);

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
    return <div className="staff-manage"><p>로딩 중...</p></div>;
  }

  return (
    <div className="staff-manage">
      <Link to="/" className="back-link">← 대시보드</Link>

      <div className="page-header">
        <h1>직원 관리</h1>
      </div>

      <div className="filters">
        <span className="staff-count">총 {staffList.length}명</span>
      </div>

      <div className="staff-list">
        {staffList.map((staff) => (
          <div key={staff.id} className="staff-card">
            <div className="staff-avatar">{staff.name.charAt(0)}</div>
            <div className="staff-info">
              <div className="staff-header">
                <h3>{staff.name}</h3>
              </div>
              <p className="bio">{staff.bio || '소개 없음'}</p>
              <div className="meta">
                {staff.phone && <span className="phone">{staff.phone}</span>}
              </div>
              {staff.specialties && staff.specialties.length > 0 && (
                <div className="specialties">
                  {staff.specialties.map((s) => (
                    <span key={s} className="specialty-tag">{s}</span>
                  ))}
                </div>
              )}
            </div>
          </div>
        ))}
      </div>

      {staffList.length === 0 && (
        <div className="empty-state">
          <p>등록된 직원이 없습니다.</p>
        </div>
      )}
    </div>
  );
}
