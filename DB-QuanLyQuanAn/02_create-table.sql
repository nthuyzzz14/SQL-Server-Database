USE QLQuanAn
GO

-- Tao tables
CREATE TABLE BAN(
  MaBan CHAR(5) PRIMARY KEY,
  ViTri NVARCHAR(10),
  SoCho INT
)
GO

CREATE TABLE MonAn(
  MaMon CHAR(5) PRIMARY KEY,
  TenMon NVARCHAR(30),
  DonGia INT,
  GhiChu NVARCHAR(100)
)
GO

CREATE TABLE HoaDon(
  SoHD CHAR(5) PRIMARY KEY,
  MaBan CHAR(5),
  NgayLap SMALLDATETIME

  -- tao khoa ngoai
  CONSTRAINT MaBan_FK -- dat ten cho khoa ngoai
    FOREIGN KEY (MaBan) -- Day la MaBan trong bang HoaDon
    REFERENCES BAN(MaBan) -- Tham chieu toi bang BAN tao su nhat quan data
)
GO

CREATE TABLE CTHoaDon (
  SoHD CHAR(5),
  MaMon CHAR(5),
  SoLuong INT

  -- Tao 2 khoa ngoai 
  CONSTRAINT CTHD_HD_FK
    FOREIGN KEY (SoHD)
    REFERENCES HoaDon(SoHD),
    -- Tham chieu toi bang HoaDon cho biết chi tiết hoá đơn

  CONSTRAINT CTHD_MON_FK
    FOREIGN KEY (MaMon)
    REFERENCES MonAn(MaMon),
  -- Tham chiếu tới bảng MonAn cho biết gọi món nào

  PRIMARY KEY (SoHD, MaMon)
  -- tạo 2 khoá chính để xác dịnh duy nhất 1 dòng tránh trùng lặp
)
GO

-- Cau 2: Them col vao table MonAn
ALTER TABLE MonAn 
ADD LoaiMon NVARCHAR(50)
GO
