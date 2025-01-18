CREATE DATABASE IF NOT EXISTS KOREANDERS;
USE KOREANDERS;

#Dropping the tables in revrse order to ensure referential data integrity
#Please NOTE: Use the Command DESCRIBE {Table Name} to get a visual view, eg: DESCRIBE Publisher;
DROP TABLE IF EXISTS Book_Order;
DROP TABLE IF EXISTS Book_Author;
DROP TABLE IF EXISTS Book_Sale;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS Country;

# There are various checks in place to validate the correct data is entered for specific fields
#The name check is the most common being implemented on Author Name,Surname, Publisher Name and the Country fields
#This validates that each character in  the record is a letter of the alphabet
CREATE TABLE IF NOT EXISTS Country( 
Country_ID INT PRIMARY KEY AUTO_INCREMENT,
Country_Name VARCHAR(56) NOT NULL
);
CREATE TABLE IF NOT EXISTS Publisher( 
Publisher_ID INT PRIMARY KEY AUTO_INCREMENT, 
Pub_Name VARCHAR(26) NOT NULL,
Email VARCHAR(50) UNIQUE NOT NULL,
Country_ID INT,
CONSTRAINT FOREIGN KEY(Country_ID) REFERENCES Country(Country_ID),
CONSTRAINT atSignchk CHECK (Email LIKE "%@%" AND  EMAIL NOT LIKE "@%"),
CONSTRAINT domainchk CHECK (Email LIKE "%.%" AND  EMAIL NOT LIKE ".%"),
CONSTRAINT voidCharacterschk CHECK (Email NOT LIKE "%!%" AND EMAIL NOT LIKE "%#%" AND EMAIL NOT LIKE "%$%" AND EMAIL NOT LIKE "%&%" AND EMAIL NOT LIKE "%~%"),
CONSTRAINT PNlettersOnlychk CHECK (Pub_Name REGEXP '^[a-zA-Z.]+$')
);

#atSignchk is a Check if the email address entered contains the @ sign at a valid position
#domainchk is a Check that validates the emai has a period/full stop representing the domain follows for the email
# voidCharacterschk is a CHECK to validate that an email does not contain certain characters 

CREATE TABLE IF NOT EXISTS BOOK(
ISBN_Number INT PRIMARY KEY AUTO_INCREMENT,
Book_Title VARCHAR(50) NOT NULL,
 Price DECIMAL (6,2) UNSIGNED NOT NULL,
 Qty_On_Hand INT UNSIGNED NOT NULL,
 Reorder_Level INT UNSIGNED NOT NULL,
 Publisher_ID INT,
 CONSTRAINT FOREIGN KEY(Publisher_ID) REFERENCES Publisher(Publisher_ID)
);
#The price of a book is stored with a maximum book amount (In Rands) of 999 999 and a precison of 2 deciaml places
#The UNSIGNED keyword ensures that the respective fields only contain 0 or positive numbers 
CREATE TABLE IF NOT EXISTS Author(
Author_ID INT PRIMARY KEY AUTO_INCREMENT,
Author_Name VARCHAR(50) NOT NULL,
Author_Surname VARCHAR(50) NOT NULL,
Country_ID INT,
CONSTRAINT FOREIGN KEY(Country_ID) REFERENCES Country(Country_ID),
CONSTRAINT ANlettersOnlychk CHECK (Author_Name REGEXP '^[a-zA-Z.]+$'),
CONSTRAINT ASlettersOnlychk CHECK (Author_Surname REGEXP '^[a-zA-Z]+$')
);

CREATE TABLE IF NOT EXISTS SALE(
Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
Sale_Total INT UNSIGNED NOT NULL,
Sale_Date DATE NOT NULL, 
Sale_Time TIME NOT NULL
);
#The total field is required by Koreanders 
#The UNSIGNED keyword ensures that only whole numbers(0 and positive numbers) are recorded
#The sale date and time is essential for transactions within the Koreanders system
#Date and Time are seperate fields for atomicity and better data retention practises rather than the DATETIME data type
CREATE TABLE IF NOT EXISTS BOOK_SALE(
ISBN_Number INT,
Sale_ID INT,
CONSTRAINT PRIMARY KEY (ISBN_Number, Sale_ID),
CONSTRAINT FOREIGN KEY (ISBN_Number) REFERENCES BOOK(ISBN_Number),
CONSTRAINT FOREIGN KEY (Sale_ID) REFERENCES SALE(Sale_ID)
);

CREATE TABLE IF NOT EXISTS Book_Author(
Book_Author_ID INT PRIMARY KEY AUTO_INCREMENT,
ISBN_Number INT,
Author_ID INT,
CONSTRAINT FOREIGN KEY (ISBN_Number) REFERENCES Book(ISBN_Number),
CONSTRAINT FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
);

CREATE TABLE IF NOT EXISTS Book_Order(
Book_Order_Number INT PRIMARY KEY AUTO_INCREMENT,
ISBN_Number INT,
Recieved SET("TRUE","FALSE") ,
CONSTRAINT FOREIGN KEY (ISBN_Number) REFERENCES Book(ISBN_Number),
CONSTRAINT recievedchk CHECK(Recieved IN("TRUE","FALSE")) 
);
#Recieved is of the SET  datatype which is stored as TINYINT
#A record will have the Recieved field false if the value stored is FALSE OR 2
#A record will have the Recieved field true if the value is TRUE OR 1
#recievedchk is a CHECK that validates that the data entered is true/false CAPS Insensitive or 1/2