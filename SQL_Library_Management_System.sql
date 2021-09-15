/*
By Chadwick Culver
Date: 9/14/2021
PROJECT - LIBRARY MANAGEMENT SYSTEM
*/


/***********************************************************
	The creating of each of table
 */

CREATE DATABASE LibraryManagementSystemDB;

 USE LibraryManagementSystemDB;

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);


CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);


CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (101,1),
	book_title VARCHAR(100) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Rename the constraint for the 'book_id' column from 'fk_book_id' to 'fk_author_book_id' 
*/

CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL CONSTRAINT fk_author_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (600001,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);


CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL 
);


/***********************************************************
	The insert of data into the created tables
 */

 INSERT INTO tb_library_branch
	(branch_name, branch_address)
	VALUES
	('Newmarket', '438 Park Ave, Newmarket, ON'),
	('Toronto City Hall', 'Toronto City Hall, 100 Queen St W, Toronto, ON'),
	('Brampton Four Corners', '65 Queen St E, Brampton, ON'),
	('Innisfil ideaLAB', '967 Innisfil Beach Rd, Innisfil, ON'),
	('Sharpstown', '55 York Blvd, Hamilton, ON'),
	('Barrie', '60 Worsley St, Barrie, ON')
;

SELECT * FROM tbl_library_branch;


INSERT INTO tbl_borrower
	(card_no, borrower_name, borrower_address, borrower_phone)
	VALUES
	(600001, 'Elon Musk', '13a Robina Ave, York, ON', '(230) 782-9297'),
	(600002, 'Paul George', '85 Sparta Dr, Brampton, ON', '(230) 974-4561'),
	(600003, 'Carol Blazejowski', '134 Belinda Square, Scarborough, ON', '(705) 776-7564'),
	(600004, 'Theresa May', '1143 Sunnidale Rd, Barrie, ON', '(705) 453-4535'),
	(600005, 'Bill Gates', '72 Coronation St, Woodbridge, ON', '(416) 476-2456'),
	(600007, 'Xi Jinping', '55 Industrial Pkwy N, Aurora, ON', '(416) 227-2555'),
	(600008, 'Jeff Bezos', '54 Cabaletta Crescent, Woodbridge, ON', '(470) 897-6565'),
	(600009, 'Cathie Wood', '32 Whalen Ct, Richmond Hill, ON', '(905) 534-0001'),
;

SELECT * FROM tbl_borrower;


INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Turnstone Press', '3550 Gorham Street, London, Ontario', '(705)719-9182'),
	('Douglas & McIntyre', '4850 Davis Drive, Orillia, Ontario', '(705)257-8911'),
	('At Bay Press', '1783 Speers Road, Oakville, Ontario', '(450)981-5389'),
	('Coach House Books', '3274 Speers Road, Oakville, Ontario, MA 02108', '(519)357-8088'),
	('Orca Book Publishers', '3947 St Jean Baptiste St, Lac Frontiere, Quebec', '(514)929-1318'),
	('Broadview Press', '4581 St. John Street, Bruno, Saskatchewan', '(416)660-6562'),
	('Boulder Publications', '1625 Park Ct, Robb, Alberta', '(905)969-5446'),
	('Arsenal Pulp Press', '2568 St George Street, Vancouver, British Columbia', '(250)488-7955'),
	('Goose Lane Editions', '3498 York St, London, Ontario', '(705)251-3666'),
	('Signature Editions', '3649 Cordova Street, Vancouver, British Columbia', '(819)840-8001'),
;

SELECT * FROM tbl_publisher;

INSERT INTO tbl_books
	(book_title, publisher_name)
	VALUES
	('BEAUTIFUL WORLD, WHERE ARE YOU', 'Knopf Canada'),
	('BIRDS OF NEWFOUNDLAND: FIELD GUIDE', 'Boulder Publications'),
	('HIKES OF WESTERN NEWFOUNDLAND', 'Boulder Publications'),
	('JONNY APPLESEED', 'Arsenal Pulp Press'),
	('BATTERED SOLES', 'Turnstone Press'),
	('INDIAN HORSE', 'Douglas & McIntyre'),
	('INDIGENOUS TORONTO: STORIES THAT CARRY THIS PLACE', 'Coach House Books'),
	('The Lost Tribe', 'Coach House Books'),
	('JILTED LOVE: AT BAY PRESS FICTION ANNUAL', 'At Bay Press'),
	('GONE WITH THE WIND', 'Warner Books'),
	('DISFIGURED: ON FAIRY TALES, DISABILITY, AND MAKING SPACE', 'Coach House Books'),
	('A LIKE VISION: THE GROUP OF SEVEN AND TOM THOMSON', 'Goose Lane Editions'),
	('NEDI NEZU (GOOD MEDICINE)', 'Arsenal Pulp Press'),
	('STATUS UPDATE', 'At Bay Press'),
	('ON MY MOUNTAIN', 'Orca Book Publishers'),
	('THE BROADVIEW ANTHOLOGY OF SHORT FICTION - FOURTH CANADIAN EDITION', 'Broadview Press'),
	('YELLOWSTONE NATIONAL PARK HARDCOVER RULED JOURNAL', 'Signature Editions'),
	('KRISHNA HARDCOVER RULED JOURNAL: B.G.', 'Signature Editions'),
	('SECRETS AND LIES: AT BAY PRESS FICTION ANNUAL', 'At Bay Press'),
