import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store { id: number; name: string; address: string; phone: string | null; description: string | null; open_time: string | null; close_time: string | null; closed_days: number[] | null; store_type: string | null; region: string | null; }
interface Menu { id: number; name: string; price: number; description: string | null; }
interface Holiday { id: number; date: string; reason: string | null; }
interface VirtualStaff { id: string; name: string; phone: string | null; bio: string | null; }

const DEFAULT_STORE_TYPES = ['룸', '오피', '휴게텔', '건마', '안마', '출장', '립카페', '핸플', '페티쉬', '스웨디시'];
const REGIONS = [
  '강남', '강서', '강동', '가락', '가산', '계양', '고양', '구로', '구미', '군포', '김포',
  '당산', '대구', '대전', '동탄', '동대문', '동암', '마곡', '마포', '문래동', '부산', '부천', '부평', '분당', '북창동',
  '상봉', '상동', '선릉', '서울대입구역', '수원', '시흥', '신대방', '신림', '안양',
  '역곡', '역삼', '연신내', '영등포', '오산', '용인', '의정부', '인천', '일산',
  '잠실', '장안동', '전주', '제주도', '주안', '중랑', '천안', '철산', '청주', '평택', '하남', '홍대', '화곡', '화정'
];
const DAY_NAMES = ['일', '월', '화', '수', '목', '금', '토'];

