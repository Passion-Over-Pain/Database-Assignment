CREATE DEFINER=`root`@`localhost` PROCEDURE `receive_bookOrder`(IN Words TEXT)
BEGIN
SET AUTOCOMMIT = FALSE;
START TRANSACTION;
BEGIN
DECLARE _DATE DATE DEFAULT CURDATE();
DECLARE _BookID INT;
DECLARE _quantity INT;
DECLARE _received BOOLEAN;
DECLARE Compos INT;
DECLARE boid INT;
DECLARE DONE BOOLEAN DEFAULT FALSE;
DECLARE SQL_Error BOOLEAN DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN 
SET SQL_Error = TRUE;
END;
SET AUTOCOMMIT = FALSE;
LoopTeLoop : LOOP

#Date recieved the book order
SET Compos = POSITION(',' IN Words);
SET _Date = CAST(LEFT(Words,Compos-1) AS DATE);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_Date)-1));

#BookID
SET Compos = POSITION(',' IN Words);
SET _BookID = LEFT(Words,Compos-1);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_BookID)+1));

#Quantity
SET Compos = POSITION(',' IN Words);
BEGIN
IF Compos = 0 THEN
BEGIN
SET _quantity = Words;
SET DONE = TRUE;
END;
ELSE 
SET _quantity = CAST(LEFT(Words,Compos-1) AS SIGNED INTEGER);
SET Words  = RIGHT(Words,CHAR_LENGTH(Words) - (Char_LENGTH(_quantity)+1));
END IF;
END;

#Recieved the order
SET _received = TRUE;
INSERT INTO bookorder(boDate,bookID,quantity,received) VALUES (_Date,_BookID,_quantity,_received);
IF DONE = TRUE THEN
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
