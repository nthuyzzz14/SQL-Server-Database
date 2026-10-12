USE QLCuaHang;
GO

/* Lưu ý:
   Trigger này dùng khi thêm chi tiết hóa đơn.
   Trong môi trường thực tế cần xử lý cả UPDATE/DELETE.
*/

IF OBJECT_ID('dbo.trg_GiamTonKhiBan','TR') IS NOT NULL DROP TRIGGER dbo.trg_GiamTonKhiBan;
GO
CREATE TRIGGER trg_GiamTonKhiBan
ON ChiTietHoaDon
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE SP
    SET SP.SoLuongTon = SP.SoLuongTon - I.SoLuong
    FROM SanPham SP
    JOIN inserted I
        ON SP.MaSanPham = I.MaSanPham;
END
GO

IF OBJECT_ID('dbo.trg_TangTonKhiNhap','TR') IS NOT NULL DROP TRIGGER dbo.trg_TangTonKhiNhap;
GO
CREATE TRIGGER trg_TangTonKhiNhap
ON ChiTietPhieuNhap
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE SP
    SET SP.SoLuongTon = SP.SoLuongTon + I.SoLuong
    FROM SanPham SP
    JOIN inserted I
        ON SP.MaSanPham = I.MaSanPham;
END
GO
