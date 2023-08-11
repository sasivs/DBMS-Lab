select Country, count(CustomerID) from customers 
group by country having count(CustomerID)>2; 

select Country, count(CustomerID) from customers 
group by country having count(CustomerID)>2
order by count(CustomerID) desc; 

select CustomerID, count(OrderID) from orders 
group by CustomerID having count(OrderID)>2;

select e.LastName, count(OrderID) from 
employees e join orders o on e.EmployeeID=o.EmployeeID
where e.LastName in ('Davolio','Fuller') group by e.LastName 
having count(OrderID)>2;

select OrderDate, count(OrderID) from orders group by OrderDate;

select LastName, count(EmployeeID) from employees group by LastName;