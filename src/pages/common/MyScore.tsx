import { useEffect, useState } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { useUserScore, getReasonLabel } from '../../hooks/useUserScore';
import { supabase } from '../../lib/supabase';

interface SearchUser {
  id: string;
  name: string;
  email: string;
}

export default function MyScore() {
  const { user } = useAuth();
  const {
    totalScore,
    history,
    loading,
    historyLoading,
    canClaimDaily,
    fetchHistory,
    claimDailyReward,
    initializeScore,
    giftScore
  } = useUserScore(user?.id);

  const [claiming, setClaiming] = useState(false);
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  // 선물 관련 상태
  const [showGiftModal, setShowGiftModal] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState<SearchUser[]>([]);
  const [searching, setSearching] = useState(false);
  const [selectedUser, setSelectedUser] = useState<SearchUser | null>(null);
  const [giftAmount, setGiftAmount] = useState(100);
  const [gifting, setGifting] = useState(false);
  const [giftMessage, setGiftMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  useEffect(() => {
    if (user?.id) {
      initializeScore();
      fetchHistory();
    }
  }, [user?.id, initializeScore, fetchHistory]);

  const handleClaimDaily = async () => {
    setClaiming(true);
    setMessage(null);

    const result = await claimDailyReward();

    if (result.success) {
      setMessage({ type: 'success', text: '100점을 획득했습니다!' });
    } else {
      setMessage({ type: 'error', text: result.error || '오류가 발생했습니다.' });
    }

    setClaiming(false);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('ko-KR', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  // 사용자 검색
  const searchUsers = async (query: string) => {
    if (!query.trim() || query.length < 2) {
      setSearchResults([]);
      return;
    }

    setSearching(true);
    try {
      const { data } = await supabase
        .from('profiles')
        .select('id, name, email')
        .neq('id', user?.id) // 자신 제외
        .or(`name.ilike.%${query}%,email.ilike.%${query}%`)
        .limit(10);

      setSearchResults(data || []);
    } catch (err) {
      console.error('사용자 검색 에러:', err);
    } finally {
      setSearching(false);
    }
  };

  // 검색어 변경 시 검색
  useEffect(() => {
    const timer = setTimeout(() => {
      searchUsers(searchQuery);
    }, 300);
    return () => clearTimeout(timer);
  }, [searchQuery]);

  // 선물하기
  const handleGift = async () => {
    if (!selectedUser) return;

    setGifting(true);
    setGiftMessage(null);

    const result = await giftScore(selectedUser.id, selectedUser.name, giftAmount);

    if (result.success) {
      setGiftMessage({ type: 'success', text: `${selectedUser.name}님에게 ${giftAmount.toLocaleString()}점을 선물했습니다!` });
      // 2초 후 모달 닫기
      setTimeout(() => {
        closeGiftModal();
      }, 2000);
    } else {
      setGiftMessage({ type: 'error', text: result.error || '선물 전송에 실패했습니다.' });
    }

    setGifting(false);
  };

  // 모달 닫기
  const closeGiftModal = () => {
    setShowGiftModal(false);
    setSearchQuery('');
    setSearchResults([]);
    setSelectedUser(null);
    setGiftAmount(100);
    setGiftMessage(null);
  };

  // 선물 가능한 최대 금액 (100점 단위)
  const maxGiftAmount = Math.floor(totalScore / 100) * 100;

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-[400px]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-orange-500"></div>
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto">
      <h1 className="text-2xl font-bold text-slate-900 mb-6">내 점수</h1>

      {/* 총 점수 카드 */}
      <div className="bg-gradient-to-br from-amber-400 to-orange-500 rounded-2xl p-6 mb-6 text-white shadow-lg">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-amber-100 text-sm font-medium mb-1">보유 점수</p>
            <p className="text-4xl font-bold">{totalScore.toLocaleString()}</p>
          </div>
          <div className="w-16 h-16 bg-white/20 rounded-full flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-10 h-10">
              <path fillRule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.006 5.404.434c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.434 2.082-5.005Z" clipRule="evenodd" />
            </svg>
          </div>
        </div>
        {/* 선물하기 버튼 */}
        <button
          onClick={() => setShowGiftModal(true)}
          disabled={totalScore < 100}
          className={`mt-4 w-full py-2.5 rounded-lg font-medium transition-colors ${
            totalScore >= 100
              ? 'bg-white/20 hover:bg-white/30 text-white'
              : 'bg-white/10 text-white/50 cursor-not-allowed'
          }`}
        >
          선물하기
        </button>
      </div>

      {/* 일일 보상 */}
      <div className="bg-white border border-slate-200 rounded-xl p-5 mb-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="font-semibold text-slate-900 mb-1">일일 로그인 보상</h2>
            <p className="text-sm text-slate-500">
              {canClaimDaily ? '오늘의 보상을 받아가세요!' : '내일 다시 방문해주세요'}
            </p>
          </div>
          <button
            onClick={handleClaimDaily}
            disabled={!canClaimDaily || claiming}
            className={`px-5 py-2.5 rounded-lg font-medium transition-colors ${
              canClaimDaily && !claiming
                ? 'bg-orange-500 text-white hover:bg-orange-600'
                : 'bg-slate-100 text-slate-400 cursor-not-allowed'
            }`}
          >
            {claiming ? (
              <span className="flex items-center gap-2">
                <svg className="animate-spin h-4 w-4" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                </svg>
                처리중...
              </span>
            ) : canClaimDaily ? (
              '+100점 받기'
            ) : (
              '받기 완료'
            )}
          </button>
        </div>

        {message && (
          <div className={`mt-4 p-3 rounded-lg text-sm ${
            message.type === 'success'
              ? 'bg-green-50 text-green-700 border border-green-200'
              : 'bg-red-50 text-red-700 border border-red-200'
          }`}>
            {message.text}
          </div>
        )}
      </div>

      {/* 점수 내역 */}
      <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
        <div className="px-5 py-4 border-b border-slate-200">
          <h2 className="font-semibold text-slate-900">점수 내역</h2>
        </div>

        {historyLoading ? (
          <div className="p-8 text-center">
            <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-orange-500 mx-auto"></div>
          </div>
        ) : history.length === 0 ? (
          <div className="p-8 text-center text-slate-500">
            아직 점수 내역이 없습니다.
          </div>
        ) : (
          <ul className="divide-y divide-slate-100">
            {history.map((item) => (
              <li key={item.id} className="px-5 py-4 flex items-center justify-between">
                <div>
                  <p className="font-medium text-slate-900">{item.description || getReasonLabel(item.reason)}</p>
                  <p className="text-xs text-slate-500 mt-0.5">{formatDate(item.created_at)}</p>
                </div>
                <span className={`font-semibold ${item.amount >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                  {item.amount >= 0 ? '+' : ''}{item.amount.toLocaleString()}
                </span>
              </li>
            ))}
          </ul>
        )}
      </div>

      {/* 선물 모달 */}
      {showGiftModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md max-h-[80vh] overflow-hidden">
            <div className="flex items-center justify-between p-4 border-b border-slate-200">
              <h2 className="text-lg font-semibold text-slate-900">점수 선물하기</h2>
              <button
                onClick={closeGiftModal}
                className="text-slate-400 hover:text-slate-600 text-xl"
              >
                ×
              </button>
            </div>

            <div className="p-4">
              {!selectedUser ? (
                // 사용자 검색
                <>
                  <div className="mb-4">
                    <label className="block text-sm font-medium text-slate-700 mb-2">받는 사람</label>
                    <input
                      type="text"
                      placeholder="이름 또는 이메일로 검색..."
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                      className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                    />
                  </div>

                  {searching ? (
                    <div className="py-8 text-center text-slate-400">검색 중...</div>
                  ) : searchResults.length > 0 ? (
                    <div className="max-h-60 overflow-y-auto">
                      {searchResults.map((u) => (
                        <button
                          key={u.id}
                          onClick={() => setSelectedUser(u)}
                          className="w-full flex items-center gap-3 p-3 hover:bg-slate-50 rounded-lg transition-colors text-left"
                        >
                          <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold flex-shrink-0">
                            {u.name.charAt(0)}
                          </div>
                          <div className="flex-1 min-w-0">
                            <p className="font-medium text-slate-900">{u.name}</p>
                            <p className="text-sm text-slate-500 truncate">{u.email}</p>
                          </div>
                        </button>
                      ))}
                    </div>
                  ) : searchQuery.length >= 2 ? (
                    <div className="py-8 text-center text-slate-400">검색 결과가 없습니다.</div>
                  ) : (
                    <div className="py-8 text-center text-slate-400">2글자 이상 입력해주세요.</div>
                  )}
                </>
              ) : (
                // 금액 선택
                <>
                  <div className="mb-4 p-4 bg-slate-50 rounded-xl">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-500 to-red-600 flex items-center justify-center text-white font-bold flex-shrink-0">
                          {selectedUser.name.charAt(0)}
                        </div>
                        <div>
                          <p className="font-medium text-slate-900">{selectedUser.name}</p>
                          <p className="text-sm text-slate-500">{selectedUser.email}</p>
                        </div>
                      </div>
                      <button
                        onClick={() => setSelectedUser(null)}
                        className="text-sm text-orange-600 hover:underline"
                      >
                        변경
                      </button>
                    </div>
                  </div>

                  <div className="mb-4">
                    <label className="block text-sm font-medium text-slate-700 mb-2">선물할 점수</label>
                    <div className="flex items-center gap-2">
                      <button
                        onClick={() => setGiftAmount(Math.max(100, giftAmount - 100))}
                        disabled={giftAmount <= 100}
                        className="w-12 h-12 bg-slate-100 rounded-lg text-xl font-bold text-slate-600 hover:bg-slate-200 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        -
                      </button>
                      <div className="flex-1 text-center">
                        <span className="text-3xl font-bold text-slate-900">{giftAmount.toLocaleString()}</span>
                        <span className="text-slate-500 ml-1">점</span>
                      </div>
                      <button
                        onClick={() => setGiftAmount(Math.min(maxGiftAmount, giftAmount + 100))}
                        disabled={giftAmount >= maxGiftAmount}
                        className="w-12 h-12 bg-slate-100 rounded-lg text-xl font-bold text-slate-600 hover:bg-slate-200 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        +
                      </button>
                    </div>
                    <p className="text-center text-sm text-slate-500 mt-2">
                      보유: {totalScore.toLocaleString()}점 (최대 {maxGiftAmount.toLocaleString()}점 선물 가능)
                    </p>
                  </div>

                  {/* 빠른 선택 버튼 */}
                  <div className="flex gap-2 mb-4">
                    {[100, 500, 1000].map((amount) => (
                      <button
                        key={amount}
                        onClick={() => setGiftAmount(Math.min(maxGiftAmount, amount))}
                        disabled={amount > maxGiftAmount}
                        className={`flex-1 py-2 rounded-lg text-sm font-medium transition-colors ${
                          giftAmount === amount
                            ? 'bg-orange-500 text-white'
                            : amount > maxGiftAmount
                            ? 'bg-slate-100 text-slate-300 cursor-not-allowed'
                            : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                        }`}
                      >
                        {amount.toLocaleString()}점
                      </button>
                    ))}
                  </div>

                  {giftMessage && (
                    <div className={`mb-4 p-3 rounded-lg text-sm ${
                      giftMessage.type === 'success'
                        ? 'bg-green-50 text-green-700 border border-green-200'
                        : 'bg-red-50 text-red-700 border border-red-200'
                    }`}>
                      {giftMessage.text}
                    </div>
                  )}

                  <button
                    onClick={handleGift}
                    disabled={gifting || giftAmount > maxGiftAmount}
                    className="w-full py-3 bg-orange-500 text-white font-medium rounded-lg hover:bg-orange-600 disabled:bg-slate-300 disabled:cursor-not-allowed transition-colors"
                  >
                    {gifting ? '전송 중...' : `${giftAmount.toLocaleString()}점 선물하기`}
                  </button>
                </>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
