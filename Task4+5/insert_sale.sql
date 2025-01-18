CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_sale`(
IN Words Text)
BEGIN
SET AUTOCOMMIT = FALSE;
START TRANSACTION;
BEGIN
DECLARE _Date DATE;
DECLARE _lineNo INT;
DECLARE _quantity INT;
DECLARE _BookID INT;
DECLARE saleID INT;
DECLARE DONE BOOLEAN DEFAULT FALSE;
DECLARE SQL_Error BOOLEAN DEFAULT FALSE;
DECLARE _saleTotal INT DEFAULT 0;
DECLARE Compos INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN 
SET SQL_Error = TRUE;
END;
SET AUTOCOMMIT = FALSE;
LoopTeLoop : LOOP
#Date
SET Compos = POSITION(',' IN Words);
SET _Date = CAST(LEFT(Words,Compos-1) AS DATE);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_Date)-1));

#LineNumber
SET Compos = POSITION(',' IN Words);
SET _lineNo = LEFT(Words,Compos-1);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_lineNo)+1));

#Quantity
SET Compos = POSITION(',' IN Words);
SET _quantity = CAST(LEFT(Words,Compos-1) AS SIGNED INTEGER);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_quantity)+1));
SET Compos = POSITION(',' IN Words);
BEGIN
IF Compos = 0 THEN
BEGIN
SET _BookID = Words;
SET DONE = TRUE;
END;
ELSE 
SET _BookID = CAST(LEFT(Words,Compos-1) AS SIGNED INTEGER);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_BookID)+1));
END IF;

#Sale Insertion
INSERT INTO sale (saleTotal,saleDate)
VALUES ( _saleTotal, _Date);
SET saleID = LAST_INSERT_ID();

#SaleLine Insertion
INSERT INTO saleLine (saleID,lineNo, quantity, bookID)
VALUES (saleID,_lineNo, _quantity, _BookID);

IF DONE = TRUE THEN
LEAVE LOOPTeLoop;
END IF;
END;
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