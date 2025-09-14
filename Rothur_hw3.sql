
--1.List all cities that have both Employees and Customers.
select distinct c.City from Customers c
inner join Employees e
on c.City = e.City

--2List all cities that have Customers but no Employee.
--a.      Use sub-query
select distinct c.City from Customers c
where c.City not in (select City from Employees)

--b.      Do not use sub-query
select distinct c.City from Customers c
left join Employees e
on c.City = e.City
where e.City is null 

--3.  List all products and their total order quantities throughout all orders.
select * from Products
select * from Orders
select * from [Order Details]
select p.ProductID, p.ProductName, sum(o.Quantity)
from Products p
left join [Order Details] o
on p.ProductID= o.ProductID
group by p.ProductID, p.ProductName 

--4.  List all Customer Cities and total products ordered by that city.

select distinct c.City, sum(d.Quantity) as TotalQuantity from
Customers c
left join Orders o
on c.CustomerID = o.CustomerID
left join [Order Details] d
on o.OrderID = d.OrderID
group by c.City 


--5. List all Customer Cities that have at least two customers.
--a.      Use union
select City
from Customers
where City in (
    select City
    from Customers
    group by City
    having count(*) >= 2
)
union
select City
from Customers
where City in (
    select City
    from Customers
    group by City
    having count(*) >= 2
);

--b.      Use sub-query and no union
select City from 
(select City, count(City) as CityCounts from Customers group by City) as CustomerCounts
where CityCounts >= 2
select * from Customers


--6.List all Customer Cities that have ordered at least two different kinds of products.
select c.City from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID
inner join [Order Details] d
on o.OrderID = d.OrderID
group by c.City
having count(distinct d.ProductID) >=2

--7. List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.
select distinct c.CustomerID, CompanyName,City,o.ShipCity from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID
where c.City != o.ShipCity 


--8. List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
select top 5 p.ProductID, p.ProductName, sum(od.Quantity) as TotalQuantity, avg(od.UnitPrice) as AveragePrice,
(
   select top 1 c.City
   from Orders o
   join Customers c 
   on o.CustomerID = c.CustomerID
   join [Order Details] od2 
   on o.OrderID = od2.OrderID
   where od2.ProductID = p.ProductID
   group by c.City
   order by sum(od2.Quantity) desc
   ) as TopCity
from Products p
inner join [Order Details] od
on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
order by sum(od.Quantity) desc 

--9.List all cities that have never ordered something but we have employees there.
--a.      Use sub-query

select City from Employees e
where City not in (
select distinct City from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID) 


--b.      Do not use sub-query
select distinct e.City from Employees e
left join Customers c
on e.City = c.City
left join Orders o
on c.CustomerID = o.CustomerID 
where OrderID is null  

--10.List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)
select * from Orders
select * from Customers
select * from Employees

select *
from (
select 
(select top 1 e.City
from Employees e
join Orders o 
on e.EmployeeID = o.EmployeeID
group by e.City
order by count(o.OrderID) desc) as TopEmployeeCity,
         
(select top 1 c.City
from Customers c
join Orders o 
on c.CustomerID = o.CustomerID
join [Order Details] od
on o.OrderID = od.OrderID
group by c.City
order by sum(od.Quantity) desc) as TopCustomerCity
) t
where TopEmployeeCity = TopCustomerCity

--11.How do you remove the duplicates record of a table?
select distinct *
into NewTable
from YourTable


