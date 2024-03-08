-- challenge01_aron.sql
-- Write two queries that explore the Two Trees Olive Oil order data.
/* From sales.orders, find the number of orders placed per month for each customer;
 use an aggregate filter and remember that dates use single quotes. */
CREATE OR REPLACE VIEW orders_per_month_and_customer AS
SELECT DATE (DATE_TRUNC('month', "order_date")) AS "Order month",
    customer_id,
    COUNT(*) AS "Number of orders"
FROM sales.orders
GROUP BY "Order month",
    customer_id;
SELECT "Order month",
    customer_id,
    "Number of orders"
FROM orders_per_month_and_customer
ORDER BY customer_id;
SELECT customer_id,
    "Number of orders"
FROM orders_per_month_and_customer
WHERE "Order month" = '2021-03-01'
ORDER BY customer_id;
SELECT customer_id,
    "Number of orders"
FROM orders_per_month_and_customer
WHERE "Order month" = '2021-04-01'
ORDER BY customer_id;
SELECT customer_id,
    SUM("Number of orders") FILTER (
        WHERE "Order month" BETWEEN '2021-01-01' AND '2021-12-31'
    )
FROM orders_per_month_and_customer
GROUP BY customer_id
ORDER BY customer_id;
/* From sales.order_lines, find the total quantity of each product sold;
 use the sum() aggregate function to add up the product quantities. */
CREATE OR REPLACE VIEW quantity_per_product AS
SELECT sku,
    SUM(quantity) AS "total quantity"
FROM sales.order_lines
GROUP BY sku;
SELECT *
FROM quantity_per_product
ORDER BY sku;