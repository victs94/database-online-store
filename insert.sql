INSERT INTO "Customer" ("first_name", "last_name", "email", "password", "phone") VALUES 
('John', 'Doe', 'john.doe@email.com', 'pass123', '0601020304'),
('Sophie', 'Martin', 'sophie.martin@email.com', 'pass456', '0611223344'),
('Lucas', 'Bernard', 'lucas.bernard@email.com', 'pass789', '0655667788');

INSERT INTO "Address" ("street", "postal_code", "city", "country", "customer_id") VALUES 
('12 Main Street', '75002', 'Paris', 'France', 1),
('45 Broadway', '69006', 'Lyon', 'France', 2),
('8 Sunset Blvd', '13001', 'Marseille', 'France', 3);

INSERT INTO "Product" ("name", "description", "price", "stock_quantity") VALUES 
('Smartphone X', 'OLED Screen, 128 GB', 699.99, 15),
('Wireless Headphones', 'Active noise cancellation', 149.50, 30),
('Organic Cotton T-Shirt', '100% Organic cotton, Size L', 25.00, 100),
('LED Desk Lamp', 'Adjustable brightness, USB port', 39.90, 8);

INSERT INTO "Order" ("order_date", "status", "total_amount", "customer_id", "shipping_address_id") VALUES 
('2026-03-01 10:15:00', 'Delivered', 849.49, 1, 1),
('2026-03-05 14:30:00', 'Processing', 25.00, 2, 2),
('2026-03-10 09:00:00', 'Paid', 189.40, 1, 1);

INSERT INTO "OrderItem" ("quantity", "unit_price", "order_id", "product_id") VALUES 
(1, 699.99, 1, 1),
(1, 149.50, 1, 2),
(1, 25.00, 2, 3),
(1, 149.50, 3, 2),
(1, 39.90, 3, 4);

INSERT INTO "Payment" ("payment_date", "amount", "payment_method", "payment_status", "order_id") VALUES 
('2026-03-01 10:16:00', 849.49, 'Credit Card', 'Completed', 1),
('2026-03-05 14:31:00', 25.00, 'PayPal', 'Completed', 2),
('2026-03-10 09:01:00', 189.40, 'Credit Card', 'Completed', 3);
