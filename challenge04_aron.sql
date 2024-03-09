-- challenge04_aron.sql
-- Use inventory.products to rank product pricing.
/* Display rankings overall, segmented by category and by size.
Not as complete as the teachers' solution.
*/
CREATE OR REPLACE VIEW products_ranking AS
SELECT sku,
    product_name,
    category_id,
    size,
    price,
    RANK() OVER (
        PARTITION BY category_id,
        size
        ORDER BY price
    ) AS ranking
FROM inventory.products;
SELECT *
FROM products_ranking
ORDER BY sku,
    category_id,
    size;