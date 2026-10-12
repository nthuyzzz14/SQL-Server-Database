-- Các kiểu dữ liệu

-- INT: Kiểu tập hợp các số nguyên N : 2,1,3,-5, -6;
-- FLOAT: Kiểu tập hợp số thực R: 1.2 , 10.3 , -1.3;
-- CHAR: Kiểu tập hợp các ký tự. Bộ nhớ cấp phát cứng không thể thay đổi. Không viết tiếng việt được: c ,a , h, b
-- VARCHAR: Kiểu tập hợp ký tự. Bộ nhớ cấp phát động linh hoạt hơn CHAR. Không thể viết tiếng việt
-- NCHAR: Có thể viết tiếng việt còn lại == CHAR
-- NVARCHAR: Kiểu ký tự cấp phát động, có thể viết tiếng việt == VARCHAR
-- DATE: Lưu trữ day, month, year, hour.
-- TIMe: Lưu trữ second, hour, minute, ...
-- BIT: Lưu giá trị 0 và 1
-- TEXT: Lưu văn bản lớn
-- NTEXT: Lưu văn bản có tiếng việt 

CREATE TABLE test (
  DOC NVARCHAR(50), --Khai báo DOC kiểu NVARCHAR cấp phát động 50 ô nhớ
  MaSV CHAR(10), -- Khai báo MaSV kiểu char cấp phát cứng 10 ô nhớ
  Birthday DATE,
  SEX BIT -- LƯU giá trị 0 hoặc 1 
)
GO

-- MaSV lưu 10 ô nhớ, MaSV = 1234567890 -> kết quả lưu trữ là: 
-- 1: '1234567890'
-- 2: '12367452as'
