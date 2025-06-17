CREATE DATABASE ecommerce_warehouse;
\c ecommerce_warehouse;

-- Dimension: Customers
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_sk SERIAL PRIMARY KEY,
    customer_id INT,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    city VARCHAR(100),
    created_at TIMESTAMP
);

-- Dimension: Products
CREATE TABLE IF NOT EXISTS dim_products (
    product_sk SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10,2),
    created_at TIMESTAMP
);

-- Fact Table: Orders
CREATE TABLE IF NOT EXISTS fact_orders (
    order_sk SERIAL PRIMARY KEY,
    order_id INT,
    customer_sk INT,
    product_sk INT,
    quantity INT,
    total_price DECIMAL(10,2),
    order_date TIMESTAMP,
    FOREIGN KEY (customer_sk) REFERENCES dim_customers(customer_sk),
    FOREIGN KEY (product_sk) REFERENCES dim_products(product_sk)
);
