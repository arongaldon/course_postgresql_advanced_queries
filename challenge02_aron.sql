-- challenge02_aron.sql
-- Use inventory.products to explore the Two Trees Olive Oil product data.
/* Write a query with window functions that expands on the information for each product.
 Display the min, max and average price for each product, as well as the total count of
 products within the same category and size classifications.
 Remember to use a window clause when frames use the same parameters.*/
CREATE OR REPLACE VIEW products_expanded AS
SELECT sku,
    product_name,
    category_id,
    size,
    price,
    MIN(price) OVER w AS min_price,
    MAX(price) OVER w AS max_price,
    AVG(price) OVER w AS avg_price,
    COUNT(*) OVER w AS product_count
FROM inventory.products WINDOW w AS (PARTITION BY category_id, size);
SELECT *
FROM products_expanded
ORDER BY category_id,
    product_name,
    size;