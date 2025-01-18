/* -------------------------------------------------------------
Task 3
This script contains the 4 SQL queries created by 
s224145312 Juanette Viljoen
s225288370 Ruben Llewellyn Wilson
s227284240 Tinotenda Lincoln Mhedziso 
/*--------------------------------------------------------------- */

/*Question 1
Retrieve the titles and publishers of all books written
by anyone with the surname of Tolkien. 
*/
SELECT title AS BookTitle, publisherName AS Publisher_Name , authorSurname AS Author_Surname
FROM book, publisher, author
WHERE authorSurname = "Tolkien";


/*Question 2 
List all book titles, the number sold and the total value of
sales of each book. 
*/
SELECT title AS BookTitle, saleline.quantity AS Number_Sold, price * saleline.quantity AS Total_Sale
FROM book 
LEFT JOIN saleline ON book.bookID = saleline.bookID
LEFT JOIN sale ON sale.saleID = saleline.saleID
GROUP BY book.bookid;


/*Question 3
List the titles of any book that has yet to appear in a Sale. 
*/
SELECT title as BookTitle
FROM book 
WHERE bookID NOT IN (SELECT DISTINCT bookID FROM saleLine);

/*Question 4 
List all Countries and the number of Authors from each country.
All countries should be displayed i.e. if a country has no authors on 
record display a 0 next to its name. 
--------- */
SELECT countryName, COUNT(author.authorId) AS Num_Author
FROM  country
LEFT JOIN author ON country.countryID = author.countryID
GROUP BY country.countryID;


/*------------
End of Task 3
------------*/
