INSERT INTO users (name, email)
VALUES
    ('Arun Kumar', 'arun.kumar@gmail.com'),
    ('Meera Nair', 'meera.nair@gmail.com'),
    ('Rahul Menon', 'rahul.menon@gmail.com'),
    ('Anjali Thomas', 'anjali.thomas@gmail.com'),
    ('Vivek Raj', 'vivek.raj@gmail.com');

INSERT INTO products(name, sku, price, stock)
VALUES
    ('Wireless Mouse', 'WM-001', 799.00, 25),
    ('Mechanical Keyboard', 'MK-002', 2499.00, 15),
    ('USB-C Hub', 'UH-003', 1499.00, 20),
    ('Laptop Stand', 'LS-004', 1299.00, 12),
    ('Bluetooth Headphones', 'BH-005', 3499.00, 8),
    ('1080p Webcam', 'WC-006', 2199.00, 10),
    ('External SSD 1TB', 'SSD-007', 6499.00, 5),
    ('USB-C Charger 65W', 'CH-008', 1799.00, 0);

-- - seeds for orders of the products

INSERT INTO orders (user_id, status)
SELECT id, 'delivered'
FROM users
WHERE email = 'arun.kumar@gmail.com';

INSERT INTO orders (user_id, status)
SELECT id, 'shipped'
FROM users
WHERE email = 'meera.nair@gmail.com';

INSERT INTO orders (user_id, status)
SELECT id, 'confirmed'
FROM users
WHERE email = 'rahul.menon@gmail.com';

INSERT INTO orders (user_id, status)
SELECT id, 'pending'
FROM users
WHERE email = 'arun.kumar@gmail.com';

INSERT INTO orders (user_id, status)
SELECT id, 'cancelled'
FROM users
WHERE email = 'anjali.thomas@gmail.com';



-- - seeds for order_items of the products

INSERT INTO order_items (order_id, product_id, quantity)
SELECT o.id, p.id, 2
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products AS p
ON p.sku = 'WM-001'
WHERE email = 'arun.kumar@gmail.com'
AND status = 'delivered';

INSERT INTO order_items (order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'MK-002'
WHERE email = 'arun.kumar@gmail.com'
AND status = 'delivered';;

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'BH-005'
WHERE email = 'meera.nair@gmail.com';

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 2
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'UH-003'
WHERE email = 'meera.nair@gmail.com';

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'LS-004'
WHERE email = 'rahul.menon@gmail.com';

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'SSD-007'
WHERE email = 'rahul.menon@gmail.com';

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'WM-001'
WHERE email = 'arun.kumar@gmail.com'
AND status = 'pending';

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'WC-006'
WHERE email = 'arun.kumar@gmail.com'
AND status = 'pending';;

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'CH-008'
WHERE email = 'anjali.thomas@gmail.com';

INSERT INTO order_items(order_id, product_id, quantity)
SELECT o.id, p.id, 1
FROM users as u
INNER JOIN orders as o
ON o.user_id = u.id
INNER JOIN products as p
ON sku = 'UH-003'
WHERE email = 'anjali.thomas@gmail.com';
