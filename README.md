# TechMart Database Project

## 📚 Campus Project – Fundamental Database Course Final Project

This project is a **SQL-based database system** for a fictional e-commerce platform called **TechMart**. It was developed as the **final project** for the **Fundamentals of Database** course. The database is designed to manage customers, products, orders, suppliers, and transactions.

## 🗄️ Project Overview
The database includes the following key functionalities:
- Creation of a **TechMart database**
- Definition of **six relational tables** with primary and foreign keys:
  - **Customers**
  - **Products**
  - **Orders**
  - **OrderDetails**
  - **Transactions**
  - **Suppliers**
- **Sample data insertion** into each table
- **SQL queries** to verify the data

## 🛠️ Database Schema

### 1. Customers
```sql
CustomerID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
Phone VARCHAR(15)
```

### 2. Products
```sql
ProductID INT PRIMARY KEY IDENTITY(1,1),
ProductName VARCHAR(100) NOT NULL,
Price DECIMAL(10, 2) NOT NULL,
Stock INT NOT NULL
```

### 3. Orders
```sql
OrderID INT PRIMARY KEY IDENTITY(1,1),
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
```

### 4. OrderDetails
```sql
OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
Price DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
```

### 5. Transactions
```sql
PaymentID INT PRIMARY KEY IDENTITY(1,1),
OrderID INT NOT NULL,
PaymentAmount DECIMAL(10, 2) NOT NULL,
PaymentMethod VARCHAR(20) NOT NULL,
PaymentStatus VARCHAR(20) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
```

### 6. Suppliers
```sql
SupplierID INT PRIMARY KEY IDENTITY(1,1),
SupplierName VARCHAR(50) NOT NULL,
ContactInfo VARCHAR(15),
Price DECIMAL(10, 2) NOT NULL,
StockQuantity INT NOT NULL
```

## 🧑‍💻 SQL Script Highlights
### Database Creation
```sql
DROP DATABASE IF EXISTS TechMart;
CREATE DATABASE TechMart;
USE TechMart;
```

### Sample Data Insertion
```sql
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890');
-- (Additional sample data provided in script)
```

### Data Verification Queries
```sql
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Transactions;
SELECT * FROM Suppliers;
```

## 📂 Files Included
- **database_script.sql** – Full SQL script for database creation, table definitions, and data insertion
- **project_report.pdf** – Final project documentation

## 📌 How to Run
1. Open your **SQL Server Management Studio (SSMS)** or any compatible SQL environment.
2. Copy the contents of **database_script.sql**.
3. Execute the script step-by-step or as a whole.
4. Run the verification queries to ensure tables and data are created successfully.

## 🚀 Key Learning Outcomes
- Understanding **database schema design**.
- Applying **SQL commands** for table creation, data manipulation, and queries.
- Working with **primary keys, foreign keys, and relationships**.
- Gaining hands-on experience with **real-world data management**.

## 🏫 Developed By
**Tamiru Assefa Welekbea**  
**St. Mary's University – Department of Computer Science**

## 🏷️ Tags
`SQL` `Database Design` `RDBMS` `Campus Project` `SQL Server`

