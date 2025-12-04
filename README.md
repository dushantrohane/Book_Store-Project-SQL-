# Book_Store-Project-SQL
📚 Bookstore Database Management System (SQL Project)

This project demonstrates the end-to-end creation and management of a Bookstore Database using SQL.
It includes database design, table creation, data import, and execution of essential and advanced SQL queries for analytics and operations.

🚀 Project Overview
The Bookstore Database is designed to efficiently manage books, customers, and orders.
This project covers:

-Creating database and tables
-Establishing relationships using foreign keys
-Importing data from CSV files (via PgAdmin)
-Writing SQL queries (basic to advanced)
-Performing analysis: revenue, stock, orders, customer insights, etc.

🗂 Database Structure
📘 Books Table 
Contains details about each book:
-Title
-Author
-Genre
-Published Year
-Price
-Stock

👥 Customers Table

Stores customer information:
-Name
-Email
-Phone
-City
-Country

🛒 Orders Table
Records customer purchase transactions:

-Customer ID
-Book ID
-Order Date
-Quantity
-Total Amount

🛠 Key SQL Operations
✔ Database & Table Creation

*Creating database Bookstore_data
*Creating Books, Customers, and Orders tables
*Adding primary & foreign key constraints

✔ Data Import

*CSV files imported using PgAdmin GUI.

🔍 Basic SQL Queries Included

Retrieve all books of a certain genre

Find books published after a specific year

List customers from a country

Show orders for a specific month

Calculate total stock

Get most expensive/cheapest book

Find high-value orders

Get unique genres

📊 Advanced SQL Queries Included

Total books sold by genre

Average price by genre

Identify frequent customers

Most ordered book

Top 3 most expensive books in a genre

Sales quantity by author

Customers who spent over a threshold

Highest-spending customer

Remaining stock after all orders

📄 SQL File Included
Book_Store Project.sql


Contains:

DDL (Database & Table creation)

DML (Queries for analysis)

Joins, Aggregations, Grouping, Filtering

Real-word business case SQL operations


Book_Store Project

🧰 Tools & Technologies

PostgreSQL

PgAdmin

SQL (DDL & DML)

Joins, Aggregate Functions, Group By

CSV Import

🎯 Learning Outcomes

By completing this project, you will learn:

✔ Designing relational databases
✔ Writing optimized SQL queries
✔ Using joins for multi-table analysis
✔ Performing business insights using SQL
✔ Understanding real-world bookstore operations with data

📎 How to Use This Project

Clone this repository

Import the SQL file into PostgreSQL

Execute the script to create tables

Import your CSV files using PgAdmin

Run the queries to explore insights

⭐ If you found this useful

Don’t forget to star ⭐ the repo!
