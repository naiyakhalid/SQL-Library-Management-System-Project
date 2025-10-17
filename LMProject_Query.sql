-- SQL Library Management System Project
-- Project Tasks 

SELECT * FROM members;
SELECT * FROM branch;
SELECT * FROM employee;
SELECT * FROM Books;
SELECT * FROM issued_status;
SELECT * FROM return_status;

-- CRUD Operations (Create, Read, Update, Delete)

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO Books (isbn, book_title, category, rental_price, status, author, publisher)
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

-- Task 2: Update an Existing Member's Address to 125 Oak St' where  member_id is 'C103'
UPDATE members 
SET member_address = '891 Maple St' 
WHERE member_id = 'C105'
SELECT * FROM members;

-- Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
DELETE FROM issued_status WHERE issued_id = 'IS121'
SELECT * FROM issued_status;

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT * FROM issued_status WHERE issued_emp_id = 'E101'

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT issued_emp_id, COUNT(*) AS Total_Books_Issued
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) > 1;

-- CTAS (Create Table As Select)
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt** 
SELECT Books.isbn, Books.book_title, COUNT(issued_status.issued_id) AS Issued_books 
INTO book_issued_cnt 
FROM Books
JOIN issued_status ON Books.isbn = issued_status.issued_book_isbn
GROUP BY Books.isbn, Books.book_title

SELECT * FROM book_issued_cnt

-- Data Analysis & Findings
-- Task 7: Retrieve All Books in a Specific Category:
SELECT * FROM Books WHERE category = 'Classic'

-- Task 8: Find Total Rental Income by Category:
SELECT Books.category, SUM(Books.rental_price) AS Rental_Income_by_Category, COUNT(*) AS Issued_Books_Count
FROM Books
JOIN issued_status ON Books.isbn = issued_status.issued_book_isbn
GROUP BY category

-- INsert some new members into the col members for year 2024 and 2025. 
INSERT INTO members (member_id, member_name, member_address, reg_date)
VALUES
('C120', 'Alice Johnson', '123 Main St', '2024-02-15'),
('C121', 'Bob Smith', '456 Elm St', '2024-04-20'),
('C122', 'Carol Davis', '789 Oak St', '2024-07-10'),
('C123', 'Dave Wilson', '567 Pine St', '2024-09-05'),
('C124', 'Eve Brown', '891 Maple St', '2024-12-25'),
('C125', 'Frank Harris', '222 Birch Rd', '2025-01-14'),
('C126', 'Grace Lee', '345 Cedar Ave', '2025-03-03'),
('C127', 'Henry Adams', '678 Walnut St', '2025-05-22'),
('C128', 'Isla Martinez', '910 Spruce Ln', '2025-07-11'),
('C129', 'Jack Robinson', '159 Willow Blvd', '2025-09-30');

-- Task 9: List Members Who Registered in the Last 180 Days:
-- SELECT GETDATE();
-- The DATEADD() function is used to add or subtract a certain amount of time (days, months, years, etc.) to a date.
-- DATEADD(datepart, number, start_date).
SELECT * FROM members WHERE reg_date >= DATEADD(DAY, -180, GETDATE());

-- Task 10: List Members Who Registered in the Last 6 months:
SELECT * FROM members WHERE reg_date >= DATEADD(MONTH, -6, GETDATE());

-- Task 11: List Members Who Registered in the Last 1 year:
SELECT * FROM members WHERE reg_date >= DATEADD(YEAR, -1, GETDATE());

-- Task 12: List Members Who Registered from 10 days in the future:
SELECT * FROM members WHERE reg_date >= DATEADD(DAY, 10, GETDATE());

-- Task 13: List of issued books from last 1 year:
SELECT * FROM issued_status WHERE issued_date >= DATEADD(YEAR, -1, GETDATE());

-- Task 14: List Employees with Their Branch Manager's Name and their branch details:
SELECT branch.branch_id, branch.manager_id, branch.branch_address, branch.contact_no,employee.emp_name, 
 employee.emp_name AS Manager, employee.emp_id,  employee.position, employee.salary 
FROM employee AS e1
JOIN branch ON branch.branch_id = e1.branch_id
JOIN employee ON branch.manager_id = employee.emp_id

-- Task 15: Create a Table of Books with Rental Price Above a Certain Threshold:
SELECT * INTO Expensive_books FROM Books WHERE rental_price > 7.00
SELECT * FROM Expensive_books

-- TASK 16: Retrieve the List of Books Not Yet Returned
SELECT * FROM issued_status As ist
LEFT JOIN return_status AS rs ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL 
