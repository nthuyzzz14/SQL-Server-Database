USE QLDH
GO

CREATE TABLE SinhVien
(
  MaSV CHAR(10),
  Name NVARCHAR(50),
  NgaySinh DATE,
  SDT INT,
  EMAIL VARCHAR(40),
  DiaChi CHAR(20) 
)
GO


-- Thêm dữ liệu
--  Kiểu số -> số bình thường
-- Kiểu ký tự hoặc ngày cần đề cập trong nháy đơn
-- Nếu là unicode thì cần có N phía trước cặp nháy đơn
INSERT INTO SinhVien(
  MaSV,
  Name,
  NgaySinh,
  SDT,
  EMAIL,
  DiaChi
)
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        0336049655, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        0336049655, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        0336049655, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        0336049655, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        03360349655, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        03360496355, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        03360496535, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        03360496553, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

INSERT INTO SinhVien
VALUES (
        'ms001', 
        N'Ma Thanh Thuỷ', 
        GETDATE(), 
        03360496553, 
        'mathanhthuyreal207@gmail.com', 
        'Yen Trach'
      )

-- Xoá dữ liệu có điều kiện (where)
-- Nếu chỉ <tên bảng> => xoá toàn bộ dữ liệu trong bảng
-- Xoá các field mong muốn thêm WHERE
-- Các toán tử:
-- < , > , <= , >= , <> , AND , OR , =

-- Xoá toàn bộ bảng
DELETE dbo.SinhVien

-- Xoá dữ liệu với điều kiện
DELETE SinhVien 
WHERE SDT > 10

-- update dư liệu toàn bộ bảng với một trường update

-- Update dữ liệu toàn bộ bảng với nhiều trường update
UPDATE dbo.SinhVien 
SET SDT = 1, Name = 'deptrai'

-- Update dữ liệu của trường mong muốn
UPDATE dbo.SinhVien SET SDT = 99999999999 WHERE Name = 30