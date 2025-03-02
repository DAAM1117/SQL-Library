#To create the database
CREATE DATABASE if not exists Library;
#To use the newly created database
USE Library;

#We start creating the tables

CREATE TABLE if not exists Books
(ISBN VARCHAR(30) PRIMARY KEY,
 Book_title VARCHAR(80),
 Author VARCHAR(40),
 Genre VARCHAR(40),
 Publisher VARCHAR(30),
 Rental_Price DECIMAL(10,2),
 Status ENUM('Yes','No')
);
DESC Books;

# Create table "Customer"
CREATE TABLE if not exists Customer
(
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_name VARCHAR(35),
    Customer_email VARCHAR(35),
    Reg_date DATE,
    constraint Customers_ibfk_1
        unique (Customer_email)
);
DESC Customer;

# create table "Branch"
CREATE TABLE if not exists Branch
(
    Branch_ID VARCHAR(10) PRIMARY KEY,
    Manager_id VARCHAR(10),
    Branch_address VARCHAR(30),
    Contact_no VARCHAR(15)
);
DESC Branch;

# Create table "Employee"
CREATE TABLE if not exists Employee
(
    Emp_ID VARCHAR(10) PRIMARY KEY,
    Emp_name VARCHAR(30),
    Position VARCHAR(30),
    Affiliated_Branch VARCHAR(10),

    constraint Employee_ibfk_1
        FOREIGN KEY (Affiliated_Branch) REFERENCES Branch (Branch_ID) on DELETE CASCADE
);
DESC Employee;

# Create table "Loan Status"
CREATE TABLE if not exists LoanStatus
(
    Loan_Id VARCHAR(10) PRIMARY KEY,
    Isbn_book VARCHAR(30),
    Loaned_book_name VARCHAR(80),
    Loaned_cust VARCHAR(30),
    Issue_date DATE,
    FOREIGN KEY (Loaned_cust) REFERENCES Customer(Customer_id) on DELETE CASCADE,
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN) on DELETE CASCADE
);
DESC LoanStatus;

# Create table "ReturnStatus"
CREATE TABLE if not exists ReturnStatus
(
    Return_id VARCHAR(10) PRIMARY KEY,
    Return_cust VARCHAR(30),
    Return_book_name VARCHAR(80),
    Return_date DATE,
    isbn_book2 VARCHAR(30),
    FOREIGN KEY (isbn_book2) REFERENCES Books(ISBN) on DELETE CASCADE,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_id) on DELETE CASCADE
);
DESC ReturnStatus;

#To show that all tables have been created successfully
SHOW TABLES;


#We start introducing values into our tables

INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('8495501074','Ensayo sobre la ceguera','Jose Saramago', 'Novel','Grupo Santillana','7.00','Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('074931852X', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Tragedy', 'Scribner', 10.00, 'Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('9688807842', 'Basic Statistics', 'Mark Berenson', 'Education', 'Prentice Hall', 20.00, 'No');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('0441172717', 'Dune', 'Frank Herbert', 'Science Fiction', 'Chilton Books', 5.50, 'Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('0307743659', 'The Shining', 'Stephen King', 'Thriller', 'Vintage', 13.10, 'Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('7543321726', 'The Catcher in The Rye', 'J.D. Salinger', 'Novel', 'Little Brown', 6.50, 'Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('0764551957', 'German for Dummies', 'Paulina Christensen', 'Education', 'John Wiley & Sons', 11.10, 'Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('0553418025', 'The Martian', 'Andy Weir', 'Science Fiction', 'Ballantine Books', 20.40, 'No');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('1451648537', 'Steve Jobs', 'Walter Isaacson', 'Biography', 'Simon & Schuster', 30.00, 'Yes');
INSERT INTO Books (ISBN, Book_title, Author, Genre, Publisher, Rental_Price, Status) VALUES ('843760494X', 'Ensayo sobre la ceguera', 'Gabriel Garcia Marquez', 'Magic Realism', 'Editorial Sudamericana', 25.40, 'Yes');

SELECT * FROM Books;


INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C001','Daniel Andrade','danielandrade@mail.com', '2024-07-05');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C002','Alena Perez','alenaperez@mail.com', '2024-07-01');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C003','Alexandra Smith','alexsmith@mail.com', '2024-07-03');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C004','Fernando Rivera','ferrivera@mail.com', '2024-07-05');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C005','Nigel Mencias','nmencias123@mail.com', '2024-07-06');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C006','Palina Rose','palinarose@mail.com', '2024-07-02');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C007','Diego Maya','diegomaya12@mail.com', '2024-07-01');
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Reg_date) VALUES ('C008','Cristina Flores','cristina123@mail.com', '2024-07-02');

