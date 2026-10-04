# E-Commerce SQL Practice Project

A PostgreSQL database project created to practice SQL fundamentals and solve
real-world e-commerce business queries.

## Database

- PostgreSQL
- Database: `ecommerce_db`

## Database Structure

The database contains four main tables:

- `users` — stores customer information
- `products` — stores product information
- `orders` — stores customer orders
- `order_items` — stores products and quantities belonging to each order

### Relationships

```text
users
  │
  └──< orders
          │
          └──< order_items >── products