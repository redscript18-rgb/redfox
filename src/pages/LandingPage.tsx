import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

export default function LandingPage() {
  const { isAuthenticated } = useAuth();

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-slate-900/80 backdrop-blur-lg border-b border-slate-700/50">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="text-2xl font-bold text-white">
            Red<span className="text-red-500">Fox</span>
          </div>
          <Link
            to={isAuthenticated ? "/" : "/login"}
            className="px-5 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors"
          >
            {isAuthenticated ? "대시보드" : "시작하기"}
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <div className="inline-block px-4 py-1.5 bg-red-500/10 border border-red-500/20 rounded-full text-red-400 text-sm font-medium mb-6">
            스마트한 예약 관리 플랫폼
          </div>
          <h1 className="text-4xl md:text-6xl font-bold text-white mb-6 leading-tight">
            가게 운영의 모든 것,<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-red-500 to-orange-500">
              RedFox
            </span>로 한번에
          </h1>
          <p className="text-lg md:text-xl text-slate-400 mb-10 max-w-2xl mx-auto">
            사장, 실장, 매니저, 손님 모두를 위한 통합 예약 관리 시스템.<br />
            실시간 현황 파악부터 매출 분석까지, 효율적인 운영을 경험하세요.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/login"
              className="px-8 py-4 bg-gradient-to-r from-red-600 to-orange-600 text-white font-semibold rounded-xl hover:from-red-700 hover:to-orange-700 transition-all shadow-lg shadow-red-500/25"
            >
              무료로 시작하기
            </Link>
            <a
              href="#features"
              className="px-8 py-4 bg-slate-800 text-white font-semibold rounded-xl hover:bg-slate-700 transition-colors border border-slate-700"
            >
              기능 알아보기
            </a>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="py-16 px-4 border-y border-slate-700/50 bg-slate-800/30">
        <div className="max-w-5xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8">
          {[
            { value: "실시간", label: "현황 파악" },
            { value: "통합", label: "일정 관리" },
            { value: "자동", label: "매출 분석" },
            { value: "간편", label: "예약 시스템" },
          ].map((stat, i) => (
            <div key={i} className="text-center">
              <div className="text-3xl md:text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-red-500 to-orange-500 mb-2">
                {stat.value}
              </div>
              <div className="text-slate-400">{stat.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* Features by Role */}
      <section id="features" className="py-20 px-4">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
              모든 역할을 위한 맞춤 기능
            </h2>
            <p className="text-slate-400 text-lg">
              각 역할에 최적화된 기능으로 업무 효율을 극대화하세요
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-6">
            {/* Owner */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-amber-500/50 transition-colors group">
              <div className="w-14 h-14 bg-amber-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:bg-amber-500/20 transition-colors">
                <span className="text-3xl">🏢</span>
              </div>
              <h3 className="text-xl font-bold text-white mb-2">사장</h3>
              <p className="text-slate-400 mb-4">여러 가게를 한눈에 관리하고 데이터로 경영하세요</p>
              <ul className="space-y-2">
                {[
                  "다중 가게 통합 대시보드",
                  "실시간 매출/예약 현황",
                  "메뉴별/매니저별 실적 분석",
                  "실장 초대 및 권한 위임",
                ].map((item, i) => (
                  <li key={i} className="flex items-center gap-2 text-slate-300 text-sm">
                    <span className="w-1.5 h-1.5 bg-amber-500 rounded-full" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            {/* Admin */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-blue-500/50 transition-colors group">
              <div className="w-14 h-14 bg-blue-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:bg-blue-500/20 transition-colors">
                <span className="text-3xl">👔</span>
              </div>
              <h3 className="text-xl font-bold text-white mb-2">실장</h3>
              <p className="text-slate-400 mb-4">예약과 인력을 효율적으로 관리하세요</p>
              <ul className="space-y-2">
                {[
                  "예약 승인/거절 한번에",
                  "매니저 스케줄 관리",
                  "가용 인력 검색 & 출근 요청",
                  "손님과 실시간 채팅",
                ].map((item, i) => (
                  <li key={i} className="flex items-center gap-2 text-slate-300 text-sm">
                    <span className="w-1.5 h-1.5 bg-blue-500 rounded-full" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            {/* Manager */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-green-500/50 transition-colors group">
              <div className="w-14 h-14 bg-green-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:bg-green-500/20 transition-colors">
                <span className="text-3xl">💆</span>
              </div>
              <h3 className="text-xl font-bold text-white mb-2">매니저</h3>
              <p className="text-slate-400 mb-4">자유롭게 일하고 수요 높은 곳을 찾으세요</p>
              <ul className="space-y-2">
                {[
                  "여러 가게 동시 소속 가능",
                  "원하는 시간에 출근 등록",
                  "가게별 수요 현황 확인",
                  "프로필로 나를 홍보",
                ].map((item, i) => (
                  <li key={i} className="flex items-center gap-2 text-slate-300 text-sm">
                    <span className="w-1.5 h-1.5 bg-green-500 rounded-full" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            {/* Customer */}
            <div className="p-6 bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 hover:border-purple-500/50 transition-colors group">
              <div className="w-14 h-14 bg-purple-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:bg-purple-500/20 transition-colors">
                <span className="text-3xl">👤</span>
              </div>
              <h3 className="text-xl font-bold text-white mb-2">손님</h3>
              <p className="text-slate-400 mb-4">쉽고 빠르게 예약하고 혜택을 누리세요</p>
              <ul className="space-y-2">
                {[
                  "가게/매니저 자유롭게 탐색",
                  "간편한 예약 시스템",
                  "고정으로 빠른 재예약",
                  "포인트 적립 & 선물",
                ].map((item, i) => (
                  <li key={i} className="flex items-center gap-2 text-slate-300 text-sm">
                    <span className="w-1.5 h-1.5 bg-purple-500 rounded-full" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </section>

      {/* Highlights */}
      <section className="py-20 px-4 bg-slate-800/30">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
              왜 RedFox인가요?
            </h2>
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            {[
              {
                icon: "⚡",
                title: "실시간 동기화",
                desc: "예약, 스케줄, 매출 현황이 실시간으로 업데이트됩니다",
                color: "red",
              },
              {
                icon: "💬",
                title: "통합 메시징",
                desc: "사장, 실장, 매니저, 손님 간 원활한 소통이 가능합니다",
                color: "orange",
              },
              {
                icon: "📊",
                title: "데이터 분석",
                desc: "매출 추이, 인기 메뉴, 우수 매니저를 한눈에 파악합니다",
                color: "yellow",
              },
              {
                icon: "🔄",
                title: "유연한 인력 관리",
                desc: "매니저가 여러 가게에서 자유롭게 일할 수 있습니다",
                color: "green",
              },
              {
                icon: "⭐",
                title: "평점 시스템",
                desc: "신뢰할 수 있는 평점으로 품질을 관리합니다",
                color: "blue",
              },
              {
                icon: "🎁",
                title: "포인트 & 혜택",
                desc: "적립과 선물 기능으로 고객 충성도를 높입니다",
                color: "purple",
              },
            ].map((item, i) => (
              <div
                key={i}
                className="p-6 bg-slate-800/50 rounded-xl border border-slate-700/50 text-center hover:bg-slate-800 transition-colors"
              >
                <div className="text-4xl mb-4">{item.icon}</div>
                <h3 className="text-lg font-bold text-white mb-2">{item.title}</h3>
                <p className="text-slate-400 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 px-4">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-6">
            지금 바로 시작하세요
          </h2>
          <p className="text-slate-400 text-lg mb-10">
            복잡한 설정 없이 바로 사용할 수 있습니다.<br />
            가입하고 가게를 등록하면 모든 기능을 이용할 수 있어요.
          </p>
          <Link
            to="/login"
            className="inline-block px-10 py-4 bg-gradient-to-r from-red-600 to-orange-600 text-white font-semibold rounded-xl hover:from-red-700 hover:to-orange-700 transition-all shadow-lg shadow-red-500/25 text-lg"
          >
            무료로 시작하기
          </Link>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-slate-700/50">
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
