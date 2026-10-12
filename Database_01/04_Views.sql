USE QLCuaHang;
GO

IF OBJECT_ID('dbo.vw_ChiTietHoaDon','V') IS NOT NULL DROP VIEW dbo.vw_ChiTietHoaDon;
GO
CREATE VIEW vw_ChiTietHoaDon
AS
SELECT
    HD.MaHoaDon,
    HD.NgayLap,
    CN.TenChiNhanh,
    KH.HoTen AS TenKhachHang,
    NV.HoTen AS TenNhanVien,
    SP.MaSanPham,
    SP.TenSanPham,
    DM.TenDanhMuc,
    CTHD.SoLuong,
    CTHD.DonGiaBan,
    CTHD.GiamGia,
    (CTHD.SoLuong * CTHD.DonGiaBan - CTHD.GiamGia) AS ThanhTien
FROM HoaDon HD
JOIN ChiTietHoaDon CTHD ON HD.MaHoaDon = CTHD.MaHoaDon
JOIN SanPham SP ON CTHD.MaSanPham = SP.MaSanPham
JOIN DanhMuc DM ON SP.MaDanhMuc = DM.MaDanhMuc
JOIN NhanVien NV ON HD.MaNhanVien = NV.MaNhanVien
JOIN ChiNhanh CN ON HD.MaChiNhanh = CN.MaChiNhanh
LEFT JOIN KhachHang KH ON HD.MaKhachHang = KH.MaKhachHang;
GO

IF OBJECT_ID('dbo.vw_DoanhThuHoaDon','V') IS NOT NULL DROP VIEW dbo.vw_DoanhThuHoaDon;
GO
CREATE VIEW vw_DoanhThuHoaDon
AS
SELECT
    HD.MaHoaDon,
    HD.NgayLap,
    HD.MaKhachHang,
    HD.MaNhanVien,
    HD.MaChiNhanh,
    SUM(CTHD.SoLuong * CTHD.DonGiaBan - CTHD.GiamGia) AS TongTien
FROM HoaDon HD
JOIN ChiTietHoaDon CTHD ON HD.MaHoaDon = CTHD.MaHoaDon
GROUP BY
    HD.MaHoaDon, HD.NgayLap, HD.MaKhachHang,
    HD.MaNhanVien, HD.MaChiNhanh;
GO

IF OBJECT_ID('dbo.vw_SanPhamSapHet','V') IS NOT NULL DROP VIEW dbo.vw_SanPhamSapHet;
GO
CREATE VIEW vw_SanPhamSapHet
AS
SELECT
    MaSanPham, TenSanPham, SoLuongTon, MucTonToiThieu
FROM SanPham
WHERE TrangThai = 1
  AND SoLuongTon <= MucTonToiThieu;
GO
