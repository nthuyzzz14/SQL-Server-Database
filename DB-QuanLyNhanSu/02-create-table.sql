USE QLNhanSu
GO

-- Cau 1:
CREATE TABLE PhongBan(
  MaPB CHAR(5) PRIMARY KEY NOT NULL,
  TenPB NVARCHAR(30),
  DiaDiem NVARCHAR(50)
)

CREATE TABLE NhanVien(
  MaNV CHAR(5) PRIMARY KEY NOT NULL,
  MaPB CHAR(5),
  HoTen NVARCHAR(50),
  NgaySinh SMALLDATETIME,
  ChucVu NVARCHAR(40),
  GhiChu NVARCHAR(30),

  CONSTRAINT MaPB_FK --đặt tên cho khoá ngoại
    FOREIGN KEY (MaPB) -- MaPB trong NhanVien
    REFERENCES PhongBan(MaPB) -- Tham chiếu tới MaPB từ bảng PHongBan
)

CREATE TABLE BangLUong(
  MaNV CHAR(5),
  Thang INT,
  Nam INT,
  LuongCoBan DECIMAL,
  PhuCap DECIMAL

  CONSTRAINT MaNV_FK -- Đặt tên cho khoá ngoại
    FOREIGN KEY (MaNV) -- Tạo Khoá ngoại với thuộc tính MaNV
    REFERENCES NhanVIen(MaNV) -- Tham chiéu tơi MaNV Tỏng NhanVIen
)
GO 

-- cau 2:
ALTER TABLE NhanVien 
ADD DienThoai NVARCHAR(15)
GO

-- Cau 3
ALTER TABLE NhanVien -- Yêu càu chỉnh sửa bảng
DROP COLUMN GhiChu
GO

SELECT * from NhanVien