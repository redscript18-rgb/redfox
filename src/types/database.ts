export type UserRole = 'owner' | 'admin' | 'staff' | 'customer';
export type ScheduleStatus = 'pending' | 'approved' | 'rejected';
export type ScheduleType = 'regular' | 'substitute' | 'temporary';
export type ReservationStatus = 'pending' | 'confirmed' | 'cancelled' | 'completed';

// 프로필 테이블
export interface Profile {
  id: string;
  email: string;
  name: string;
  role: UserRole;
  phone: string | null;
  profile_image: string | null;
  bio: string | null;
  specialties: string[] | null;
  created_at: string;
}

// 가게 테이블
export interface Store {
  id: number;
  name: string;
  address: string;
  owner_id: string;
  created_at: string;
}

// 메뉴 테이블
export interface Menu {
  id: number;
  store_id: number;
  name: string;
  price: number;
  description: string | null;
  created_at: string;
}

// 스케줄 테이블
export interface Schedule {
  id: number;
  store_id: number;
  staff_id: string;
  date: string;
  start_time: string;
  end_time: string;
  status: ScheduleStatus;
  type: ScheduleType;
  created_at: string;
}

// 예약 테이블
export interface Reservation {
  id: number;
  customer_id: string;
  staff_id: string;
  store_id: number;
  menu_id: number;
  date: string;
  start_time: string;
  end_time: string;
  status: ReservationStatus;
  created_at: string;
}

// 조인된 데이터 타입
export interface StoreWithDetails extends Store {
  menus: Menu[];
  admins: Profile[];
  staff: Profile[];
}

export interface ScheduleWithDetails extends Schedule {
  store: Store;
  staff: Profile;
}

export interface ReservationWithDetails extends Reservation {
  store: Store;
  staff: Profile;
  customer: Profile;
  menu: Menu;
}

// 직원 확장 타입 (검색용)
export interface StaffWithStores extends Profile {
  stores: number[];
  workingToday: boolean;
}
