-- B) Charts Requirement
-------------------------------------------------------------------------------------
select * from pizza_sales
-------------------------------------------------------------------------------------

--1) Daily Trend for Total Orders
select DATENAME(DW,order_date) as order_day , count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW,order_date)
order by total_orders Desc
---------------------------------------------------------------------------------

--2) Hourly Trend for Orders
select DATEPART(hh,order_time) as order_hours,COUNT(DISTINCT order_id) as total_orders 
from pizza_sales
group by DATEPART(hh,order_time)
order by DATEPART(hh,order_time)
---------------------------------------------------------------------------------

-- 3) % of Sales by Pizza Category
select pizza_category,cast(sum(total_price) as decimal(10,2)) as total_revenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales)as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category
order by PCT desc
--------------------------------------------------------------------------------

-- 4) % of Sales by Pizza Size
select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_revenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales)as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc
------------------------------------------------------------------------------------------------

--5) Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold 
FROM pizza_sales 
GROUP BY pizza_category 
ORDER BY Total_Quantity_Sold DESC
------------------------------------------------------------------------------------------------

--6) Total Pizzas Sold by Pizza Size
SELECT pizza_size, SUM(quantity) as Total_Quantity_Sold 
FROM pizza_sales 
GROUP BY pizza_size 
ORDER BY Total_Quantity_Sold DESC
------------------------------------------------------------------------------------------------

-- 7) Top 5 Best Sellers by Total Pizzas Sold
select top 5 pizza_name,SUM(quantity) AS Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold desc

------------------------------------------------------------------------------------------------

-- 7) Bottom 5 Best Sellers by Total Pizzas Sold
select top 5 pizza_name,SUM(quantity) AS Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold 
