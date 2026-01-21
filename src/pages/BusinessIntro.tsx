import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

export default function BusinessIntro() {
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
            className="px-5 py-2 bg-gradient-to-r from-red-600 to-orange-600 text-white font-medium rounded-lg hover:from-red-700 hover:to-orange-700 transition-all"
          >
            {isAuthenticated ? "대시보드" : "무료로 시작"}
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <div className="inline-block px-4 py-1.5 bg-red-500/10 border border-red-500/20 rounded-full text-red-400 text-sm font-medium mb-6">
            사장님 & 실장님을 위한 통합 관리 시스템
          </div>
          <h1 className="text-4xl md:text-6xl font-bold text-white mb-6 leading-tight">
            가게 운영,<br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-red-500 to-orange-500">
              이제 스마트하게
            </span>
          </h1>
          <p className="text-lg md:text-xl text-slate-400 mb-10 max-w-2xl mx-auto">
            예약, 매니저, 매출을 한눈에 관리하세요.<br />
            데이터 기반 경영으로 매출을 극대화하고 운영 효율을 높이세요.
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
              기능 살펴보기
            </a>
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="py-16 px-4 border-y border-slate-700/50 bg-slate-800/30">
        <div className="max-w-5xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8">
          {[
            { value: "실시간", label: "매출 현황" },
            { value: "통합", label: "예약 관리" },
            { value: "자동", label: "스케줄 관리" },
            { value: "데이터", label: "기반 분석" },
          ].map((stat, i) => (
            <div key={i} className="text-center">
              <div className="text-2xl md:text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-red-500 to-orange-500 mb-2">
                {stat.value}
              </div>
              <div className="text-slate-400">{stat.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* Role Tabs */}
      <section id="features" className="py-20 px-4">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
              역할별 맞춤 기능
            </h2>
            <p className="text-slate-400 text-lg">
              사장님과 실장님, 각자의 역할에 최적화된 기능을 제공합니다
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8">
            {/* Owner Section */}
            <div className="p-8 bg-gradient-to-br from-amber-500/5 to-orange-500/5 rounded-2xl border border-amber-500/20">
              <div className="w-16 h-16 bg-amber-500/10 rounded-2xl flex items-center justify-center mb-6 text-4xl">
                🏢
              </div>
              <h3 className="text-2xl font-bold text-white mb-2">사장님</h3>
              <p className="text-slate-400 mb-6">여러 가게를 한눈에 관리하고 데이터로 경영하세요</p>

              <div className="space-y-4">
                {[
                  { icon: "📊", title: "통합 대시보드", desc: "모든 가게의 매출, 예약, 매니저 현황을 실시간으로" },
                  { icon: "📈", title: "매출 분석", desc: "7일간 매출 추이, 메뉴별/매니저별 실적 한눈에" },
                  { icon: "👔", title: "실장님 관리", desc: "실장님 초대, 권한 위임으로 효율적인 운영" },
                  { icon: "🏪", title: "다중 가게", desc: "여러 지점을 하나의 계정에서 통합 관리" },
                ].map((item, i) => (
                  <div key={i} className="flex gap-4 p-4 bg-slate-800/50 rounded-xl">
                    <div className="text-2xl">{item.icon}</div>
                    <div>
                      <h4 className="font-semibold text-white">{item.title}</h4>
                      <p className="text-slate-400 text-sm">{item.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Admin Section */}
            <div className="p-8 bg-gradient-to-br from-blue-500/5 to-cyan-500/5 rounded-2xl border border-blue-500/20">
              <div className="w-16 h-16 bg-blue-500/10 rounded-2xl flex items-center justify-center mb-6 text-4xl">
                👔
              </div>
              <h3 className="text-2xl font-bold text-white mb-2">실장님</h3>
              <p className="text-slate-400 mb-6">예약과 매니저를 효율적으로 관리하세요</p>

              <div className="space-y-4">
                {[
                  { icon: "📅", title: "예약 관리", desc: "대기/확정/취소 한번에 처리, 손님 평점 확인" },
                  { icon: "👥", title: "매니저 관리", desc: "스케줄 승인, 출근 요청, 가용 인력 검색" },
                  { icon: "💬", title: "실시간 소통", desc: "매니저, 손님과 앱 내 채팅으로 빠른 커뮤니케이션" },
                  { icon: "🚫", title: "고객 관리", desc: "문제 고객 차단, 단골 고객 관리" },
                ].map((item, i) => (
                  <div key={i} className="flex gap-4 p-4 bg-slate-800/50 rounded-xl">
                    <div className="text-2xl">{item.icon}</div>
                    <div>
                      <h4 className="font-semibold text-white">{item.title}</h4>
                      <p className="text-slate-400 text-sm">{item.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Dashboard Preview - Owner */}
      <section className="py-20 px-4 bg-slate-800/30">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
              사장님 대시보드 미리보기
            </h2>
            <p className="text-slate-400">실시간 현황을 한눈에 파악하세요</p>
          </div>

          <div className="bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 p-6 md:p-8">
            {/* Stats Cards */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
              {[
                { label: "오늘 예상 매출", value: "2,450,000원", color: "red" },
                { label: "오늘 예약", value: "32건", color: "orange" },
                { label: "근무 매니저", value: "12명", color: "amber" },
                { label: "운영 가게", value: "3개", color: "yellow" },
              ].map((stat, i) => (
                <div key={i} className="p-4 bg-slate-900/50 rounded-xl text-center">
                  <div className={`text-2xl md:text-3xl font-bold mb-1 ${
                    stat.color === 'red' ? 'text-red-400' :
                    stat.color === 'orange' ? 'text-orange-400' :
                    stat.color === 'amber' ? 'text-amber-400' :
                    'text-yellow-400'
                  }`}>
                    {stat.value}
                  </div>
                  <div className="text-slate-500 text-sm">{stat.label}</div>
                </div>
              ))}
            </div>

            {/* Store List */}
            <h3 className="text-lg font-semibold text-white mb-4">가게별 현황</h3>
            <div className="space-y-3">
              {[
                { name: "힐링스파 강남점", revenue: "980,000원", reservations: 12, staff: 4 },
                { name: "힐링스파 역삼점", revenue: "750,000원", reservations: 10, staff: 3 },
                { name: "힐링스파 선릉점", revenue: "720,000원", reservations: 10, staff: 5 },
              ].map((store, i) => (
                <div key={i} className="flex items-center justify-between p-4 bg-slate-900/30 rounded-xl">
                  <div>
                    <div className="font-medium text-white">{store.name}</div>
                    <div className="text-slate-500 text-sm">매니저 {store.staff}명 근무중</div>
                  </div>
                  <div className="text-right">
                    <div className="font-semibold text-orange-400">{store.revenue}</div>
                    <div className="text-slate-500 text-sm">예약 {store.reservations}건</div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Dashboard Preview - Admin */}
      <section className="py-20 px-4">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
              실장님 대시보드 미리보기
            </h2>
            <p className="text-slate-400">예약과 매니저를 효율적으로 관리하세요</p>
          </div>

          <div className="bg-gradient-to-br from-slate-800 to-slate-800/50 rounded-2xl border border-slate-700/50 p-6 md:p-8">
            {/* Alert Cards */}
            <div className="grid grid-cols-2 gap-4 mb-8">
              <div className="p-4 bg-amber-500/10 border border-amber-500/20 rounded-xl">
                <div className="text-amber-400 font-semibold mb-1">승인 대기 스케줄</div>
                <div className="text-3xl font-bold text-white">5건</div>
              </div>
              <div className="p-4 bg-orange-500/10 border border-orange-500/20 rounded-xl">
                <div className="text-orange-400 font-semibold mb-1">대기 예약</div>
                <div className="text-3xl font-bold text-white">8건</div>
              </div>
            </div>

            {/* Reservation List */}
            <h3 className="text-lg font-semibold text-white mb-4">오늘 예약</h3>
            <div className="space-y-3">
              {[
                { time: "14:00", customer: "김**", menu: "스웨디시 60분", staff: "이수진", status: "confirmed" },
                { time: "15:30", customer: "박**", menu: "아로마 90분", staff: "최민지", status: "pending" },
                { time: "17:00", customer: "이**", menu: "딥티슈 60분", staff: "미배정", status: "pending" },
              ].map((res, i) => (
                <div key={i} className="flex items-center justify-between p-4 bg-slate-900/30 rounded-xl">
                  <div className="flex items-center gap-4">
                    <div className="text-xl font-bold text-white">{res.time}</div>
                    <div>
                      <div className="font-medium text-white">{res.customer} · {res.menu}</div>
                      <div className="text-slate-500 text-sm">담당: {res.staff}</div>
                    </div>
                  </div>
                  <div className={`px-3 py-1 rounded-full text-xs font-medium ${
                    res.status === 'confirmed' ? 'bg-green-500/20 text-green-400' : 'bg-amber-500/20 text-amber-400'
                  }`}>
                    {res.status === 'confirmed' ? '확정' : '대기'}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Benefits */}
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
                title: "실시간 현황",
                desc: "30초마다 자동 갱신되는 대시보드로 현장 상황을 즉시 파악",
              },
              {
                icon: "📊",
                title: "데이터 분석",
                desc: "메뉴별, 매니저별 실적을 분석해 경영 인사이트 도출",
              },
              {
                icon: "👥",
                title: "인력 관리",
                desc: "가용 매니저 검색, 출근 요청으로 인력 부족 즉시 해결",
              },
              {
                icon: "💬",
                title: "통합 소통",
                desc: "매니저, 손님과 앱 내에서 바로 소통",
              },
              {
                icon: "🔒",
                title: "권한 관리",
                desc: "사장님은 전체 관리, 실장님은 매장 운영에 집중",
              },
              {
                icon: "📱",
                title: "어디서나",
                desc: "PC, 모바일 어디서든 가게를 관리",
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
            스마트한 가게 운영,<br />
            지금 시작하세요
          </h2>
          <p className="text-slate-400 text-lg mb-10">
            가입 후 바로 가게를 등록하고 사용할 수 있습니다.<br />
            복잡한 설정 없이 즉시 시작하세요.
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
