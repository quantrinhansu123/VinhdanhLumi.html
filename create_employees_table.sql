-- Tạo bảng employees trong Supabase
-- Chạy SQL này trong Supabase Dashboard > SQL Editor

CREATE TABLE IF NOT EXISTS employees (
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
CREATE INDEX IF NOT EXISTS idx_employees_email ON employees(Email);

-- Tạo trigger để tự động cập nhật updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_employees_updated_at 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Thêm comment cho bảng
COMMENT ON TABLE employees IS 'Bảng quản lý nhân sự - sử dụng Email làm unique key';
