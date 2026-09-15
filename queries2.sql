SELECT 
    P."name" AS "product_name",
    P."price",
    P."stock_quantity"
FROM "Product" P
WHERE P."stock_quantity" < 20
ORDER BY P."stock_quantity" ASC;
