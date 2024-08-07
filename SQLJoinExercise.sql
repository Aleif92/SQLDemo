

-- Start of the assignment

/* joins: select all the computers from the products table:
using the products table and the categories
 table, return the product name and the category name */
SELECT P.Name AS ProductName, C.Name AS CategoryName
FROM products AS P
INNER JOIN categories AS C
ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT  products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews 
 WHERE reviews.Rating= 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total
From Sales AS s
Left JOIN employees AS e ON e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by Total DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS DepartmentName, c.Name AS CategoryName
FROM departments AS d
INNER JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name, sum(s.Quantity) AS TotalSales, sum(s.Quantity * s.PricePerUnit) AS TotalPrice
 FROM sales AS s
 INNER JOIN products AS p
 ON s.ProductID = p.ProductID
 WHERE p.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM reviews AS r
INNER JOIN products AS p
ON r.ProductID = p.ProductID
WHERE p.Name = "Visio TV" AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS Product, s.Quantity AS AmountSold
From sales AS s
INNER JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
INNER JOIN products AS p
ON s.ProductID = p.ProductID;