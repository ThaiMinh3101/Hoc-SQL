--1--
CREATE DATABASE QLBH
ON PRIMARY
(
NAME = QLBH_data,
FILENAME = 'D:\HQTCSDL\BT\CHUONG1\QLBH_data.mdf',
SIZE = 500MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%
)
LOG ON
(
NAME = QLBH_log,
FILENAME = 'D:\HQTCSDL\BT\CHUONG1\QLBH_log.ldf',
SIZE = 800MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%
)

--2--
ALTER DATABASE QLBH
MODIFY FILE (NAME = QLBH_data, FILENAME = 'D:\HQTCSDL\BT\CHUONG1\QLBH_data.mdf', SIZE = 250MB, MAXSIZE = 800MB)

ALTER DATABASE QLBH
ADD FILE (NAME = QLBH_data2, FILENAME = 'D:\HQTCSDL\BT\CHUONG1\QLBH_data2.mdf', SIZE = 200MB, MAXSIZE = 800MB, FILEGROWTH = 10%)

--3--
DROP DATABASE QLBH


--4--
CREATE DATABASE QLBH
GO
CREATE TABLE KHACHHANG
(
Ma_Khach_Hang int primary key,
Ten_Khach_Hang nvarchar(40),
Dia_Chi nvarchar(40),
So_DT int,
Email nvarchar(40)
)
CREATE TABLE HOADON
(
Ma_Hoa_Don int primary key,
Ma_KH int foreign key references KHACHHANG (Ma_Khach_Hang),
Ngay_Lap int,
Thanh_Tien float,
NV_Lap_HD nvarchar(40)
)
CREATE TABLE NHANVIEN
(
Ma_NV int primary key,
Ho_NV nvarchar(40),
Ten_Lot_NV nvarchar(40),
Ten_NV nvarchar(40),
Ngay_Sinh int,
Phai nvarchar(4),
Luong int,
NV_Quan_Ly nvarchar(40)
)
CREATE TABLE HANGSANXUAT
(
Ma_Hang_SX int primary key,
Ten_Hang_SX nvarchar(40)
)
CREATE TABLE SANPHAM 
(
Ma_San_Pham int primary key,
Ten_San_Pham nvarchar(40),
Hang_San_Xuat int foreign key references HANGSANXUAT(Ma_Hang_SX),
So_Luong_Ton_Kho int,
Don_Gia float,
Don_Vi_Tinh nvarchar(10)
)
CREATE TABLE CHITIETHOADON
(
Ma_HD int,
Ma_SP int foreign key references SANPHAM(Ma_San_Pham),
So_luong int,
primary key (Ma_HD, Ma_SP)
)
USE QLBH
GO

INSERT INTO KHACHHANG (Ma_Khach_Hang, Ten_Khach_Hang, Dia_Chi, So_DT, Email)
VALUES 
(1, N'Nguyễn Văn A', N'Hà Nội', 987654321, N'a.nguyen@gmail.com'),
(2, N'Trần Thị B', N'Hồ Chí Minh', 912345678, N'b.tran@gmail.com'),
(3, N'Lê Văn C', N'Đà Nẵng', 933333333, N'c.le@gmail.com'),
(4, N'Phạm Thị D', N'Cần Thơ', 944444444, N'd.pham@gmail.com'),
(5, N'Hoàng Văn E', N'Hải Phòng', 955555555, N'e.hoang@gmail.com');

INSERT INTO NHANVIEN (Ma_NV, Ho_NV, Ten_Lot_NV, Ten_NV, Ngay_Sinh, Phai, Luong, NV_Quan_Ly)
VALUES 
(1, N'Nguyễn', N'Văn', N'An', 19900101, N'Nam', 15000000, N'Trần Giám Đốc'),
(2, N'Trần', N'Thị', N'Bình', 19920515, N'Nữ', 12000000, N'Nguyễn Văn An'),
(3, N'Lê', N'Hoàng', N'Cường', 19951020, N'Nam', 11000000, N'Nguyễn Văn An'),
(4, N'Phạm', N'Thanh', N'Dung', 19981230, N'Nữ', 10000000, N'Nguyễn Văn An'),
(5, N'Vũ', N'Đức', N'Em', 19930707, N'Nam', 13000000, N'Nguyễn Văn An');

INSERT INTO HANGSANXUAT (Ma_Hang_SX, Ten_Hang_SX)
VALUES 
(1, N'Apple'),
(2, N'Samsung'),
(3, N'Sony'),
(4, N'Dell'),
(5, N'Asus');

INSERT INTO SANPHAM (Ma_San_Pham, Ten_San_Pham, Hang_San_Xuat, So_Luong_Ton_Kho, Don_Gia, Don_Vi_Tinh)
VALUES 
(1, N'iPhone 15 Pro', 1, 50, 25000000, N'Cái'),
(2, N'Galaxy S24 Ultra', 2, 40, 24000000, N'Cái'),
(3, N'Tai nghe Sony WH', 3, 100, 5000000, N'Chiếc'),
(4, N'Laptop Dell XPS', 4, 20, 35000000, N'Chiếc'),
(5, N'Màn hình Asus ROG', 5, 30, 10000000, N'Cái');

INSERT INTO HOADON (Ma_Hoa_Don, Ma_KH, Ngay_Lap, Thanh_Tien, NV_Lap_HD)
VALUES 
(101, 1, 20240105, 25000000, N'Nguyễn Văn An'),
(102, 2, 20240210, 24000000, N'Trần Thị Bình'),
(103, 3, 20240315, 10000000, N'Lê Hoàng Cường'),
(104, 4, 20240420, 35000000, N'Phạm Thanh Dung'),
(105, 5, 20240525, 5000000, N'Vũ Đức Em');

INSERT INTO CHITIETHOADON (Ma_HD, Ma_SP, So_luong)
VALUES
(101, 1, 1),
(102, 2, 1),
(103, 5, 1),
(104, 4, 1),
(105, 3, 1);