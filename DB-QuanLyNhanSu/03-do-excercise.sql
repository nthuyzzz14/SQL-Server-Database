USE QLNhanSu
GO

-- cau 4:
-- 3 phong ban
INSERT INTO PhongBan(MaPB, TenPB, DiaDiem)
VALUES
('PB01', N'Phòng kế toán', N'Tầng 2'),
('PB02', N'Phòng nhân sự', N'Tầng 1'),
('PB03', N'Phòng kỹ thuật', N'Tầng 3')
GO

-- 5 Nhan vien
INSERT INTO NhanVien(MaNV, MaPB, HoTen, NgaySinh, ChucVu, DienThoai)
VALUES
('NV01', 'PB01', N'Ma Thanh Thuỷ', '2007-08-14', N'Sếp tổng', '012345678891'),
('NV02', 'PB01', N'Ma Thanh Thuỷ', '2007-08-14', N'Sếp tổng', '012345678891'),
('NV03', 'PB03', N'Ma Thanh Thuỷ', '2007-08-14', N'Sếp tổng', '012345678891'),
('NV04', 'PB02', N'Ma Thanh Thuỷ', '2007-08-14', N'Sếp tổng', '012345678891'),
('NV05', 'PB02', N'Ma Thanh Thuỷ', '2007-08-14', N'Sếp tổng', '012345678891')
GO
SELECT * FROM NhanVien

--- 8 bang luong
INSERT INTO BangLUong (MaNV, Thang, Nam, LuongCoBan, PhuCap)
VALUES
('NV01', 1, 2026, 8000000, 1000000), 
('NV01', 1, 2026, 8000000, 1000000), 
('NV02', 2, 2026, 8000000, 1000000), 
('NV03', 1, 2026, 8000000, 1000000), 
('NV04', 2, 2026, 8000000, 1000000), 
('NV05', 1, 2026, 8000000, 1000000), 
('NV05', 1, 2026, 8000000, 1000000), 
('NV03', 2, 2026, 8000000, 1000000)
GO 
SELECT * FROM BangLUong

-- Tang phuh cap cho PB01

SELECT NhanVien.MaNV,
      PhongBan.MaPB,
      BangLUong.PhuCap
FROM NhanVien
JOIN PhongBan
  ON NhanVien.MaPB = PhongBan.MaPB
JOIN BangLUong
  ON NhanVien.MaNV = BangLUong.MaNV

UPDATE BangLUong
SET PhuCap = PhuCap + 200000 -- Xác định được tăng cái gì
FROM BangLUong
JOIN NhanVien
  ON BangLUong.MaNV = NhanVien.MaNV
WHERE NhanVien.MaPB = 'PB01'; -- xác định ai được tăng 

-- cau 5:
SELECT *
FROM NhanVien
WHERE NgaySinh
BETWEEN ('1985') AND ('1995')
GO

-- Cau 6:
SELECT NhanVien.MaNV,
      NhanVien.HoTen,
      NhanVien.ChucVu
FROM NhanVien
WHERE ChucVu LIKE '%Trưởng%'
GO

-- Cau 7:
SELECT *
FROM NhanVien
LEFT JOIN BangLUong
  ON NhanVien.MaNV = BangLUong.MaNV
WHERE BangLUong.MaNV IS NULL
GO

-- Cau 8:
SELECT NhanVien.HoTen,
      PhongBan.TenPB,
      BangLUong.Thang,
      BangLUong.Nam,
      (BangLUong.LuongCoBan + BangLUong.PhuCap) AS TongThuNhap
FROM NhanVien
JOIN PhongBan
  ON NhanVien.MaPB = PhongBan.MaPB
JOIN BangLUong
  ON NhanVien.MaNV = BangLUong.MaNV
ORDER BY TongThuNhap DESC

-- Cau 9:
SELECT NhanVien.MaPB,
      SUM(BangLUong.LuongCoBan + BangLUong.PhuCap) AS TongQUyPhaiChi
FROM NhanVien
JOIN BangLUong
  ON NhanVien.MaNV = BangLUong.MaNV
GROUP BY NhanVien.MaPB
GO

-- Cau 10:
SELECT NhanVien.MaPB,
      COUNT(*) SoNhanVien
FROM NhanVien
GROUP BY NhanVien.MaPB
HAVING COUNT(*) >= 2