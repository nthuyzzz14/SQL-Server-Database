USE QLCuaHang;
GO

/* Một số đáp án mẫu để đối chiếu sau khi tự làm.
   Không đưa toàn bộ 55 bài, nhằm khuyến khích tự luyện. */

/* Bài 8 */
SELECT SP.MaSanPham, SP.TenSanPham, DM.TenDanhMuc, SP.GiaBan
FROM SanPham SP
JOIN DanhMuc DM ON SP.MaDanhMuc = DM.MaDanhMuc;

/* Bài 13 */
SELECT DM.MaDanhMuc, DM.TenDanhMuc, COUNT(*) AS SoSanPham
FROM DanhMuc DM
JOIN SanPham SP ON DM.MaDanhMuc = SP.MaDanhMuc
GROUP BY DM.MaDanhMuc, DM.TenDanhMuc;

/* Bài 15 */
SELECT SP.MaSanPham, SP.TenSanPham,
       SUM(CT.SoLuong) AS TongSoLuongBan
FROM SanPham SP
JOIN ChiTietHoaDon CT ON SP.MaSanPham = CT.MaSanPham
JOIN HoaDon HD ON CT.MaHoaDon = HD.MaHoaDon
WHERE HD.TrangThai = N'Hoàn tất'
GROUP BY SP.MaSanPham, SP.TenSanPham
ORDER BY TongSoLuongBan DESC;

/* Bài 16 */
SELECT HD.MaHoaDon,
       SUM(CT.SoLuong * CT.DonGiaBan - CT.GiamGia) AS TongTien
FROM HoaDon HD
JOIN ChiTietHoaDon CT ON HD.MaHoaDon = CT.MaHoaDon
GROUP BY HD.MaHoaDon;

/* Bài 20 */
SELECT *
FROM SanPham
WHERE GiaBan > (SELECT AVG(GiaBan) FROM SanPham);

/* Bài 21 */
SELECT *
FROM SanPham
WHERE GiaBan = (SELECT MAX(GiaBan) FROM SanPham);

/* Bài 30 */
SELECT TOP 5
       SP.MaSanPham, SP.TenSanPham,
       SUM(CT.SoLuong) AS SoLuongBan
FROM SanPham SP
JOIN ChiTietHoaDon CT ON SP.MaSanPham = CT.MaSanPham
GROUP BY SP.MaSanPham, SP.TenSanPham
ORDER BY SoLuongBan DESC;

/* Bài 37 */
SELECT TOP 1
       YEAR(HD.NgayLap) AS Nam,
       MONTH(HD.NgayLap) AS Thang,
       SUM(CT.SoLuong * CT.DonGiaBan - CT.GiamGia) AS DoanhThu
FROM HoaDon HD
JOIN ChiTietHoaDon CT ON HD.MaHoaDon = CT.MaHoaDon
GROUP BY YEAR(HD.NgayLap), MONTH(HD.NgayLap)
ORDER BY DoanhThu DESC;

/* Bài 42 */
WITH XepHang AS
(
    SELECT
        DM.MaDanhMuc,
        DM.TenDanhMuc,
        SP.MaSanPham,
        SP.TenSanPham,
        SUM(CT.SoLuong) AS SoLuongBan,
        ROW_NUMBER() OVER
        (
            PARTITION BY DM.MaDanhMuc
            ORDER BY SUM(CT.SoLuong) DESC
        ) AS STT
    FROM DanhMuc DM
    JOIN SanPham SP ON DM.MaDanhMuc = SP.MaDanhMuc
    JOIN ChiTietHoaDon CT ON SP.MaSanPham = CT.MaSanPham
    GROUP BY
        DM.MaDanhMuc, DM.TenDanhMuc,
        SP.MaSanPham, SP.TenSanPham
)
SELECT *
FROM XepHang
WHERE STT <= 2;
GO
