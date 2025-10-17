# SQL-Library-Management-System-Project

## Project Overview
This SQL Library Management System is designed to manage a library’s branches, employees, books, members, issued and returned books efficiently.
- It demonstrates key SQL concepts including:
- Database creation and relationships (Primary & Foreign Keys)
- CRUD operations (Create, Read, Update, Delete)
- Aggregations, joins, and filtering
- Use of DATEADD(), GROUP BY, JOIN, and CTAS (Create Table As Select)
- Analytical queries to find trends and insights.

## Database Schema                                       
<img width="1536" height="1024" alt="LMProject_Query sql" src="https://github.com/user-attachments/assets/1ddce50d-f376-4a83-9149-2e13bba6dd5c" />

## CTAS (Create Table As Select)
Generated summary tables such as:
'''
SELECT Books.isbn, Books.book_title, COUNT(issued_status.issued_id) AS Issued_books 
INTO book_issued_cnt
FROM Books
JOIN issued_status ON Books.isbn = issued_status.issued_book_isbn
GROUP BY Books.isbn, Books.book_title;
'''
Output: A summary of books and their total issued counts.

## Key SQL Functions Used
| Function               | Purpose                                                 |
| ---------------------- | ------------------------------------------------------- |
| **DATEADD()**          | Adds or subtracts time intervals (days, months, years)  |
| **GETDATE()**          | Returns current system date                             |
| **GROUP BY + HAVING**  | Aggregates results with conditions                      |
| **JOIN**               | Combines related data from multiple tables              |
| **LEFT JOIN**          | Identifies unmatched records (e.g., books not returned) |
| **CTAS (SELECT INTO)** | Creates new tables from query results                   |

## Features & Functionalities
### 1. CRUD Operations
- Create new books or members.
- Read records using filters and joins.
- Update member details.
- Delete specific records (e.g., issued book entries).

### 2. Data Analysis & Reporting
Includes queries to extract insights such as:
- Total rental income by book category.
- Members who registered recently.
- Books issued in the last year.
- Books not yet returned.
- Employees and their respective branch managers.

## Key Findings
1. Most Frequent Categories:Classic and Dystopian genres dominate issued books.
2. Rental Trends: Books with rental price above 7.00 were filtered into a new table Expensive_books.
3. Active Members: Recent members from 2024–2025 are actively registering, showing system scalability.
4. Branch & Employee Insights: Each branch is linked to a manager, and employee data can be analyzed using joins for salary or performance reports.


## How to Run
1. Copy and run the full SQL script in Microsoft SQL Server or Azure Data Studio.
2. Execute the CREATE DATABASE and CREATE TABLE commands.
3. Run all INSERT statements to populate tables.
4. Execute each task section to see the project queries and analytical results.

## Conclusion
This project demonstrates how SQL can be used for complete data management and analytics within a library system. It shows practical use of joins, aggregations, and date functions, preparing the ground for future integration with dashboards or Python-based analytics.
