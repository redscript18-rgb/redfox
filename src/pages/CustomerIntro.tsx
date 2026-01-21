import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

export default function CustomerIntro() {
  const { isAuthenticated } = useAuth();

  return (
    <div className="min-h-screen bg-black text-white">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-black/80 backdrop-blur-lg border-b border-red-900/30">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="text-2xl font-bold">
            Red<span className="text-red-500">Fox</span>
          </div>
          <Link
            to={isAuthenticated ? "/" : "/login"}
            className="px-5 py-2 bg-gradient-to-r from-red-600 to-red-700 text-white font-medium rounded-lg hover:from-red-700 hover:to-red-800 transition-all"
          >
            {isAuthenticated ? "내 예약" : "시작하기"}
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="relative pt-24 pb-32 px-4 overflow-hidden">
        {/* Background gradient overlay */}
        <div className="absolute inset-0 bg-gradient-to-b from-red-950/40 via-black to-black" />
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-red-900/20 via-transparent to-transparent" />

        <div className="relative max-w-4xl mx-auto text-center pt-16">
          <div className="inline-block px-4 py-1.5 bg-red-500/10 border border-red-500/30 rounded-full text-red-400 text-sm font-medium mb-8 tracking-wide">
            PREMIUM RESERVATION
          </div>
          <h1 className="text-5xl md:text-7xl font-bold mb-8 leading-tight tracking-tight">
            당신만을 위한<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-red-400 via-red-500 to-orange-400">
              특별한 시간
            </span>
          </h1>
          <p className="text-xl md:text-2xl text-gray-400 mb-12 max-w-2xl mx-auto leading-relaxed font-light">
            엄선된 매니저와 함께하는 프리미엄 힐링.<br />
            당신의 취향에 맞는 완벽한 경험을 예약하세요.
          </p>
          <Link
            to="/login"
            className="inline-block px-10 py-4 bg-gradient-to-r from-red-600 to-red-700 text-white font-semibold rounded-full hover:from-red-700 hover:to-red-800 transition-all shadow-lg shadow-red-500/30 text-lg tracking-wide"
          >
            지금 예약하기
          </Link>
        </div>
      </section>

      {/* Divider */}
      <div className="h-px bg-gradient-to-r from-transparent via-red-800/50 to-transparent" />

      {/* Features */}
      <section className="py-24 px-4">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-20">
            <h2 className="text-3xl md:text-4xl font-bold mb-4 tracking-tight">
              왜 <span className="text-red-500">RedFox</span>인가요?
            </h2>
            <p className="text-gray-500 text-lg">
              차원이 다른 예약 경험
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {/* Feature 1 - 완벽한 프라이버시 */}
            <div className="group p-8 bg-gradient-to-b from-gray-900/80 to-gray-900/40 rounded-2xl border border-gray-800 hover:border-red-800/50 transition-all duration-300">
              <div className="w-14 h-14 bg-red-500/10 rounded-xl flex items-center justify-center mb-6 text-3xl group-hover:bg-red-500/20 transition-colors">
                🔒
              </div>
              <h3 className="text-xl font-bold mb-3">완벽한 프라이버시</h3>
              <p className="text-gray-500 leading-relaxed">
                개인정보 노출 없이 앱 내에서만 소통. 당신의 비밀은 안전합니다
              </p>
            </div>

            {/* Feature 2 - 익명 채팅 */}
            <div className="group p-8 bg-gradient-to-b from-gray-900/80 to-gray-900/40 rounded-2xl border border-gray-800 hover:border-red-800/50 transition-all duration-300">
              <div className="w-14 h-14 bg-red-500/10 rounded-xl flex items-center justify-center mb-6 text-3xl group-hover:bg-red-500/20 transition-colors">
                💬
              </div>
              <h3 className="text-xl font-bold mb-3">익명 채팅</h3>
              <p className="text-gray-500 leading-relaxed">
                전화번호 공개 없이 앱 내 메시지로 안전하게 문의하세요
              </p>
            </div>

            {/* Feature 3 - 실제 매니저 프로필 */}
            <div className="group p-8 bg-gradient-to-b from-gray-900/80 to-gray-900/40 rounded-2xl border border-gray-800 hover:border-red-800/50 transition-all duration-300">
              <div className="w-14 h-14 bg-red-500/10 rounded-xl flex items-center justify-center mb-6 text-3xl group-hover:bg-red-500/20 transition-colors">
                👤
              </div>
              <h3 className="text-xl font-bold mb-3">실제 매니저 프로필</h3>
              <p className="text-gray-500 leading-relaxed">
                상세한 프로필과 실제 사진으로 당신의 취향에 맞는 매니저를 선택하세요
              </p>
            </div>

            {/* Feature 4 - 검증된 후기 */}
            <div className="group p-8 bg-gradient-to-b from-gray-900/80 to-gray-900/40 rounded-2xl border border-gray-800 hover:border-red-800/50 transition-all duration-300">
              <div className="w-14 h-14 bg-red-500/10 rounded-xl flex items-center justify-center mb-6 text-3xl group-hover:bg-red-500/20 transition-colors">
                ⭐
              </div>
              <h3 className="text-xl font-bold mb-3">검증된 후기</h3>
              <p className="text-gray-500 leading-relaxed">
                실제 이용 손님들의 솔직한 평점으로 믿을 수 있는 선택을 하세요
              </p>
            </div>

            {/* Feature 5 - 간편한 예약 */}
            <div className="group p-8 bg-gradient-to-b from-gray-900/80 to-gray-900/40 rounded-2xl border border-gray-800 hover:border-red-800/50 transition-all duration-300">
              <div className="w-14 h-14 bg-red-500/10 rounded-xl flex items-center justify-center mb-6 text-3xl group-hover:bg-red-500/20 transition-colors">
                📱
              </div>
              <h3 className="text-xl font-bold mb-3">간편한 예약</h3>
              <p className="text-gray-500 leading-relaxed">
                복잡한 과정 없이 몇 번의 터치로 원하는 시간에 예약 완료
              </p>
            </div>

            {/* Feature 6 - VIP 혜택 */}
            <div className="group p-8 bg-gradient-to-b from-gray-900/80 to-gray-900/40 rounded-2xl border border-gray-800 hover:border-red-800/50 transition-all duration-300">
              <div className="w-14 h-14 bg-red-500/10 rounded-xl flex items-center justify-center mb-6 text-3xl group-hover:bg-red-500/20 transition-colors">
                🎁
              </div>
              <h3 className="text-xl font-bold mb-3">VIP 혜택</h3>
              <p className="text-gray-500 leading-relaxed">
                이용할수록 쌓이는 포인트. 특별한 혜택을 누리세요
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Privacy Section */}
      <section className="py-24 px-4 bg-gradient-to-b from-black via-red-950/10 to-black">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold mb-4 tracking-tight">
              당신의 <span className="text-red-500">비밀</span>은 안전합니다
            </h2>
            <p className="text-gray-500 text-lg">
              철저한 프라이버시 보호
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            <div className="p-8 bg-black/50 rounded-2xl border border-red-900/20 text-center">
              <div className="w-16 h-16 bg-red-500/10 rounded-full flex items-center justify-center mb-6 mx-auto text-3xl">
                🔐
              </div>
              <h3 className="text-lg font-bold mb-3">앱 내 전용 메시지</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                전화번호, SNS 없이 앱에서만 대화합니다. 개인 연락처가 노출되지 않습니다.
              </p>
            </div>

            <div className="p-8 bg-black/50 rounded-2xl border border-red-900/20 text-center">
              <div className="w-16 h-16 bg-red-500/10 rounded-full flex items-center justify-center mb-6 mx-auto text-3xl">
                🙈
              </div>
              <h3 className="text-lg font-bold mb-3">익명 평점</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                평점과 후기는 익명으로 처리됩니다. 솔직한 평가를 남겨도 신원이 드러나지 않습니다.
              </p>
            </div>

            <div className="p-8 bg-black/50 rounded-2xl border border-red-900/20 text-center">
              <div className="w-16 h-16 bg-red-500/10 rounded-full flex items-center justify-center mb-6 mx-auto text-3xl">
                🛡️
              </div>
              <h3 className="text-lg font-bold mb-3">최소 정보만</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                예약에 필요한 최소한의 정보만 사용합니다. 불필요한 개인정보는 수집하지 않습니다.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* How it works */}
      <section className="py-24 px-4">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold mb-4 tracking-tight">
              간단한 예약 과정
            </h2>
          </div>

          <div className="grid md:grid-cols-4 gap-8">
            {[
              { step: "01", title: "탐색", desc: "마음에 드는 가게와 매니저를 찾아보세요" },
              { step: "02", title: "선택", desc: "프로필과 후기를 확인하고 선택하세요" },
              { step: "03", title: "예약", desc: "원하는 날짜와 시간을 선택하세요" },
              { step: "04", title: "방문", desc: "특별한 시간을 즐기세요" },
            ].map((item, i) => (
              <div key={i} className="text-center">
                <div className="text-5xl font-bold text-red-500/20 mb-4">{item.step}</div>
                <h3 className="text-xl font-bold mb-2">{item.title}</h3>
                <p className="text-gray-500 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Divider */}
      <div className="h-px bg-gradient-to-r from-transparent via-red-800/50 to-transparent" />

      {/* CTA Section */}
      <section className="py-24 px-4 relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_bottom,_var(--tw-gradient-stops))] from-red-900/30 via-transparent to-transparent" />

        <div className="relative max-w-3xl mx-auto text-center">
          <h2 className="text-4xl md:text-5xl font-bold mb-6 tracking-tight">
            오늘 밤,<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-red-400 to-orange-400">특별한 시간</span>을 예약하세요
          </h2>
          <p className="text-gray-400 text-xl mb-12 font-light">
            가입은 무료. 지금 바로 시작하세요.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/login"
              className="px-12 py-4 bg-gradient-to-r from-red-600 to-red-700 text-white font-semibold rounded-full hover:from-red-700 hover:to-red-800 transition-all shadow-lg shadow-red-500/30 text-lg"
            >
              무료로 시작하기
            </Link>
            <Link
              to="/stores"
              className="px-12 py-4 bg-transparent text-white font-semibold rounded-full hover:bg-white/5 transition-colors border border-gray-700 text-lg"
            >
              둘러보기
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-gray-800">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="text-2xl font-bold">
            Red<span className="text-red-500">Fox</span>
          </div>
          <p className="text-gray-600 text-sm">
            © 2024 RedFox. All rights reserved.
          </p>
        </div>
      </footer>
    </div>
  );
}
