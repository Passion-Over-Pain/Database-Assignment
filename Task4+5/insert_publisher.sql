CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_publisher`(IN Words Text)
BEGIN
SET AUTOCOMMIT = FALSE;
START TRANSACTION;
BEGIN
DECLARE _publisherName VARCHAR(50);
DECLARE _publisherEmail VARCHAR(35);
DECLARE _CountryID INT;
DECLARE Compos INT;
DECLARE DONE BOOLEAN DEFAULT FALSE;
DECLARE SQL_Error BOOLEAN DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN 
SET SQL_Error = TRUE;
END;

LoopTeLoop : LOOP
#PublisherName
SET Compos = POSITION(',' IN Words);
SET _publisherName = LEFT(Words,Compos-1);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_publisherName)+1));

#PublisherEmail
SET Compos = POSITION(',' IN Words);
SET _publisherEmail = LEFT(Words,Compos-1);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_publisherEmail)+1));

#Publisher Country
SET Compos = POSITION(',' IN Words);
BEGIN
IF Compos = 0 THEN
SET _CountryID = Words;
SET DONE = TRUE;
ELSE 
SET _CountryID = CAST(LEFT(Words,Compos-1) AS SIGNED INTEGER);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_CountryID)+1));
END IF;
END;


INSERT INTO publisher(publisherName,publisherEmail,CountryID) VALUES (_publisherName,_publisherEmail,_CountryID);
IF DONE = TRUE  THEN
LEAVE LOOPTeLoop;
END IF;
END LOOP LoopTeLoop;
IF SQL_Error = FALSE THEN 
	COMMIT;
ELSE
    ROLLBACK;
END IF;
SET AUTOCOMMIT = TRUE;
END;
END
#Completed by :
#s224145312 Juanette Viljoen
#s225288370 Ruben Llewellyn Wilson
#s227284240 Tinotenda Lincoln Mhedziso