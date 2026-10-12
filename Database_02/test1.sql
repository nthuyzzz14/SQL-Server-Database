-- Sử dụng DAtabase
USE QLDH;
GO

-- GiaoVien có 2 cột thuộc tính
CREATE TABLE GiaoVien
(
  MaGV NVARCHAR (10),
  Name NVARCHAR (100)
)


CREATE TABLE HocSinh
(
  MaHS NVARCHAR (10),
  Name NVARCHAR (100)
)

-- Thêm cột ngày sinh cho HocSinh
ALTER TABLE HocSinh ADD NgaySinh DATE

-- Xoá toàn bộ dữ liệu của bảng
TRUNCATE TABLE HocSinh

--Xoá bảng 
DROP TABLE HocSinh