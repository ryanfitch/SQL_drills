/*
	  Ryan Fitch - 2015

	  Creating, deleting, and updating a login named Murray.  
	  Mixed authentication also needs to be set by changing 
	  the SQL Server to "SQL Server and Windows Authentication"
*/

-- Switches to master database so security parameters can be updated at the server level.
USE master
GO

-- Creates login named Murray with password ABC$$123.
CREATE LOGIN Murray
WITH PASSWORD = 'ABC123xyz'

-- Deletes login named Murray.
DROP LOGIN Murray

-- Updates login named Murray to disabled.
ALTER LOGIN Murray DISABLE

-- Gives Murray some permissions to make limited updates to databases.
GRANT ALTER ANY DATABASE TO Murray

-- Gives Murray full control to alter any database in SQL Server.
GRANT CONTROL SERVER TO Murray

-- Murray will no longer be able to make changes to any database.
DENY ALTER ANY DATABASE TO Murray

-- Undo denying Murray make changes to any database.
REVOKE ALTER ANY DATABASE TO Murray