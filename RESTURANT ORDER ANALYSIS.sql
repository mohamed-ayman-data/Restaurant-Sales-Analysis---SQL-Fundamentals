-- ========================================
--  RESTAURANT SQL ANALYSIS PROJECT
--  Source: Maven Analytics
--  Author: [Your Name]
--  Tool: MySQL Workbench 8.0
-- ========================================

USE resturant;

-- ================================
-- 🧭 OBJECTIVE 1: MENU ANALYSIS
-- ================================

-- View all menu items
SELECT * FROM menu_items;

-- Count total menu items
SELECT COUNT(*) AS total_items
FROM menu_items;

-- Most expensive item
SELECT item_name, price
FROM menu_items
WHERE price = (SELECT MAX(price) FROM menu_items);

-- Least expensive item
SELECT item_name, price
FROM menu_items
WHERE price = (SELECT MIN(price) FROM menu_items);

-- Menu items in descending price order
SELECT item_name, price
FROM menu_items
ORDER BY price DESC;

-- Number of Italian dishes
SELECT COUNT(*) AS italian_dishes
FROM menu_items
WHERE category = 'Italian';

-- Most & least expensive Italian dishes
SELECT item_name, price, category
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- Dishes per category + average price
SELECT 
    category, 
    COUNT(*) AS number_of_dishes,
    ROUND(AVG(price), 2) AS avg_dish_price
FROM menu_items
GROUP BY category
ORDER BY number_of_dishes DESC;
-- ================================
-- 📅 OBJECTIVE 2: ORDER ANALYSIS
-- ================================

-- View all order details
SELECT * FROM order_details;

-- Find the date range of orders
SELECT 
    MIN(order_date) AS first_order_date, 
    MAX(order_date) AS last_order_date
FROM order_details;

-- Number of distinct orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- Total number of items ordered
SELECT COUNT(*) AS total_items_ordered
FROM order_details;

-- Orders with the most items
SELECT 
    order_id, 
    COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- Orders with more than 12 items
SELECT COUNT(*) AS orders_over_12_items
FROM (
    SELECT order_id
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS sub;
-- ================================
-- 🍽️ OBJECTIVE 3: COMBINED ANALYSIS
-- ================================

-- Combine menu_items & order_details
SELECT 
    od.order_id,
    mi.item_name,
    mi.category,
    mi.price,
    od.order_date,
    od.order_time
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
LIMIT 10;

-- Least & most ordered items (with categories)
SELECT 
    mi.item_name, 
    mi.category,
    COUNT(od.order_id) AS times_ordered
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY times_ordered DESC;
-- ================================
-- 💰 OBJECTIVE 4: REVENUE INSIGHTS
-- ================================

-- Top 5 highest spending orders
SELECT 
    od.order_id,
    SUM(mi.price) AS total_spent
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spent DESC
LIMIT 5;

-- Breakdown of the highest spending order (ID = 440)
SELECT 
    mi.category,
    COUNT(od.item_id) AS items_purchased
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE od.order_id = 440
GROUP BY mi.category
ORDER BY items_purchased DESC;

-- Breakdown of top 5 highest spending orders
SELECT 
    mi.category,
    COUNT(od.item_id) AS items_purchased
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE od.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY mi.category
ORDER BY items_purchased DESC; 
-- ================================
