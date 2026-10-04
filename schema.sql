CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name VARCHAR(50) NOT NULL,

    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(), 
    
    name VARCHAR(100) NOT NULL,

    sku TEXT NOT NULL UNIQUE,

    price NUMERIC(10, 2)
        CHECK (price >= 0),

    stock INTEGER DEFAULT 0
        CHECK (stock >= 0)
);

CREATE TABLE IF NOT EXISTS orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL REFERENCES users(id),

    status TEXT NOT NULL DEFAULT 'pending'
        CHECK (status IN (
            'pending',
            'confirmed',
            'shipped',
            'delivered',
            'cancelled'
        )),

    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id UUID NOT NULL REFERENCES orders(id),

    product_id UUID NOT NULL REFERENCES products(id),

    quantity INTEGER NOT NULL
        CHECK (quantity > 0),

    PRIMARY KEY(order_id, product_id)    
);


