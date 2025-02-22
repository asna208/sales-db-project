-- sales_schema.sql
-- Schema for Sales Database

-- 1️⃣ Create Customers Table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,  -- Unique identifier
    customer_name TEXT NOT NULL,
    contact_lastname TEXT NOT NULL,
    contact_firstname TEXT NOT NULL,
    phone TEXT ,
    address_1 TEXT NOT NULL,
    address_2 TEXT ,  
    city TEXT NOT NULL,
    state TEXT DEFAULT NULL,  
    postal_code TEXT DEFAULT NULL,  
    country TEXT NOT NULL
);

-- 2️⃣ Create Orders Table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,  -- Unique identifier
    customer_id INTEGER NOT NULL,  -- Foreign key referencing Customers
    order_number INTEGER NOT NULL,
    order_date DATE NOT NULL,
    status TEXT  CHECK(status IN ('Shipped', 'Disputed', 'In Process', 'Cancelled', 'On Hold', 'Resolved'))  ,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- 3️⃣ Create Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,  -- Unique identifier
    product_code TEXT NOT NULL,  -- Could be a string (e.g., 'S10_1678')
    product_line TEXT NOT NULL
);

-- 4️⃣ Create Order Details Table
CREATE TABLE Order_Details (
    orderdetail_id INTEGER PRIMARY KEY,  -- Unique identifier
    order_id INTEGER NOT NULL,  -- Foreign key referencing Orders
    product_id INTEGER NOT NULL,  -- Foreign key referencing Products
    quantity INTEGER NOT NULL,
    price_each REAL NOT NULL,  
    orderline_number INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- 5️⃣ Create Sales Table
CREATE TABLE Sales (
    sales_id INTEGER PRIMARY KEY,  -- Unique identifier
    orderdetail_id INTEGER NOT NULL,  -- Foreign key referencing Order_Details
    sales REAL NOT NULL,  
    deal_size TEXT NOT NULL,
    FOREIGN KEY (orderdetail_id) REFERENCES Order_Details(orderdetail_id) ON DELETE CASCADE
);

-- ✅ Verify Tables Created
SELECT name FROM sqlite_master WHERE type='table';


 
---Create index for Uniqe columns
CREATE INDEX customerid ON customers (customer_id);
CREATE INDEX ordersid ON orders (order_id);
CREATE INDEX productsid ON products (product_id);

 
