USE QLQuanAn
GO

-- Cau 3: 
ALTER TABLE MonAn
DROP COLUMN GhiChu
GO

--Cau 4:
-- 4 BAN
INSERT INTO BAN
VALUES (
  'B01', N'Tầng 1', 4
)

INSERT INTO  BAN
VALUES(
  'B02', N'Tầng 1', 3
)

INSERT INTO BAN
VALUES(
  'B03', N'Tầng 2', 7
)
INSERT INTO BAN
VALUES (
  'B04', N'Tầng 2', 6
)

-- 5 MON
INSERT INTO MonAn
VALUES(
  'M01', N'Phở bò', 35000, N'Món nước'
)

INSERT INTO MonAn
VALUES(
  'M02', N'Gỏi cuốn', 15000, N'Món cuốn'
)

INSERT INTO MonAn
VALUES(
  'M03', N'Thịt kho tàu', 30000, N'Món mặn'
)

INSERT INTO MonAn
VALUES(
  'M04', N'Bún chả', 40000, N'Món nướng kèm bún'
)

INSERT INTO MonAn
VALUES(
  'M05', N'Chè đậu đỏ', 20000, N'Món tráng miệng'
)

INSERT INTO MonAn
VALUES(
  'M06', N'Chè dừa', 15000, N'Món Tráng miệng'
)

SELECT * 
FROM MonAn
GO


-- 3 Hoa don
INSERT INTO HoaDon
VALUES(
  'H01', 'B02', 2026-01-09
)

INSERT INTO HoaDon
VALUES(
  'H02', 'B01', 2026-01-10
)

INSERT INTO HoaDon
VALUES(
  'H03', 'B03', 2026-01-11
)

-- 7 Chi tiet hoa don
INSERT INTO CTHoaDon
VALUES(
  'H01', 'M03', 3
)

INSERT INTO CTHoaDon
VALUES(
  'H01', 'M01', 1
)

INSERT INTO CTHoaDon
VALUES(
  'H02', 'M04', 2
)

INSERT INTO CTHoaDon
VALUES(
  'H02', 'M05', 5
)

INSERT INTO CTHoaDon
VALUES(
  'H03', 'M02', 8
)

-- Update gia MonAn them 5%
UPDATE MonAn
SET DonGia = DonGia * 105 / 100
WHERE MaMon = 'M01'

UPDATE MonAn
SET DonGia = DonGia * 105 / 100
WHERE MaMon = 'M02'

UPDATE MonAn 
SET DonGia = DonGia * 105 / 100
WHERE MaMon = 'M03'

UPDATE MonAn
SET DonGia = DonGia * 105 / 100
WHERE MaMon = 'M04'

UPDATE MonAn
SET DonGia = DonGia * 105 / 100
WHERE MaMon = 'M05'

-- Cau 5:
SELECT * 
FROM MonAN
WHERE DonGia
BETWEEN 30000 AND 80000
GO

-- Cau 8:
SELECT TenMon AS N'Tên Món', DonGia AS N'Đơn Giá'
FROM MonAn
WHERE TenMon LIKE N'%gà%'
GO
-- Chỉ đổi tên 2 hàng khi đúng điều kiện là %gà%

-- Cau 7:
SELECT * 
FROM MonAn
WHERE MaMon NOT IN (
  SELECT MaMon
  FROM CTHoaDon
)
-- Lấy ra MonAn mà MaMon không nằm trong MaMon của CTHoaDon

--Cau 8: Liet ke chi tiet hoa don gom: 

-- INNER: Chỉ lấy phần chung
-- INNER LEFT: giữ hết bên trái bên phải xuất hiện nhưng trái 0 thì ghi null
-- RIGHT: lấy hết bên phải (trái không có ghi null)
-- FULL: giữ cả 2 : nếu 1 trong 2 bên không có thì ghi null

SELECT HoaDon.SoHD, -- Lấy SoHD
        BAN.ViTri, -- Lấy ViTri
        MonAn.TenMon, -- lấy TenMon
        CTHoaDon.SoLuong, -- Lấy SoLuong
        --Tạo cột thành tiền
        CTHoaDon.SoLuong * MonAn.DonGia AS ThanhTien
  -- Chọn các cột từ các bảng khác nhau
  -- Và tạo thêm 1 cột từ 2 cột SoLuong và DonGia để tạo cột Thanh tiền
  -- Bảng bao gồm
  -- SoHD -> Bảng HoaDon
  -- ViTri -> Bảng BAN
  -- TenMon -> Bảng MonAn
  -- ThanhTien -> Từ SoLuong * DonGia
FROM HoaDon

-- Chỉ nối cac bảng lại với nhau
-- Select sẽ hiển thị tất cả col được yêu cầu 
-- QUY TẮC NỐI: yêu cầu cùng kiểu dữ liệu
JOIN CTHoaDon -- Lấy SoHD
  ON HoaDon.SoHD = CTHoaDon.SoHD

JOIN BAN -- Lấy ViTri
  ON HoaDon.MaBan = BAN.MaBan

JOIN MonAn -- Lấy TenMon
  ON CTHoaDon.MaMon = MonAn.MaMon

ORDER BY HoaDon.SoHD,
          ThanhTien
        DESC -- Giam dan


-- Cau 9: Tính tổng tiền từng hoá đơn
SELECT HoaDon.SoHD,
      SUM(CTHoaDon.SoLuong * MonAn.DonGia) AS TongTien
FROM CTHoaDon

JOIN HoaDon
  ON CTHoaDon.SoHD = HoaDon.SoHD
JOIN MonAn
  ON CTHoaDon.MaMon = MonAn.MaMon

GROUP BY HoaDon.SoHD -- Nhóm tổng tiền dựa vào SoHD
-- Nếu có 2 HD01 thì cộng cả 2

-- Cau 10:
SELECT CTHoaDon.MaMon,
      MonAn.TenMon,
      SUM(CTHoaDon.SoLuong) As TongSoLuong
FROM CTHoaDon
JOIN MonAn
  ON CTHoaDon.MaMon = MonAn.MaMon
GROUP BY CTHoaDon.MaMon, MonAn.TenMon
-- Sau khi nhóm xong thì tới điều kiện ta cần lọc
-- VD: sau khi GROUP BY được các nhsom có: 3 , 5, 6 ,23, 32 lượt gọi
-- Ta dùng HAVING để lọc SoLuong > 5
HAVING SUM(CTHoaDon.SoLuong) > 3

