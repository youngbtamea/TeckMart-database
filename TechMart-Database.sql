-- 1. Create Database (Optional: Modify database name as needed)
DROP DATABASE IF EXISTS TechMart;
CREATE DATABASE TechMart;
USE TechMart;

-- 2. Drop Tables (If They Exist)
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Suppliers;

-- 3. Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Transactions (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(15),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- 4. Insert Sample Data
-- Insert data into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
    ('Alice', 'Brown', 'alice.brown@example.com', '1122334455');

-- Insert data into Products
INSERT INTO Products (ProductName, Price, Stock)
VALUES
    ('Laptop', 999.99, 50),
    ('Smartphone', 699.99, 100),
    ('Tablet', 399.99, 75);

-- Insert data into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (1, '2024-12-15', 1099.98),
    (2, '2024-12-16', 399.99);

-- Insert data into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
    (1, 1, 1, 999.99),
    (1, 2, 1, 99.99),
    (2, 3, 1, 399.99);

-- Insert data into Transactions
INSERT INTO Transactions (OrderID, PaymentAmount, PaymentMethod, PaymentStatus)
VALUES
    (1, 1099.98, 'Credit Card', 'Completed'),
    (2, 399.99, 'PayPal', 'Pending');

-- Insert data into Suppliers
INSERT INTO Suppliers (SupplierName, ContactInfo, Price, StockQuantity)
VALUES
    ('Tech Supplies Co.', '5551234567', 899.99, 30),
    ('Gadget Wholesale', '5559876543', 649.99, 50),
    ('Device Depot', '5551122334', 379.99, 40);

-- 5. Verify Data
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Transactions;
SELECT * FROM Suppliers;
