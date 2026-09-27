--1--
create database GhiDanh
on primary
(
	name = GhiDanh_data,
	filename='D:\GhiDanh\GhiDanh_Data.mdf',
	size=20MB,
	maxsize=40MB,
	filegrowth=1MB
)
log on
(
	name = GhiDanh_Log,
	filename='D:\GhiDanh\GhiDanh_Log.ldf',
	size=6MB,
	maxsize=8MB,
	filegrowth=1MB
)

--2--
create database SalesDb
on primary
(
	name = SalesDb_data1,
	filename='D:\SalesDb\QLBH_Data1.mdf',
	size=10MB,
	maxsize=40MB,
	filegrowth=1MB
)
log on
(
	name = SalesDb_Log,
	filename='D:\SalesDb\SalesDb.ldf',
	size=6MB,
	maxsize=8MB,
	filegrowth=1MB
)

--3--
alter database SalesDb
add file
(
	name = SalesDb_data2,
	filename='D:\SalesDb\SalesDB_data2.ndf',
	size=10MB,
	maxsize=40MB,
	filegrowth=1MB
)

--4--
alter database SalesDb
modify file
(
	name = SalesDb_data1,
	size=50MB
)
alter database SalesDb
modify file
(
	name = SalesDb_log,
	size=10MB
)

--5--
use GhiDanh
go

alter table SV
add constraint FK_SV_MALOP foreign key (MALOP) references LOP(MaLOP)
go
insert into LOP values 
(001, 30, 2026/09/25),
(002, 35, 2026/08/21),
(003, 29, 2025/01/24)

go
insert into SV values 
(049, N'NGUYEN HUE', 2026/09/25, 001),
(048, N'LY CONG', 2026/08/21, 002),
(047, N'TRAN DAI', 2025/01/24, 003)


--6--
USE SalesDb;
GO
	--a--
CREATE TABLE HOADON (
    MaHD int NOT NULL PRIMARY KEY,
    NgayLapHD datetime,
    MaNV char(3),
    MaKH char(5)
);

CREATE TABLE CHITIETHOADON (
    MaHD int NOT NULL,
    MaSP int NOT NULL,
    SoLuong int,
    DonGia money,
    PRIMARY KEY (MaHD, MaSP)
);
GO
	--b--
ALTER TABLE CHITIETHOADON
ADD CONSTRAINT CHK_SoLuong CHECK (SoLuong > 0);
GO
	--c--
CREATE RULE rule_DonGia 
AS @gia >= 1000;
GO
EXEC sp_bindrule 'rule_DonGia', 'CHITIETHOADON.DonGia';
GO
	--d--
INSERT INTO HOADON (MaHD, NgayLapHD, MaNV, MaKH)
VALUES (1, '2026-09-25', 'NV1', 'KH001');
GO
	--e--
INSERT INTO CHITIETHOADON (MaHD, MaSP, SoLuong, DonGia)
VALUES (1, 101, 0, 2000); 
GO
	--f--
INSERT INTO CHITIETHOADON (MaHD, MaSP, SoLuong, DonGia)
VALUES (1, 102, 5, 500); 
GO