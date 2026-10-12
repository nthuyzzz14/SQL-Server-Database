USE QLCuaHang;
GO

/* =========================
   CHI NHÁNH
   ========================= */
INSERT INTO ChiNhanh VALUES
('CN01', N'Chi nhánh Trung tâm', N'12 Hoàng Văn Thụ, Thái Nguyên', '02083680001'),
('CN02', N'Chi nhánh Gang Thép', N'88 Cách Mạng Tháng Tám, Thái Nguyên', '02083680002'),
('CN03', N'Chi nhánh Sông Công', N'25 Cách Mạng Tháng Tám, Sông Công', '02083680003');
GO

/* =========================
   NHÂN VIÊN
   ========================= */
INSERT INTO NhanVien
(MaNhanVien,HoTen,GioiTinh,NgaySinh,SoDienThoai,Email,ChucVu,NgayVaoLam,MaChiNhanh)
VALUES
('NV01',N'Nguyễn Văn An',N'Nam','2001-03-12','0901000001','an@store.com',N'Quản lý','2023-01-10','CN01'),
('NV02',N'Trần Thị Bình',N'Nữ','2002-08-20','0901000002','binh@store.com',N'Bán hàng','2024-02-15','CN01'),
('NV03',N'Lê Văn Cường',N'Nam','2000-11-05','0901000003','cuong@store.com',N'Bán hàng','2024-04-01','CN02'),
('NV04',N'Phạm Thị Dung',N'Nữ','2001-06-18','0901000004','dung@store.com',N'Bán hàng','2024-05-20','CN02'),
('NV05',N'Hoàng Văn Em',N'Nam','1999-09-09','0901000005','em@store.com',N'Quản lý','2022-08-01','CN03'),
('NV06',N'Đỗ Thị Hoa',N'Nữ','2002-12-22','0901000006','hoa@store.com',N'Bán hàng','2025-01-05','CN03');
GO

/* =========================
   KHÁCH HÀNG
   ========================= */
INSERT INTO KhachHang
(MaKhachHang,HoTen,SoDienThoai,Email,DiaChi,NgayDangKy,DiemTichLuy)
VALUES
('KH01',N'Ngô Minh Đức','0911000001','duc@gmail.com',N'Thái Nguyên','2025-01-15',120),
('KH02',N'Vũ Thu Hà','0911000002','ha@gmail.com',N'Thái Nguyên','2025-02-20',80),
('KH03',N'Nguyễn Quốc Khánh','0911000003','khanh@gmail.com',N'Hà Nội','2025-03-11',250),
('KH04',N'Đặng Thị Lan','0911000004','lan@gmail.com',N'Thái Nguyên','2025-04-02',40),
('KH05',N'Bùi Văn Nam','0911000005','nam@gmail.com',N'Sông Công','2025-05-18',170),
('KH06',N'Phan Thị Mai','0911000006','mai@gmail.com',N'Thái Nguyên','2025-06-01',300),
('KH07',N'Trần Minh Quân','0911000007','quan@gmail.com',N'Hà Nội','2025-07-05',60),
('KH08',N'Lê Thị Thảo','0911000008','thao@gmail.com',N'Sông Công','2025-08-12',95);
GO

/* =========================
   NHÀ CUNG CẤP
   ========================= */
INSERT INTO NhaCungCap VALUES
('NCC01',N'Công ty Nước giải khát ABC','0283000001','abc@ncc.com',N'Hà Nội'),
('NCC02',N'Công ty Bánh kẹo XYZ','0283000002','xyz@ncc.com',N'Hải Phòng'),
('NCC03',N'Công ty Gia dụng Việt','0283000003','giadung@ncc.com',N'Hà Nội'),
('NCC04',N'Công ty Văn phòng phẩm Sao Mai','0283000004','saomai@ncc.com',N'Bắc Ninh');
GO

/* =========================
   DANH MỤC
   ========================= */
INSERT INTO DanhMuc VALUES
('DM01',N'Đồ uống'),
('DM02',N'Bánh kẹo'),
('DM03',N'Đồ gia dụng'),
('DM04',N'Văn phòng phẩm');
GO

/* =========================
   SẢN PHẨM
   ========================= */
INSERT INTO SanPham
(MaSanPham,TenSanPham,MaDanhMuc,DonViTinh,GiaNhap,GiaBan,SoLuongTon,MucTonToiThieu,TrangThai)
VALUES
('SP01',N'Coca Cola lon','DM01',N'Lon',7000,10000,120,30,1),
('SP02',N'Pepsi lon','DM01',N'Lon',6500,9500,90,25,1),
('SP03',N'Nước suối 500ml','DM01',N'Chai',3500,6000,180,50,1),
('SP04',N'Cà phê lon','DM01',N'Lon',9000,13000,70,20,1),
('SP05',N'Bánh Oreo','DM02',N'Gói',9000,12000,85,20,1),
('SP06',N'Bánh ChocoPie','DM02',N'Hộp',38000,48000,35,10,1),
('SP07',N'Kẹo dẻo','DM02',N'Gói',12000,17000,42,15,1),
('SP08',N'Khăn giấy','DM03',N'Gói',12000,16000,55,15,1),
('SP09',N'Nước rửa chén','DM03',N'Chai',22000,29000,24,10,1),
('SP10',N'Bột giặt 3kg','DM03',N'Túi',65000,79000,18,8,1),
('SP11',N'Bút bi xanh','DM04',N'Cây',2500,4000,200,50,1),
('SP12',N'Vở 200 trang','DM04',N'Quyển',11000,15000,100,30,1);
GO

