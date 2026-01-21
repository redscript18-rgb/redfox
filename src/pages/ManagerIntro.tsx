import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

export default function ManagerIntro() {
  const { isAuthenticated } = useAuth();

  return (
    <div className="min-h-screen bg-gradient-to-b from-pink-50 via-white to-purple-50">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-lg border-b border-pink-100">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="text-2xl font-bold text-slate-800">
            Red<span className="text-pink-500">Fox</span>
          </div>
          <Link
            to={isAuthenticated ? "/" : "/login"}
            className="px-5 py-2 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-medium rounded-full hover:from-pink-600 hover:to-rose-600 transition-all shadow-md shadow-pink-200"
          >
            {isAuthenticated ? "내 대시보드" : "시작하기"}
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <div className="inline-block px-4 py-1.5 bg-pink-100 rounded-full text-pink-600 text-sm font-medium mb-6">
            나다운 일, 나다운 시간
          </div>
          <h1 className="text-4xl md:text-5xl font-bold text-slate-800 mb-6 leading-tight">
            원하는 시간에,<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-purple-500">
              원하는 만큼만
            </span>
          </h1>
          <p className="text-lg text-slate-600 mb-10 max-w-2xl mx-auto leading-relaxed">
            여러 가게에서 자유롭게 일하고, 내 스케줄은 내가 정해요.<br />
            나를 알리고, 더 많은 손님을 만나보세요.
          </p>
          <Link
            to="/login"
            className="inline-block px-8 py-4 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-semibold rounded-full hover:from-pink-600 hover:to-rose-600 transition-all shadow-lg shadow-pink-200"
          >
            무료로 시작하기
          </Link>
        </div>
      </section>

      {/* Key Benefits */}
      <section className="py-12 px-4">
        <div className="max-w-5xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-6">
          {[
            { icon: "🕐", label: "자유로운 시간" },
            { icon: "🏠", label: "다양한 가게" },
            { icon: "💝", label: "투명한 정보" },
            { icon: "✨", label: "나만의 프로필" },
          ].map((item, i) => (
            <div key={i} className="text-center p-4 bg-white rounded-2xl shadow-sm border border-pink-100">
              <div className="text-3xl mb-2">{item.icon}</div>
              <div className="text-slate-700 font-medium">{item.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* How it works */}
      <section className="py-16 px-4 bg-white">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-slate-800 text-center mb-4">
            이렇게 시작해요
          </h2>
          <p className="text-slate-500 text-center mb-12">어렵지 않아요, 천천히 따라오세요</p>

          <div className="grid md:grid-cols-4 gap-6">
            {[
              { step: "1", title: "가입하기", desc: "1분이면 충분해요", icon: "📝", color: "pink" },
              { step: "2", title: "가게 찾기", desc: "마음에 드는 곳으로", icon: "🔍", color: "purple" },
              { step: "3", title: "출근 등록", desc: "원하는 날만 골라서", icon: "📅", color: "rose" },
              { step: "4", title: "수입 창출", desc: "내 페이스대로", icon: "💰", color: "pink" },
            ].map((item, i) => (
              <div key={i} className="text-center">
                <div className={`w-16 h-16 mx-auto mb-4 rounded-2xl flex items-center justify-center text-3xl shadow-md ${
                  item.color === 'pink' ? 'bg-pink-100' :
                  item.color === 'purple' ? 'bg-purple-100' :
                  'bg-rose-100'
                }`}>
                  {item.icon}
                </div>
                <div className="text-pink-500 text-sm font-medium mb-1">STEP {item.step}</div>
                <h3 className="text-lg font-bold text-slate-800 mb-1">{item.title}</h3>
                <p className="text-slate-500 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Main Features */}
      <section className="py-20 px-4 bg-gradient-to-b from-pink-50 to-purple-50">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-slate-800 mb-4">
              이런 점이 좋아요
            </h2>
            <p className="text-slate-500 text-lg">
              일도, 쉼도 내가 원하는 대로
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Feature 1 */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-pink-100 hover:shadow-md hover:border-pink-200 transition-all">
              <div className="w-12 h-12 bg-pink-100 rounded-xl flex items-center justify-center mb-4 text-2xl">
                🏠
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">여러 가게에서 일해요</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                한 곳에 묶이지 않아도 돼요. 원하는 가게 여러 곳에서 자유롭게 일할 수 있어요
              </p>
            </div>

            {/* Feature 2 */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-purple-100 hover:shadow-md hover:border-purple-200 transition-all">
              <div className="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center mb-4 text-2xl">
                📊
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">어디가 바쁜지 알 수 있어요</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                가게별 예약 현황을 미리 확인하고, 수요 높은 곳에서 더 많이 일할 수 있어요
              </p>
            </div>

            {/* Feature 3 */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-rose-100 hover:shadow-md hover:border-rose-200 transition-all">
              <div className="w-12 h-12 bg-rose-100 rounded-xl flex items-center justify-center mb-4 text-2xl">
                🕐
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">내 시간은 내가 정해요</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                강제 스케줄 없이, 가능한 날만 골라서 출근 등록하면 돼요
              </p>
            </div>

            {/* Feature 4 */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-pink-100 hover:shadow-md hover:border-pink-200 transition-all">
              <div className="w-12 h-12 bg-pink-100 rounded-xl flex items-center justify-center mb-4 text-2xl">
                📋
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">예약 정보 미리 확인</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                어떤 손님인지, 어떤 메뉴인지 미리 알고 준비할 수 있어요
              </p>
            </div>

            {/* Feature 5 */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-purple-100 hover:shadow-md hover:border-purple-200 transition-all">
              <div className="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center mb-4 text-2xl">
                💝
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">나를 알릴 수 있어요</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                프로필에 사진과 소개를 등록해서 손님에게 나를 어필해요
              </p>
            </div>

            {/* Feature 6 */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-rose-100 hover:shadow-md hover:border-rose-200 transition-all">
              <div className="w-12 h-12 bg-rose-100 rounded-xl flex items-center justify-center mb-4 text-2xl">
                📩
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">출근 요청이 와요</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                실장님이 보낸 요청을 확인하고, 수락할지 거절할지 내가 선택해요
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Dashboard Preview */}
      <section className="py-20 px-4 bg-white">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-slate-800 text-center mb-4">
            내 대시보드는 이렇게 생겼어요
          </h2>
          <p className="text-slate-500 text-center mb-12">한눈에 모든 정보를 확인할 수 있어요</p>

          <div className="bg-gradient-to-br from-pink-50 to-purple-50 rounded-3xl border border-pink-100 p-6 md:p-8">
            {/* Today's Schedule */}
            <div className="mb-8">
              <h3 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
                <span>📅</span> 오늘 스케줄
              </h3>
              <div className="space-y-3">
                {[
                  { time: "10:00 - 18:00", store: "힐링스파 강남점", status: "approved" },
                  { time: "19:00 - 23:00", store: "릴렉스 마사지", status: "pending" },
                ].map((item, i) => (
                  <div key={i} className="flex items-center justify-between p-4 bg-white rounded-2xl shadow-sm">
                    <div className="flex items-center gap-4">
                      <div className="text-lg font-semibold text-slate-800">{item.time}</div>
                      <div className="text-slate-500">{item.store}</div>
                    </div>
                    <div className={`px-3 py-1 rounded-full text-xs font-medium ${
                      item.status === 'approved' ? 'bg-green-100 text-green-600' : 'bg-amber-100 text-amber-600'
                    }`}>
                      {item.status === 'approved' ? '승인완료' : '대기중'}
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Today's Reservations */}
            <div className="mb-8">
              <h3 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
                <span>💆‍♀️</span> 오늘 예약
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {[
                  { time: "11:00", menu: "스웨디시 60분", price: "80,000원" },
                  { time: "14:00", menu: "아로마 90분", price: "120,000원" },
                  { time: "16:30", menu: "딥티슈 60분", price: "90,000원" },
                ].map((item, i) => (
                  <div key={i} className="flex items-center justify-between p-4 bg-white rounded-2xl shadow-sm">
                    <div className="flex items-center gap-3">
                      <div className="text-xl font-bold text-pink-500">{item.time}</div>
                      <div className="text-slate-600 text-sm">{item.menu}</div>
                    </div>
                    <div className="text-slate-800 font-medium text-sm">{item.price}</div>
                  </div>
                ))}
              </div>
            </div>

            {/* Store Demand */}
            <div>
              <h3 className="text-lg font-semibold text-slate-800 mb-4 flex items-center gap-2">
                <span>📊</span> 가게별 예약 현황
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {[
                  { store: "힐링스파 강남점", today: 8, avg: 5, hot: true },
                  { store: "릴렉스 마사지", today: 4, avg: 6, hot: false },
                ].map((item, i) => (
                  <div key={i} className="flex items-center justify-between p-4 bg-white rounded-2xl shadow-sm">
                    <div>
                      <div className="font-medium text-slate-800 flex items-center gap-2">
                        {item.store}
                        {item.hot && (
                          <span className="px-2 py-0.5 bg-rose-100 text-rose-500 text-xs rounded-full">바쁜 날</span>
                        )}
                      </div>
                      <div className="text-slate-400 text-sm mt-1">평균 {item.avg}건/일</div>
                    </div>
                    <div className="text-right">
                      <div className="text-2xl font-bold text-pink-500">{item.today}</div>
                      <div className="text-slate-400 text-xs">오늘 예약</div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Safety Features */}
      <section className="py-20 px-4 bg-gradient-to-b from-white to-pink-50">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl md:text-3xl font-bold text-slate-800 mb-4">
              안심하고 일할 수 있어요
            </h2>
            <p className="text-slate-500">
              소중한 개인정보, 안전하게 보호해드려요
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            {/* Verified Customers */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-green-100 text-center">
              <div className="w-14 h-14 bg-green-100 rounded-2xl flex items-center justify-center mb-4 mx-auto text-3xl">
                ✅
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">인증된 손님만</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                가입 시 본인 인증을 거친 손님만 예약할 수 있어요. 믿을 수 있는 손님을 만나세요
              </p>
            </div>

            {/* Block Feature */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-rose-100 text-center">
              <div className="w-14 h-14 bg-rose-100 rounded-2xl flex items-center justify-center mb-4 mx-auto text-3xl">
                🚫
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">불편한 손님은 차단</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                불편했던 손님은 차단할 수 있어요. 차단하면 그 손님에게 내 프로필이 보이지 않아요
              </p>
            </div>

            {/* In-app Messaging */}
            <div className="p-6 bg-white rounded-3xl shadow-sm border border-purple-100 text-center">
              <div className="w-14 h-14 bg-purple-100 rounded-2xl flex items-center justify-center mb-4 mx-auto text-3xl">
                💬
              </div>
              <h3 className="text-lg font-bold text-slate-800 mb-2">앱 안에서 메시지</h3>
              <p className="text-slate-500 text-sm leading-relaxed">
                개인 연락처 없이 앱 내 메시지로 소통해요. 내 번호나 SNS를 알려줄 필요 없어요
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Testimonials */}
      <section className="py-20 px-4 bg-pink-50">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-slate-800 text-center mb-4">
            먼저 시작한 분들의 이야기
          </h2>
          <p className="text-slate-500 text-center mb-12">실제로 사용 중인 매니저님들의 후기예요</p>

          <div className="grid md:grid-cols-3 gap-6">
            {[
              {
                text: "여러 가게에서 일할 수 있어서 수입이 훨씬 늘었어요. 바쁜 곳 골라서 출근하니까 효율도 좋고요!",
                name: "김** 님",
                exp: "3년차",
              },
              {
                text: "차단 기능이 있어서 안심이 돼요. 불편했던 손님 차단하니까 다시 안 만나서 좋아요",
                name: "이** 님",
                exp: "5년차",
              },
              {
                text: "개인 번호 안 알려줘도 앱으로 대화할 수 있어서 좋아요. 프라이버시가 지켜지는 느낌이에요 :)",
                name: "박** 님",
                exp: "2년차",
              },
            ].map((item, i) => (
              <div key={i} className="p-6 bg-white rounded-3xl shadow-sm border border-pink-100">
                <p className="text-slate-600 mb-4 leading-relaxed">"{item.text}"</p>
                <div className="flex items-center justify-between">
                  <p className="text-slate-800 font-medium">{item.name}</p>
                  <p className="text-pink-400 text-sm">{item.exp}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 px-4 bg-gradient-to-b from-pink-50 to-white">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-slate-800 mb-6">
            나다운 일,<br />
            지금 시작해볼까요?
          </h2>
          <p className="text-slate-500 text-lg mb-10">
            가입은 무료예요. 부담 없이 시작해보세요.<br />
            새로운 기회가 기다리고 있어요.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/login"
              className="px-10 py-4 bg-gradient-to-r from-pink-500 to-rose-500 text-white font-semibold rounded-full hover:from-pink-600 hover:to-rose-600 transition-all shadow-lg shadow-pink-200 text-lg"
            >
              무료로 가입하기
            </Link>
            <Link
              to="/staff/stores"
              className="px-10 py-4 bg-white text-slate-700 font-semibold rounded-full hover:bg-pink-50 transition-colors border border-pink-200 text-lg"
            >
              가게 둘러보기
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-pink-100 bg-white">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="text-2xl font-bold text-slate-800">
            Red<span className="text-pink-500">Fox</span>
          </div>
          <p className="text-slate-400 text-sm">
            © 2024 RedFox. All rights reserved.
          </p>
        </div>
      </footer>
    </div>
  );
}
