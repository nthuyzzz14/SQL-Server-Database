USE QLCuaHang;
GO

IF OBJECT_ID('dbo.sp_TimSanPham','P') IS NOT NULL DROP PROCEDURE dbo.sp_TimSanPham;
GO
CREATE PROCEDURE sp_TimSanPham
    @TuKhoa NVARCHAR(100)
AS
BEGIN
    SELECT MaSanPham, TenSanPham, GiaNhap, GiaBan, SoLuongTon
    FROM SanPham
    WHERE TenSanPham LIKE N'%' + @TuKhoa + N'%';
END
GO

IF OBJECT_ID('dbo.sp_DoanhThuTheoNgay','P') IS NOT NULL DROP PROCEDURE dbo.sp_DoanhThuTheoNgay;
GO
CREATE PROCEDURE sp_DoanhThuTheoNgay
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SELECT
        CAST(NgayLap AS DATE) AS Ngay,
        SUM(TongTien) AS DoanhThu
    FROM vw_DoanhThuHoaDon
    WHERE CAST(NgayLap AS DATE) BETWEEN @TuNgay AND @DenNgay
    GROUP BY CAST(NgayLap AS DATE)
    ORDER BY Ngay;
END
GO

IF OBJECT_ID('dbo.sp_SanPhamTheoDanhMuc','P') IS NOT NULL DROP PROCEDURE dbo.sp_SanPhamTheoDanhMuc;
GO
CREATE PROCEDURE sp_SanPhamTheoDanhMuc
    @MaDanhMuc VARCHAR(10)
AS
BEGIN
    SELECT SP.*
    FROM SanPham SP
    WHERE SP.MaDanhMuc = @MaDanhMuc
      AND SP.TrangThai = 1
    ORDER BY SP.GiaBan DESC;
END
GO
