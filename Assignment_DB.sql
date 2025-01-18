CREATE DATABASE IF NOT EXISTS Assignment;
USE Assignment;


DROP TABLE IF EXISTS bookauthor;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS bookorder; 
DROP TABLE IF EXISTS saleline;
DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS book; 
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS country;  
 
CREATE TABLE country
(	countryId INT AUTO_INCREMENT PRIMARY KEY,
	countryName  VARCHAR(45) NOT NULL
);


CREATE TABLE publisher
(	publisherId INT AUTO_INCREMENT PRIMARY KEY,
	publisherName  VARCHAR(50) NOT NULL,
    publisherEmail  VARCHAR(35) NOT NULL,
    countryID INT,
        CONSTRAINT CountryExist_FK FOREIGN KEY (countryID) REFERENCES country(countryID)
);


CREATE TABLE author
(	authorId INT AUTO_INCREMENT PRIMARY KEY,
	authorFirst  VARCHAR(20) NOT NULL,
    authorSurname  VARCHAR(25) NOT NULL,
    countryID INT,
        CONSTRAINT CountryExistforAuthor_FK FOREIGN KEY (countryID) REFERENCES country(countryID)
);

CREATE TABLE book (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13) NOT NULL,
    title VARCHAR(200) NOT NULL,
    price DECIMAL(10, 2),
    quantity INT,
    reorderLevel INT,
    publisherID INT,
    CONSTRAINT FK_Publisher FOREIGN KEY (publisherID) REFERENCES publisher(publisherID)
    );
    
    CREATE TABLE bookauthor( 	
		bookID INT,
		authorID INT,
		CONSTRAINT bookauthor_PK PRIMARY KEY (bookID, authorID),
		CONSTRAINT bookExist_FK FOREIGN KEY (bookID) REFERENCES book(bookID),
		CONSTRAINT AuthorExist_FK FOREIGN KEY (authorID) REFERENCES author(authorID)
        );


CREATE TABLE sale
(	saleId INT AUTO_INCREMENT PRIMARY KEY,
	saleTotal DECIMAL(10,2) NOT NULL,
    saleDate DATE
);

CREATE TABLE saleLine(
    saleID INT,
    lineNo INT,
    quantity INT,
    bookID INT,
	CONSTRAINT saleLine_PK PRIMARY KEY (saleID, lineNo),
	CONSTRAINT SaleExist_FK FOREIGN KEY (saleID) REFERENCES sale(saleID),    
    CONSTRAINT FK_book FOREIGN KEY (bookID) REFERENCES book(bookID)
    );

CREATE TABLE bookorder
(	boid INT AUTO_INCREMENT PRIMARY KEY,
	boDate DATE,
    bookID INT,
    quantity INT,
    received BOOLEAN,
    CONSTRAINT FK_book_forBO FOREIGN KEY (bookID) REFERENCES book(bookID)
);

