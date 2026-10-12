USE QLCuaHang;
GO

/* Chạy lại script an toàn: xóa theo thứ tự phụ thuộc */
IF OBJECT_ID('dbo.ChiTietHoaDon','U') IS NOT NULL DROP TABLE dbo.ChiTietHoaDon;
IF OBJECT_ID('dbo.HoaDon','U') IS NOT NULL DROP TABLE dbo.HoaDon;
IF OBJECT_ID('dbo.ChiTietPhieuNhap','U') IS NOT NULL DROP TABLE dbo.ChiTietPhieuNhap;
IF OBJECT_ID('dbo.PhieuNhap','U') IS NOT NULL DROP TABLE dbo.PhieuNhap;
IF OBJECT_ID('dbo.SanPham','U') IS NOT NULL DROP TABLE dbo.SanPham;
IF OBJECT_ID('dbo.DanhMuc','U') IS NOT NULL DROP TABLE dbo.DanhMuc;
IF OBJECT_ID('dbo.NhaCungCap','U') IS NOT NULL DROP TABLE dbo.NhaCungCap;
IF OBJECT_ID('dbo.KhachHang','U') IS NOT NULL DROP TABLE dbo.KhachHang;
IF OBJECT_ID('dbo.NhanVien','U') IS NOT NULL DROP TABLE dbo.NhanVien;
IF OBJECT_ID('dbo.ChiNhanh','U') IS NOT NULL DROP TABLE dbo.ChiNhanh;
GO

/* 1 */
CREATE TABLE ChiNhanh
(
    MaChiNhanh VARCHAR(10) NOT NULL,
    TenChiNhanh NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200) NOT NULL,
    SoDienThoai VARCHAR(20) NULL,
    CONSTRAINT PK_ChiNhanh PRIMARY KEY (MaChiNhanh)
);
GO

/* 2 */
CREATE TABLE NhanVien
(
    MaNhanVien VARCHAR(10) NOT NULL,
    HoTen NVARCHAR(100) NOT NULL,
    GioiTinh NVARCHAR(10) NULL,
    NgaySinh DATE NULL,
    SoDienThoai VARCHAR(20) NULL,
    Email VARCHAR(100) NULL,
    ChucVu NVARCHAR(50) NOT NULL,
    NgayVaoLam DATE NOT NULL,
    MaChiNhanh VARCHAR(10) NOT NULL,
    CONSTRAINT PK_NhanVien PRIMARY KEY (MaNhanVien),
    CONSTRAINT FK_NhanVien_ChiNhanh FOREIGN KEY (MaChiNhanh)
        REFERENCES ChiNhanh(MaChiNhanh)
);
GO

/* 3 */
CREATE TABLE KhachHang
(
    MaKhachHang VARCHAR(10) NOT NULL,
    HoTen NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(20) NULL,
    Email VARCHAR(100) NULL,
    DiaChi NVARCHAR(200) NULL,
    NgayDangKy DATE NOT NULL,
    DiemTichLuy INT NOT NULL DEFAULT 0,
    CONSTRAINT PK_KhachHang PRIMARY KEY (MaKhachHang),
    CONSTRAINT CK_KhachHang_Diem CHECK (DiemTichLuy >= 0)
);
GO

/* 4 */
CREATE TABLE NhaCungCap
(
    MaNhaCungCap VARCHAR(10) NOT NULL,
    TenNhaCungCap NVARCHAR(150) NOT NULL,
    SoDienThoai VARCHAR(20) NULL,
    Email VARCHAR(100) NULL,
    DiaChi NVARCHAR(200) NULL,
    CONSTRAINT PK_NhaCungCap PRIMARY KEY (MaNhaCungCap)
);
GO

/* 5 */
CREATE TABLE DanhMuc
(
    MaDanhMuc VARCHAR(10) NOT NULL,
    TenDanhMuc NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_DanhMuc PRIMARY KEY (MaDanhMuc)
);
GO

/* 6 */
CREATE TABLE SanPham
(
    MaSanPham VARCHAR(10) NOT NULL,
    TenSanPham NVARCHAR(150) NOT NULL,
    MaDanhMuc VARCHAR(10) NOT NULL,
    DonViTinh NVARCHAR(30) NOT NULL,
    GiaNhap DECIMAL(18,2) NOT NULL,
    GiaBan DECIMAL(18,2) NOT NULL,
    SoLuongTon INT NOT NULL DEFAULT 0,
    MucTonToiThieu INT NOT NULL DEFAULT 10,
    TrangThai BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_SanPham PRIMARY KEY (MaSanPham),
    CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (MaDanhMuc)
        REFERENCES DanhMuc(MaDanhMuc),
    CONSTRAINT CK_SanPham_GiaNhap CHECK (GiaNhap >= 0),
    CONSTRAINT CK_SanPham_GiaBan CHECK (GiaBan >= GiaNhap),
    CONSTRAINT CK_SanPham_Ton CHECK (SoLuongTon >= 0),
    CONSTRAINT CK_SanPham_MucTon CHECK (MucTonToiThieu >= 0)
);
GO

