# The-Tech-Academy-SQL-Coding-Projects

1. Review this diagram of the database schema:

https://mynew.aolcc.ca/courses/40034/files/37352511/preview

2. Using SSMS, create a database and tables exactly as laid out in the above diagram.

Meaning, create all of the items below as covered in the schema:

Database.
Tables.
Columns.
Primary keys.
Foreign keys.
3. Populate the tables in the database as follows:

a. Insert into the LIBRARY_BRANCH table 6 values of your choosing with the exception that one branch name is “Sharpstown.” Create values for the following columns: BranchName and BranchAddress.

b. Insert into the BORROWER table 8 values of your choosing for the following columns: CardNo, Name, Address and Phone.

c. Insert into the PUBLISHER table 10 values of your choosing for the following columns: PublisherName, Address and Phone.

d. Insert into the BOOKS table 20 rows of different books. Ensure to include values in the following columns: Title and PublisherName. Assign one of the book titles with the value “The Lost Tribe.” If you need ideas for the other books, Google the top 100 books of all time and pull names from there.

e. Insert into the BOOK_AUTHORS table 10 different author names (You may insert a name multiple times with a different BookID, for example, one author may have written multiple books that have different IDs).

f. Insert into the BOOK_COPIES table values for the following columns: Number_of_Copies, BookID, and BranchID. Ensure that if a branch has a book, it has at least two copies of it. (To clarify, the Number_of_Copies column should show two or more for each row).

g. Insert into the BOOK_LOANS table 10 rows including values in the following columns: BookID, BranchID, CardNo, DateOut, DateDue (Each BORROWER may have more than one book checked out).

Let’s see how each of these tables relate to each other.

Type in the following query:

SELECT * FROM ((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo) FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BookID);

We're using a FULL OUTER JOIN on three tables. BOOK_LOANS has columns for the primary keys of the BORROWER and BOOKS tables.

https://mynew.aolcc.ca/courses/40034/files/37352159/preview

By using the FULL OUTER JOIN on those three tables, you are able see which BookID belongs in which branch, the card number of the borrower, the Publisher, the date the book was checked out and the date that it is due.

Each table has a reference to another table of some sort. Some tables will have more data than another depending on how many library branches there are, how many books each branch has, how many people have obtained library cards, etc.

Using the library database you created, create a query that returns all book titles and the authors name.

Next we'll create some stored procedures so the library managers don't have to keep typing the same queries over and over.

Create stored procedures that will query for each of the following questions: 

A. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

B. How many copies of the book titled "The Lost Tribe" are owned by each library branch?

C. Retrieve the names of all borrowers who do not have any books checked out.

Submit all code for this exercise below:
