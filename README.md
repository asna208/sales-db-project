 # Sales.db Portfolio Project

## Introduction
This project, built using SQLite3, is a personal portfolio piece designed to showcase my skills in database design, SQL querying, and data analysis. It implements a robust e-commerce sales system to analyze customer behavior, track sales by location (City and Country), and provide actionable business insights. This project demonstrates my ability to design, develop, and manage a relational database, as well as my proficiency in extracting meaningful insights from real-world datasets sourced from Kaggle.

## Purpose
The main objectives of this project are to:
- Demonstrate my expertise in designing and implementing a relational database using SQLite3.
- Showcase my ability to analyze customer buying patterns and sales trends using SQL queries, using the “Sample Sales Data” dataset from Kaggle.
- Highlight my skills in data modeling, schema creation, data cleaning, and location-based analytics for business decision-making.

## Skills Demonstrated
This project showcases the following technical skills and knowledge:
- **Database Design and Management:** Creating and optimizing a relational database schema with SQLite3.
- **SQL Proficiency:** Writing complex queries for data retrieval, aggregation, and analysis.
- **Data Analysis:** Analyzing customer behavior, sales performance, and geographic trends.
- **Data Import and Integration:** Importing and managing data from CSV files (e.g., Kaggle datasets) into a SQLite database.
- **Data Cleaning and Transformation:** Preprocessing and normalizing denormalized real-world data to fit a relational schema.
- **Problem-Solving:** Addressing real-world business challenges like tracking sales by location and order status using Kaggle data.
- **Documentation:** Clear and professional documentation of the project structure, schema, and usage.

## Tools and Technologies
- **Database:** SQLite3
- **Development Environment:** Visual Studio Code
- **Data Sources:** 
  - "Sample Sales Data" dataset from Kaggle (sales_data_sample.csv)
  - Preprocessed CSV files derived from the Kaggle dataset: customers.csv, orders.csv, order_details.csv, products.csv, sales.csv

## Entity Relationship Diagram (ERD)
The ERD visually represents the relationships between entities in the database, demonstrating my ability to model complex data structures. You can view the ERD here:![ ERD](<Entity Relationship Diagram Team Whiteboard-3.png>)

**ERD Components:**
- **Customers:** Stores customer information and location data.
- **Orders:** Tracks customer orders, including quantities, prices, and status.
- **Order Details:** Manages details of each order, such as products and quantities.
- **Sales:** Records sales transactions and deal sizes.
- **Products:** Contains product information like product codes and lines.

## Database Schema
The database schema, defined in the `sales_schema.sql` file, showcases my ability to design a normalized, efficient, and scalable database, adapted to the Kaggle dataset.

### **Customers Table**
```sql
customer_id INTEGER PRIMARY KEY,
customer_name TEXT NOT NULL,
city TEXT NOT NULL,
country TEXT NOT NULL,
phone TEXT
```

### **Orders Table**
```sql
order_id INTEGER PRIMARY KEY,
customer_id INTEGER NOT NULL REFERENCES Customers(customer_id) ON DELETE CASCADE,
order_date DATE NOT NULL,
status TEXT CHECK(status IN ('Shipped', 'Disputed', 'In Process', 'Cancelled', 'On Hold', 'Resolved'))
```

### **Products Table**
```sql
product_id INTEGER PRIMARY KEY,
product_code TEXT,
product_line TEXT
```

### **Order_Details Table**
```sql
orderdetail_id INTEGER PRIMARY KEY AUTOINCREMENT,
order_id INTEGER NOT NULL REFERENCES Orders(order_id) ON DELETE CASCADE,
product_id INTEGER NOT NULL REFERENCES Products(product_id) ON DELETE CASCADE,
quantity INTEGER NOT NULL,
price_each REAL NOT NULL
```

### **Sales Table**
```sql
sales_id INTEGER PRIMARY KEY,
orderdetail_id INTEGER NOT NULL REFERENCES Order_Details(orderdetail_id) ON DELETE CASCADE,
sales REAL NOT NULL,
deal_size TEXT NOT NULL
```

## Setup and Installation
This section demonstrates my ability to set up and document a project for reproducibility:

### **Clone the Repository**
```bash
git clone https://github.com/asna208/sales-db-project.git
cd sales-db-project
```

### **Open in VS Code**
Open the folder containing `sales.db` in Visual Studio Code.

### **Install SQLite Extension**
Install the SQLite extension in VS Code if not already installed.

### **Set Up the Database**
Ensure SQLite3 is installed on your system.

```bash
sqlite3 sales.db
```

Load the schema by running the `sales_schema.sql` script:
```sql
.read sales_schema.sql
```

### **Import Data**
1. Download the "Sample Sales Data" dataset (`sales_data_sample.csv`) from Kaggle.
2. Preprocess the dataset using the `preprocess_kaggle.py` script (or a similar tool) to create normalized CSV files (`customers.csv`, `orders.csv`, `order_details.csv`, `products.csv`, `sales.csv`).
3. Import the preprocessed CSV files into the corresponding tables using SQLite commands:

```sql
.mode csv
.import customers.csv Customers
.import orders.csv Orders
.import order_details.csv Order_Details
.import products.csv Products
.import sales.csv Sales
```

Ensure the CSV column names match the table column names or use column mapping if necessary.

## Usage and Analysis
This project showcases my SQL querying and data analysis skills through practical examples, tailored to the Kaggle dataset.

### **Total Sales by Country**
```sql
SELECT c.country, SUM(od.quantity * od.price_each) AS total_sales
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
GROUP BY c.country
ORDER BY total_sales DESC
LIMIT 10;
```

### **Customer Orders by City**
```sql
SELECT c.city, COUNT(o.order_id) AS order_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY order_count DESC;
```

## Why This Project?
This portfolio project stands out because it:
- Combines real-world e-commerce challenges with advanced database techniques, using the “Sample Sales Data” dataset from Kaggle.
- Demonstrates my ability to design a scalable, normalized database schema and adapt it to a denormalized, real-world dataset.
- Showcases my proficiency in SQL for complex data analysis and reporting, including data cleaning and transformation.
- Highlights my attention to detail in documentation, data integration, and project organization.

## Contributing
While this is a portfolio project, I welcome feedback or collaboration opportunities. Please reach out via the contact information below.

## Contact
For questions, feedback, or collaboration opportunities, contact me at:

 
- **GitHub:** [asna208](https://github.com/asna208)
