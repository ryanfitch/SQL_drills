/*
	Ryan Fitch - 2015

	Specify database to use. 
*/

USE MASTER
GO


--Run only if dbMovie is present
IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'dbMovie')
DROP DATABASE dbMovie
GO

--Create new database called dbMovie
CREATE DATABASE dbMovie
GO

--Switch to and use database dbMovie
USE dbMovie
GO