SELECT * FROM Customer;


INSERT INTO Branch (Branch_ID, Manager_ID, Branch_address, Contact_no) VALUES ('B001','M001','Melchiorstrasse1', '+4912345');
INSERT INTO Branch (Branch_ID, Manager_ID, Branch_address, Contact_no) VALUES ('B002','M002','Steintragerweg1', '+4954321');
INSERT INTO Branch (Branch_ID, Manager_ID, Branch_address, Contact_no) VALUES ('B003','M003','Silberstrasse1', '+4998765');
INSERT INTO Branch (Branch_ID, Manager_ID, Branch_address, Contact_no) VALUES ('B004','M004','Ulsteinstrasse1', '+4915725');
INSERT INTO Branch (Branch_ID, Manager_ID, Branch_address, Contact_no) VALUES ('B005','M005','Lousadaertrasse1', '+4963728');

SELECT * FROM Branch;

INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E001','Pablo Aul ','Manager', 'B001');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E002','John doe ','Clerk', 'B001');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E003','Sarah Sup ','Manager', 'B002');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E004','Emily Eau ','Clerk', 'B002');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E005','Jav Ter ','Manager', 'B003');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E006','Aaron Brown','Clerk', 'B003');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E007','Cam Sen ','Manager', 'B004');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E008','Paula Ber ','Clerk', 'B004');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E009','Enner Val ','Manager', 'B005');
INSERT INTO Employee (Emp_ID, EMP_name, Position, Affiliated_Branch) VALUES ('E010','Moises Cai','Clerk', 'B005');

SELECT * FROM Employee;

INSERT INTO LoanStatus (Loan_Id,Isbn_book,Loaned_book_name,Loaned_cust,Issue_date) VALUES ('L001','074931852X','The Great Gatsby','C001','2024-08-03');
INSERT INTO LoanStatus (Loan_Id,Isbn_book,Loaned_book_name,Loaned_cust,Issue_date) VALUES ('L002','0307743659','The Shining','C002','2024-08-01');
INSERT INTO LoanStatus (Loan_Id,Isbn_book,Loaned_book_name,Loaned_cust,Issue_date) VALUES ('L003','0553418025','The Martian','C003','2024-07-15');
INSERT INTO LoanStatus (Loan_Id,Isbn_book,Loaned_book_name,Loaned_cust,Issue_date) VALUES ('L004','1451648537','Steve Jobs','C004','2024-07-10');
INSERT INTO LoanStatus (Loan_Id,Isbn_book,Loaned_book_name,Loaned_cust,Issue_date) VALUES ('L005','0764551957','German for Dummies','C005','2024-07-30');

SELECT * FROM LoanStatus;

INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES ('R001','C001','The Great Gatsby','2024-08-20','074931852X');
INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES ('R002','C002','The Shining','2024-08-25','0307743659');
INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES ('R003','C003','The Martian','2024-08-28','0553418025');
INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES ('R004','C004','Steve Jobs','2024-08-27','1451648537');
INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES ('R005','C005','German for Dummies','2024-08-30','0764551957');

SELECT * FROM ReturnStatus;

#Queries

# 1. Retrieve the book title, category, and rental price for books that are currently available
SELECT book_title, Genre, rental_price FROM Library.Books WHERE Status = 'Yes';

# 2. Retrieve the book title, author, and rental price of all the books in a certain genre.
SELECT book_title, author, rental_price FROM Library.Books WHERE Genre = 'Novel';

# 3. Retrieve the customers who have loaned books and the title of those books
SELECT Library.LoanStatus.Loaned_book_name, Library.Customer.Customer_name FROM Library.LoanStatus INNER JOIN
Library.Customer on Library.LoanStatus.Loaned_cust = Library.Customer.Customer_Id;

# 4. Display the total count of books in each Genre.
SELECT Genre, COUNT(Book_title) FROM Library.Books GROUP BY Genre;

# 5. List the customer names who registered after a certain date and have not issued any books yet.
SELECT customer_name FROM Library.Customer WHERE Reg_date > '2022-07-03' AND Customer_Id NOT IN(SELECT Library.LoanStatus.Loaned_cust FROM Library.LoanStatus);

#6. Count the employees in each branch
SELECT Library.Employee.Affiliated_Branch, COUNT(emp_id) FROM Library.Employee GROUP BY Library.Employee.Affiliated_Branch;
