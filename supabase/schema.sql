-- 사용자 프로필 테이블
CREATE TABLE profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  email TEXT NOT NULL,
  name TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('owner', 'admin', 'staff', 'customer')),
  phone TEXT,
  profile_image TEXT,
  bio TEXT,
  specialties TEXT[],
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 가게 테이블
CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  owner_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 가게-관리자 연결 테이블
CREATE TABLE store_admins (
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE,
  admin_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  PRIMARY KEY (store_id, admin_id)
);

-- 가게-직원 연결 테이블
CREATE TABLE store_staff (
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  PRIMARY KEY (store_id, staff_id)
);

-- 메뉴 테이블
CREATE TABLE menus (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  price INTEGER NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 스케줄 테이블
CREATE TABLE schedules (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  type TEXT NOT NULL DEFAULT 'regular' CHECK (type IN ('regular', 'substitute', 'temporary')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 예약 테이블
CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  customer_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE NOT NULL,
  menu_id INTEGER REFERENCES menus(id) ON DELETE CASCADE NOT NULL,
  date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'cancelled', 'completed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS (Row Level Security) 정책
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE stores ENABLE ROW LEVEL SECURITY;
ALTER TABLE store_admins ENABLE ROW LEVEL SECURITY;
ALTER TABLE store_staff ENABLE ROW LEVEL SECURITY;
ALTER TABLE menus ENABLE ROW LEVEL SECURITY;
ALTER TABLE schedules ENABLE ROW LEVEL SECURITY;
ALTER TABLE reservations ENABLE ROW LEVEL SECURITY;

-- 프로필: 모든 인증된 사용자가 조회 가능, 본인만 수정 가능
CREATE POLICY "프로필 조회" ON profiles FOR SELECT TO authenticated USING (true);
CREATE POLICY "본인 프로필 수정" ON profiles FOR UPDATE TO authenticated USING (auth.uid() = id);

-- 가게: 모든 인증된 사용자가 조회 가능
CREATE POLICY "가게 조회" ON stores FOR SELECT TO authenticated USING (true);
CREATE POLICY "사장 가게 관리" ON stores FOR ALL TO authenticated USING (owner_id = auth.uid());

-- 가게-관리자: 조회 가능
CREATE POLICY "가게 관리자 조회" ON store_admins FOR SELECT TO authenticated USING (true);
CREATE POLICY "가게 관리자 관리" ON store_admins FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid()));

-- 가게-직원: 조회 가능
CREATE POLICY "가게 직원 조회" ON store_staff FOR SELECT TO authenticated USING (true);
CREATE POLICY "가게 직원 관리" ON store_staff FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_id AND store_admins.admin_id = auth.uid())
  );

-- 메뉴: 모든 인증된 사용자가 조회 가능
CREATE POLICY "메뉴 조회" ON menus FOR SELECT TO authenticated USING (true);
CREATE POLICY "메뉴 관리" ON menus FOR ALL TO authenticated
  USING (
    EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = store_id AND store_admins.admin_id = auth.uid())
  );

-- 스케줄: 조회 가능, 본인/관리자 수정 가능
CREATE POLICY "스케줄 조회" ON schedules FOR SELECT TO authenticated USING (true);
CREATE POLICY "직원 스케줄 등록" ON schedules FOR INSERT TO authenticated WITH CHECK (staff_id = auth.uid());
CREATE POLICY "스케줄 관리" ON schedules FOR UPDATE TO authenticated
  USING (
    staff_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = schedules.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
  );

-- 예약: 관련자만 조회/수정 가능
CREATE POLICY "예약 조회" ON reservations FOR SELECT TO authenticated
  USING (
    customer_id = auth.uid()
    OR staff_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = reservations.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
  );
CREATE POLICY "고객 예약 생성" ON reservations FOR INSERT TO authenticated WITH CHECK (customer_id = auth.uid());
CREATE POLICY "예약 관리" ON reservations FOR UPDATE TO authenticated
  USING (
    customer_id = auth.uid()
    OR staff_id = auth.uid()
    OR EXISTS (SELECT 1 FROM store_admins WHERE store_admins.store_id = reservations.store_id AND store_admins.admin_id = auth.uid())
    OR EXISTS (SELECT 1 FROM stores WHERE stores.id = store_id AND stores.owner_id = auth.uid())
  );

-- 인덱스
CREATE INDEX idx_schedules_date ON schedules(date);
CREATE INDEX idx_schedules_staff ON schedules(staff_id);
CREATE INDEX idx_schedules_store ON schedules(store_id);
CREATE INDEX idx_reservations_date ON reservations(date);
CREATE INDEX idx_reservations_customer ON reservations(customer_id);
CREATE INDEX idx_reservations_staff ON reservations(staff_id);
CREATE INDEX idx_reservations_store ON reservations(store_id);

-- 프로필 자동 생성 함수 (회원가입 시)
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, name, role)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'name', NEW.email),
    COALESCE(NEW.raw_user_meta_data->>'role', 'customer')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 트리거
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
