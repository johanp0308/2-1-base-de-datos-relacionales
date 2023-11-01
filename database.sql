
CREATE DATABASE IF NOT EXISTS 2_1_1_BaseDeDatosRelacionales;

USE 2_1_1_BaseDeDatosRelacionales;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) NULL,
    isbn TEXT NULL,
    year DATE NULL,
    price DECIMAL(8, 2) NULL,
    authorID INT NOT NULL,
    editorialID INT NOT NULL
);
--Foreing Keys (Books)
ALTER TABLE Books 
MODIFY authorID INT NOT NULL CONSTRAINT FK_Author_Id FOREIGN KEY (authorID) REFERENCES Authors(id),
MODIFY editorialID INT NOT NULL CONSTRAINT FK_Editorials_Id FOREIGN KEY (editorialID) REFERENCES Editorials(id);
---------------------

DROP TABLE IF EXISTS cart_books;
CREATE TABLE cart_books(
    book_id INT NULL,
    cart_id INT NULL,
    amount INT NULL
);
--Foreign Keys (cart_books)
ALTER TABLE cart_books 
MODIFY book_id INT NOT NULL CONSTRAINT FK_Books_Id FOREIGN KEY (book_id) REFERENCES Books(id),
MODIFY cart_id INT NOT NULL CONSTRAINT FK_Cart_Id FOREIGN KEY (cart_id) REFERENCES Cart(Shopping_cart_ID);
------------------------

DROP TABLE IF EXISTS Editorials;
CREATE TABLE Editorials(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    phonenumber VARCHAR(30) NULL,
    url TEXT NULL,
    address VARCHAR(30) NULL
);
-------------
-------------
DROP TABLE IF EXISTS Cart;
CREATE TABLE Cart(
    Shopping_cart_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NULL
);
--Foreign Key (Cart)
ALTER TABLE Cart
MODIFY customer_id INT NOT NULL CONSTRAINT FK_Customers_id FOREIGN KEY (customer_id) REFERENCES Customers(id);
-----------------

DROP TABLE IF EXISTS Stores;
CREATE TABLE Stores(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(50) NULL,
    phonenumber VARCHAR(16) NULL
);
ALTER TABLE 

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    address VARCHAR(50) NULL,
    email VARCHAR(50) NULL,
    phonenumber VARCHAR(50) NULL,
    store_id INT NOT NULL
);

DROP TABLE IF EXISTS Authors;
CREATE TABLE Authors(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NULL,
    url TEXT NULL
);

DROP TABLE IF EXISTS Stock;
CREATE TABLE Stock(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    books_id INT NULL,
    amount INT NULL,
    store_id INT NULL
);

