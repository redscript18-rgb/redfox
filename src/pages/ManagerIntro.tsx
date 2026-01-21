import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

export default function ManagerIntro() {
  const { isAuthenticated } = useAuth();

  return (
    <div className="min-h-screen bg-gradient-to-b from-emerald-950 via-slate-900 to-slate-900">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-emerald-950/80 backdrop-blur-lg border-b border-emerald-800/30">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="text-2xl font-bold text-white">
            Red<span className="text-red-500">Fox</span>
          </div>
          <Link
            to={isAuthenticated ? "/" : "/login"}
            className="px-5 py-2 bg-gradient-to-r from-emerald-600 to-teal-600 text-white font-medium rounded-lg hover:from-emerald-700 hover:to-teal-700 transition-all"
          >
            {isAuthenticated ? "대시보드" : "매니저 등록"}
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <div className="inline-block px-4 py-1.5 bg-emerald-500/10 border border-emerald-500/20 rounded-full text-emerald-300 text-sm font-medium mb-6">
            매니저를 위한 스마트 워크 플랫폼
          </div>
          <h1 className="text-4xl md:text-6xl font-bold text-white mb-6 leading-tight">
            내가 원하는 시간,<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 to-teal-400">
              내가 선택하는 일터
            </span>
          </h1>
          <p className="text-lg md:text-xl text-slate-400 mb-10 max-w-2xl mx-auto">
            여러 가게에서 자유롭게 일하고, 수요 높은 곳을 찾아 수익을 극대화하세요.<br />
            프로필로 나를 홍보하고, 더 많은 손님을 만나보세요.
          </p>
          <Link
            to="/login"
            className="inline-block px-8 py-4 bg-gradient-to-r from-emerald-600 to-teal-600 text-white font-semibold rounded-xl hover:from-emerald-700 hover:to-teal-700 transition-all shadow-lg shadow-emerald-500/25"
          >
            매니저로 시작하기
          </Link>
        </div>
      </section>

      {/* Key Benefits */}
      <section className="py-16 px-4 border-y border-slate-700/50 bg-slate-800/30">
        <div className="max-w-5xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8">
          {[
            { value: "자유로운", label: "근무 시간" },
            { value: "다양한", label: "가게 선택" },
            { value: "투명한", label: "예약 정보" },
            { value: "직접", label: "프로필 관리" },
          ].map((stat, i) => (
            <div key={i} className="text-center">
              <div className="text-2xl md:text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 to-teal-400 mb-2">
                {stat.value}
              </div>
              <div className="text-slate-400">{stat.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* How it works */}
      <section className="py-20 px-4">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-white text-center mb-12">
            이렇게 일하세요
          </h2>
          <div className="grid md:grid-cols-4 gap-6">
            {[
              { step: "1", title: "가입", desc: "매니저로 회원가입", icon: "📝" },
              { step: "2", title: "가게 선택", desc: "일하고 싶은 가게 지원", icon: "🏪" },
              { step: "3", title: "출근 등록", desc: "가능한 시간에 출근 신청", icon: "📅" },
              { step: "4", title: "수익 창출", desc: "손님 예약 받고 서비스 제공", icon: "💰" },
            ].map((item, i) => (
              <div key={i} className="text-center">
                <div className="w-16 h-16 mx-auto mb-4 bg-gradient-to-br from-emerald-600 to-teal-600 rounded-2xl flex items-center justify-center text-3xl shadow-lg shadow-emerald-500/20">
                  {item.icon}
                </div>
                <div className="text-emerald-400 text-sm font-medium mb-1">STEP {item.step}</div>
                <h3 className="text-lg font-bold text-white mb-1">{item.title}</h3>
                <p className="text-slate-400 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Main Features */}
      <section className="py-20 px-4 bg-slate-800/30">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
              매니저를 위한 핵심 기능
            </h2>
            <p className="text-slate-400 text-lg">
              더 자유롭게, 더 효율적으로, 더 많이 벌 수 있도록
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {/* Feature 1 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-emerald-500/50 transition-all group">
              <div className="w-12 h-12 bg-emerald-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-emerald-500/20 transition-colors">
                🏪
              </div>
              <h3 className="text-lg font-bold text-white mb-2">다중 가게 소속</h3>
              <p className="text-slate-400 text-sm">
                한 곳에 묶이지 마세요. 여러 가게에 동시 소속되어 더 많은 기회를 잡으세요
              </p>
            </div>

            {/* Feature 2 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-teal-500/50 transition-all group">
              <div className="w-12 h-12 bg-teal-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-teal-500/20 transition-colors">
                📊
              </div>
              <h3 className="text-lg font-bold text-white mb-2">수요 현황 확인</h3>
              <p className="text-slate-400 text-sm">
                가게별 오늘 예약 수와 평균을 비교해 수요 높은 곳에서 일하세요
              </p>
            </div>

            {/* Feature 3 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-cyan-500/50 transition-all group">
              <div className="w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-cyan-500/20 transition-colors">
                🕐
              </div>
              <h3 className="text-lg font-bold text-white mb-2">자유로운 출근</h3>
              <p className="text-slate-400 text-sm">
                원하는 날짜와 시간에만 출근 등록하세요. 강제 스케줄은 없어요
              </p>
            </div>

            {/* Feature 4 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-green-500/50 transition-all group">
              <div className="w-12 h-12 bg-green-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-green-500/20 transition-colors">
                📋
              </div>
              <h3 className="text-lg font-bold text-white mb-2">예약 정보 확인</h3>
              <p className="text-slate-400 text-sm">
                배정된 손님, 메뉴, 가격을 미리 확인하고 준비할 수 있어요
              </p>
            </div>

            {/* Feature 5 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-lime-500/50 transition-all group">
              <div className="w-12 h-12 bg-lime-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-lime-500/20 transition-colors">
                👤
              </div>
              <h3 className="text-lg font-bold text-white mb-2">프로필 홍보</h3>
              <p className="text-slate-400 text-sm">
                사진, 전문 분야, 소개를 등록해 손님에게 나를 어필하세요
              </p>
            </div>

            {/* Feature 6 */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-emerald-500/50 transition-all group">
              <div className="w-12 h-12 bg-emerald-500/10 rounded-xl flex items-center justify-center mb-4 text-2xl group-hover:bg-emerald-500/20 transition-colors">
                📩
              </div>
              <h3 className="text-lg font-bold text-white mb-2">출근 요청 수신</h3>
              <p className="text-slate-400 text-sm">
                실장님이 보낸 출근 요청을 확인하고 수락/거절을 선택하세요
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Dashboard Preview */}
      <section className="py-20 px-4">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-white text-center mb-12">
            매니저 대시보드 미리보기
          </h2>
          <div className="bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 p-6 md:p-8">
            {/* Today's Schedule */}
            <div className="mb-8">
              <h3 className="text-lg font-semibold text-white mb-4 flex items-center gap-2">
                <span className="text-emerald-400">📅</span> 오늘 스케줄
              </h3>
              <div className="space-y-3">
                {[
                  { time: "10:00 - 18:00", store: "힐링스파 강남점", status: "approved" },
                  { time: "19:00 - 23:00", store: "리프레시 마사지", status: "pending" },
                ].map((item, i) => (
                  <div key={i} className="flex items-center justify-between p-4 bg-slate-900/30 rounded-xl">
                    <div className="flex items-center gap-4">
                      <div className="text-lg font-semibold text-white">{item.time}</div>
                      <div className="text-slate-400">{item.store}</div>
                    </div>
                    <div className={`px-3 py-1 rounded-full text-xs font-medium ${
                      item.status === 'approved' ? 'bg-emerald-500/20 text-emerald-400' : 'bg-amber-500/20 text-amber-400'
                    }`}>
                      {item.status === 'approved' ? '승인됨' : '대기중'}
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Today's Reservations */}
            <div className="mb-8">
              <h3 className="text-lg font-semibold text-white mb-4 flex items-center gap-2">
                <span className="text-emerald-400">📋</span> 오늘 예약
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {[
                  { time: "11:00", menu: "스웨디시 60분", price: "80,000원" },
                  { time: "14:00", menu: "아로마 90분", price: "120,000원" },
                  { time: "16:30", menu: "딥티슈 60분", price: "90,000원" },
                ].map((item, i) => (
                  <div key={i} className="flex items-center justify-between p-3 bg-slate-900/30 rounded-lg">
                    <div className="flex items-center gap-3">
                      <div className="text-xl font-bold text-white">{item.time}</div>
                      <div className="text-slate-400 text-sm">{item.menu}</div>
                    </div>
                    <div className="text-emerald-400 font-medium text-sm">{item.price}</div>
                  </div>
                ))}
              </div>
            </div>

            {/* Store Demand */}
            <div>
              <h3 className="text-lg font-semibold text-white mb-4 flex items-center gap-2">
                <span className="text-emerald-400">📊</span> 가게별 수요
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {[
                  { store: "힐링스파 강남점", today: 8, avg: 5, hot: true },
                  { store: "리프레시 마사지", today: 4, avg: 6, hot: false },
                ].map((item, i) => (
                  <div key={i} className="flex items-center justify-between p-4 bg-slate-900/30 rounded-xl">
                    <div>
                      <div className="font-medium text-white flex items-center gap-2">
                        {item.store}
                        {item.hot && (
                          <span className="px-2 py-0.5 bg-orange-500/20 text-orange-400 text-xs rounded">수요 높음</span>
                        )}
                      </div>
                      <div className="text-slate-500 text-sm mt-1">평균 {item.avg}건 / 일</div>
                    </div>
                    <div className="text-right">
                      <div className="text-2xl font-bold text-white">{item.today}</div>
                      <div className="text-slate-500 text-xs">오늘 예약</div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Specialties */}
      <section className="py-20 px-4 bg-slate-800/30">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
            당신의 전문 분야를 등록하세요
          </h2>
          <p className="text-slate-400 mb-8">
            손님들이 전문 분야를 보고 매니저를 선택합니다
          </p>
          <div className="flex flex-wrap justify-center gap-3">
            {[
              "스웨디시", "아로마", "타이", "스포츠", "딥티슈",
              "경락", "발마사지", "왁싱", "림프", "핫스톤"
            ].map((specialty, i) => (
              <span
                key={i}
                className="px-4 py-2 bg-emerald-500/10 border border-emerald-500/30 text-emerald-300 rounded-full text-sm hover:bg-emerald-500/20 transition-colors"
              >
                {specialty}
              </span>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials */}
      <section className="py-20 px-4">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-white text-center mb-12">
            매니저들의 이야기
          </h2>
          <div className="grid md:grid-cols-3 gap-6">
            {[
              {
                text: "여러 가게에서 동시에 일할 수 있어서 수입이 훨씬 늘었어요. 수요 높은 곳을 골라서 출근해요",
                name: "김** 매니저",
                exp: "경력 3년",
              },
              {
                text: "실장님이 출근 요청 보내면 확인하고 수락만 하면 돼서 편해요. 강제로 나가야 하는 일이 없어요",
                name: "이** 매니저",
                exp: "경력 5년",
              },
              {
                text: "프로필에 전문 분야랑 사진 올려놓으니까 단골 손님이 많이 생겼어요. 지명 예약도 늘었고요",
                name: "박** 매니저",
                exp: "경력 2년",
              },
            ].map((item, i) => (
              <div key={i} className="p-6 bg-slate-800/50 rounded-2xl border border-slate-700/50">
                <p className="text-slate-300 mb-4">"{item.text}"</p>
                <div className="flex items-center justify-between">
                  <p className="text-white font-medium">{item.name}</p>
                  <p className="text-slate-500 text-sm">{item.exp}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 px-4 bg-gradient-to-b from-slate-900 to-emerald-950">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-6">
            더 자유롭게,<br />
            더 많이 벌 준비 되셨나요?
          </h2>
          <p className="text-slate-400 text-lg mb-10">
            가입은 무료입니다. 지금 바로 매니저로 등록하고<br />
            새로운 기회를 만나보세요.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/login"
              className="px-10 py-4 bg-gradient-to-r from-emerald-600 to-teal-600 text-white font-semibold rounded-xl hover:from-emerald-700 hover:to-teal-700 transition-all shadow-lg shadow-emerald-500/25 text-lg"
            >
              매니저로 가입하기
            </Link>
            <Link
              to="/staff/stores"
              className="px-10 py-4 bg-slate-800 text-white font-semibold rounded-xl hover:bg-slate-700 transition-colors border border-slate-700 text-lg"
            >
              가게 둘러보기
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-slate-700/50 bg-emerald-950">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="text-2xl font-bold text-white">
            Red<span className="text-red-500">Fox</span>
          </div>
          <p className="text-slate-500 text-sm">
            © 2024 RedFox. All rights reserved.
          </p>
        </div>
      </footer>
    </div>
  );
}
