/*Delete the info of the tables > DELETE REGISTERS */
TRUNCATE TABLE [Test].[dbo].[constructor_results];
TRUNCATE TABLE [Test].[dbo].[circuits];
TRUNCATE TABLE [Test].[dbo].[constructor_standings];
TRUNCATE TABLE [Test].[dbo].[constructors];
TRUNCATE TABLE [Test].[dbo].[driver_standings];
TRUNCATE TABLE [Test].[dbo].[drivers];
TRUNCATE TABLE  [Test].[dbo].[lap_times];
TRUNCATE TABLE  [Test].[dbo].[status];
TRUNCATE TABLE [Test].[dbo].[seasons];
TRUNCATE TABLE [Test].[dbo].[races];
TRUNCATE TABLE [Test].[dbo].[qualifying];
TRUNCATE TABLE [Test].[dbo].[pit_stops];
TRUNCATE TABLE [Test].[dbo].[results];
TRUNCATE TABLE [Test].[dbo].[sprint_results];

/*Delete the table WHEN i HAVE DEPENDENCIES */
DELETE  FROM [Test].[dbo].[constructor_results];
DELETE FROM [Test].[dbo].[circuits];
DELETE FROM [Test].[dbo].[constructor_standings];
DELETE FROM [Test].[dbo].[constructors];
DELETE FROM [Test].[dbo].[driver_standings];
DELETE FROM [Test].[dbo].[drivers];
DELETE FROM  [Test].[dbo].[lap_times];
DELETE FROM  [Test].[dbo].[status];
DELETE FROM [Test].[dbo].[seasons];
DELETE FROM [Test].[dbo].[races];
DELETE FROM [Test].[dbo].[qualifying];
DELETE FROM [Test].[dbo].[pit_stops];
DELETE FROM [Test].[dbo].[results];
DELETE FROM [Test].[dbo].[sprint_results];


/*Delete the table */
DROP TABLE [Test].[dbo].[constructor_results];
DROP TABLE [Test].[dbo].[circuits];
DROP TABLE [Test].[dbo].[constructor_standings];
DROP TABLE [Test].[dbo].[constructors];
DROP TABLE	[Test].[dbo].[driver_standings];
DROP TABLE	[Test].[dbo].[drivers];
DROP TABLE	[Test].[dbo].[lap_times];
DROP TABLE [Test].[dbo].[status];
DROP TABLE [Test].[dbo].[seasons];
DROP TABLE [Test].[dbo].[races];
DROP TABLE [Test].[dbo].[qualifying];
DROP TABLE [Test].[dbo].[pit_stops];
DROP TABLE [Test].[dbo].[results];
DROP TABLE [Test].[dbo].[sprint_results];

/*SEEING INFORMATION OF TABLES*/
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='circuits'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='constructor_results'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='constructor_standings'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='constructors'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='driver_standings'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='drivers'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='lap_times'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='status'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='seasons'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='races'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='qualifying'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='pit_stops'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='results'
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='sprint_results'