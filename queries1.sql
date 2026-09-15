SELECT 
    P."name" AS "product_name",
    OI."unit_price",
    OI."quantity",
    (OI."unit_price" * OI."quantity") AS "subtotal"
FROM "OrderItem" OI
JOIN "Product" P ON OI."product_id" = P."product_id"
WHERE OI."order_id" = 1;
