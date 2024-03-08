-- challenge03_aron.sql
-- Use inventory.products to explore the Two Trees Olive Oil product pricing.
/* Display the min, max, first quartile, second quartile and third quartile; and range of prices.
 Use grouping functions and ordered sets.*/
CREATE OR REPLACE VIEW explore_products AS
SELECT category_id,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    PERCENTILE_CONT(0.25) WITHIN GROUP (
        ORDER BY price
    ) AS first_quartile,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY price
    ) AS second_quartile,
    PERCENTILE_CONT(0.75) WITHIN GROUP (
        ORDER BY price
    ) AS third_quartile,
    MAX(price) - MIN(price) AS price_range
FROM inventory.products
GROUP BY ROLLUP (category_id);
SELECT *
FROM explore_products;