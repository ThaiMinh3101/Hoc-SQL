use Northwind
--lenh update (lam file NorthWind)
update Products
set UnitPrice = 30000
where ProductName like 'T%' --phai dung LIKE

update Products
set UnitPrice = UnitPrice + 50
where SupplierID = 1

update Products
set UnitPrice = UnitPrice - 5
where SupplierID = 2

update Customers
set CustomerID = 'ONTAN'
where CustomerID = 'ANTON'

update Products
set UnitPrice = UnitPrice * 1.03
where CategoryID = 1

update Customers
set CompanyName = 'Nguyen Van Tam', Phone = '0909090909'
where CustomerID = 'ALFKI'