;

SELECT * FROM tbl_books;


INSERT INTO tbl_book_authors
	(book_id, author_name)
	VALUES
	(101, 'Cheryl Thompson'),
	(102, 'J.K. Rowling'),
	(103, 'Cheryl Thompson'),
	(104, 'Joshua Whitehead'),
	(105, 'Jocelyne Saucier'),
	(106, 'Joshua Whitehead'),
	(107, 'C.S. Lewis'),
	(108, 'Cheryl Thompson'),
	(109, 'Denise Bolduc'),
	(110, 'Cheryl Thompson'),
    	(111, 'J.K. Rowling'),
	(112, 'Cheryl Thompson'),
	(113, 'Douglas Adams'),
	(114, 'Steven King'),
	(115, 'J.K. Rowling'),
	(116, 'Steven King'),
	(117, 'Lewis Carroll'),
	(118, 'Oscar Wilde'),
	(119, 'Victor Hugo'),
	(120, 'Steven King'),
;

;

SELECT * FROM tbl_book_authors;

INSERT INTO tbl_book_copies
	(book_id, branch_id, number_of_copies)
	VALUES
	(101, 1, 3),
	(102, 1, 12),
	(103, 1, 9),
	(104, 1, 9),
	(105, 1, 11),
	(106, 1, 8),
	(107, 1, 9),
	(108, 1, 3),
	(109, 1, 8),
	(110, 1, 4),
	(111, 1, 9),
	(112, 1, 6),
	(113, 1, 10),
	(114, 1, 8),
	(115, 1, 4),
	(116, 1, 4),
	(117, 1, 4),
	(118, 1, 2),
	(119, 1, 2),
	(120, 1, 11),

        (101, 2, 7),
	(102, 2, 7),
	(103, 2, 7),
	(104, 2, 7),
	(105, 2, 11),
	(106, 2, 8),
	(107, 2, 9),
	(108, 2, 3),
	(109, 2, 8),
	(110, 2, 7),
	(111, 2, 9),
	(112, 2, 6),
	(113, 2, 10),
	(114, 2, 2),
	(115, 2, 5),
	(116, 2, 7),
	(117, 2, 4),
	(118, 2, 4),
	(119, 2, 4),
	(120, 2, 4),

	(101, 3, 6),
	(102, 3, 6),
	(103, 3, 6),
	(104, 3, 6),
	(105, 3, 6),
	(106, 3, 6),
	(107, 3, 5),
	(108, 3, 5),
	(109, 3, 5),
	(110, 3, 5),
	(111, 3, 5),
	(112, 3, 6),
	(113, 3, 10),
	(114, 3, 2),
	(115, 3, 5),
	(116, 3, 7),
	(117, 3, 2),
	(118, 3, 3),
	(119, 3, 9),
	(120, 3, 11),

	(101, 4, 2),
	(102, 4, 5),
	(103, 4, 6),
	(104, 4, 9),
	(105, 4, 13),
	(106, 4, 8),
	(107, 4, 9),
	(108, 4, 7),
	(109, 4, 8),
	(110, 4, 4),
	(111, 4, 9),
	(112, 4, 6),
	(113, 4, 7),
	(114, 4, 5),
	(115, 4, 5),
	(116, 4, 7),
	(117, 4, 5),
	(118, 4, 3),
	(119, 4, 9),
	(120, 4, 11),

	(101, 5, 2),
	(102, 5, 5),
	(103, 5, 6),
	(104, 5, 9),
	(105, 5, 10),
	(106, 5, 8),
	(107, 5, 9),
	(108, 5, 3),
	(109, 5, 8),
	(110, 5, 12),
	(111, 5, 9),
	(112, 5, 17),
	(113, 5, 10),
	(114, 5, 2),
	(115, 5, 5),
	(116, 5, 7),
	(117, 5, 2),
	(118, 5, 3),
	(119, 5, 9),
	(120, 5, 11),

	(101, 6, 2),
	(102, 6, 5),
	(103, 6, 6),
	(104, 6, 16),
	(105, 6, 15),
	(106, 6, 8),
	(107, 6, 9),
	(108, 6, 3),
	(109, 6, 8),
	(110, 6, 4),
	(111, 6, 5),
	(112, 6, 6),
	(113, 6, 10),
	(114, 6, 2),
	(115, 6, 5),
	(116, 6, 7),
	(117, 6, 5),
	(118, 6, 3),
	(119, 6, 9),
	(120, 6, 11),