/* =========================
   PHIẾU NHẬP
   ========================= */
INSERT INTO PhieuNhap
(MaPhieuNhap,NgayNhap,MaNhaCungCap,MaNhanVien,MaChiNhanh,GhiChu)
VALUES
('PN01','2026-01-03 09:00','NCC01','NV01','CN01',N'Nhập đồ uống'),
('PN02','2026-01-05 10:00','NCC02','NV01','CN01',N'Nhập bánh kẹo'),
('PN03','2026-01-08 08:30','NCC03','NV05','CN03',N'Nhập hàng gia dụng'),
('PN04','2026-01-12 14:00','NCC04','NV03','CN02',N'Nhập văn phòng phẩm'),
('PN05','2026-02-02 09:15','NCC01','NV01','CN01',N'Nhập bổ sung đồ uống'),
('PN06','2026-02-10 11:00','NCC02','NV04','CN02',N'Nhập bổ sung bánh kẹo'),
('PN07','2026-02-18 10:20','NCC03','NV05','CN03',N'Nhập bổ sung đồ gia dụng'),
('PN08','2026-03-05 09:45','NCC04','NV06','CN03',N'Nhập văn phòng phẩm');
GO

INSERT INTO ChiTietPhieuNhap VALUES
('PN01','SP01',100,7000),
('PN01','SP02',80,6500),
('PN01','SP03',150,3500),
('PN02','SP05',70,9000),
('PN02','SP06',30,38000),
('PN02','SP07',40,12000),
('PN03','SP08',60,12000),
('PN03','SP09',30,22000),
('PN03','SP10',25,65000),
('PN04','SP11',250,2500),
('PN04','SP12',120,11000),
('PN05','SP01',80,7000),
('PN05','SP03',100,3500),
('PN05','SP04',60,9000),
('PN06','SP05',50,9000),
('PN06','SP06',20,38000),
('PN07','SP09',20,22000),
('PN07','SP10',15,65000),
('PN08','SP11',100,2500),
('PN08','SP12',60,11000);
GO

/* =========================
   HÓA ĐƠN
   ========================= */
INSERT INTO HoaDon
(MaHoaDon,NgayLap,MaKhachHang,MaNhanVien,MaChiNhanh,PhuongThucThanhToan,TrangThai)
VALUES
('HD01','2026-01-04 10:10','KH01','NV02','CN01',N'Tiền mặt',N'Hoàn tất'),
('HD02','2026-01-06 15:30','KH02','NV02','CN01',N'Chuyển khoản',N'Hoàn tất'),
('HD03','2026-01-10 18:20',NULL,'NV03','CN02',N'Tiền mặt',N'Hoàn tất'),
('HD04','2026-01-15 09:45','KH03','NV04','CN02',N'Chuyển khoản',N'Hoàn tất'),
('HD05','2026-01-22 16:10','KH01','NV05','CN03',N'Tiền mặt',N'Hoàn tất'),
('HD06','2026-02-03 11:15','KH04','NV02','CN01',N'Tiền mặt',N'Hoàn tất'),
('HD07','2026-02-08 17:40','KH05','NV03','CN02',N'Chuyển khoản',N'Hoàn tất'),
('HD08','2026-02-14 14:25','KH06','NV05','CN03',N'Tiền mặt',N'Hoàn tất'),
('HD09','2026-02-20 19:05','KH03','NV04','CN02',N'Thẻ',N'Hoàn tất'),
('HD10','2026-03-01 08:50','KH07','NV06','CN03',N'Chuyển khoản',N'Hoàn tất'),
('HD11','2026-03-06 12:10','KH08','NV02','CN01',N'Tiền mặt',N'Hoàn tất'),
('HD12','2026-03-10 18:30','KH01','NV03','CN02',N'Thẻ',N'Hoàn tất');
GO

INSERT INTO ChiTietHoaDon
(MaHoaDon,MaSanPham,SoLuong,DonGiaBan,GiamGia)
VALUES
('HD01','SP01',3,10000,0),
('HD01','SP03',2,6000,0),
('HD01','SP11',5,4000,2000),

('HD02','SP02',4,9500,0),
('HD02','SP05',2,12000,2000),

('HD03','SP08',2,16000,0),
('HD03','SP09',1,29000,0),

('HD04','SP06',2,48000,5000),
('HD04','SP07',3,17000,0),

('HD05','SP10',2,79000,5000),
('HD05','SP12',4,15000,0),

('HD06','SP01',2,10000,0),
('HD06','SP04',2,13000,0),
('HD06','SP05',1,12000,0),

('HD07','SP03',5,6000,0),
('HD07','SP08',2,16000,1000),

('HD08','SP09',2,29000,0),
('HD08','SP10',1,79000,0),

('HD09','SP05',3,12000,3000),
('HD09','SP06',1,48000,0),

('HD10','SP11',10,4000,5000),
('HD10','SP12',5,15000,0),

('HD11','SP01',5,10000,0),
('HD11','SP02',3,9500,0),
('HD11','SP03',2,6000,0),

('HD12','SP04',3,13000,0),
('HD12','SP07',4,17000,2000);
GO
