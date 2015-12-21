/*
	Ryan Fitch - 2015

	This query updates the RetailPrice from 
	the CurrentProducts table and waits 
	55 seconds before commiting the transaction.
*/


BEGIN TRAN

UPDATE CurrentProducts
SET RetailPrice = 999
WHERE ProductID = 1

WAITFOR DELAY '00:00:55'

COMMIT TRAN


/*
	This query will show the original data from 
	the CurrentProducts table even though the table 
	is in the process of being updated.  

*/


SELECT *
FROM CurrentProducts (NOLOCK)
WHERE ProductID = 1

SELECT COUNT(*)
FROM CurrentProducts (NOLOCK)