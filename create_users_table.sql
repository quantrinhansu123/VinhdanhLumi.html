-- Tạo bảng users trong Supabase
-- Chạy SQL này trong Supabase Dashboard > SQL Editor

CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    "Họ Và Tên" TEXT,
    "Email" TEXT UNIQUE NOT NULL,
    "Team" TEXT,
    "Vị trí" TEXT,
    "chi nhánh" TEXT,
    "ca" TEXT,
    "link_anh" TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tạo index cho Email để tìm kiếm nhanh
CREATE INDEX IF NOT EXISTS idx_users_email ON users(Email);

-- Tạo trigger để tự động cập nhật updated_at
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'update_updated_at_column') THEN
        CREATE OR REPLACE FUNCTION update_updated_at_column()
        RETURNS TRIGGER AS $$
        BEGIN
            NEW.updated_at = NOW();
            RETURN NEW;
        END;
        $$ language 'plpgsql';
    END IF;
END $$;

DROP TRIGGER IF EXISTS update_users_updated_at ON users;
CREATE TRIGGER update_users_updated_at 
    BEFORE UPDATE ON users
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Thêm comment cho bảng
COMMENT ON TABLE users IS 'Bảng quản lý nhân sự - sử dụng Email làm unique key';