INSERT INTO country (countryName) 
VALUES 
('Afghanistan'),('Albania'),('Algeria'),('Andorra'),('Angola'),('Antigua and Barbuda'),('Argentina'),('Armenia'),('Australia'),('Austria'),
('Azerbaijan'),('Bahamas'),('Bahrain'),('Bangladesh'),('Barbados'),('Belarus'),('Belgium'),('Belize'),('Benin'),('Bhutan'),('Bolivia'),
('Bosnia and Herzegovina'),('Botswana'),('Brazil'),('Brunei'),('Bulgaria'),('Burkina Faso'),('Burundi'),('Cabo Verde'),('Cambodia'),('Cameroon'),
('Canada'),('Central African Republic'),('Chad'),('Chile'),('China'),('Colombia'),('Comoros'),('Congo (Congo-Brazzaville)'),
('Costa Rica'),('Croatia'),('Cuba'),('Cyprus'),('Czechia (Czech Republic)'),('Democratic Republic of the Congo'),('Denmark'),('Djibouti'),
('Dominica'),('Dominican Republic'),('Ecuador'),('Egypt'),('El Salvador'),('Equatorial Guinea'),('Eritrea'),('Estonia'),
('Eswatini'),('Ethiopia'),('Fiji'),('Finland'),('France'),('Gabon'),('Gambia'),('Georgia'),('Germany'),('Ghana'),('Greece'),('Grenada'),
('Guatemala'),('Guinea'),('Guinea-Bissau'),('Guyana'),('Haiti'),('Holy See'),('Honduras'),('Hungary'),('Iceland'),('India'),('Indonesia'),
('Iran'),('Iraq'),('Ireland'),('Israel'),('Italy'),('Jamaica'),('Japan'),('Jordan'),('Kazakhstan'),('Kenya'),('Kiribati'),('Kuwait'),('Kyrgyzstan'),
('Laos'),('Latvia'),('Lebanon'),('Lesotho'),('Liberia'),('Libya'),('Liechtenstein'),('Lithuania'),('Luxembourg'),('Madagascar'),('Malawi'),('Malaysia'),
('Maldives'),('Mali'),('Malta'),('Marshall Islands'),('Mauritania'),('Mauritius'),('Mexico'),('Micronesia'),('Moldova'),('Monaco'),
('Mongolia'),('Montenegro'),('Morocco'),('Mozambique'),('Myanmar'),('Namibia'),('Nauru'),('Nepal'),('Netherlands'),('New Zealand'),('Nicaragua'),('Niger'),
('Nigeria'),('North Korea'),('North Macedonia'),('Norway'),('Oman'),('Pakistan'),('Palau'),('Palestine State'),('Panama'),('Papua New Guinea'),
('Paraguay'),('Peru'),('Philippines'),('Poland'),('Portugal'),('Qatar'),('Romania'),('Russia'),('Rwanda'),('Saint Kitts and Nevis'),
('Saint Lucia'),('Saint Vincent and the Grenadines'),('Samoa'),('San Marino'),('Sao Tome and Principe'),('Saudi Arabia'),('Senegal'),('Serbia'),
('Seychelles'),('Sierra Leone'),('Singapore'),('Slovakia'),('Slovenia'),('Solomon Islands'),('Somalia'),('South Africa'),('South Korea'),('South Sudan'),
('Spain'),('Sri Lanka'),('Sudan'),('Suriname'),('Sweden'),('Switzerland'),('Syria'),('Tajikistan'),('Tanzania'),('Thailand'),('Timor-Leste'),
('Togo'),('Tonga'),('Trinidad and Tobago'),('Tunisia'),('Turkey'),('Turkmenistan'),('Tuvalu'),('Uganda'),('Ukraine'),('United Arab Emirates'),('United Kingdom'),
('United States of America'),('Uruguay'),('Uzbekistan'),('Vanuatu'),('Venezuela'),('Vietnam'),('Yemen'),('Zambia'),('Zimbabwe');

INSERT INTO publisher (publisherName, publisherEmail, countryID) 
VALUES 
('Penguin Random House', 'info@penguinrandomhouse.com', 1),
('HarperCollins Publishers', 'info@harpercollins.com', 185),
('Simon & Schuster', 'info@simonandschuster.com', 185),
('Hachette Book Group', 'info@hachettebookgroup.com', 186),
('Macmillan Publishers', 'info@macmillan.com', 186);

INSERT INTO book (ISBN, Title, Price, Quantity, ReOrderLevel, publisherID)
VALUES 
('9780061120084', 'To Kill a Mockingbird', 9.99, 100, 10, 1),('9780679417649', 'The Catcher in the Rye', 8.99, 120, 15, 2),
('9781400033416', '1984', 11.99, 80, 12, 3),('9781451673319', 'The Great Gatsby', 7.99, 150, 20, 4),
('9780544003415', 'The Hobbit', 12.49, 90, 10, 5),('9780439023528', 'The Hunger Games', 6.99, 200, 25, 1),
('9780735219090', 'The Girl on the Train', 10.99, 110, 15, 1),('9780316769488', 'To Kill a Mockingbird', 9.99, 100, 10, 2),
('9780062315007', 'Gone Girl', 8.49, 130, 18, 2),('9780316438962', 'The Silent Patient', 11.49, 95, 10, 1),
('9780385537858', 'All the Light We Cannot See', 13.99, 70, 8, 1),('9780735221185', 'The Nightingale', 9.99, 120, 12, 4),
('9780525538193', 'Where the Crawdads Sing', 14.49, 85, 10, 3),('9780385537858', 'Educated', 11.99, 100, 15, 4),
('9780062457714', 'Little Fires Everywhere', 10.99, 110, 12, 5),('9781594480003', 'The Kite Runner', 9.49, 140, 18, 1),
('9780142437244', 'The Picture of Dorian Gray', 7.99, 95, 10, 2),('9780316769174', 'The Road', 8.99, 120, 15, 3),
('9780679723165', 'Norwegian Wood', 10.49, 100, 10, 3),('9781400034772', 'The Book Thief', 9.99, 110, 12, 4),
('9781400064113', 'A Gentleman in Moscow', 12.99, 80, 10, 3),('9780547249643', 'The Help', 8.49, 130, 15, 4),
('9780307948482', 'The Alchemist', 11.49, 90, 10, 1),('9780812997765', 'Sapiens: A Brief History of Humankind', 13.49, 75, 10, 2),
('9780062316097', 'Where the Sidewalk Ends', 6.99, 150, 20, 2),('9780544003415', 'The Fellowship of the Ring', 12.49, 90, 10, 5),('9780544003415', 'The Twin Towers', 12.49, 90, 10, 5),
('9780544003415', 'The Return of the King', 12.49, 90, 10, 5),('9780544003415', 'The Silmarillion', 12.49, 90, 10, 5);

