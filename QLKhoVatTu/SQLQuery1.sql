create database QLKhoVatTu
Go

use  QLKhoVatTu
Go

create table NHACUNGCAP
(
	MaNCC Char(5) primary key,
	TenNCC NVARCHAR(50),
	DiaChi varchar(50)
)

create table VATTU
(
	MaVT char(5) primary key,
	TenVT nvarchar(30),
	DVT INT
)

create table PHIEUNHAP
(
	SoPN char(5) primary key,
	MaNCC char(5),
	NgayNhap smalldatetime,
	GhiChu NVARChar(50)
)

create table CTPhieuNhap
(
	SoPN char(5) primary key,
	MaVT char(5),
	SoLuong int,
	DonGia int,


)