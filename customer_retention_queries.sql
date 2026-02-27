-- Created New Database
Create Database ECOMMERCE;

-- Retrieved all columns from table
Select * from Ecommerce;

-- Retrieved Total Orders, Total Customers, Total Sales & Profit
Select
Count(Distinct[Order ID]) As Total_Orders,
Count(Distinct[Customer Name]) As Total_Customers,
Sum(Sales) As Total_Sales,
Sum(Profit) As Total_Profit
From Ecommerce;

-- Tracking Trend for Yearly Sales vs Profit
Select DATEPART(YEAR,[Order Date]) AS Order_Year,
Sum(Sales) As Monthly_Sales,
Sum(Profit) As Monthly_Profit,
Floor(Sum(Profit)/Sum(Sales) * 100) AS Profit_Margin
From Ecommerce
Group By DATEPART(YEAR,[Order Date])
Order By Order_Year Asc;

-- Region wise Sales & Profit
Select Region,
Sum(Sales) AS Region_Sales,
Sum(Profit) AS Region_Profit,
Floor(Sum(Profit)/Sum(Sales) * 100) AS Region_Margin
From Ecommerce
Group BY Region;

-- Category wise Sales & Profit
Select Category,
Sum(Sales) AS Category_Sales,
Sum(Profit) AS Category_Profit,
Floor(Sum(Profit)/Sum(Sales) * 100) AS Category_Margin
From Ecommerce
Group BY Category;

-- Each Customer Name & Orders Count
Select Distinct [Customer Name],
Count(Distinct [Order ID]) AS Total_Orders
From Ecommerce
Group By [Customer Name];

-- Customer who placed only 1 orders
Select Distinct [Customer Name],
Count(Distinct [Order ID]) AS Total_Orders
From Ecommerce
Group By [Customer Name]
Having Count(Distinct [Order ID]) = 1;

-- Customer who placed more than 1 order or repeat customer
Select Distinct [Customer Name],
Count(Distinct [Order ID]) AS Total_Orders
From Ecommerce
Group By [Customer Name]
Having Count(Distinct [Order ID]) > 1;

-- Retrieve Top 10 customer based on Profit
Select Top 10 [Customer Name],
Sum(Profit) AS Total_Profit
From Ecommerce
Group By [Customer Name]
Order By Total_Profit DESC;

-- Payment Mode wise Total Orders, Total Sales
Select [Payment Mode],
Count([Order ID]) AS Total_Orders,
Sum(Sales) AS Total_Sales
From Ecommerce
Group BY [Payment Mode];

-- Category on which repeat buyers exist**
SELECT 
e.Category,
COUNT(DISTINCT e.[Customer Name]) AS Repeat_Customers
FROM Ecommerce e
JOIN (
    SELECT [Customer Name]
    FROM Ecommerce
    GROUP BY [Customer Name]
    HAVING COUNT([Order ID]) > 1) r
ON e.[Customer Name] = r.[Customer Name]
GROUP BY e.Category
ORDER BY Repeat_Customers DESC;

-- Retrieve Top 5 Cities by Sales
Select TOP 5 City,
Sum(Sales) AS Total_Sales
From Ecommerce
Group By City;

-- Most Profitable Sub-Category
Select Top 1 [Sub-Category],
Sum(Profit) AS Total_Profit
From Ecommerce
Group By [Sub-Category];









