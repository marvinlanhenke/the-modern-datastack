CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY
    , name VARCHAR(100) NOT NULL
    , email VARCHAR(100) NOT NULL
    , created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Charlie Davis', 'charlie.davis@example.com'),
('Diana Evans', 'diana.evans@example.com'),
('Edward Wilson', 'edward.wilson@example.com'),
('Fiona Brown', 'fiona.brown@example.com'),
('George Harris', 'george.harris@example.com'),
('Helen Clark', 'helen.clark@example.com'),
('Ian Lewis', 'ian.lewis@example.com'),
('Julia Turner', 'julia.turner@example.com');

CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY
    , customer_id INTEGER REFERENCES customers(id)
    , product VARCHAR(100) NOT NULL
    , amount VARCHAR(100) NOT NULL
    , sale_date DATE NOT NULL
);

-- Insert sample sales data into the sales table
INSERT INTO sales (customer_id, product, amount, sale_date) VALUES
(1, 'Product A', '$19.99', '2023-09-01'),
(2, 'Product B', '$29.99', '2023-09-02'),
(3, 'Product C', '$39.99', '2023-09-03'),
(4, 'Product D', '$49.99', '2023-09-04'),
(5, 'Product E', '$59.99', '2023-09-05'),
(6, 'Product F', '$69.99', '2023-09-06'),
(7, 'Product G', '$79.99', '2023-09-07'),
(8, 'Product H', '$89.99', '2023-09-08'),
(9, 'Product I', '$99.99', '2023-09-09'),
(10, 'Product J', '$109.99', '2023-09-10');
