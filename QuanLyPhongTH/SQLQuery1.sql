Create database QuanLyPhongTH
Go

use QuanLyPhongTH
go

create table PhongMay
(
	SoP int ,
	NguoiQL nvarchar(100),
	SoLuong int,

	-- Tạo rằng buộc: Tạo khoá chính
	Constraint PK_PhongMay primary key (SoP)
)
create table MonHoc
(
	MaMH char(5),
	TenMH nvarchar(100),
	SoTC int,
	SoP int,

	-- Tạo rằng buộc cho MonHoc: khoá chính và khoá ngoại

	-- Khoá chính:
	constraint PK_MonHoc Primary key (MaMH),
	-- Khoá phụ:
	constraint FK_MonHoc_PhongMay Foreign key (SoP) references PhongMay(SoP)
)
create table MayTinh 
(
	SoTT int ,
	CauHinh varchar (70),
	SoP int,

	-- Tạo rằng buộc MayTinh: Khoá chính và khoá ngoại

	-- Khoá chính: có SoTT và SoP
	constraint PK_MayTinh primary key (SoTT, SoP),
	
	--Khoá ngoại: 
	constraint FK_MayTinh_PhongMay foreign key (SoP) references PhongMay(SoP)
)
go


-- Insert dữ liệu
insert into PhongMay (SoP , NguoiQL, SoLuong)
Values
(101,N'Nguyễn Văn An', 40),
(102, N'Trần Thị Bình', 35),
(201, N'Lê Hoàng Cường', 50),
(202, N'Phạm Minh Dũng', 45),
(301, N'Vũ Thuỳ Linh', 30)

insert into MonHoc (MaMH, TenMH, SoTC, SoP)
Values
('IT001', N'Nhập môn lập trình',4 , 101),
('IT002', N'Kỹ thuật lập trình', 3 , 102),
('IT003', N'Cấu trúc DL và GT', 4 , 201),
('IT004', N'Cơ sở dữ liệu', 3, 202),
('IT005', N'Mạng máy tính', 3, 301)

insert into MayTinh (SoTT, CauHinh, SoP)
values
(1, 'Core i5, RAM 8GB, SSD 256GB', 101),
(2, 'Core i5, RAM 8GB, SSD 256GB', 101),
(1, 'Core i7, RAM 16GB, SSD 512GB', 102),
(1, 'Core i5, RAM 8GB, HDD 1TB', 201),
(2, 'Core i5, RAM 8GB, HDD 1TB', 201)
GO

-- Câu 2: đưa ra thông có có số lượng máy lớn nhất
select *
from PhongMay
where SoLuong = (select max(SoLuong) from PhongMay)
GO

-- cau 3: tong hop thong tin mon hoc duoc phan vao tung phong
select MaMH,TenMH, SoP
from MonHoc
order by SoP,MaMH;
go
