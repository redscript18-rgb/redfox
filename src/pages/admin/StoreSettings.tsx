import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';
import './StoreSettings.css';

interface Store {
  id: number;
  name: string;
  address: string;
  phone: string | null;
  description: string | null;
  open_time: string | null;
  close_time: string | null;
  closed_days: number[] | null;
  store_type: string | null;
}

const STORE_TYPES = [
  '1인샵',
  '커플관리샵',
  '왁싱샵',
  '스웨디시',
  '타이마사지',
  '중국마사지',
  '스포츠마사지',
  '발마사지',
  '네일샵',
  '피부관리샵',
  '기타',
];

interface Menu {
  id: number;
  name: string;
  price: number;
  description: string | null;
}

interface Holiday {
  id: number;
  date: string;
  reason: string | null;
}

const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

export default function StoreSettings() {
  const { id } = useParams<{ id: string }>();
  const storeId = Number(id);
  const { user } = useAuth();

  const [store, setStore] = useState<Store | null>(null);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [holidays, setHolidays] = useState<Holiday[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [activeTab, setActiveTab] = useState<'info' | 'menu' | 'holiday'>('info');

  // 가게 정보 수정용
  const [phone, setPhone] = useState('');
  const [description, setDescription] = useState('');
  const [openTime, setOpenTime] = useState('10:00');
  const [closeTime, setCloseTime] = useState('22:00');
  const [closedDays, setClosedDays] = useState<number[]>([]);
  const [storeType, setStoreType] = useState('');

  // 메뉴 추가용
  const [newMenuName, setNewMenuName] = useState('');
  const [newMenuPrice, setNewMenuPrice] = useState('');
  const [newMenuDesc, setNewMenuDesc] = useState('');
  const [editingMenu, setEditingMenu] = useState<Menu | null>(null);

  // 휴무일 추가용
  const [newHolidayDate, setNewHolidayDate] = useState('');
  const [newHolidayReason, setNewHolidayReason] = useState('');

  useEffect(() => {
    if (user && storeId) {
      fetchData();
    }
  }, [user, storeId]);

  const fetchData = async () => {
    // 가게 정보
    const { data: storeData } = await supabase
      .from('stores')
      .select('*')
      .eq('id', storeId)
      .single();

    if (storeData) {
      setStore(storeData);
      setPhone(storeData.phone || '');
      setDescription(storeData.description || '');
      setOpenTime(storeData.open_time?.slice(0, 5) || '10:00');
      setCloseTime(storeData.close_time?.slice(0, 5) || '22:00');
      setClosedDays(storeData.closed_days || []);
      setStoreType(storeData.store_type || '');
    }

    // 메뉴
    const { data: menusData } = await supabase
      .from('menus')
      .select('*')
      .eq('store_id', storeId)
      .order('name');

    setMenus(menusData || []);

    // 휴무일 (오늘 이후만)
    const today = new Date().toISOString().split('T')[0];
    const { data: holidaysData } = await supabase
      .from('store_holidays')
      .select('*')
      .eq('store_id', storeId)
      .gte('date', today)
      .order('date');

    setHolidays(holidaysData || []);

    setLoading(false);
  };

  const handleSaveInfo = async () => {
    setSaving(true);

    const { error } = await supabase
      .from('stores')
      .update({
        phone: phone || null,
        description: description || null,
        open_time: openTime,
        close_time: closeTime,
        closed_days: closedDays.length > 0 ? closedDays : null,
        store_type: storeType || null,
      })
      .eq('id', storeId);

    setSaving(false);

    if (error) {
      alert('저장 중 오류가 발생했습니다.');
    } else {
      alert('저장되었습니다.');
    }
  };

  const toggleClosedDay = (day: number) => {
    setClosedDays((prev) =>
      prev.includes(day) ? prev.filter((d) => d !== day) : [...prev, day]
    );
  };

  // 메뉴 관리
  const handleAddMenu = async () => {
    if (!newMenuName.trim() || !newMenuPrice) {
      alert('메뉴 이름과 가격을 입력하세요.');
      return;
    }

    const { error } = await supabase.from('menus').insert({
      store_id: storeId,
      name: newMenuName.trim(),
      price: Number(newMenuPrice),
      description: newMenuDesc.trim() || null,
    });

    if (error) {
      alert('메뉴 추가 중 오류가 발생했습니다.');
    } else {
      setNewMenuName('');
      setNewMenuPrice('');
      setNewMenuDesc('');
      fetchData();
    }
  };

  const handleUpdateMenu = async () => {
    if (!editingMenu) return;

    const { error } = await supabase
      .from('menus')
      .update({
        name: editingMenu.name,
        price: editingMenu.price,
        description: editingMenu.description,
      })
      .eq('id', editingMenu.id);

    if (error) {
      alert('메뉴 수정 중 오류가 발생했습니다.');
    } else {
      setEditingMenu(null);
      fetchData();
    }
  };

  const handleDeleteMenu = async (menuId: number) => {
    if (!confirm('이 메뉴를 삭제하시겠습니까?')) return;

    const { error } = await supabase.from('menus').delete().eq('id', menuId);

    if (error) {
      alert('메뉴 삭제 중 오류가 발생했습니다.');
    } else {
      fetchData();
    }
  };

  // 휴무일 관리
  const handleAddHoliday = async () => {
    if (!newHolidayDate) {
      alert('날짜를 선택하세요.');
      return;
    }

    const { error } = await supabase.from('store_holidays').insert({
      store_id: storeId,
      date: newHolidayDate,
      reason: newHolidayReason.trim() || null,
    });

    if (error) {
      if (error.code === '23505') {
        alert('이미 등록된 휴무일입니다.');
      } else {
        alert('휴무일 추가 중 오류가 발생했습니다.');
      }
    } else {
      setNewHolidayDate('');
      setNewHolidayReason('');
      fetchData();
    }
  };

  const handleDeleteHoliday = async (holidayId: number) => {
    if (!confirm('이 휴무일을 삭제하시겠습니까?')) return;

    const { error } = await supabase.from('store_holidays').delete().eq('id', holidayId);

    if (error) {
      alert('휴무일 삭제 중 오류가 발생했습니다.');
    } else {
      fetchData();
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getMonth() + 1}/${date.getDate()} (${DAY_NAMES[date.getDay()]})`;
  };

  if (loading) {
    return <div className="store-settings"><p>로딩 중...</p></div>;
  }

  if (!store) {
    return (
      <div className="store-settings">
        <p>가게를 찾을 수 없습니다.</p>
        <Link to="/admin">← 대시보드</Link>
      </div>
    );
  }

  return (
    <div className="store-settings">
      <Link to="/admin" className="back-link">← 대시보드</Link>

      <h1>{store.name} 설정</h1>
      <p className="store-address">{store.address}</p>

      <div className="tabs">
        <button
          className={`tab ${activeTab === 'info' ? 'active' : ''}`}
          onClick={() => setActiveTab('info')}
        >
          기본 정보
        </button>
        <button
          className={`tab ${activeTab === 'menu' ? 'active' : ''}`}
          onClick={() => setActiveTab('menu')}
        >
          메뉴 관리
        </button>
        <button
          className={`tab ${activeTab === 'holiday' ? 'active' : ''}`}
          onClick={() => setActiveTab('holiday')}
        >
          휴무일
        </button>
      </div>

      {activeTab === 'info' && (
        <div className="tab-content">
          <section className="form-section">
            <h2>가게 형태</h2>
            <select
              value={storeType}
              onChange={(e) => setStoreType(e.target.value)}
              className="select-field"
            >
              <option value="">선택하세요</option>
              {STORE_TYPES.map((type) => (
                <option key={type} value={type}>{type}</option>
              ))}
            </select>
          </section>

          <section className="form-section">
            <h2>연락처</h2>
            <input
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="전화번호"
              className="input-field"
            />
          </section>

          <section className="form-section">
            <h2>가게 소개</h2>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="가게 소개를 입력하세요"
              rows={4}
              className="textarea-field"
            />
          </section>

          <section className="form-section">
            <h2>영업 시간</h2>
            <div className="time-inputs">
              <div className="time-group">
                <label>오픈</label>
                <input
                  type="time"
                  value={openTime}
                  onChange={(e) => setOpenTime(e.target.value)}
                />
              </div>
              <span className="time-separator">~</span>
              <div className="time-group">
                <label>마감</label>
                <input
                  type="time"
                  value={closeTime}
                  onChange={(e) => setCloseTime(e.target.value)}
                />
              </div>
            </div>
          </section>

          <section className="form-section">
            <h2>정기 휴무</h2>
            <p className="section-desc">매주 쉬는 요일을 선택하세요</p>
            <div className="day-buttons">
              {[1, 2, 3, 4, 5, 6, 0].map((day) => (
                <button
                  key={day}
                  type="button"
                  className={`day-btn ${closedDays.includes(day) ? 'selected' : ''}`}
                  onClick={() => toggleClosedDay(day)}
                >
                  {DAY_NAMES[day]}
                </button>
              ))}
            </div>
          </section>

          <button
            onClick={handleSaveInfo}
            disabled={saving}
            className="save-btn"
          >
            {saving ? '저장 중...' : '저장하기'}
          </button>
        </div>
      )}

      {activeTab === 'menu' && (
        <div className="tab-content">
          <section className="form-section">
            <h2>메뉴 추가</h2>
            <div className="menu-form">
              <input
                type="text"
                value={newMenuName}
                onChange={(e) => setNewMenuName(e.target.value)}
                placeholder="메뉴 이름"
                className="input-field"
              />
              <input
                type="number"
                value={newMenuPrice}
                onChange={(e) => setNewMenuPrice(e.target.value)}
                placeholder="가격"
                className="input-field price-input"
              />
              <input
                type="text"
                value={newMenuDesc}
                onChange={(e) => setNewMenuDesc(e.target.value)}
                placeholder="설명 (선택)"
                className="input-field"
              />
              <button onClick={handleAddMenu} className="add-btn">추가</button>
            </div>
          </section>

          <section className="form-section">
            <h2>메뉴 목록</h2>
            {menus.length === 0 ? (
              <p className="empty">등록된 메뉴가 없습니다.</p>
            ) : (
              <div className="menu-list">
                {menus.map((menu) => (
                  <div key={menu.id} className="menu-item">
                    {editingMenu?.id === menu.id ? (
                      <div className="menu-edit-form">
                        <input
                          type="text"
                          value={editingMenu.name}
                          onChange={(e) => setEditingMenu({ ...editingMenu, name: e.target.value })}
                          className="input-field"
                        />
                        <input
                          type="number"
                          value={editingMenu.price}
                          onChange={(e) => setEditingMenu({ ...editingMenu, price: Number(e.target.value) })}
                          className="input-field price-input"
                        />
                        <input
                          type="text"
                          value={editingMenu.description || ''}
                          onChange={(e) => setEditingMenu({ ...editingMenu, description: e.target.value || null })}
                          placeholder="설명"
                          className="input-field"
                        />
                        <div className="edit-actions">
                          <button onClick={() => setEditingMenu(null)} className="cancel-btn">취소</button>
                          <button onClick={handleUpdateMenu} className="save-btn small">저장</button>
                        </div>
                      </div>
                    ) : (
                      <>
                        <div className="menu-info">
                          <span className="menu-name">{menu.name}</span>
                          {menu.description && <span className="menu-desc">{menu.description}</span>}
                        </div>
                        <span className="menu-price">{menu.price.toLocaleString()}원</span>
                        <div className="menu-actions">
                          <button onClick={() => setEditingMenu(menu)} className="edit-btn">수정</button>
                          <button onClick={() => handleDeleteMenu(menu.id)} className="delete-btn">삭제</button>
                        </div>
                      </>
                    )}
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      )}

      {activeTab === 'holiday' && (
        <div className="tab-content">
          <section className="form-section">
            <h2>휴무일 추가</h2>
            <div className="holiday-form">
              <input
                type="date"
                value={newHolidayDate}
                onChange={(e) => setNewHolidayDate(e.target.value)}
                min={new Date().toISOString().split('T')[0]}
                className="input-field"
              />
              <input
                type="text"
                value={newHolidayReason}
                onChange={(e) => setNewHolidayReason(e.target.value)}
                placeholder="사유 (선택)"
                className="input-field"
              />
              <button onClick={handleAddHoliday} className="add-btn">추가</button>
            </div>
          </section>

          <section className="form-section">
            <h2>예정된 휴무일</h2>
            {holidays.length === 0 ? (
              <p className="empty">등록된 휴무일이 없습니다.</p>
            ) : (
              <div className="holiday-list">
                {holidays.map((holiday) => (
                  <div key={holiday.id} className="holiday-item">
                    <div className="holiday-info">
                      <span className="holiday-date">{formatDate(holiday.date)}</span>
                      {holiday.reason && <span className="holiday-reason">{holiday.reason}</span>}
                    </div>
                    <button onClick={() => handleDeleteHoliday(holiday.id)} className="delete-btn">삭제</button>
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      )}
    </div>
  );
}
