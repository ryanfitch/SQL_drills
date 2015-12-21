/*
	Ryan Fitch - 2015

	A stored procedure is prepared SQL code that is saved so that you can 
	reuse the code over and over again whenever you want to use it.
	This stored procedure that takes a variable called City.  As a default, 
	if no city is called the query will show results for Portland.
*/


CREATE PROCEDURE GetEmployeeByCity @City VARCHAR(50) = 'Portland'
AS
	SELECT emp.FirstName, emp.LastName, Loc.city, Loc.[state]
	FROM Employee AS emp
	INNER JOIN Location as Loc
	ON emp.LocationID = Loc.LocationID
	WHERE Loc.city = @City


-- To Run Procedure = 
-- EXEC GetEmployeeByCity 'Boston'