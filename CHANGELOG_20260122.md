# 작업 내역 (2026-01-22)

## 1. 가게-에이전시 연결 시스템

### 데이터베이스 마이그레이션
- `supabase/migrations/20260122_store_agency.sql`
  - `store_agency_requests` 테이블: 가게에서 에이전시로 연결 요청
  - `store_agencies` 테이블: 승인된 가게-에이전시 연결
  - RLS 정책 (조회/삽입/수정/삭제)
  - `approve_store_agency_request()` RPC 함수
  - `reject_store_agency_request()` RPC 함수

### 새 페이지
- `src/pages/admin/AgencySearch.tsx`
  - 사장/실장이 에이전시를 검색하고 연결 요청
  - 연결된 에이전시 목록 표시
  - 요청 중인 에이전시 취소 기능
  - 연결 해제 기능

- `src/pages/agency/StoreRequestsManage.tsx`
  - 에이전시가 가게 요청을 관리
  - 대기 중인 요청 / 연결된 가게 탭
  - 요청 승인/거절 기능
  - 연결 해제 기능

### 라우트 추가 (App.tsx)
- `/admin/agencies` - 사장/실장용 에이전시 탐색
- `/agency/store-requests` - 에이전시용 가게 요청 관리

### 네비게이션 추가 (Layout.tsx)
- 사장/실장: "에이전시" 메뉴
- 에이전시: "가게요청" 메뉴

---

## 2. 에이전시-실장/사장 메시지 기능

### 데이터베이스 마이그레이션
- `supabase/migrations/20260122_conversations_agency.sql`
  - `conversations` 테이블에 `agency_id` 컬럼 추가
  - 제약조건 업데이트: customer_id / staff_id / agency_id 중 하나만 설정
  - 유니크 인덱스 추가
  - RLS 정책 업데이트 (conversations, messages)

### ChatList.tsx 업데이트
- 에이전시 역할 지원
- 에이전시는 연결된 가게의 사장/실장과 대화 시작 가능
- 실장/사장 탭에 "에이전시" 탭 추가 (보라색 배지)
- 대화 목록에 에이전시 타입 배지 표시

### ChatRoom.tsx 업데이트
- 에이전시 대화 지원
- 대화 상대방 표시 및 에이전시 배지 표시

### Layout.tsx 업데이트
- 에이전시 역할도 읽지 않은 메시지 수 표시

---

## 3. 슈퍼어드민 대시보드 채팅 통계

### SuperAdminDashboard.tsx 업데이트
- 전체 대화 수
- 전체 메시지 수
- 오늘 메시지 수
- 대화 유형별 통계 (손님/매니저/에이전시)

---

## 4. 사용자 관리 에이전시 채팅 통계 수정

### UserManagement.tsx 수정
- `openUserDetail` 함수에서 채팅 수 조회 시 `agency_id` 포함
- 에이전시 사용자의 채팅 수 정상 표시

---

## 5. 기타 수정

### 누락된 RPC 함수 추가
- `supabase/migrations/20260122_accept_admin_invite.sql`
  - `accept_admin_invite()` 함수 생성
  - InviteAccept.tsx에서 호출하는 함수가 누락되어 있었음

### 테스트 로그인 버튼 복원
- `src/components/Login.tsx`
  - 각 역할별 빠른 로그인 버튼 항상 표시
  - superadmin, owner, staff, manager, customer, agency

---

## 커밋 목록

1. `99ba864` - Add agency-store connection and agency messaging features
2. `855b782` - Add chat statistics to superadmin dashboard
3. `31d61ef` - Fix agency chat count in user management

---

## 적용 필요한 DB 마이그레이션

Supabase에 다음 마이그레이션 파일들을 순서대로 적용해야 합니다:

1. `20260122_accept_admin_invite.sql`
2. `20260122_store_agency.sql`
3. `20260122_conversations_agency.sql`
