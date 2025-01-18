DROP TRIGGER IF EXISTS update_BookQty;
CREATE TRIGGER update_BookQty
AFTER INSERT ON bookorder
FOR EACH ROW
UPDATE book,bookorder
SET book.quantity = book.quantity + bookorder.quantity
WHERE book.bookID = bookorder.bookID;
#Completed by :
#s224145312 Juanette Viljoen
#s225288370 Ruben Llewellyn Wilson
#s227284240 Tinotenda Lincoln Mhedziso