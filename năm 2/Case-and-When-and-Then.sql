----Case-and-When-and-Then---------
--cau14----------------------------------------------------------------------------------------------------
Select *,
Case
	When PHAI=N'Nữ' Then 0
	When PHAI=N'Nam' Then 1
End As'PHAI'
From NHANVIEN

--cau15-----------------------------------------------------------------------------------------------------------------
Select * from DEAN
Select *,
Case
	When DDIEM_DA=N'TP HCM' OR DDIEM_DA=N'Hà Nội' Then N'Trọng Yếu'
End As N'Mức độ quan trọng'
From DEAN

--cau16-----------------------------------------------------------------------------------------------------------------
Select MANV, HONV+' '+TENLOT+' '+TENNV as N'Họ tên',
Case
	When sum(THOIGIAN) >= 40 Then N'Khen Thưởng'
End
From NHANVIEN,PHANCONG
Where MANV = MA_NVIEN
Group by MANV,HONV,TENLOT,TENNV

--cau17------------------------------------------------------------------------------------------------------------------
Update CT_HoaDon
Set ChietKhau =
Case
	When SOLUONG < 10 Then 0
	When SOLUONG < 20 Then 0.05
	When SOLUONG < 30 Then 0.07
	Else 0.1
End
Where MaHD = 10252