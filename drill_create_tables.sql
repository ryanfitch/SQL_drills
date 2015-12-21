/* 
	Ryan Fitch - 2015

	SQL library datbase schema for Tech Academy Drill. 
*/

CREATE TABLE lib_book
(
bookID int,
title varchar(100),
publisherName varchar(100)
);

CREATE TABLE lib_bookAuthors
(
bookID int NOT NULL,
authorNameFirst varchar(30),
authorNameLast varchar(30)
);

CREATE TABLE lib_publisher
(
publisherName varchar(30) NOT NULL,
address varchar(30),
city varchar(30),
state varchar(2),
zip int
);

CREATE TABLE lib_bookCopies
(
bookID int NOT NULL,
branchID int NOT NULL,
no_of_copies int
);

CREATE TABLE lib_bookLoans
(
bookID int NOT NULL,
branchID int NOT NULL,
card_no int,
dateOut date,
dueDate date
);

CREATE TABLE lib_branch
(
branchID int NOT NULL,
branchName varchar(30),
address varchar(30),
city varchar(30),
state varchar(2),
zip int
);

CREATE TABLE lib_borrower
(
card_no int NOT NULL,
name varchar(30),
address varchar(30),
city varchar(30),
state varchar(2),
zip int,
phone int
);