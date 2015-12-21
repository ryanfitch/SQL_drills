/*	
	Ryan Fitch - 2015

	Transfers 500 from customer 13568's Savings to Checking.  
	This explicit transactions ensures that the statements
	succeed or fail together.	
*/

BEGIN TRAN

	--Take 500 out of Savings
	UPDATE SavAccount Set Balance = Balance - 500
	WHERE CustomerID = 13568

	--Put 500 into checking
	UPDATE CkAccount SET Balance = Balance + 500
	WHERE CustomerID = 13568

COMMIT TRAN