/* 7 */
CREATE TABLE PhieuNhap
(
    MaPhieuNhap VARCHAR(10) NOT NULL,
    NgayNhap DATETIME NOT NULL,
    MaNhaCungCap VARCHAR(10) NOT NULL,
    MaNhanVien VARCHAR(10) NOT NULL,
    MaChiNhanh VARCHAR(10) NOT NULL,
    GhiChu NVARCHAR(255) NULL,
    CONSTRAINT PK_PhieuNhap PRIMARY KEY (MaPhieuNhap),
    CONSTRAINT FK_PhieuNhap_NCC FOREIGN KEY (MaNhaCungCap)
        REFERENCES NhaCungCap(MaNhaCungCap),
    CONSTRAINT FK_PhieuNhap_NV FOREIGN KEY (MaNhanVien)
        REFERENCES NhanVien(MaNhanVien),
    CONSTRAINT FK_PhieuNhap_CN FOREIGN KEY (MaChiNhanh)
        REFERENCES ChiNhanh(MaChiNhanh)
);
GO

/* 8 */
CREATE TABLE ChiTietPhieuNhap
(
    MaPhieuNhap VARCHAR(10) NOT NULL,
    MaSanPham VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    DonGiaNhap DECIMAL(18,2) NOT NULL,
    CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY (MaPhieuNhap, MaSanPham),
    CONSTRAINT FK_CTPN_PN FOREIGN KEY (MaPhieuNhap)
        REFERENCES PhieuNhap(MaPhieuNhap),
    CONSTRAINT FK_CTPN_SP FOREIGN KEY (MaSanPham)
        REFERENCES SanPham(MaSanPham),
    CONSTRAINT CK_CTPN_SoLuong CHECK (SoLuong > 0),
    CONSTRAINT CK_CTPN_DonGia CHECK (DonGiaNhap >= 0)
);
GO

/* 9 */
CREATE TABLE HoaDon
(
    MaHoaDon VARCHAR(10) NOT NULL,
    NgayLap DATETIME NOT NULL,
    MaKhachHang VARCHAR(10) NULL,
    MaNhanVien VARCHAR(10) NOT NULL,
    MaChiNhanh VARCHAR(10) NOT NULL,
    PhuongThucThanhToan NVARCHAR(30) NOT NULL,
    TrangThai NVARCHAR(30) NOT NULL DEFAULT N'Hoàn tất',
    CONSTRAINT PK_HoaDon PRIMARY KEY (MaHoaDon),
    CONSTRAINT FK_HoaDon_KH FOREIGN KEY (MaKhachHang)
        REFERENCES KhachHang(MaKhachHang),
    CONSTRAINT FK_HoaDon_NV FOREIGN KEY (MaNhanVien)
        REFERENCES NhanVien(MaNhanVien),
    CONSTRAINT FK_HoaDon_CN FOREIGN KEY (MaChiNhanh)
        REFERENCES ChiNhanh(MaChiNhanh)
);
GO

/* 10 */
CREATE TABLE ChiTietHoaDon
(
    MaHoaDon VARCHAR(10) NOT NULL,
    MaSanPham VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    DonGiaBan DECIMAL(18,2) NOT NULL,
    GiamGia DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT PK_ChiTietHoaDon PRIMARY KEY (MaHoaDon, MaSanPham),
    CONSTRAINT FK_CTHD_HD FOREIGN KEY (MaHoaDon)
        REFERENCES HoaDon(MaHoaDon),
    CONSTRAINT FK_CTHD_SP FOREIGN KEY (MaSanPham)
        REFERENCES SanPham(MaSanPham),
    CONSTRAINT CK_CTHD_SoLuong CHECK (SoLuong > 0),
    CONSTRAINT CK_CTHD_DonGia CHECK (DonGiaBan >= 0),
    CONSTRAINT CK_CTHD_GiamGia CHECK (GiamGia >= 0 AND GiamGia <= DonGiaBan * SoLuong)
);
GO
