CREATE DATABASE Library; 

/* CREATE TABLES */

CREATE TABLE LIBRARY_BRANCH (
    BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    BranchName VARCHAR(250) NOT NULL,
    Address VARCHAR(250) NOT NULL
);

CREATE TABLE BOOK_COPIES ( 
    BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
    BranchID INT NOT NULL FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
    Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOKS (
    BookID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(250) NOT NULL,
    PublisherName VARCHAR(250) NOT NULL FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);


CREATE TABLE BOOK_AUTHORS (
    BOOKID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
    AuthorName VARCHAR(250) NOT NULL
); 

CREATE TABLE BORROWER ( 
    CardNo INT NOT NULL PRIMARY KEY,
    Name VARCHAR(250) NOT NULL,
    Address VARCHAR(250) NOT NULL,
    Phone VARCHAR(250) NOT NULL
);

 CREATE TABLE BOOK_LOANS (
     BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
     BranchID INT NOT NULL FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
     CardNo INT NOT NULL FOREIGN KEY REFERENCES BORROWER(CardNo),
     DateOut DATE NOT NULL,
     DateDue DATE NOT NULL
 );

CREATE TABLE PUBLISHER (
    PublisherName VARCHAR(250) NOT NULL PRIMARY KEY,
    Address VARCHAR(250),
    Phone VARCHAR(250)
);
/* INSERTING VALUES INTO TABLES */

INSERT INTO LIBRARY_BRANCH (BranchName,Address)
VALUES 
('Ryans Books', '1245 Hello road'),
('Bobs Books','42 Galaxy drive'),
('Jerrys Books','89 90th street'),
('Sharpstown','626 Stitch lane'),
('Dullstown ','99 Problem drive'),
('Larrys Books','22 Goodbye drive')
;

INSERT INTO BORROWER (CardNo, Name, Address, Phone)
VALUES
(1,'Stan Smith','22 Home Street','123-626-8888'),
(2,'Kevin Smith','48 Why lane','123-676-9999'),
(3,'Timmy Tom','99 Jefferson lane','123-888-4747'),
(4,'Jerry Springer','205 Skittle drive','123-999-4545'),
(5,'Johnny Cash','66 Cash Road','123-891-6789'),
(6,'Iggy Arbuckle','432 Brookland street','123-456-4567'),
(7,'Derek Boberick','47 3RD Avenue','123-789-9876'),
(8,'Philip Fry','1 New york Road', '123-654-9090')
;



INSERT INTO PUBLISHER (PublisherName, Address, Phone) 
VALUES
('Yam','2 Long Drive','356-532-753'),
('KLP','17 Stars Street','934-854-038'),
('YellowStone','932 1st Avenue','523-746-157'),
('TomorrowLand','192 Horton Road','059-254-857'),
('Talon','777 Linx Drive','642-836-364'),
('Mac11','758 Sydney Road','073-267-637'),
('Bookkeepers','4785 Beech Street','738-957-745'),
('Snakes','267 Covert Drive','274-847-467'),
('123 books','7467 Hurns Way','384-375-374'),
('EbookOpolus','2467 NorthFork Drive','846-274-756')
;

INSERT INTO BOOKS (Title, PublisherName) 
VALUES
('The Lost Tribe','Yam'),
('The Hunger Games','KLP'),
('The Titanic','YellowStone'),
('The Breadwinner','TomorrowLand'),
('The Matrix','Talon'),
('24 or More','Mac11'),
('Blue Bird Songs','Bookkeepers'),
('To Kill a Mocking Bird','Snakes'),
('Kill Bill','123 Books'),
('The Day after Tomorrow','EbookOpolus'),
('Yesterdays News','TomorrowLand'),
('Slime Ball','Snakes'),
('Lost In Space','EbookOpolus'),
('Where is you','YellowStone'),
('Lost Time','Talon'),
('The Monster','EbookOpolus'),
('Magic Conch','KLP'),
('Squidwards Show','Bookkeepers'),
('The Secret','Bookkeepers'),
('Actual Book Title','YellowStone')
;

INSERT INTO BOOK_AUTHORS (BookID,AuthorName) 
VALUES
(1,'Shiba Inu'),
(2,'Jay Long'),
(3,'Tim Toe'),
(4,'Steve French'),
(5,'Bubbles'),
(6,'Jay Long'),
(7,'Tim Toe'),
(8,'Jim lahey'),
(9,'Shiba Inu'),
(10,'Dr.Seuss'),
(11,'Jason Jennie'),
(12,'Tim Toe'),
(13,'Jim Lahey'),
(14,'Jay Long'),
(15,'Ollie Dane'),
(16,'Jim Lahey'),
(17,'Jason Jennie'),
(18,'Ollie Dane'),
(19,'Dr.Seuss'),
(20,'Ollie Dane')
;

INSERT INTO BOOK_COPIES (Number_Of_Copies, BookID, BranchID) 
VALUES
(3,1,4),
(6,2,1),
(9,3,2),
(12,4,6),
(75,5,4),
(66,6,5),
(102,7,1),
(93,8,2),
(4,9,3),
(11,10,2),
(28,11,5),
(10,12,3),
(658,13,5),
(223,14,1),
(10,15,2),
(20,16,2),
(18,17,3),
(44,18,3),
(66,19,6),
(3,20,6)
;

INSERT INTO BOOK_LOANS (BookID,BranchID,CardNo, DateOut, DateDue) 
VALUES 
(20,4,8,'2022-08-04','2022-08-18'),
(14,3,1,'2022-08-06','2022-08-20'),
(10,2,2,'2022-08-08','2022-08-22'),
(3,1,4,'2022-08-11','2022-08-25'),
(8,5,3,'2022-07-16','2022-08-01'),
(4,6,7,'2022-08-28','2022-09-12'),
(12,1,8,'2022-07-19','2022-08-3'),
(1,2,5,'2022-07-30','2022-08-14'),
(6,5,6,'2022-08-05','2022-08-19'),
(9,6,2,'2022-08-06','2022-08-20')
;

/* QUERYING TABLES */ 

SELECT * FROM ((BOOK_LOANS 
FULL OUTER JOIN BORROWER 
ON BOOK_LOANS.CardNo = BORROWER.CardNo)
FULL OUTER JOIN BOOKS 
ON BOOK_LOANS.BookID = BOOKS.BOOKID);

/* CREATING STORED PROCEDURE 1 */
USE Library
GO
CREATE PROCEDURE dbo.uspLostTribeSharpstown
AS

SELECT copie.Number_Of_Copies, book.Title, branch.BranchName
FROM BOOK_COPIES AS copie

INNER JOIN LIBRARY_BRANCH as branch
ON copie.BranchID = branch.BranchID

INNER JOIN BOOKS AS book
ON copie.BookID = book.BookID

WHERE book.Title = 'The Lost Tribe'
AND branch.BranchName = 'Sharpstown' 

GO
EXEC dbo.uspLostTribeSharpstown;

/* CREATING STORED PROCEDURE 2 */
USE Library
GO
CREATE PROCEDURE dbo.uspTheLostTribe
AS
SELECT copie.Number_Of_Copies, branch.BranchName
FROM BOOK_COPIES AS copie

INNER JOIN LIBRARY_BRANCH as branch
ON copie.BranchID = branch.BranchID

INNER JOIN BOOKS AS book
ON copie.BookID = book.BookID

WHERE book.Title = 'The Lost Tribe'
ORDER BY branch.BranchName GO
EXEC dbo.usp dbo.uspTheLostTribe;

/* CREATING STORED PROCEDURE 3 */
USE Library
GO
CREATE PROCEDURE dbo.uspNoBooks
AS
SELECT Name 
FROM BORROWER
WHERE CardNo NOT IN (SELECT CardNo FROM BOOK_LOANS)
GO
EXEC dbo.usp dbo.uspNoBooks