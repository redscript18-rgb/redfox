import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

export default function CustomerIntro() {
  const { isAuthenticated } = useAuth();

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-950 via-slate-900 to-slate-900">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-purple-950/80 backdrop-blur-lg border-b border-purple-800/30">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="text-2xl font-bold text-white">
            Red<span className="text-red-500">Fox</span>
          </div>
          <div className="flex items-center gap-3">
            <Link
              to="/intro"
              className="px-4 py-2 text-purple-300 hover:text-white transition-colors text-sm"
            >
              서비스 소개
            </Link>
            <Link
              to={isAuthenticated ? "/" : "/login"}
              className="px-5 py-2 bg-gradient-to-r from-purple-600 to-pink-600 text-white font-medium rounded-lg hover:from-purple-700 hover:to-pink-700 transition-all"
            >
              {isAuthenticated ? "내 예약" : "시작하기"}
            </Link>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <div className="inline-block px-4 py-1.5 bg-purple-500/10 border border-purple-500/20 rounded-full text-purple-300 text-sm font-medium mb-6">
            손님을 위한 스마트 예약
          </div>
          <h1 className="text-4xl md:text-6xl font-bold text-white mb-6 leading-tight">
            원하는 매니저,<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-purple-400 to-pink-400">
              원하는 시간에
            </span>
          </h1>
          <p className="text-lg md:text-xl text-slate-400 mb-10 max-w-2xl mx-auto">
            마음에 드는 가게와 매니저를 찾아 간편하게 예약하세요.<br />
            평점 확인부터 즐겨찾기까지, 당신만의 힐링 타임을 위해.
          </p>
          <Link
            to="/login"
            className="inline-block px-8 py-4 bg-gradient-to-r from-purple-600 to-pink-600 text-white font-semibold rounded-xl hover:from-purple-700 hover:to-pink-700 transition-all shadow-lg shadow-purple-500/25"
          >
            지금 예약하기
          </Link>
        </div>
      </section>

      {/* How it works */}
      <section className="py-16 px-4">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-white text-center mb-12">
            이렇게 이용하세요
          </h2>
          <div className="grid md:grid-cols-4 gap-6">
            {[
              { step: "1", title: "탐색", desc: "가게와 매니저를 둘러보세요", icon: "🔍" },
              { step: "2", title: "선택", desc: "마음에 드는 곳을 고르세요", icon: "💜" },
              { step: "3", title: "예약", desc: "원하는 시간에 예약하세요", icon: "📅" },
              { step: "4", title: "방문", desc: "편안한 서비스를 즐기세요", icon: "✨" },
            ].map((item, i) => (
              <div key={i} className="text-center">
                <div className="w-16 h-16 mx-auto mb-4 bg-gradient-to-br from-purple-600 to-pink-600 rounded-2xl flex items-center justify-center text-3xl shadow-lg shadow-purple-500/20">
                  {item.icon}
                </div>
                <div className="text-purple-400 text-sm font-medium mb-1">STEP {item.step}</div>
                <h3 className="text-lg font-bold text-white mb-1">{item.title}</h3>
                <p className="text-slate-400 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="py-20 px-4 bg-slate-800/30">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
              왜 RedFox로 예약해야 할까요?
            </h2>
            <p className="text-slate-400 text-lg">
              더 편리하고, 더 투명하고, 더 특별한 경험
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Feature 1 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-purple-500/50 transition-all group">
              <div className="w-12 h-12 bg-purple-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-purple-500/20 transition-colors">
                👤
              </div>
              <h3 className="text-lg font-bold text-white mb-2">매니저 프로필 확인</h3>
              <p className="text-slate-400 text-sm">
                사진, 전문 분야, 경력을 미리 확인하고 나에게 맞는 매니저를 선택하세요
              </p>
            </div>

            {/* Feature 2 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-pink-500/50 transition-all group">
              <div className="w-12 h-12 bg-pink-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-pink-500/20 transition-colors">
                ⭐
              </div>
              <h3 className="text-lg font-bold text-white mb-2">실제 이용 후기</h3>
              <p className="text-slate-400 text-sm">
                다른 손님들의 솔직한 평점과 후기를 참고해 현명한 선택을 하세요
              </p>
            </div>

            {/* Feature 3 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-indigo-500/50 transition-all group">
              <div className="w-12 h-12 bg-indigo-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-indigo-500/20 transition-colors">
                📱
              </div>
              <h3 className="text-lg font-bold text-white mb-2">간편한 예약</h3>
              <p className="text-slate-400 text-sm">
                몇 번의 터치로 원하는 시간, 메뉴, 매니저를 선택하고 예약 완료
              </p>
            </div>

            {/* Feature 4 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-violet-500/50 transition-all group">
              <div className="w-12 h-12 bg-violet-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-violet-500/20 transition-colors">
                💬
              </div>
              <h3 className="text-lg font-bold text-white mb-2">실시간 채팅</h3>
              <p className="text-slate-400 text-sm">
                예약 전 궁금한 점을 가게에 직접 물어보고 확인할 수 있어요
              </p>
            </div>

            {/* Feature 5 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-fuchsia-500/50 transition-all group">
              <div className="w-12 h-12 bg-fuchsia-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-fuchsia-500/20 transition-colors">
                ❤️
              </div>
              <h3 className="text-lg font-bold text-white mb-2">즐겨찾기</h3>
              <p className="text-slate-400 text-sm">
                마음에 드는 가게와 매니저를 저장해두고 다음에 더 빠르게 예약하세요
              </p>
            </div>

            {/* Feature 6 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-rose-500/50 transition-all group">
              <div className="w-12 h-12 bg-rose-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-rose-500/20 transition-colors">
                🎁
              </div>
              <h3 className="text-lg font-bold text-white mb-2">포인트 적립</h3>
              <p className="text-slate-400 text-sm">
                이용할 때마다 포인트가 쌓여요. 친구에게 선물도 할 수 있어요
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Reservation Status */}
      <section className="py-20 px-4">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-white text-center mb-12">
            예약 현황을 한눈에
          </h2>
          <div className="bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 p-6 md:p-8">
            <div className="grid grid-cols-3 gap-4 mb-8">
              {[
                { status: "대기중", color: "amber", desc: "승인 대기" },
                { status: "확정됨", color: "green", desc: "예약 완료" },
                { status: "완료", color: "slate", desc: "이용 완료" },
              ].map((item, i) => (
                <div key={i} className="text-center p-4 bg-slate-900/50 rounded-xl">
                  <div className={`inline-block px-3 py-1 rounded-full text-sm font-medium mb-2 ${
                    item.color === 'amber' ? 'bg-amber-500/20 text-amber-400' :
                    item.color === 'green' ? 'bg-green-500/20 text-green-400' :
                    'bg-slate-500/20 text-slate-400'
                  }`}>
                    {item.status}
                  </div>
                  <p className="text-slate-500 text-xs">{item.desc}</p>
                </div>
              ))}
            </div>
            <div className="space-y-3">
              {[
                { time: "14:00", store: "힐링스파 강남점", menu: "아로마 테라피 60분", status: "confirmed" },
                { time: "16:30", store: "리프레시 마사지", menu: "스웨디시 90분", status: "pending" },
              ].map((item, i) => (
                <div key={i} className="flex items-center justify-between p-4 bg-slate-900/30 rounded-xl">
                  <div className="flex items-center gap-4">
                    <div className="text-2xl font-bold text-white">{item.time}</div>
                    <div>
                      <div className="font-medium text-white">{item.store}</div>
                      <div className="text-sm text-slate-400">{item.menu}</div>
                    </div>
                  </div>
                  <div className={`px-3 py-1 rounded-full text-xs font-medium ${
                    item.status === 'confirmed' ? 'bg-green-500/20 text-green-400' : 'bg-amber-500/20 text-amber-400'
                  }`}>
                    {item.status === 'confirmed' ? '확정됨' : '대기중'}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Testimonials */}
      <section className="py-20 px-4 bg-slate-800/30">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-white text-center mb-12">
            손님들의 이야기
          </h2>
          <div className="grid md:grid-cols-3 gap-6">
            {[
              {
                text: "매번 전화로 예약하던게 너무 번거로웠는데, 앱으로 간편하게 예약할 수 있어서 좋아요",
                name: "김**",
                rating: 5,
              },
              {
                text: "매니저 프로필을 미리 볼 수 있어서 선택할 때 도움이 많이 됐어요. 즐겨찾기 기능도 편해요",
                name: "이**",
                rating: 5,
              },
              {
                text: "포인트 적립되는 것도 좋고, 예약 현황을 실시간으로 확인할 수 있어서 안심이 돼요",
                name: "박**",
                rating: 5,
              },
            ].map((item, i) => (
              <div key={i} className="p-6 bg-slate-800/50 rounded-2xl border border-slate-700/50">
                <div className="flex gap-1 mb-3">
                  {Array(item.rating).fill(0).map((_, j) => (
                    <span key={j} className="text-amber-400">★</span>
                  ))}
                </div>
                <p className="text-slate-300 mb-4">"{item.text}"</p>
                <p className="text-slate-500 text-sm">{item.name} 님</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 px-4">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-6">
            오늘의 힐링,<br />
            RedFox에서 예약하세요
          </h2>
          <p className="text-slate-400 text-lg mb-10">
            가입은 무료, 예약도 간편해요.<br />
            지금 바로 시작해보세요.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/login"
              className="px-10 py-4 bg-gradient-to-r from-purple-600 to-pink-600 text-white font-semibold rounded-xl hover:from-purple-700 hover:to-pink-700 transition-all shadow-lg shadow-purple-500/25 text-lg"
            >
              무료로 가입하기
            </Link>
            <Link
              to="/stores"
              className="px-10 py-4 bg-slate-800 text-white font-semibold rounded-xl hover:bg-slate-700 transition-colors border border-slate-700 text-lg"
            >
              가게 둘러보기
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-slate-700/50">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="text-2xl font-bold text-white">
            Red<span className="text-red-500">Fox</span>
          </div>
          <div className="flex items-center gap-6">
            <Link to="/intro" className="text-slate-400 hover:text-white text-sm transition-colors">
              사업자용 소개
            </Link>
          </div>
          <p className="text-slate-500 text-sm">
            © 2024 RedFox. All rights reserved.
          </p>
        </div>
      </footer>
    </div>
  );
}
