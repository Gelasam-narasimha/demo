-- 1. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- 2. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- 3. Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. SalesDetails Table
CREATE TABLE SalesDetails (
    SalesDetailID INT PRIMARY KEY AUTO_INCREMENT,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 5. Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    SaleID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

drop table customers;

-- 1. Insert Data into Customers
INSERT INTO Customers (CustomerName, Email, Phone, Address) VALUES
('Narasimha', 'narasimha@gmail.com', '9618517329', 'Andhra Pradesh'),
('Bharath', 'bharatg@gmail.com', '', '456 Oak St'),
('Charlie Brown', 'charlie@example.com', '555-123-4567', '789 Pine St'),
('David White', 'david@example.com', '555-987-6543', '101 Elm St'),
('Eva Davis', 'eva@example.com', '555-555-5555', '202 Cedar St');

-- 2. Insert Data into Products
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Laptop', 800.00, 50),
('Smartphone', 500.00, 100),
('Tablet', 300.00, 60),
('Monitor', 150.00, 30),
('Keyboard', 50.00, 200);

-- 3. Insert Data into Sales
INSERT INTO Sales (CustomerID, SaleDate, TotalAmount) VALUES
(1, '2024-10-01', 1300.00),
(2, '2024-10-02', 500.00),
(3, '2024-10-02', 900.00),
(4, '2024-10-03', 300.00),
(5, '2024-10-04', 200.00);

-- 4. Insert Data into SalesDetails
INSERT INTO SalesDetails (SaleID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 800.00),
(1, 2, 1, 500.00),
(2, 2, 1, 500.00),
(3, 3, 3, 300.00),
(4, 5, 1, 50.00),
(5, 5, 2, 50.00);

-- 5. Insert Data into Payments
INSERT INTO Payments (SaleID, PaymentDate, PaymentAmount, PaymentMethod) VALUES
(1, '2024-10-01', 1300.00, 'Credit Card'),
(2, '2024-10-02', 500.00, 'Cash'),
(3, '2024-10-02', 900.00, 'Credit Card'),
(4, '2024-10-03', 300.00, 'Debit Card'),
(5, '2024-10-04', 200.00, 'Credit Card');

-- Aggregate Functions

-- Total Sales Amount by Customer
SELECT c.CustomerName, SUM(s.TotalAmount) AS TotalSales
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerName;

-- Average Price of Products
SELECT AVG(Price) AS AvgProductPrice FROM Products;

-- Total Quantity Sold per Product
SELECT p.ProductName, SUM(sd.Quantity) AS TotalQuantitySold
FROM SalesDetails sd
JOIN Products p ON sd.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Count of Sales Transactions per Day
SELECT SaleDate, COUNT(*) AS SalesCount
FROM Sales
GROUP BY SaleDate;

-- Total Payment Amount by Payment Method
SELECT PaymentMethod, SUM(PaymentAmount) AS TotalPayments
FROM Payments
GROUP BY PaymentMethod;

select * from products;

select * from payments;

select * from customers;
