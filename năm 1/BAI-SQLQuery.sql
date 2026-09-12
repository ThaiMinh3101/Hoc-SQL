use quanlydean
go
create table NHAN_VIEN (
MANV int,
HONV nchar (20),
TENNV nchar(10),
PHAI nchar(3),
NGSINH timestamp,
LUONG int,
DCHI nchar(30),
primary key (MANV)
)

CREATE TABLE PHONGBAN (
MAPHG nchar(10),
TenPHG nchar (10)
)

--tạo bảng đề án
create table DEAN (
TENDA nchar(15),
MADA int,
DDIEM_DA nchar(15),
PHONG int
primary key (MADA)
)

create table THAN_NHAN (
TENTN nchar(15),
PHAI nchar(3),
NGSINH timestamp,
QUANHE nchar(10),
primary key (TENTN)
)

create table CONGVIEC (
MADA int,
STT int,
TEN nchar(10)
primary key (MADA,STT)
)

create table DD_PHGBAN(
MAPHG int,
DIADIEM nchar(30),
primary key (MAPHG,DIADIEM)

--đổi tên
exec sp_rename 'dean','DEAN';

--Thêm vào bảng nhanvien 2 thuộc tính: MA_NQL và PHG
after table NHANVIEN add MA_NQL char(9)
after table NHANVIEN add PHQ int
--Xóa cột MA_NQL trong bảng nhanvien
after table NHANVIEN drop column PHG
--Xóa bảng dean
drop table dbo.DEAN
--Tạo khóa ngoại có tên là: FK_NHANVIEN_PHONGBAN