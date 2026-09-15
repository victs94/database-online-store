SELECT 
    C."first_name",
    C."last_name",
    C."email",
    COUNT(O."order_id") AS "total_orders",
    SUM(O."total_amount") AS "total_spent"
FROM "Customer" C
JOIN "Order" O ON C."customer_id" = O."customer_id"
GROUP BY C."customer_id", C."first_name", C."last_name", C."email"
ORDER BY "total_spent" DESC;