export default function StoreSettings() {
  const { id } = useParams<{ id: string }>();
  const storeId = Number(id);
  const { user } = useAuth();

  const [store, setStore] = useState<Store | null>(null);
  const [menus, setMenus] = useState<Menu[]>([]);
  const [holidays, setHolidays] = useState<Holiday[]>([]);
  const [virtualStaff, setVirtualStaff] = useState<VirtualStaff[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [activeTab, setActiveTab] = useState<'info' | 'menu' | 'holiday' | 'staff'>('info');

  const [phone, setPhone] = useState('');
  const [description, setDescription] = useState('');
  const [openTime, setOpenTime] = useState('10:00');
  const [closeTime, setCloseTime] = useState('22:00');
  const [closedDays, setClosedDays] = useState<number[]>([]);
  const [storeType, setStoreType] = useState('');
  const [region, setRegion] = useState('');
  const [allStoreTypes, setAllStoreTypes] = useState<string[]>(DEFAULT_STORE_TYPES);

  const [newMenuName, setNewMenuName] = useState('');
  const [newMenuPrice, setNewMenuPrice] = useState('');
  const [newMenuDesc, setNewMenuDesc] = useState('');
  const [editingMenu, setEditingMenu] = useState<Menu | null>(null);

  const [newHolidayDate, setNewHolidayDate] = useState('');
  const [newHolidayReason, setNewHolidayReason] = useState('');

  const minDateNow = new Date();
  const minDate = `${minDateNow.getFullYear()}-${String(minDateNow.getMonth() + 1).padStart(2, '0')}-${String(minDateNow.getDate()).padStart(2, '0')}`;

  useEffect(() => { if (user && storeId) fetchData(); }, [user, storeId]);

  const fetchData = async () => {
    const { data: storeData } = await supabase.from('stores').select('*').eq('id', storeId).single();
    if (storeData) {
      setStore(storeData);
      setPhone(storeData.phone || '');
      setDescription(storeData.description || '');
      setOpenTime(storeData.open_time?.slice(0, 5) || '10:00');
      setCloseTime(storeData.close_time?.slice(0, 5) || '22:00');
      setClosedDays(storeData.closed_days || []);
      setStoreType(storeData.store_type || '');
      setRegion(storeData.region || '');
    }
    const { data: menusData } = await supabase.from('menus').select('*').eq('store_id', storeId).order('name');
    setMenus(menusData || []);
    const now = new Date();
    const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
    const { data: holidaysData } = await supabase.from('store_holidays').select('*').eq('store_id', storeId).gte('date', today).order('date');
    setHolidays(holidaysData || []);
    const { data: virtualStaffData } = await supabase.from('virtual_staff').select('id, name, phone, bio').eq('store_id', storeId).order('name');
    setVirtualStaff(virtualStaffData || []);
    // Fetch custom store types with display_order
    const { data: customTypes } = await supabase
      .from('store_type_visibility')
      .select('store_type, display_order')
      .eq('is_visible', true)
      .order('display_order', { ascending: true });

    if (customTypes) {
      // Get ordered types from DB first, then add default types that aren't in DB
      const orderedTypes = customTypes.map(ct => ct.store_type);
      const remainingDefaults = DEFAULT_STORE_TYPES.filter(t => !orderedTypes.includes(t));
      const allTypes = [...orderedTypes, ...remainingDefaults];
      setAllStoreTypes(allTypes);
    }
    setLoading(false);
  };

  const handleSaveInfo = async () => {
    setSaving(true);
    const { error } = await supabase.from('stores').update({ phone: phone || null, description: description || null, open_time: openTime, close_time: closeTime, closed_days: closedDays.length > 0 ? closedDays : null, store_type: storeType || null, region: region || null }).eq('id', storeId);
    setSaving(false);
    if (error) alert('저장 중 오류가 발생했습니다.');
    else alert('저장되었습니다.');
  };

  const toggleClosedDay = (day: number) => setClosedDays((prev) => prev.includes(day) ? prev.filter((d) => d !== day) : [...prev, day]);

  const handleAddMenu = async () => {
    if (!newMenuName.trim() || !newMenuPrice) { alert('메뉴 이름과 가격을 입력하세요.'); return; }
    const { error } = await supabase.from('menus').insert({ store_id: storeId, name: newMenuName.trim(), price: Number(newMenuPrice), description: newMenuDesc.trim() || null });
    if (error) alert('메뉴 추가 중 오류가 발생했습니다.');
    else { setNewMenuName(''); setNewMenuPrice(''); setNewMenuDesc(''); fetchData(); }
  };

  const handleUpdateMenu = async () => {
    if (!editingMenu) return;
    const { error } = await supabase.from('menus').update({ name: editingMenu.name, price: editingMenu.price, description: editingMenu.description }).eq('id', editingMenu.id);
    if (error) alert('메뉴 수정 중 오류가 발생했습니다.');
    else { setEditingMenu(null); fetchData(); }
  };

  const handleDeleteMenu = async (menuId: number) => {
    if (!confirm('이 메뉴를 삭제하시겠습니까?')) return;
    const { error } = await supabase.from('menus').delete().eq('id', menuId);
    if (error) alert('메뉴 삭제 중 오류가 발생했습니다.');
    else fetchData();
  };

  const handleAddHoliday = async () => {
    if (!newHolidayDate) { alert('날짜를 선택하세요.'); return; }
    const { error } = await supabase.from('store_holidays').insert({ store_id: storeId, date: newHolidayDate, reason: newHolidayReason.trim() || null });
    if (error) { if (error.code === '23505') alert('이미 등록된 휴무일입니다.'); else alert('휴무일 추가 중 오류가 발생했습니다.'); }
    else { setNewHolidayDate(''); setNewHolidayReason(''); fetchData(); }
  };

  const handleDeleteHoliday = async (holidayId: number) => {
    if (!confirm('이 휴무일을 삭제하시겠습니까?')) return;
    const { error } = await supabase.from('store_holidays').delete().eq('id', holidayId);
    if (error) alert('휴무일 삭제 중 오류가 발생했습니다.');
    else fetchData();
  };

  const formatDate = (dateStr: string) => { const date = new Date(dateStr); return `${date.getMonth() + 1}/${date.getDate()} (${DAY_NAMES[date.getDay()]})`; };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;
  if (!store) return <div><p className="text-slate-500 mb-4">가게를 찾을 수 없습니다.</p><Link to="/admin" className="text-orange-600 hover:underline">← 대시보드</Link></div>;

  return (
    <div>
      <Link to="/admin" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 대시보드</Link>
      <h1 className="text-2xl font-bold text-slate-900 mb-1">{store.name} 설정</h1>
      <p className="text-sm text-slate-500 mb-6">{store.address}</p>

      <div className="flex gap-2 mb-6 flex-wrap">
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'info' ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('info')}>기본 정보</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'menu' ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('menu')}>메뉴 관리</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'holiday' ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('holiday')}>휴무일</button>
        <button className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${activeTab === 'staff' ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`} onClick={() => setActiveTab('staff')}>소속 매니저 {virtualStaff.length > 0 && `(${virtualStaff.length})`}</button>
      </div>

      {activeTab === 'info' && (
        <div className="space-y-6">
          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">가게 형태</h2>
            <select value={storeType} onChange={(e) => setStoreType(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
              <option value="">선택하세요</option>
              {allStoreTypes.map((type) => (<option key={type} value={type}>{type}</option>))}
            </select>
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">지역</h2>
            <select value={region} onChange={(e) => setRegion(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600">
              <option value="">선택하세요</option>
              {REGIONS.map((r) => (<option key={r} value={r}>{r}</option>))}
            </select>
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">연락처</h2>
            <input type="tel" value={phone} onChange={(e) => setPhone(e.target.value)} placeholder="전화번호" className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">가게 소개</h2>
            <textarea value={description} onChange={(e) => setDescription(e.target.value)} placeholder="가게 소개를 입력하세요" rows={4} className="w-full px-4 py-3 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">영업 시간</h2>
            <div className="flex items-center gap-4">
              <div className="flex-1">
                <label className="block text-sm font-medium text-slate-700 mb-1">오픈</label>
                <input type="time" value={openTime} onChange={(e) => setOpenTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              </div>
              <span className="text-slate-400 mt-6">~</span>
              <div className="flex-1">
                <label className="block text-sm font-medium text-slate-700 mb-1">마감</label>
                <input type="time" value={closeTime} onChange={(e) => setCloseTime(e.target.value)} className="w-full h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              </div>
            </div>
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-2">정기 휴무</h2>
            <p className="text-sm text-slate-500 mb-4">매주 쉬는 요일을 선택하세요</p>
            <div className="flex gap-2 flex-wrap">
              {[1, 2, 3, 4, 5, 6, 0].map((day) => (
                <button key={day} type="button" className={`w-10 h-10 rounded-full text-sm font-medium transition-colors ${closedDays.includes(day) ? 'bg-red-600 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'}`} onClick={() => toggleClosedDay(day)}>{DAY_NAMES[day]}</button>
              ))}
            </div>
          </section>

          <button onClick={handleSaveInfo} disabled={saving} className="w-full py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-400">{saving ? '저장 중...' : '저장하기'}</button>
        </div>
      )}

      {activeTab === 'menu' && (
        <div className="space-y-6">
          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">메뉴 추가</h2>
            <div className="flex gap-2 flex-wrap">
              <input type="text" value={newMenuName} onChange={(e) => setNewMenuName(e.target.value)} placeholder="메뉴 이름" className="flex-1 min-w-[120px] h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              <input type="number" value={newMenuPrice} onChange={(e) => setNewMenuPrice(e.target.value)} placeholder="가격" className="w-28 h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              <input type="text" value={newMenuDesc} onChange={(e) => setNewMenuDesc(e.target.value)} placeholder="설명 (선택)" className="flex-1 min-w-[120px] h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              <button onClick={handleAddMenu} className="h-11 px-4 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors">추가</button>
            </div>
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">메뉴 목록</h2>
            {menus.length === 0 ? (<p className="text-sm text-slate-400">등록된 메뉴가 없습니다.</p>) : (
              <div className="flex flex-col gap-2">
                {menus.map((menu) => (
                  <div key={menu.id} className="p-3 bg-slate-50 rounded-lg">
                    {editingMenu?.id === menu.id ? (
                      <div className="flex gap-2 flex-wrap items-center">
                        <input type="text" value={editingMenu.name} onChange={(e) => setEditingMenu({ ...editingMenu, name: e.target.value })} className="flex-1 min-w-[100px] h-9 px-3 border border-slate-200 rounded-lg text-sm" />
                        <input type="number" value={editingMenu.price} onChange={(e) => setEditingMenu({ ...editingMenu, price: Number(e.target.value) })} className="w-24 h-9 px-3 border border-slate-200 rounded-lg text-sm" />
                        <input type="text" value={editingMenu.description || ''} onChange={(e) => setEditingMenu({ ...editingMenu, description: e.target.value || null })} placeholder="설명" className="flex-1 min-w-[100px] h-9 px-3 border border-slate-200 rounded-lg text-sm" />
                        <button onClick={() => setEditingMenu(null)} className="px-3 py-1.5 text-sm text-slate-600 hover:bg-slate-200 rounded">취소</button>
                        <button onClick={handleUpdateMenu} className="px-3 py-1.5 bg-red-600 text-white text-sm rounded hover:bg-red-700">저장</button>
                      </div>
                    ) : (
                      <div className="flex items-center justify-between">
                        <div>
                          <span className="font-medium text-slate-900">{menu.name}</span>
                          {menu.description && <span className="text-sm text-slate-500 ml-2">{menu.description}</span>}
                        </div>
                        <div className="flex items-center gap-3">
                          <span className="font-medium text-orange-600">{menu.price.toLocaleString()}원</span>
                          <button onClick={() => setEditingMenu(menu)} className="text-sm text-slate-500 hover:text-orange-600">수정</button>
                          <button onClick={() => handleDeleteMenu(menu.id)} className="text-sm text-red-500 hover:text-red-600">삭제</button>
                        </div>
                      </div>
                    )}
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      )}

      {activeTab === 'holiday' && (
        <div className="space-y-6">
          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">휴무일 추가</h2>
            <div className="flex gap-2 flex-wrap">
              <input type="date" value={newHolidayDate} onChange={(e) => setNewHolidayDate(e.target.value)} min={minDate} className="h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              <input type="text" value={newHolidayReason} onChange={(e) => setNewHolidayReason(e.target.value)} placeholder="사유 (선택)" className="flex-1 min-w-[120px] h-11 px-4 border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-red-600" />
              <button onClick={handleAddHoliday} className="h-11 px-4 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors">추가</button>
            </div>
          </section>

          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <h2 className="text-lg font-semibold text-slate-900 mb-4">예정된 휴무일</h2>
            {holidays.length === 0 ? (<p className="text-sm text-slate-400">등록된 휴무일이 없습니다.</p>) : (
              <div className="flex flex-col gap-2">
                {holidays.map((holiday) => (
                  <div key={holiday.id} className="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                    <div>
                      <span className="font-medium text-slate-900">{formatDate(holiday.date)}</span>
                      {holiday.reason && <span className="text-sm text-slate-500 ml-2">{holiday.reason}</span>}
                    </div>
                    <button onClick={() => handleDeleteHoliday(holiday.id)} className="text-sm text-red-500 hover:text-red-600">삭제</button>
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      )}

      {activeTab === 'staff' && (
        <div className="space-y-6">
          <section className="p-4 bg-white border border-slate-200 rounded-xl">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-lg font-semibold text-slate-900">소속 매니저</h2>
              <Link to="/admin/staff" className="text-sm text-red-600 hover:underline">매니저 관리 →</Link>
            </div>
            {virtualStaff.length === 0 ? (
              <div className="text-center py-8">
                <p className="text-slate-400 mb-4">등록된 매니저가 없습니다.</p>
                <Link to="/admin/staff" className="inline-block px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors">
                  매니저 추가하기
                </Link>
              </div>
            ) : (
              <div className="flex flex-col gap-2">
                {virtualStaff.map((staff) => (
                  <Link
                    key={staff.id}
                    to={`/virtual-staff/${staff.id}`}
                    className="flex items-center gap-3 p-3 bg-slate-50 rounded-lg hover:bg-slate-100 transition-colors"
                  >
                    <div className="w-10 h-10 rounded-full bg-gradient-to-br from-blue-600 to-purple-600 flex items-center justify-center text-sm font-bold text-white flex-shrink-0">
                      {staff.name.charAt(0)}
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <h3 className="font-medium text-slate-900">{staff.name}</h3>
                        <span className="px-2 py-0.5 bg-purple-50 text-purple-600 text-xs font-medium rounded">실장 등록</span>
                      </div>
                      {staff.bio && <p className="text-sm text-slate-500 truncate">{staff.bio}</p>}
                      {staff.phone && <p className="text-xs text-slate-400">{staff.phone}</p>}
                    </div>
                    <span className="text-sm text-slate-400">→</span>
                  </Link>
                ))}
              </div>
            )}
          </section>
        </div>
      )}
    </div>
  );
}
