-- SQL Library Management System Project

-- Creating Branches tables
CREATE DATABASE Library_Management_Project;

DROP TABLE IF EXISTS Branch
CREATE TABLE Branch
(
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(50),
    contact_no VARCHAR(15)
)

DROP TABLE IF EXISTS Employee
CREATE TABLE Employee
(
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(30),
    position VARCHAR(30),
    salary INT,
    branch_id VARCHAR(10),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
)

DROP TABLE IF EXISTS Books
CREATE TABLE Books
(
    isbn VARCHAR(20) PRIMARY KEY,
    book_title	VARCHAR(75),
    category VARCHAR(20),	
    rental_price FLOAT,
    status VARCHAR(15),
    author VARCHAR(30),
    publisher VARCHAR(50)
)

DROP TABLE IF EXISTS members
CREATE TABLE members
(
    member_id VARCHAR(10) PRIMARY KEY,	
    member_name VARCHAR(30),	
    member_address VARCHAR(75),	
    reg_date DATE,
)

DROP TABLE IF EXISTS issued_status
CREATE TABLE issued_status
(
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10), --FK
    issued_book_name VARCHAR(75),
    issued_date	DATE,
    issued_book_isbn VARCHAR(20),  --FK 
    issued_emp_id VARCHAR(10),  --FK
    FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
    FOREIGN KEY (issued_book_isbn) REFERENCES Books(isbn),
    FOREIGN KEY (issued_emp_id) REFERENCES Employee(emp_id)
)

DROP TABLE IF EXISTS return_status
CREATE TABLE return_status
(
    return_id VARCHAR(10) PRIMARY KEY,	
    issued_id VARCHAR(10),	
    return_book_name VARCHAR(75),	
    return_date DATE, 	
    return_book_isbn VARCHAR(20), 
    FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id)
)
SELECT * from return_status
