DROP TABLE IF EXISTS "Payment" CASCADE;
DROP TABLE IF EXISTS "OrderItem" CASCADE;
DROP TABLE IF EXISTS "Order" CASCADE;
DROP TABLE IF EXISTS "Product" CASCADE;
DROP TABLE IF EXISTS "Address" CASCADE;
DROP TABLE IF EXISTS "Customer" CASCADE;

CREATE TABLE "Customer" (
    "customer_id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) NOT NULL UNIQUE,
    "password" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(20),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Address" (
    "address_id" SERIAL PRIMARY KEY,
    "street" VARCHAR(255) NOT NULL,
    "postal_code" VARCHAR(20) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "country" VARCHAR(100) NOT NULL,
    "customer_id" INT NOT NULL,
    FOREIGN KEY ("customer_id") REFERENCES "Customer"("customer_id") ON DELETE CASCADE
);

CREATE TABLE "Product" (
    "product_id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "description" TEXT,
    "price" DECIMAL(10,2) NOT NULL,
    "stock_quantity" INT NOT NULL
);

CREATE TABLE "Order" (
    "order_id" SERIAL PRIMARY KEY,
    "order_date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(50) NOT NULL,
    "total_amount" DECIMAL(10,2) NOT NULL,
    "customer_id" INT NOT NULL,
    "shipping_address_id" INT NOT NULL,
    FOREIGN KEY ("customer_id") REFERENCES "Customer"("customer_id"),
    FOREIGN KEY ("shipping_address_id") REFERENCES "Address"("address_id")
);

CREATE TABLE "OrderItem" (
    "order_item_id" SERIAL PRIMARY KEY,
    "quantity" INT NOT NULL,
    "unit_price" DECIMAL(10,2) NOT NULL,
    "order_id" INT NOT NULL,
    "product_id" INT NOT NULL,
    FOREIGN KEY ("order_id") REFERENCES "Order"("order_id") ON DELETE CASCADE,
    FOREIGN KEY ("product_id") REFERENCES "Product"("product_id")
);

CREATE TABLE "Payment" (
    "payment_id" SERIAL PRIMARY KEY,
    "payment_date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "amount" DECIMAL(10,2) NOT NULL,
    "payment_method" VARCHAR(50) NOT NULL,
    "payment_status" VARCHAR(50) NOT NULL,
    "order_id" INT UNIQUE NOT NULL,
    FOREIGN KEY ("order_id") REFERENCES "Order"("order_id")
);
