--1.How many products can you find in the Production.Product table?
select count(*) as ProductCount from Production.Product

--2.Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. 
--The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
select count(*) as SubProduct from Production.Product where ProductSubcategoryID is not null

--3.Count how many products belong to each product subcategory.
select ProductSubcategoryID, count(*) as CountedProducts from Production.Product group by ProductSubcategoryID

--4.How many products that do not have a product subcategory.
select count(*) NotSubProduct from Production.Product where ProductSubcategoryID is null

--5.Write a query to list the sum of products quantity in the Production.ProductInventory table.
select sum(Quantity) as TotalQuantity from Production.ProductInventory 


--6.Write a query to list the sum of products in the Production.ProductInventory table 
--and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
select sum(Quantity) as TotalQuantity from Production.ProductInventory where LocationID = 40 and Quantity < 100

--7. Write a query to list the sum of products with the shelf information in the Production.ProductInventory 
--table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
 select ProductID, Shelf, sum(Quantity) as TotalQuantity from Production.ProductInventory where LocationID = 40 group by ProductID,Shelf having sum(Quantity) < 100
 
 
--8.Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
 select avg(Quantity) as AvgQuantity from Production.ProductInventory where LocationID = 10

--9.Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory
 select Shelf, avg(Quantity) as AvgQuantity from Production.ProductInventory group by Shelf

--10.Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
select Shelf, avg(Quantity) as AvgQuantity from Production.ProductInventory where Shelf != 'N/A' group by Shelf 


--11.List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. 
--Exclude the rows where Color or Class are null.
select Color, Class, avg(ListPrice) as AvgListPrice from Production.Product where Color is not null and Class is not null group by Color, Class

--12.Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. 
--Join them and produce a result set similar to the following
select c.Name as CountryName, s.Name as StateProvinceName
from person.CountryRegion c
inner join person.StateProvince s
on c.CountryRegionCode = s.CountryRegionCode
order by c.Name

--13.Write a query that lists the country and province names from person. CountryRegion and person. 
--StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.
select c.Name as CountryName, s.Name as StateProvinceName
from person.CountryRegion c
inner join person.StateProvince s
on c.CountryRegionCode = s.CountryRegionCode
where c.Name in ('Germany','Canada')
order by c.Name 

-- Using Northwnd Database: (Use aliases for all the Joins)
--14.List all Products that has been sold at least once in last 25 years.
select distinct p.ProductID, p.ProductName from
Products p
inner join [Order Details] d on p.ProductID = d.ProductID
inner join Orders o on d.OrderID = o.OrderID
where o.OrderDate >= DATEADD(YEAR, -25, GETDATE()) 

--15.List top 5 locations (Zip Code) where the products sold most.
select top 5 o.ShipPostalCode, sum(d.Quantity) as TotalQuantity from
Products p
inner join [Order Details] d on p.ProductID = d.ProductID
inner join Orders o on d.OrderID = o.OrderID
group by o.ShipPostalCode
having o.ShipPostalCode is not null
Order by sum(d.Quantity) desc 

--16.List top 5 locations (Zip Code) where the products sold most in last 25 years.
select top 5 o.ShipPostalCode, sum(d.Quantity) as TotalQuantity from
Products p
inner join [Order Details] d on p.ProductID = d.ProductID
inner join Orders o on d.OrderID = o.OrderID
where o.OrderDate >= DATEADD(YEAR, -25, GETDATE()) 
group by o.ShipPostalCode
having o.ShipPostalCode is not null
Order by sum(d.Quantity) desc 

--17.List all city names and number of customers in that city.    
select City, count(City) from Customers
group by City 

--18.List city names which have more than 2 customers, and number of customers in that city
select City, count(City) from Customers
group by City
having count(City) > 2 

--19.List the names of customers who placed orders after 1/1/98 with order date.
select c.CompanyName as CustomerName, o.OrderDate
from Customers c
inner join Orders o
on c.CustomerID = O.CustomerID
group by c.CompanyName, o.OrderDate
having o.OrderDate > '1998-01-01' 

--20.List the names of all customers with most recent order dates
select c.CompanyName as CustomerName, max(o.OrderDate) as MostRecentDate
from Customers c
left join Orders o
on c.CustomerID = O.CustomerID
group by c.CompanyName, o.OrderDate 

--21.Display the names of all customers  along with the  count of products they bought
select c.CompanyName, coalesce(sum(d.Quantity), 0) as TotalQuantity
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
left join [Order Details] d
on o.OrderID = d.OrderID
group by c.CompanyName

--22.Display the customer ids who bought more than 100 Products with count of products.
select o.CustomerID, sum(d.Quantity) as ProductsBought from Orders o
inner join [Order Details] d
on o.OrderID = d.OrderID
group by o.CustomerID
having sum(Quantity) > 100 

--23.Show all the possible combinations of suppliers and shippers, representing every way a supplier can ship its products.
select * from Suppliers
select * from Shippers
select sh.CompanyName as ShipperName, su.CompanyName as SupplierName
from Shippers sh
cross join Suppliers su 

--24.Display the products order each day. Show Order date and Product Name.
select distinct o.OrderDate, p.ProductName
from Orders o
inner join [Order Details] d
on o.OrderID = d.OrderID
inner join Products p
on d.ProductID = p.ProductID
order by OrderDate  

--25.Displays pairs of employees who have the same job title.
select e1.FirstName+' '+e1.LastName as	Name1, e2.FirstName+' '+e2.LastName as Name2, e1.Title
from Employees e1
inner join Employees e2
ON e1.Title = e2.Title
AND e1.EmployeeID < e2.EmployeeID


--26.Display all the Managers who have more than 2 employees reporting to them.
select * from Employees where Title like '%Manager%' and ReportsTo >2 

--27.List all customers and suppliers together, grouped by city.
select City, CompanyName, ContactName, 'Customer' as Type from Customers
union 
select City, CompanyName, ContactName, 'Supplier' as Type from Suppliers
group by City, CompanyName, ContactName
order by City
