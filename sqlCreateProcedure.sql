/*	
	Ryan Fitch - 2015

	Creates a procedure to get Employee's first name, last name, 
	city and state who live in Washington from the Employee database 	
	whenever 'GetWashington Employees' is executed.
*/

CREATE PROCEDURE GetWashingtonEmployees
AS
	SELECT E.FirstName, E.LastName, L.city, L.[state]
	FROM Employee AS E
	INNER JOIN Location as L
	ON E.LocationID = L.LocationID
	Where L.[state] = 'WA'

--	To Run Procedure =
-- 	EXEC GetWashingtonEmployees