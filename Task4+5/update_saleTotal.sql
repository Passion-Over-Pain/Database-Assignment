DROP TRIGGER IF EXISTS update_saleTotal;
CREATE TRIGGER update_saleTotal
AFTER INSERT ON saleline
FOR EACH ROW
UPDATE sale,saleline,book
SET saleTotal = saleTotal + (saleline.quantity * book.price)
WHERE book.bookID = saleline.bookID AND sale.saleid = saleline.saleid;
#Completed by :
#s224145312 Juanette Viljoen
#s225288370 Ruben Llewellyn Wilson
#s227284240 Tinotenda Lincoln Mhedziso