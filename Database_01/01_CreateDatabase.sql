/* =========================================================
   01_CreateDatabase.sql
   SQL Server 2008+
   ========================================================= */
IF DB_ID(N'QLCuaHang') IS NOT NULL
BEGIN
    PRINT N'Database QLCuaHang đã tồn tại.';
END
ELSE
BEGIN
    CREATE DATABASE QLCuaHang;
    PRINT N'Đã tạo database QLCuaHang.';
END
GO