;

SELECT * FROM tbl_book_copies;


INSERT INTO tbl_book_loans
	(book_id, branch_id, card_no, date_out, date_due)
	VALUES
	(101, 1, 600001, '2021-01-01', '2021-02-04'),
	(112, 1, 600001, '2021-01-08', '2021-02-12'),
	(103, 1, 600001, '2021-01-15', '2021-02-22'),
	(120, 1, 600001, '2021-01-26', '2021-02-25'),

	(102, 2, 500002, '2021-01-07', '2021-02-14'),
	(103, 2, 500002, '2021-01-14', '2021-02-21'),
	
	(107, 1, 600003, '2021-01-01', '2021-02-07'),

	(107, 4, 600004, '2021-01-01', '2021-02-07'),
	
	(118, 4, 600005, '2021-01-01', '2021-02-07'),
	(108, 4, 600005, '2021-01-09', '2021-02-14'),
	(109, 4, 600005, '2021-01-19', '2021-02-21'),
	(110, 4, 600005, '2021-01-19', '2021-02-28'),
	(106, 4, 600005, '2021-01-28', '2021-02-04'),

	(113, 5, 600006, '2021-04-01', '2021-05-08'),
	(114, 5, 600006, '2021-04-08', '2021-05-15'),
	(109, 5, 600006, '2021-04-15', '2021-05-22'),
	(107, 5, 600006, '2021-04-22', '2021-06-29'), 
	(110, 5, 600006, '2021-04-29', '2021-06-06'),
	(113, 5, 600006, '2021-12-01', '2021-12-08'),

	(114, 6, 600007, '2021-09-08', '2021-05-15'),
	(115, 6, 600007, '2021-04-15', '2021-05-22'),
	(109, 6, 600007, '2021-11-22', '2021-11-29'), 

	(105, 2, 600008, '2021-04-01', '2021-04-06'),

	(115, 3, 600008, '2021-07-15', '2021-07-22'),
	(120, 3, 600008, '2021-07-22', '2021-07-29'), 
;

SELECT * FROM tbl_book_loans;

SELECT * FROM ((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo) 
FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BookID);

/***********************************************************************
	creation of stored procedures
 */

/*
CREATE STORED PROCEDURES THAT WILL QUERY FOR EACH OF THE FOLLOWING QUESTIONS:
1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name 
	is "Sharpstown"?
2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?
3.) Retrieve the names of all borrowers who do not have any books checked out.
*/

------------------------------------------------------------------------------------------------------------------------------------------

-- 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?


CREATE PROCEDURE sp_Number1
AS
SELECT a.book_id, b.book_title, c.branch_name, a.number_of_copies
	FROM tbl_book_copies a
	INNER JOIN tbl_books b ON a.book_id = b.book_id
	INNER JOIN tbl_library_branch c ON a.branch_id = c.branch_id
	WHERE book_title = 'The Lost Tribe' AND branch_name = 'Sharpstown'

-- Stored Procedure
EXEC sp_Number1;

------------------------------------------------------------------------------------------------------------------------------------------

-- 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

CREATE PROCEDURE sp_Number2;
AS
SELECT a.book_id, b.book_title, c.branch_name, a.number_of_copies
	FROM tbl_book_copies a
	INNER JOIN tbl_books b ON a.book_id = b.book_id
	INNER JOIN tbl_library_branch c ON a.branch_id = c.branch_id
	WHERE a.book_id = 121 AND book_title = 'The Lost Tribe'

-- Stored Procedure
EXEC sp_Number2

------------------------------------------------------------------------------------------------------------------------------------------

-- 3.) Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROCEDURE sp_Number3
AS
SELECT a.card_number, a.borrower_name, a.borrower_address, a.borrower_phone
	FROM tbl_borrower a
	LEFT OUTER JOIN tbl_book_loans b ON a.card_number = b.card_number
	WHERE b.book_id IS NULL

-- Stored Procedure
EXEC sp_Number3

------------------------------------------------------------------------------------------------------------------------------------------

/*
