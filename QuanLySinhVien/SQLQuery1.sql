create database QLSinhVien
go

use QLSinhVien
Go

create table Lop
(
	MaLop int primary key,
	TenLop nvarchar(70),
	Khoa nvarchar (60),
	SiSo int,
)

create table SinhVien
(
	MaSV int primary key,
	HoTen nvarchar(60),
	GioiTinh bit, -- 1:Nam , 0:Nu
	DiemTB float,
	MaLop int,

	-- tao rang buoc
	constraint FK_SinhVien_MaLop foreign key (MaLop) references Lop(MaLop)
)
go

insert into Lop(MaLop, TenLop, Khoa, SiSo)
values
(1, 'CNTT1', N'Công nghệ thông tin', 5),
(2, 'CNTT2', N'Công nghệ thông tin', 5),
(3, 'KT1', N'Kế toán', 5),
(4, 'QTKD', N'Quản trị kinh doanh', 5),
(5, 'NN1', N'Ngoại ngữ', 5)
insert into SinhVien(MaSV, HoTen, GioiTinh, DiemTB,MaLop)
values
(101, N'Nguyễn Văn An', 1, 8.5, 1),
(102, N'Trần Thị Bình', 0, 7.8, 2),
(103, N'Lê Văn Cường', 1, 9.2, 3),
(104, N'Phạm Thị Dung', 0, 6.5, 4),
(105, N'Hoàng Văn Anh', 1, 5.5, 5)
Go

-- a:
select MaLop, Hoten, DiemTB
from SinhVien
order by MaLop
Go

-- b:
select MaSV, HoTen, DiemTB
from SinhVien
where DiemTB >= 8.0
Go

-- c:
select TenLop, SiSo
from Lop
go

-- d:
select SinhVien.MaSV,
	   SinhVien.HoTen,
	   SinhVien.GioiTinh, 
	   Lop.Khoa
from SinhVien
JOIN Lop
	On SinhVien.MaLop = Lop.MaLop
where GioiTinh = 0
order by MaSV Asc
go;