import { useState, useEffect, useRef, useCallback } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Message {
  id: number;
  conversation_id: number;
  sender_id: string;
  content: string;
  read_at: string | null;
  created_at: string;
}

interface Conversation {
  id: number;
  store_id: number;
  admin_id: string;
  customer_id: string | null;
  staff_id: string | null;
  store?: { id: number; name: string };
  admin?: { id: string; name: string };
  customer?: { id: string; name: string };
  staff?: { id: string; name: string };
}

export default function ChatRoom() {
  const { id } = useParams<{ id: string }>();
  const conversationId = Number(id);
  const { user } = useAuth();
  const [conversation, setConversation] = useState<Conversation | null>(null);
  const [messages, setMessages] = useState<Message[]>([]);
  const [newMessage, setNewMessage] = useState('');
  const [loading, setLoading] = useState(true);
  const [sending, setSending] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  const fetchConversation = useCallback(async () => {
    const { data: convData } = await supabase
      .from('conversations')
      .select('*')
      .eq('id', conversationId)
      .single();

    if (!convData) {
      setLoading(false);
      return;
    }

    const [storeRes, adminRes] = await Promise.all([
      supabase.from('stores').select('id, name').eq('id', convData.store_id).single(),
      supabase.from('profiles').select('id, name').eq('id', convData.admin_id).single(),
    ]);

    let customerRes = null;
    let staffRes = null;
    if (convData.customer_id) {
      customerRes = await supabase.from('profiles').select('id, name').eq('id', convData.customer_id).single();
    }
    if (convData.staff_id) {
      staffRes = await supabase.from('profiles').select('id, name').eq('id', convData.staff_id).single();
    }

    setConversation({
      ...convData,
      store: storeRes.data || undefined,
      admin: adminRes.data || undefined,
      customer: customerRes?.data || undefined,
      staff: staffRes?.data || undefined
    });
  }, [conversationId]);

  const fetchMessages = useCallback(async () => {
    const { data } = await supabase
      .from('messages')
      .select('*')
      .eq('conversation_id', conversationId)
      .order('created_at', { ascending: true });

    if (data) {
      setMessages(data);
    }
    setLoading(false);
  }, [conversationId]);

  const markAsRead = useCallback(async () => {
    if (!user) return;

    await supabase
      .from('messages')
      .update({ read_at: new Date().toISOString() })
      .eq('conversation_id', conversationId)
      .neq('sender_id', user.id)
      .is('read_at', null);
  }, [conversationId, user]);

  useEffect(() => {
    if (user) {
      fetchConversation();
      fetchMessages();
    }
  }, [user, fetchConversation, fetchMessages]);

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  useEffect(() => {
    if (user && messages.length > 0) {
      markAsRead();
    }
  }, [user, messages, markAsRead]);

  // Polling for new messages
  useEffect(() => {
    const interval = setInterval(() => {
      fetchMessages();
    }, 30000);
    return () => clearInterval(interval);
  }, [fetchMessages]);

  const sendMessage = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!user || !newMessage.trim() || sending) return;

    setSending(true);
    const content = newMessage.trim();
    setNewMessage('');

    const { data, error } = await supabase
      .from('messages')
      .insert({
        conversation_id: conversationId,
        sender_id: user.id,
        content
      })
      .select()
      .single();

    if (!error && data) {
      setMessages(prev => [...prev, data]);

      // Update last_message_at
      await supabase
        .from('conversations')
        .update({ last_message_at: new Date().toISOString() })
        .eq('id', conversationId);
    }

    setSending(false);
    inputRef.current?.focus();
  };

  const getOtherParticipant = () => {
    if (!conversation) return null;
    if (user?.role === 'staff') {
      return conversation.customer || conversation.staff;
    } else if (user?.role === 'manager') {
      return conversation.admin;
    }
    return conversation.admin;
  };

  const getConversationType = () => {
    if (!conversation) return null;
    return conversation.staff_id ? 'staff' : 'customer';
  };

  const formatTime = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', weekday: 'short' });
  };

  const shouldShowDate = (current: Message, previous?: Message) => {
    if (!previous) return true;
    const currentDate = new Date(current.created_at).toDateString();
    const previousDate = new Date(previous.created_at).toDateString();
    return currentDate !== previousDate;
  };

  if (loading) return <div className="text-slate-500">로딩 중...</div>;

  if (!conversation) {
    return (
      <div>
        <p className="text-slate-500 mb-4">대화를 찾을 수 없습니다.</p>
        <Link to="/chat" className="text-orange-600 text-sm hover:underline">← 목록으로</Link>
      </div>
    );
  }

  const other = getOtherParticipant();
  const convType = getConversationType();

  return (
    <div className="flex flex-col h-[calc(100vh-200px)] max-h-[700px]">
      {/* Header */}
      <div className="flex items-center gap-4 pb-4 border-b border-slate-200">
        <Link to="/chat" className="text-slate-400 hover:text-slate-600">
          ←
        </Link>
        <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold flex-shrink-0">
          {other?.name?.charAt(0) || '?'}
        </div>
        <div>
          <div className="flex items-center gap-2">
            <h1 className="font-semibold text-slate-900">{other?.name || '알 수 없음'}</h1>
            {user?.role === 'staff' && convType && (
              <span className={`px-1.5 py-0.5 text-[10px] font-medium rounded ${convType === 'staff' ? 'bg-green-50 text-green-600' : 'bg-blue-50 text-blue-600'}`}>
                {convType === 'staff' ? '매니저' : '손님'}
              </span>
            )}
          </div>
          <p className="text-xs text-slate-500">{conversation.store?.name}</p>
        </div>
      </div>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto py-4 space-y-3">
        {messages.length === 0 ? (
          <div className="text-center text-slate-500 py-8">
            대화를 시작해보세요.
          </div>
        ) : (
          messages.map((message, index) => {
            const isMe = message.sender_id === user?.id;
            const showDate = shouldShowDate(message, messages[index - 1]);

            return (
              <div key={message.id}>
                {showDate && (
                  <div className="text-center text-xs text-slate-400 my-4">
                    {formatDate(message.created_at)}
                  </div>
                )}
                <div className={`flex ${isMe ? 'justify-end' : 'justify-start'}`}>
                  <div className={`max-w-[70%] ${isMe ? 'order-2' : 'order-1'}`}>
                    <div
                      className={`px-4 py-2 rounded-2xl ${
                        isMe
                          ? 'bg-red-600 text-white rounded-br-sm'
                          : 'bg-slate-100 text-slate-900 rounded-bl-sm'
                      }`}
                    >
                      <p className="text-sm whitespace-pre-wrap break-words">{message.content}</p>
                    </div>
                    <div className={`flex items-center gap-1 mt-1 ${isMe ? 'justify-end' : 'justify-start'}`}>
                      <span className="text-[10px] text-slate-400">{formatTime(message.created_at)}</span>
                      {isMe && message.read_at && (
                        <span className="text-[10px] text-orange-600">읽음</span>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            );
          })
        )}
        <div ref={messagesEndRef} />
      </div>

      {/* Input */}
      <form onSubmit={sendMessage} className="pt-4 border-t border-slate-200">
        <div className="flex gap-2">
          <input
            ref={inputRef}
            type="text"
            value={newMessage}
            onChange={(e) => setNewMessage(e.target.value)}
            placeholder="메시지를 입력하세요..."
            className="flex-1 px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-red-600 focus:border-transparent"
            disabled={sending}
          />
          <button
            type="submit"
            disabled={!newMessage.trim() || sending}
            className="px-6 py-3 bg-red-600 text-white font-medium rounded-xl hover:bg-red-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed whitespace-nowrap flex-shrink-0"
          >
            전송
          </button>
        </div>
      </form>
    </div>
  );
}