INSERT INTO author (authorfirst, authorsurname, countryid)
VALUES 
('Harper', 'Lee', 186), ('J.D.', 'Salinger', 186),('George', 'Orwell', 185),('F. Scott', 'Fitzgerald', 186),('J.R.R.', 'Tolkien', 161),
('Suzanne', 'Collins', 	186),('Paula', 'Hawkins', 185),('Miguel', 'Cervantes', 164),('Gillian', 'Flynn', 186),('Alex', 'Michaelides', 43),
('Anthony', 'Doerr', 186),('Kristin', 'Hannah', 186),('Delia', 'Owens', 186),('Tara', 'Westover', 186),('Celeste', 'Ng', 186),
('Khaled', 'Hosseini', 1),('Oscar', 'Wilde', 185),('Cormac', 'McCarthy', 186),('Haruki', 'Murakami', 85),('Markus', 'Zusak', 9),
('Amor', 'Towles', 186),('Kathryn', 'Stockett', 186),('Paulo', 'Coelho', 24),('Yuval', 'Noah Harari', 82),('Shel', 'Silverstein', 186);

INSERT INTO bookauthor (bookid, authorid)
VALUES ('1',1),('2',2),('3',3),('4',4),('5',5),('6',6),('7',7),('8',8),('9',9),('10',10),('11',11),('12',12),('13',13),('14',14),
('15',15),('16',16),('17',17),('18',18),('19',19),('20',20),('21',21),('22',22),('23',23),('24',24),('25',25),(26,5),(27,5),(28,5),(29,5);

INSERT INTO sale (saleDate, saleTotal)
VALUES 
('2024-03-01', 171.82),('2024-03-05', 179.81),('2024-03-10', 137.85),('2024-03-15', 197.81),
('2024-03-20', 156.84),('2024-03-25', 233.81),('2024-04-01', 216.84),('2024-04-05', 171.83),
('2024-04-10', 143.83),('2024-04-15', 183.82),('2024-04-20', 184.32),('2024-04-25', 224.82),('2024-05-01', 55.92);

INSERT INTO saleline (saleid, lineNo, quantity, bookid)
VALUES 
(1, 1, 10, 1),(1, 2, 8, 2),(2, 1, 7, 3),(2, 2, 12, 4),(3, 1, 6, 5),(3, 2, 9, 6),(4, 1, 8, 7),(4, 2, 11, 8),
(5, 1, 9, 9),(5, 2, 7, 10),(6, 1, 11, 11),(6, 2, 8, 12),(7, 1, 10, 13),(7, 2, 6, 14),(8, 1, 7, 15),(8, 2, 10, 16),
(9, 1, 9, 17),(9, 2, 8, 18),(10, 1, 8, 19),(10, 2, 10, 20),(11, 1, 7, 21),(11, 2, 11, 22),(12, 1, 9, 23),(12, 2, 9, 24),(13, 1, 8, 25);

INSERT INTO bookorder (bookid,boDate,quantity,received)
VALUES 
(5, '2024-03-23', 10, false),(12, '2024-03-23', 15, false),(17, '2024-03-23', 20, false),(7, '2024-03-23', 5, false);

