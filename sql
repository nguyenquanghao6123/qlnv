IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'QuanLyNhanVien')
BEGIN
    CREATE DATABASE QuanLyNhanVien;
END
GO

-- 2. Sử dụng cơ sở dữ liệu
USE QuanLyNhanVien;
GO


-- 3. Tạo bảng NhanVien (giữ nguyên)
CREATE TABLE NhanVien (
    MaNhanVien INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    ChucVu NVARCHAR(50),
    SoDienThoai VARCHAR(15) UNIQUE
);
GO

-- 4. Tạo bảng LuongNhanVien (KHÔNG có MaLuong)
CREATE TABLE LuongNhanVien (
    MaNhanVien INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    LuongNhanVien DECIMAL(18, 2) NOT NULL,
    ChucVu NVARCHAR(50),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);
GO

-- Tạo bảng ThongTinCVThangToi
CREATE TABLE ThongTinCVThangToi (
    MaNhanVien INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    ChucVu NVARCHAR(50),
    Thang INT NOT NULL,
    CongViecCanLam NVARCHAR(200),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);
GO


-- 6. Thêm dữ liệu mẫu vào NhanVien
INSERT INTO NhanVien (HoTen, ChucVu, SoDienThoai)
VALUES
(N'Nguyễn Văn A', N'Nhân viên', '0912345678'),
(N'Trần Thị B', N'Quản lý', '0987654321'),
(N'Lê Văn C', N'Trưởng phòng', '0901111222');
GO

-- 7. Thêm dữ liệu mẫu vào LuongNhanVien
INSERT INTO LuongNhanVien (MaNhanVien, HoTen, LuongNhanVien, ChucVu)
VALUES
(1, N'Nguyễn Văn A', 10000000, N'Nhân viên'),
(2, N'Trần Thị B', 15000000, N'Quản lý'),
(3, N'Lê Văn C', 20000000, N'Trưởng phòng');
GO
INSERT INTO ThongTinCVThangToi (MaNhanVien, HoTen, ChucVu, Thang, CongViecCanLam)
VALUES
(1, N'Nguyễn Văn A', N'Nhân viên', 9, N'Hoàn thành báo cáo doanh số'),
(2, N'Trần Thị B', N'Quản lý', 9, N'Kiểm tra kế hoạch đào tạo nhân viên'),
(3, N'Lê Văn C', N'Trưởng phòng', 9, N'Lập kế hoạch ngân sách tháng 10');
GO
