import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Conversation {
  id: number;
  store_id: number;
  admin_id: string;
  customer_id: string | null;
  staff_id: string | null;
  last_message_at: string;
  store?: { id: number; name: string };
  admin?: { id: string; name: string };
  customer?: { id: string; name: string };
  staff?: { id: string; name: string };
  lastMessage?: { content: string; sender_id: string; created_at: string };
  unreadCount: number;
}

interface Store {
  id: number;
  name: string;
  admins: { admin_id: string; admin?: { id: string; name: string } }[];
}

interface StaffWithStores {
  id: string;
  name: string;
  stores: { id: number; name: string }[];
}

export default function ChatList() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [conversations, setConversations] = useState<Conversation[]>([]);
  const [loading, setLoading] = useState(true);
  const [showNewChat, setShowNewChat] = useState(false);
  const [stores, setStores] = useState<Store[]>([]);
  const [staffList, setStaffList] = useState<StaffWithStores[]>([]);
  const [loadingStores, setLoadingStores] = useState(false);
  const [activeTab, setActiveTab] = useState<'all' | 'customer' | 'staff'>('all');
  const [deleteTarget, setDeleteTarget] = useState<Conversation | null>(null);
  const [deleting, setDeleting] = useState(false);

  useEffect(() => {
    if (user) fetchConversations();
  }, [user]);

  const fetchConversations = async () => {
    if (!user) return;

    const { data: convData } = await supabase
      .from('conversations')
      .select('*')
      .or(`admin_id.eq.${user.id},customer_id.eq.${user.id},staff_id.eq.${user.id}`)
      .order('last_message_at', { ascending: false });

    if (!convData || convData.length === 0) {
      setConversations([]);
      setLoading(false);
      return;
    }

    // Fetch related data
    const storeIds = [...new Set(convData.map(c => c.store_id))];
    const userIds = [...new Set(convData.flatMap(c => [c.admin_id, c.customer_id, c.staff_id].filter(Boolean)))];

    const [storesRes, profilesRes] = await Promise.all([
      supabase.from('stores').select('id, name').in('id', storeIds),
      supabase.from('profiles').select('id, name').in('id', userIds)
    ]);

    const storesMap = new Map((storesRes.data || []).map(s => [s.id, s]));
    const profilesMap = new Map((profilesRes.data || []).map(p => [p.id, p]));

    // Fetch last messages and unread counts
    const conversationsWithDetails = await Promise.all(
      convData.map(async (conv) => {
        const { data: lastMsgData } = await supabase
          .from('messages')
          .select('content, sender_id, created_at')
          .eq('conversation_id', conv.id)
          .order('created_at', { ascending: false })
          .limit(1);

        const lastMsg = lastMsgData?.[0];

        const { count } = await supabase
          .from('messages')
          .select('*', { count: 'exact', head: true })
          .eq('conversation_id', conv.id)
          .neq('sender_id', user.id)
          .is('read_at', null);

        return {
          ...conv,
          store: storesMap.get(conv.store_id),
          admin: profilesMap.get(conv.admin_id),
          customer: conv.customer_id ? profilesMap.get(conv.customer_id) : undefined,
          staff: conv.staff_id ? profilesMap.get(conv.staff_id) : undefined,
          lastMessage: lastMsg || undefined,
          unreadCount: count || 0
        };
      })
    );

    setConversations(conversationsWithDetails);
    setLoading(false);
  };

  const openNewChatModal = async () => {
    setShowNewChat(true);
    setLoadingStores(true);
    setStaffList([]);
    setStores([]);

    if (user?.role === 'staff') {
      // Admin: show affiliated staff members
      const { data: adminStoresData } = await supabase
        .from('store_admins')
        .select('store_id, store:stores(id, name)')
        .eq('admin_id', user.id);

      if (adminStoresData && adminStoresData.length > 0) {
        const storeIds = adminStoresData.map(s => s.store_id);
        const storesMap = new Map(adminStoresData.map(s => [s.store_id, (s.store as unknown as { id: number; name: string })?.name || '']));

        // Fetch staff from store_staff
        const { data: storeStaffData } = await supabase
          .from('store_staff')
          .select('staff_id, store_id')
          .in('store_id', storeIds);

        if (storeStaffData && storeStaffData.length > 0) {
          const staffIds = [...new Set(storeStaffData.map(s => s.staff_id))];
          const { data: profilesData } = await supabase
            .from('profiles')
            .select('id, name')
            .in('id', staffIds);

          const profilesMap = new Map((profilesData || []).map(p => [p.id, p]));

          // Group stores by staff
          const staffStoresMap = new Map<string, { id: number; name: string }[]>();
          storeStaffData.forEach(ss => {
            const stores = staffStoresMap.get(ss.staff_id) || [];
            stores.push({ id: ss.store_id, name: storesMap.get(ss.store_id) || '' });
            staffStoresMap.set(ss.staff_id, stores);
          });

          const staffWithStores: StaffWithStores[] = staffIds.map(staffId => ({
            id: staffId,
            name: profilesMap.get(staffId)?.name || '알 수 없음',
            stores: staffStoresMap.get(staffId) || []
          }));

          setStaffList(staffWithStores);
        }
      }
    } else if (user?.role === 'manager') {
      // Manager: show only affiliated stores
      const { data: storeStaffData } = await supabase
        .from('store_staff')
        .select('store_id')
        .eq('staff_id', user.id);

      if (storeStaffData && storeStaffData.length > 0) {
        const storeIds = storeStaffData.map(s => s.store_id);
        const { data: storesData } = await supabase
          .from('stores')
          .select('id, name')
          .in('id', storeIds);

        const { data: adminsData } = await supabase
          .from('store_admins')
          .select('store_id, admin_id')
          .in('store_id', storeIds);

        if (adminsData && storesData) {
          const adminIds = [...new Set(adminsData.map(a => a.admin_id))];
          const { data: profilesData } = await supabase
            .from('profiles')
            .select('id, name')
            .in('id', adminIds);

          const profilesMap = new Map((profilesData || []).map(p => [p.id, p]));

          const storesWithAdmins = storesData.map(store => ({
            ...store,
            admins: (adminsData || [])
              .filter(a => a.store_id === store.id)
              .map(a => ({ admin_id: a.admin_id, admin: profilesMap.get(a.admin_id) }))
          })).filter(s => s.admins.length > 0);

          setStores(storesWithAdmins);
        }
      }
    } else {
      // Customer: show all stores
      const { data: storesData } = await supabase
        .from('stores')
        .select('id, name');

      if (storesData && storesData.length > 0) {
        const storeIds = storesData.map(s => s.id);
        const { data: adminsData } = await supabase
          .from('store_admins')
          .select('store_id, admin_id')
          .in('store_id', storeIds);

        if (adminsData) {
          const adminIds = [...new Set(adminsData.map(a => a.admin_id))];
          const { data: profilesData } = await supabase
            .from('profiles')
            .select('id, name')
            .in('id', adminIds);

          const profilesMap = new Map((profilesData || []).map(p => [p.id, p]));

          const storesWithAdmins = storesData.map(store => ({
            ...store,
            admins: (adminsData || [])
              .filter(a => a.store_id === store.id)
              .map(a => ({ admin_id: a.admin_id, admin: profilesMap.get(a.admin_id) }))
          })).filter(s => s.admins.length > 0);

          setStores(storesWithAdmins);
        }
      }
    }
    setLoadingStores(false);
  };

  const startConversation = async (storeId: number, adminId: string) => {
    if (!user) return;

    try {
      if (user.role === 'manager') {
        // Manager starting conversation with admin
        const { data: existing, error: findError } = await supabase
          .from('conversations')
          .select('id')
          .eq('store_id', storeId)
          .eq('admin_id', adminId)
          .eq('staff_id', user.id)
          .maybeSingle();

        if (findError) {
          console.error('Find conversation error:', findError);
        }

        if (existing) {
          setShowNewChat(false);
          navigate(`/chat/${existing.id}`);
          return;
        }

        const { data: newConv, error } = await supabase
          .from('conversations')
          .insert({
            store_id: storeId,
            admin_id: adminId,
            staff_id: user.id
          })
          .select()
          .single();

        if (error) {
          console.error('Create conversation error:', error);
          alert('대화를 시작할 수 없습니다: ' + error.message);
          return;
        }

        if (newConv) {
          setShowNewChat(false);
          navigate(`/chat/${newConv.id}`);
        }
      } else {
        // Customer starting conversation with admin
        const { data: existing, error: findError } = await supabase
          .from('conversations')
          .select('id')
          .eq('store_id', storeId)
          .eq('admin_id', adminId)
          .eq('customer_id', user.id)
          .maybeSingle();

        if (findError) {
          console.error('Find conversation error:', findError);
        }

        if (existing) {
          setShowNewChat(false);
          navigate(`/chat/${existing.id}`);
          return;
        }

        const { data: newConv, error } = await supabase
          .from('conversations')
          .insert({
            store_id: storeId,
            admin_id: adminId,
            customer_id: user.id
          })
          .select()
          .single();

        if (error) {
          console.error('Create conversation error:', error);
          alert('대화를 시작할 수 없습니다: ' + error.message);
          return;
        }

        if (newConv) {
          setShowNewChat(false);
          navigate(`/chat/${newConv.id}`);
        }
      }
    } catch (e) {
      console.error('Unexpected error:', e);
      alert('오류가 발생했습니다.');
    }
  };

  const startConversationWithStaff = async (staffId: string, storeId: number) => {
    if (!user || user.role !== 'admin') return;

    // Check if conversation already exists
    const { data: existing } = await supabase
      .from('conversations')
      .select('id')
      .eq('store_id', storeId)
      .eq('admin_id', user.id)
      .eq('staff_id', staffId)
      .maybeSingle();

    if (existing) {
      setShowNewChat(false);
      navigate(`/chat/${existing.id}`);
      return;
    }

    // Create new conversation
    const { data: newConv, error } = await supabase
      .from('conversations')
      .insert({
        store_id: storeId,
        admin_id: user.id,
        staff_id: staffId
      })
      .select()
      .single();

    if (!error && newConv) {
      setShowNewChat(false);
      navigate(`/chat/${newConv.id}`);
    }
  };

  const getOtherParticipant = (conv: Conversation) => {
    if (user?.role === 'staff') {
      // 실장 sees customer or manager
      return conv.customer || conv.staff;
    } else if (user?.role === 'manager') {
      // 프리 매니저 sees admin
      return conv.admin;
    }
    // Customer sees admin
    return conv.admin;
  };

  const getConversationType = (conv: Conversation) => {
    if (conv.staff_id) return 'staff';
    return 'customer';
  };

  const handleDeleteClick = (e: React.MouseEvent, conv: Conversation) => {
    e.preventDefault();
    e.stopPropagation();
    setDeleteTarget(conv);
  };

  const deleteConversation = async () => {
    if (!deleteTarget) return;

    setDeleting(true);
    try {
      // 먼저 메시지 삭제
      await supabase
        .from('messages')
        .delete()
        .eq('conversation_id', deleteTarget.id);

      // 대화 삭제
      const { error } = await supabase
        .from('conversations')
        .delete()
        .eq('id', deleteTarget.id);

      if (error) {
        console.error('대화 삭제 실패:', error);
        alert('대화 삭제에 실패했습니다.');
        return;
      }

      // 목록에서 제거
      setConversations(prev => prev.filter(c => c.id !== deleteTarget.id));
      setDeleteTarget(null);
    } catch (err) {
      console.error('대화 삭제 에러:', err);
      alert('대화 삭제 중 오류가 발생했습니다.');
    } finally {
      setDeleting(false);
    }
  };

  const formatTime = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const days = Math.floor(diff / (1000 * 60 * 60 * 24));

    if (days === 0) {
      return date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
    } else if (days === 1) {
      return '어제';
    } else if (days < 7) {
      return `${days}일 전`;
    } else {
      return date.toLocaleDateString('ko-KR', { month: 'short', day: 'numeric' });
    }
  };

  // Filter conversations for admin tabs
  const filteredConversations = user?.role === 'staff'
    ? conversations.filter(conv => {
        if (activeTab === 'customer') return conv.customer_id !== null;
        if (activeTab === 'staff') return conv.staff_id !== null;
        return true;
      })
    : conversations;

  // Count unread messages by type for admin
  const customerUnreadCount = conversations
    .filter(c => c.customer_id !== null)
    .reduce((sum, c) => sum + c.unreadCount, 0);
  const staffUnreadCount = conversations
    .filter(c => c.staff_id !== null)
    .reduce((sum, c) => sum + c.unreadCount, 0);

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">메시지</h1>
        {(user?.role === 'customer' || user?.role === 'staff' || user?.role === 'manager') && (
          <button
            onClick={openNewChatModal}
            className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
          >
            새 대화
          </button>
        )}
      </div>

      {/* Admin Tabs */}
      {user?.role === 'staff' && conversations.length > 0 && (
        <div className="flex gap-1 mb-4 p-1 bg-slate-100 rounded-lg">
          <button
            onClick={() => setActiveTab('all')}
            className={`flex-1 py-2 px-4 text-sm font-medium rounded-md transition-colors ${
              activeTab === 'all'
                ? 'bg-white text-slate-900 shadow-sm'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            전체
            {(customerUnreadCount + staffUnreadCount) > 0 && (
              <span className="ml-1.5 inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 bg-red-600 text-white text-[10px] font-semibold rounded-full">
                {customerUnreadCount + staffUnreadCount}
              </span>
            )}
          </button>
          <button
            onClick={() => setActiveTab('customer')}
            className={`flex-1 py-2 px-4 text-sm font-medium rounded-md transition-colors ${
              activeTab === 'customer'
                ? 'bg-white text-slate-900 shadow-sm'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            손님
            {customerUnreadCount > 0 && (
              <span className="ml-1.5 inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 bg-blue-600 text-white text-[10px] font-semibold rounded-full">
                {customerUnreadCount}
              </span>
            )}
          </button>
          <button
            onClick={() => setActiveTab('staff')}
            className={`flex-1 py-2 px-4 text-sm font-medium rounded-md transition-colors ${
              activeTab === 'staff'
                ? 'bg-white text-slate-900 shadow-sm'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            매니저
            {staffUnreadCount > 0 && (
              <span className="ml-1.5 inline-flex items-center justify-center min-w-[18px] h-[18px] px-1 bg-green-600 text-white text-[10px] font-semibold rounded-full">
                {staffUnreadCount}
              </span>
            )}
          </button>
        </div>
      )}

      {filteredConversations.length === 0 ? (
        <div className="p-8 bg-slate-50 rounded-xl text-center">
          <p className="text-slate-500">
            {user?.role === 'staff' && activeTab !== 'all'
              ? `${activeTab === 'customer' ? '손님' : '매니저'}과의 메시지가 없습니다.`
              : '메시지가 없습니다.'}
          </p>
          {(user?.role === 'customer' || user?.role === 'staff' || user?.role === 'manager') && (
            <button
              onClick={openNewChatModal}
              className="mt-4 px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 transition-colors"
            >
              대화 시작하기
            </button>
          )}
        </div>
      ) : (
        <div className="flex flex-col gap-2">
          {filteredConversations.map((conv) => {
            const other = getOtherParticipant(conv);
            const convType = getConversationType(conv);
            return (
              <div key={conv.id} className="relative group">
                <Link
                  to={`/chat/${conv.id}`}
                  className="flex items-center gap-4 p-4 bg-white border border-slate-200 rounded-xl hover:border-red-600 transition-colors"
                >
                  <div className="w-12 h-12 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold flex-shrink-0">
                    {other?.name?.charAt(0) || '?'}
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 mb-1">
                      <span className="font-semibold text-slate-900">{other?.name || '알 수 없음'}</span>
                      {user?.role === 'staff' && (
                        <span className={`px-1.5 py-0.5 text-[10px] font-medium rounded ${convType === 'staff' ? 'bg-green-50 text-green-600' : 'bg-blue-50 text-blue-600'}`}>
                          {convType === 'staff' ? '매니저' : '손님'}
                        </span>
                      )}
                      <span className="text-xs text-slate-400">· {conv.store?.name}</span>
                    </div>
                    {conv.lastMessage && (
                      <p className="text-sm text-slate-500 truncate">
                        {conv.lastMessage.sender_id === user?.id ? '나: ' : ''}
                        {conv.lastMessage.content}
                      </p>
                    )}
                  </div>
                  <div className="flex flex-col items-end gap-1 flex-shrink-0">
                    {conv.lastMessage && (
                      <span className="text-xs text-slate-400">
                        {formatTime(conv.lastMessage.created_at)}
                      </span>
                    )}
                    {conv.unreadCount > 0 && (
                      <span className="inline-flex items-center justify-center min-w-[20px] h-5 px-1.5 bg-red-600 text-white text-xs font-semibold rounded-full">
                        {conv.unreadCount}
                      </span>
                    )}
                  </div>
                </Link>
                {/* 삭제 버튼 */}
                <button
                  onClick={(e) => handleDeleteClick(e, conv)}
                  className="absolute top-2 right-2 p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg opacity-0 group-hover:opacity-100 transition-all"
                  title="대화 삭제"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-4 h-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                  </svg>
                </button>
              </div>
            );
          })}
        </div>
      )}

      {/* New Chat Modal */}
      {showNewChat && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md max-h-[80vh] overflow-hidden">
            <div className="flex items-center justify-between p-4 border-b border-slate-200">
              <h2 className="text-lg font-semibold text-slate-900">
                {user?.role === 'staff' ? '매니저 선택' : '가게 선택'}
              </h2>
              <button
                onClick={() => setShowNewChat(false)}
                className="text-slate-400 hover:text-slate-600"
              >
                ✕
              </button>
            </div>
            <div className="p-4 overflow-y-auto max-h-[60vh]">
              {loadingStores ? (
                <p className="text-slate-500 text-center py-4">로딩 중...</p>
              ) : user?.role === 'staff' ? (
                // Admin: show staff list
                staffList.length === 0 ? (
                  <p className="text-slate-500 text-center py-4">메시지를 보낼 매니저가 없습니다.</p>
                ) : (
                  <div className="flex flex-col gap-2">
                    {staffList.map((staff) => (
                      <button
                        key={staff.id}
                        onClick={() => startConversationWithStaff(staff.id, staff.stores[0]?.id)}
                        className="flex items-center justify-between p-4 bg-slate-50 rounded-xl hover:bg-orange-50 transition-colors text-left"
                      >
                        <div>
                          <span className="font-semibold text-slate-900">{staff.name}</span>
                          <span className="text-xs text-slate-500 ml-2">
                            {staff.stores.map(s => s.name).join(', ')}
                          </span>
                        </div>
                        <span className="text-xs text-orange-600">메시지 →</span>
                      </button>
                    ))}
                  </div>
                )
              ) : (
                // Customer/Staff: show stores list
                stores.length === 0 ? (
                  <p className="text-slate-500 text-center py-4">문의 가능한 가게가 없습니다.</p>
                ) : (
                  <div className="flex flex-col gap-2">
                    {stores.map((store) => (
                      <div key={store.id} className="p-4 bg-slate-50 rounded-xl">
                        <h3 className="font-semibold text-slate-900 mb-2">{store.name}</h3>
                        <div className="flex flex-col gap-1">
                          {store.admins.map((admin) => (
                            <button
                              key={admin.admin_id}
                              onClick={() => startConversation(store.id, admin.admin_id)}
                              className="flex items-center justify-between p-2 bg-white rounded-lg hover:bg-orange-50 transition-colors text-left"
                            >
                              <span className="text-sm text-slate-700">{admin.admin?.name || '관리자'}</span>
                              <span className="text-xs text-orange-600">문의하기 →</span>
                            </button>
                          ))}
                        </div>
                      </div>
                    ))}
                  </div>
                )
              )}
            </div>
          </div>
        </div>
      )}

      {/* Delete Confirmation Modal */}
      {deleteTarget && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-sm p-6">
            <h2 className="text-lg font-semibold text-slate-900 mb-2">대화 삭제</h2>
            <p className="text-sm text-slate-600 mb-6">
              <span className="font-medium">{getOtherParticipant(deleteTarget)?.name || '알 수 없음'}</span>님과의 대화를 삭제하시겠습니까?
              <br />
              <span className="text-red-500">삭제된 대화는 복구할 수 없습니다.</span>
            </p>
            <div className="flex gap-3">
              <button
                onClick={() => setDeleteTarget(null)}
                disabled={deleting}
                className="flex-1 py-2.5 px-4 bg-slate-100 text-slate-700 font-medium rounded-lg hover:bg-slate-200 transition-colors disabled:opacity-50"
              >
                취소
              </button>
              <button
                onClick={deleteConversation}
                disabled={deleting}
                className="flex-1 py-2.5 px-4 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:opacity-50"
              >
                {deleting ? '삭제 중...' : '삭제'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
