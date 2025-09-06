--1.Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter
select ProductID, Name, Color, ListPrice from Production.Product

--2.Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, excludes the rows that ListPrice is 0
select ProductID, Name, Color, ListPrice from Production.Product where ListPrice != 0


--3.Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are NULL for the Color column
select ProductID, Name, Color, ListPrice from Production.Product where Color is null

--4.Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.
select ProductID, Name, Color, ListPrice from Production.Product where color is not null

--5.Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, 
--and the column ListPrice has a value greater than zero
select ProductID, Name, Color, ListPrice from Production.Product where color is not null and ListPrice > 0

--6.Write a query that concatenates the columns Name and Color like 'LL Crankarm: Black' from the Production.Product table by excluding the rows that are null for color.
select ProductID, Name + ':' + Color as "NameAndColor", ListPrice from Production.Product where color is not null

--7.Write a query that generates the following result set  from Production.Product:
select ProductID, 'NAME: ' + Name + ' -- COLOR: ' + Color as "NameAndColor", ListPrice from Production.Product where color is not null 

--8.Write a query to retrieve the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500
select ProductID, Name from Production.Product where ProductID between 400 and 500

--9.Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table restricted to the colors black and blue
select ProductID, Name, Color from Production.Product where Color = 'Black' or Color = 'Blue'

--10.Write a query to get a result set on products that begins with the letter S. 
select * from Production.Product where Name like 'S%'


--11.Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
--Order the result set by the Name column.
select Name, ListPrice from Production.Product order by Name

--12. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
--Order the result set by the Name column. The products name should start with either 'A' or 'S'
select Name, ListPrice from Production.Product where Name like '[A,S]%'order by Name

--13.Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. 
--After this zero or more letters can exists. Order the result set by the Name column.
select Name, ListPrice from Production.Product where Name like 'SPO[^K]%'order by Name 

--14.Write a query that retrieves unique colors from the table Production.Product. Order the results in descending  manner
select distinct Color from Production.Product where Color is not null order by Color desc

--15.Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product table. 
--We do not want any rows that are NULL.in any of the two columns in the result.
select distinct ProductSubcategoryID, Color from Production.Product
where ProductSubcategoryID is not null and Color is not null




