QUAN LY CUA HANG - BO SQL LUYEN TAP

Thu tu chay:
1. 01_CreateDatabase.sql
2. 02_CreateTables.sql
3. 03_InsertData.sql
4. 04_Views.sql
5. 05_Procedures.sql
6. 06_Triggers.sql

7. Mở 07_Practice_Questions.sql để làm bài.
8. Chỉ xem 08_Answer_Sample.sql sau khi đã tự làm.

Cấu trúc gồm 10 bảng:
- ChiNhanh
- NhanVien
- KhachHang
- NhaCungCap
- DanhMuc
- SanPham
- PhieuNhap
- ChiTietPhieuNhap
- HoaDon
- ChiTietHoaDon

Mục tiêu luyện tập:
SELECT, WHERE, ORDER BY, LIKE, JOIN, LEFT JOIN,
GROUP BY, HAVING, aggregate, subquery, CASE,
DATE/YEAR/MONTH, CTE, ROW_NUMBER, RANK,
VIEW, PROCEDURE, TRIGGER.

Lưu ý:
- Script hướng tới SQL Server 2008+.
- Nếu chạy lại 02_CreateTables.sql, các bảng sẽ bị xóa và tạo lại.
- Dữ liệu mẫu được thiết kế đủ nhiều để có kết quả khác nhau khi GROUP BY/HAVING/subquery.
- Trigger sẽ tác động đến SoLuongTon khi INSERT chi tiết nhập/bán. Vì dữ liệu mẫu đã có số lượng tồn ban đầu nên không cần chạy lại các INSERT chi tiết sau khi trigger được tạo.
