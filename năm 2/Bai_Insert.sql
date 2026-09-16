--csdl quản lý bán hàng
use master
create database banhang
go
--
use banhang
go
create table SanPham
(
MaSp	int 	primary key,
TenSp	nvarchar(100),
MoTa	nvarchar(200),
Donvitinh	nvarchar(20),
SoLuong int,	
DonGia	 Money,
mancc int
)
go
create table nhanvien
(
	MaNV int primary key,
	HoNV	nvarchar(30),
	TenNV	nvarchar(30),
	GioiTinh	nvarchar(3),
	NgaySinh	datetime,
	DiaChi	nvarchar(100),
	DienThoai varchar(24)
)
create table HoaDon
(
MaHD	Int	primary key,
NgayLapHD	DateTime,
MaNV int,
NoiChuyen	nvarchar(50),
MaKh	char(5),
)
create table CT_HoaDon
(
MaHD	Int	,
MaSp	int	,
SoLuong	Int	,
DonGia	Money,
ChietKhau	Money,
primary key(mahd,masp)
)
create table NhaCungCap
(
MaNCC	Int	primary key,
TenNcc	Nvarchar(100),
Diachi	Nvarchar(100),
Phone	Varchar(24)	,
SoFax	Varchar(24)	,
DCMail	Varchar(50)	
)
create table KhachHang
(
MaKh	Char(5)primary key,
TenKh	Nvarchar(100),
DiaChi	Nvarchar(100),
Phone	Varchar(24),
SoFax	Varchar(24)	,
DCMail	varchar(50)	
)
alter table hoadon
add foreign key(makh) references khachhang(makh)
--
alter table hoadon
add foreign key(manv)references nhanvien(manv)
--
alter table ct_hoadon
add foreign key(mahd) references hoadon(mahd)
--
alter table ct_hoadon
add foreign key(masp) references sanpham(masp)
--
alter table sanpham
add foreign key(mancc) references nhacungcap(mancc)


--cau lenh insert (nhap cho bang ko co khoa ngoai truoc neu ko se loi)
--cach1: nhap bang thuong truoc roi nhap bang foreign key sau
--cach2: set gia tri NULL vao cho duoc foreign key
insert into nhanvien values (1, 'Thai', 'Hoang Minh', 'Nam', '01/31/2007', 'Tp.HCM', '012412452')

insert into NhaCungCap values (110, 'Nguyen Van A', 'Tp.HCM', '012318294', '001', 'nguyenvana@gmail.com')

insert into KhachHang values (1, 'Khach Hang A', 'Vung Tau', '012830912', '002', 'khachhanga@gmail.com')

insert into HoaDon values (01, '9/16/2026', 1, 'Tp.HCM', 1)

insert into SanPham values (001, 'Bàn phím cơ', 'Bàn phím cơ Red Switch', 'Cái', 50, 1200000, 110)

insert into CT_HoaDon values (01, 1, 10, 1200000, 10000)
