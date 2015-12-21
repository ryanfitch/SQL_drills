/*
	Ryan Fitch - 2015

	How many copies of the book titled The Lost Tribe are owned by the library branch whose name
is"Sharpstown"?
*/

SELECT book.title, copies.no_of_copies, branch.branchName
FROM lib_book AS book JOIN lib_bookCopies AS copies
	ON book.bookID = copies.bookID 
    JOIN lib_branch AS branch
	ON copies.branchID = branch.branchID
	WHERE book.bookID = '1' AND branch.BranchId = '1';


/*
How many copies of the book titled The Lost Tribe are owned by each library branch?
*/

SELECT book.title, branch.branchName, copies.no_of_copies
FROM lib_book AS book JOIN lib_bookCopies AS copies
	ON book.bookID = copies.bookID
    JOIN lib_branch AS branch
    ON copies.branchID = branch.branchID
    WHERE book.title = "The Lost Tribe";

/*
Retrieve the names of all borrowers who do not have any books checked out.
*/

SELECT *
FROM lib_bookLoans AS loans JOIN lib_borrower AS borrower
	ON loans.card_no = borrower.card_no
	WHERE loans.dueDate IS NULL;


/*
For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
retrieve the book title, the borrower's name, and the borrower's address.
*/

SELECT book.title, borrower.firstName, borrower.lastName, borrower.address, borrower.city, borrower.state, borrower.zip
FROM lib_bookLoans AS loans JOIN lib_branch AS branch
	ON loans.branchID = branch.branchID
    JOIN lib_borrower AS borrower
    ON loans.card_no = borrower.card_no
    JOIN lib_book = book
    ON loans.bookID = book.bookID
	WHERE loans.dueDate = '2012-02-01'
    AND branch.branchName = 'Sharpstown';

/*
For each library branch, retrieve the branch name and the total number of books loaned out from
that branch.
*/

SELECT branch.branchname, COUNT(dueDate)
FROM lib_bookLoans AS loans JOIN lib_branch AS branch
	ON loans.branchID = branch.branchID
	WHERE dueDate IS NOT NULL;

/*
Retrieve the names, addresses, and number of books checked out for all borrowers who have more
than five books checked out.
*/

SELECT borrower.firstName, borrower.lastName, borrower.address
FROM lib_borrower AS borrower JOIN lib_bookLoans AS loans
	ON borrower.card_no = loans.card_no
	HAVING COUNT(*)<=5;


/*
For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of
copies owned by the library branch whose name is "Central"
*/

SELECT author.authorNameFirst, author.authorNameLast, book.title, copies.no_of_copies, branch.branchName
FROM lib_bookAuthors AS author JOIN lib_bookCopies AS copies
	ON author.bookID = copies.bookID 
    JOIN lib_book AS book
    ON book.bookID = copies.bookID
    JOIN lib_branch AS branch
    ON branch.branchID = copies.branchID
	WHERE author.authorNameFirst = 'Stephen' AND author.authorNameLast = 'King'
	AND branch.branchName = 'Central';
