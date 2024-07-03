CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;


-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    Publisher VARCHAR(255),
    PublicationDate DATE,
    ISBN VARCHAR(13),
    StockQuantity INT NOT NULL
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    BookID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert sample data into Books Table
INSERT INTO Books (Title, Author, Genre, Price, Publisher, PublicationDate, ISBN, StockQuantity)
VALUES 
('HARRY POTTER', 'Author 1', 'Genre 1', 19.99, 'Publisher 1', '2022-01-01', '1234567890123', 10),
('7 DAYS IN JUNE', 'Author 2', 'Genre 2', 29.99, 'Publisher 2', '2022-02-01', '1234567890124', 5),
('Dune', 'Frank Herbert', 'Science Fiction', 24.99, 'Chilton Books', '1965-08-01', '9780441013593', 15),
('Neuromancer', 'William Gibson', 'Science Fiction', 18.99, 'Ace Books', '1984-07-01', '9780441569595', 20),
('Foundation', 'Isaac Asimov', 'Science Fiction', 22.99, 'Gnome Press', '1951-06-01', '9780553293357', 12),
('Snow Crash', 'Neal Stephenson', 'Science Fiction', 21.99, 'Bantam Books', '1992-06-01', '9780553380958', 18),
('The Left Hand of Darkness', 'Ursula K. Le Guin', 'Science Fiction', 19.99, 'Ace Books', '1969-03-01', '9780441478125', 10),
('Hyperion', 'Dan Simmons', 'Science Fiction', 25.99, 'Doubleday', '1989-05-01', '9780553283686', 14),
('The Martian', 'Andy Weir', 'Science Fiction', 26.99, 'Crown Publishing', '2011-09-01', '9780804139021', 22),
('Ender\'s Game', 'Orson Scott Card', 'Science Fiction', 20.99, 'Tor Books', '1985-01-01', '9780812550702', 25),
('The War of the Worlds', 'H.G. Wells', 'Science Fiction', 16.99, 'William Heinemann', '1898-01-01', '9780141439983', 8);

-- Insert sample data into Customers Table
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'Anystate', '12345'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321', '456 Elm St', 'Othertown', 'Otherstate', '54321');

-- Insert sample data into Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2023-01-01', 49.98),
(2, '2023-01-02', 29.99);

-- Insert sample data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, BookID, Quantity, UnitPrice)
VALUES 
(1, 1, 2, 19.99),
(2, 2, 1, 29.99);

-- Insert sample data into Inventory Table
INSERT INTO Inventory (BookID, StockQuantity)
VALUES 
(1, 10),
(2, 5);


-- Display data in Books Table
SELECT * FROM Books;

-- Display data in Customers Table
SELECT * FROM Customers;

-- Display data in Orders Table
SELECT * FROM Orders;

-- Display data in OrderDetails Table
SELECT * FROM OrderDetails;

-- Display data in Inventory Table
SELECT * FROM Inventory;

