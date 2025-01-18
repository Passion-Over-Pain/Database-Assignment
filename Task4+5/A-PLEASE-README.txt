Good Day Sir

Please Note the following about this assignment:
1.The paraments for each procedure varies so you may refer to this test data:
CALL insert_publisher('Tino,s227284240@mandela.ac.za,7,Llewellyn,s225288370@mandela.ac.za,10,Juanette,s224145312@mandela.ac.za,11');
CALL insert_sale('20200107,10,10,10,20200107,11,10,7');
CALL receive_bookOrder('20200107,7,7,20210307,8,10');
2.All stored procedures are able to operate on multiple record ( such as one publisher being a single record)
3.The format for our date field when inserting is yyyymmdd instead of yyyy-mm-dd such as 20040607 (Tino's birthday 😀)
4.The Stored procedures make use of a single Transaction and error handling
5.The Stored procedures were created through the schemas Tab but the Triggers were created in an sql script
6.Both are fully functional but please be aware that for the triggers, SAFE MODE should be turned off
>>>You can turn it off through the Edit tab, Preferences, SQL Editor, scroll down to uncheck Safe Updates Mode then restart mysql workbench<<<<
7. Sir, Apologies for the extra work but this is the solution we were able to get working, you can read on the issue we had here:
https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench

8.The DELIMITER keyword was created automatically in the Stored Procedures but in the Triggers it ran as a normal sql script