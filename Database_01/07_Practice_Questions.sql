USE QLCuaHang;
GO

/* =========================================================
   BỘ BÀI TẬP LUYỆN SQL - KHÔNG CÓ ĐÁP ÁN
   Làm từ trên xuống dưới.
   ========================================================= */

/* MỨC 1 - SELECT / WHERE / ORDER BY
   1. Hiển thị toàn bộ sản phẩm.
   2. Hiển thị mã, tên, giá bán của sản phẩm có giá bán > 20.000.
   3. Tìm sản phẩm có số lượng tồn <= mức tồn tối thiểu.
   4. Tìm khách hàng ở Thái Nguyên.
   5. Hiển thị nhân viên chức vụ 'Bán hàng'.
   6. Sắp xếp sản phẩm theo giá bán giảm dần.
   7. Tìm sản phẩm có tên chứa 'Bánh'.
*/

/* MỨC 2 - JOIN
   8. Hiển thị sản phẩm kèm tên danh mục.
   9. Hiển thị nhân viên kèm tên chi nhánh.
   10. Hiển thị hóa đơn kèm tên khách hàng, nhân viên, chi nhánh.
   11. Hiển thị chi tiết hóa đơn gồm tên sản phẩm, số lượng, đơn giá, giảm giá.
   12. Hiển thị các phiếu nhập kèm tên nhà cung cấp và nhân viên.
*/

/* MỨC 3 - GROUP BY / HAVING
   13. Đếm số sản phẩm theo từng danh mục.
   14. Tính giá bán trung bình của từng danh mục.
   15. Tính tổng số lượng bán của từng sản phẩm.
   16. Tính doanh thu của từng hóa đơn.
   17. Tính doanh thu theo từng chi nhánh.
   18. Tìm khách hàng có tổng tiền mua > 100.000.
   19. Tìm danh mục có doanh thu > 150.000.
*/

/* MỨC 4 - SUBQUERY
   20. Tìm sản phẩm có giá bán cao hơn giá bán trung bình.
   21. Tìm sản phẩm có giá bán cao nhất.
   22. Tìm khách hàng có tổng mua cao nhất.
   23. Tìm nhân viên có số hóa đơn nhiều nhất.
   24. Tìm các sản phẩm chưa từng được bán.
   25. Tìm các nhà cung cấp chưa từng có phiếu nhập.
*/

/* MỨC 5 - CASE / DATETIME
   26. Phân loại sản phẩm:
       - Tồn thấp: SoLuongTon <= MucTonToiThieu
       - Bình thường: ngược lại.
   27. Phân loại hóa đơn:
       - < 50.000: Nhỏ
       - 50.000-100.000: Trung bình
       - > 100.000: Lớn
   28. Tính doanh thu theo tháng.
   29. Tìm ngày có doanh thu cao nhất.
*/

/* MỨC 6 - CÂU HỎI TỔNG HỢP
   30. Tìm top 5 sản phẩm bán chạy nhất theo số lượng.
   31. Tìm top 3 khách hàng có tổng tiền mua cao nhất.
   32. Với mỗi chi nhánh, tìm nhân viên có doanh thu cao nhất.
   33. Tìm sản phẩm có lợi nhuận đơn vị cao nhất
       (GiaBan - GiaNhap).
   34. Tính lợi nhuận ước tính theo từng sản phẩm đã bán.
   35. Tìm sản phẩm thuộc danh mục có doanh thu cao nhất.
   36. Tìm khách hàng mua nhiều loại sản phẩm khác nhau nhất.
   37. Tìm tháng có doanh thu cao nhất.
   38. Tìm sản phẩm có số lượng bán cao hơn mức bán trung bình
       của toàn bộ sản phẩm.
*/

/* MỨC 7 - CTE / WINDOW FUNCTION
   39. Dùng CTE tính doanh thu theo khách hàng.
   40. Dùng ROW_NUMBER() xếp hạng khách hàng theo doanh thu.
   41. Dùng RANK() xếp hạng sản phẩm theo số lượng bán trong từng danh mục.
   42. Tìm top 2 sản phẩm của mỗi danh mục.
   43. Tính tỷ trọng doanh thu của từng chi nhánh so với tổng doanh thu.
*/

/* MỨC 8 - VIEW / PROCEDURE / TRIGGER
   44. Dùng vw_ChiTietHoaDon để lấy doanh thu theo nhân viên.
   45. Dùng vw_SanPhamSapHet để tìm hàng cần nhập.
   46. Gọi sp_TimSanPham với từ khóa 'nước'.
   47. Gọi sp_DoanhThuTheoNgay cho tháng 02/2026.
   48. Gọi sp_SanPhamTheoDanhMuc cho DM02.
   49. Tự tạo procedure thêm một khách hàng.
   50. Tự tạo procedure tìm hóa đơn theo khoảng ngày.
*/

/* MỨC 9 - BÀI TỔNG HỢP
   51. Xây dựng báo cáo:
       Chi nhánh | Doanh thu | Số hóa đơn | Số khách hàng.
   52. Xây dựng báo cáo:
       Danh mục | Số sản phẩm | Số lượng đã bán | Doanh thu | Lợi nhuận.
   53. Tìm khách hàng mua hàng ở nhiều chi nhánh nhất.
   54. Tìm 3 sản phẩm đóng góp doanh thu lớn nhất ở mỗi chi nhánh.
   55. Viết truy vấn phát hiện sản phẩm có tồn kho âm sau khi
       thực hiện một giao dịch thử nghiệm.
*/
GO
