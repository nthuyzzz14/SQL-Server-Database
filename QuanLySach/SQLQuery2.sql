create database QuanLySach
go

use QuanLySach
go

create table NhaXuatBan
(
	MaNXB int primary key,
	TenNXB nvarchar(50),
	DiaChi nvarchar (100)
)
create table Sach
(
	MaSach Int primary key,
	TenSach nvarchar(100),
	TacGia nvarchar(50),
	Gia int,
	MaNXB int,

	-- Tạo rằng buộc
	constraint FK_Sach_NhaXuatBan foreign key (MaNXB) references NhaXuatBan(MaNXB)
)
GO

insert into NhaXuatBan(MaNXB, TenNXB, DiaChi)
values
(1, N'Kim Đồng', N'Đông Anh, Hà Nội'),
(2, N'Tiếng nói của người phụ nữ', N'Ninh Bình'),
(3, N'Văn học', N'Thành phố Hồ Chí Minh'),
(4, N'Giáo Dục', N'Hà Nội')
insert into Sach (MaSach, TenSach, TacGia, Gia, MaNXB)
values
(1, N'Dế Mèn phiêu lưu ký', N'Tô Hoài', 54000, 1),
(2, N'Đất rừng phương Nam', N'Đoàn Giỏi', 60000, 1),
(3, N'Ăn bay', N'Nguyễn Trí', 92000, 3),
(4, N'Ở xứ vàng', N'Henryk Sienkiewicz', 95000, 3),
(5, N'Chí Phèo', N'Nam Cao', 39000, 2),
(6, N'Tắt đèn', N'Ngô Tất Tố', 40000, 2)
GO



-- a:
Select MaNXB, TenSach, Gia
from Sach
order by MaNXB
go

-- b:
select TenSach, Gia
from Sach
where Gia > 50000
go

-- c:
select NhaXuatBan.TenNXB,
		COUNT(Sach.MaNXB) AS SoLuongSach
from NhaXuatBan
left join Sach
	on Sach.MaNXB =NhaXuatBan.MaNXB
group by NhaXuatBan.TenNXB
GO

-- d:
select s.MaSach, s.TenSach, s.TacGia, nxb.TenNXB
from Sach s
inner join NhaXuatBan nxb
	on s.MaNXB = nxb.MaNXB
where s.TacGia Like N'%Hoài'
go