--Creating Database

CREATE DATABASE Bookstore_data;

--Creating Tables

DROP TABLE IF EXISTS Books;

CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(50),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT

);

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(50),
	Email VARCHAR(50),
	Phone VARCHAR(50),
	City VARCHAR(30),
	Country VARCHAR(100)

);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)

);

-- Imported csv Files  using Pgadmin GUI

SELECT * FROM Orders;
SELECT * FROM Books;
SELECT * FROM Customers;

--Solving Queries

--Retrieve all books in the "Fiction" genre
	SELECT * FROM Books
	WHERE Genre = 'Fiction';

--Find books published after the year 1950
	SELECT * FROM Books
	WHERE Published_Year>1950;
	
--List all customers from the Canada
	SELECT * FROM Customers
	WHERE Country= 'Canada';

--Show orders placed in November 2023
	SELECT * FROM Orders
	WHERE Order_Date BETWEEN '2023-11-01' AND ' 2023-11-30';

--Retrieve the total stock of books available
	SELECT SUM(Stock) AS Total_Stock
	FROM Books;

--Find the details of the most expensive book
	SELECT * FROM Books ORDER BY Price DESC LIMIT 1;

--Show all customers who ordered more than 1 quantity of a book
	SELECT * FROM Orders
	WHERE Quantity>1;

--Retrieve all orders where the total amount exceeds $20
	SELECT * FROM Orders
	WHERE Total_Amount>20;

--List all genres available in the Books table
	SELECT DISTINCT Genre
	FROM Books;
	
--Find the book with the lowest stock
	SELECT * FROM Books 
	ORDER BY Stock ASC 
	LIMIT 1;
	
--Calculate the total revenue generated from all orders
	SELECT SUM(Total_Amount) AS Total_Revenue_Generated
	FROM Orders;


--ADVANCED QUERIES

--Retrieve the total number of books sold for each genre
	SELECT b.Genre,SUM(o.Quantity) AS Total_Books_Sold
	FROM Books b
	JOIN
	Orders o
	ON b.Book_ID = O.Book_ID
	GROUP BY Genre;

--Find the average price of books in the "Fantasy" genre
	SELECT AVG(Price) AS Average_Price
	FROM Books
	WHERE Genre = 'Fantasy';

--List customers who have placed at least 2 orders
	SELECT Customer_ID,COUNT(Order_ID) AS Total_Order
	FROM Orders
	GROUP BY Customer_ID
	HAVING COUNT(Order_ID)>2;

--Find the most frequently ordered book
	SELECT Book_ID,COUNT(Order_ID) AS Order_Count
	FROM Orders
	GROUP BY Book_ID
	ORDER BY Order_Count DESC
	LIMIT 1;
	
--Show the top 3 most expensive books of 'Fantasy' Genre
	SELECT *
	FROM Books
	WHERE Genre = 'Fantasy'
	ORDER BY Price DESC
	LIMIT 3;

--Retrieve the total quantity of books sold by each author
	SELECT  b.Author,SUM(o.Quantity) AS Total_Quantity
	FROM Books b
	JOIN Orders o
	ON b.Book_ID = o.Book_ID
	GROUP BY b.Author;

--List the cities where customers who spent over $30 are loc
	SELECT c.City,o.Total_Amount
	FROM Customers c
	JOIN Orders o
	ON c.Customer_ID = o.Customer_ID
	GROUP BY c.City,o.Total_Amount
	HAVING o.Total_Amount>30;
	
--Find the customer who spent the most on orders
	SELECT c.Customer_ID,c.Name,SUM(o.Total_Amount) AS Total_Spent
	FROM Customers c
	JOIN Orders o
	ON c.Customer_ID = o.Customer_ID
	GROUP BY c.Customer_ID,c.Name
	ORDER BY Total_Spent DESC 
	LIMIT 1;
	
	
--Calculate the stock remaining after fulfilling all orderz
	SELECT b. Book_ID, b.Title, b.Stock, COALESCE (SUM(Quantity), 0) AS Order_quantity, 
	b.stock- COALESCE (SUM(Quantity), 0) AS Remaining_Quantity
	FROM books b
 	LEFT JOIN orders o ON b.Book_ID = o.Book_ID
 	GROUP BY b.Book_ID
	 ORDER BY b.Book_ID;