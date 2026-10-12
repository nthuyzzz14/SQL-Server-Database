use QLCuaHang;

-- MUC 1
-- cau 1:
select * from SanPham
GO

-- cau 2:
SELECT MaSanPham, TenSanPham, GiaBan
From SanPham
WHERE GiaBan > 20.000
GO

-- Cau 3:
SELECT * 
From SanPham
WHERE SoLuongTon <= MucTonToiThieu;
GO

-- cau 4:
SELECT *
FROM KhachHang
WHERE DiaChi = 'Thái Nguyên'
GO

-- cau 5:
SELECT *
FROM NhanVien
WHERE ChucVu = 'Bán Hàng'
GO

-- cau 6:
SELECT *
FROM SanPham
ORDER BY GiaBan DESC;
GO

-- cau 7:
SELECT *
FROM SanPham
WHERE TenSanPham = 'Bánh';
GO

-- MŨc 2

-- cau 8:
SELECT *
FROM SanPham sp
JOIN DanhMuc dm
ON sp.MaSanPham = dm.MaDanhMuc
GO