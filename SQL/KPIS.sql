-- A) Key Performance Indicators KPIS
-------------------------------------------------------------------------------
select * from pizza_sales
-------------------------------------------------------------------------------

-- 1) Total Revenue
select cast(sum(total_price) as decimal(10,2)) as Total_Revenue
from pizza_sales
----------------------------------------------------------

-- 2) Average Order Value
select cast(sum(total_price)/ count(distinct order_id)as decimal(10,2))as Average_Order_Value
from pizza_sales
--------------------------------------------------------------------------------------

-- 3) Total Pizzas Sold
select sum(quantity) as Total_Pizzas_Sold
from pizza_sales
--------------------------------------------------------------------------------------

-- 4) Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
--------------------------------------------------------------------------------------

--5) Average Pizzas Per Order
select cast( cast(sum(quantity) as decimal(10,2))
/ count(distinct order_id) as decimal(10,2))as Average_Pizzas_Per_Order
from pizza_sales