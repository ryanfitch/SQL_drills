/* 
	Ryan Fitch - 2015

	This will declare two variables called MinPrice and MaxPrice 
	which will supply the value of the maximum and minimum price
	desired for this query. 

*/

DECLARE @MinPrice INT
SET @MinPrice = 900

DECLARE @MaxPrice INT
SET @MaxPrice = 1000

-- This query will use the variables to find the price between the two values in the RetailPrice table.

SELECT *
FROM CurrentProducts
WHERE RetailPrice BETWEEN @MinPrice AND @MaxPrice



