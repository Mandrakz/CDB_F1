/*Creation structure of DW*/


IF OBJECT_ID('[dwF1_LapTimes].[dbo].[fact_LapTime]') Is NOT NULL drop table [dwF1_LapTimes].[dbo].[fact_LapTime]
create table [dwF1_LapTimes].[dbo].[fact_LapTime](

fact_LapTimes_id int identity(1,1) primary key,

dim_raceid int
,dim_driverid int
,lap INT NOT NULL,
position INT NOT NULL,
time time(3)  NOT NULL,
milliseconds INT NOT NULL

,race_date date
,seasons_year INT NOT NULL
,dim_constructorid int NOT NULL
,dim_circuitid int NOT NULL
);

IF OBJECT_ID('[dwF1_LapTimes].[dbo].[dim_drivers]') Is NOT NULL drop table [dwF1_LapTimes].[dbo].[dim_drivers]
create table [dwF1_LapTimes].[dbo].[dim_drivers](

dim_driverID int identity(1,1) primary key,
driverId INT  NOT NULL ,
number INT,
forename VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL

);


IF OBJECT_ID('[dwF1_LapTimes].[dbo].[dim_races]') Is NOT NULL drop table [dwF1_LapTimes].[dbo].[dim_races]
create table [dwF1_LapTimes].[dbo].[dim_races](

dim_raceId int identity(1,1) primary key,
raceId INT NOT NULL ,
year INT NOT NULL,
round INT NOT NULL,
name VARCHAR(50) NOT NULL,
fp1_date DATE,
fp1_time time(0),
fp2_date DATE,
fp2_time time(0),
fp3_date DATE,
fp3_time time(0),
quali_date DATE,
quali_time time(0),
sprint_date DATE,
sprint_time time(0),

);

IF OBJECT_ID('[dwF1_LapTimes].[dbo].[dim_circuits]') Is NOT NULL drop table [dwF1_LapTimes].[dbo].[dim_circuits]
create table [dwF1_LapTimes].[dbo].[dim_circuits](

dim_circuitId int identity(1,1) primary key,
circuitId int NOT NULL,
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
lat DECIMAL(8,6) NOT NULL ,
lng DECIMAL(9,6) NOT NULL,
alt int 

);


IF OBJECT_ID('[dwF1_LapTimes].[dbo].[dim_constructors]') Is NOT NULL drop table [dwF1_LapTimes].[dbo].[dim_constructors]
create table [dwF1_LapTimes].[dbo].[dim_constructors](

dim_constructorId int identity(1,1) primary key,
constructorId int NOT NULL,
constructorRef VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL

);

/*Okey Date table will be created in Power BI*/
/*
IF OBJECT_ID('[dwF1_LapTimes].[dbo].[dim_date]') Is NOT NULL drop table [dwF1_LapTimes].[dbo].[dim_date]
CREATE TABLE [dwF1_LapTimes].[dbo].[dim_date]
(
[DateKey] INT primary key,

[Date] DATETIME,
[FullDateUK] CHAR(10),
[FullDeteUSA] CHAR(10),-- Date in MM-dd-yyry format
[DayOfMonth] VARCHAR(2),-- Field will hold day number of Month
[DaySuffix] VARCHAR(4), -- Apply suFFIX tat, 2nd Ae ee
[DayName] VARCHAR(9), --Contains name of the day, Sunday, Moncey
[DayOfWeektUSA] CHAR(1),-- First Day Sundey=1 and Seturday=7
[DayOfWeekUK] CHAR(1),-- Fist Day Mandayet and Sundy=7
[DayOfWeekInMonth] VARCHAR(2), --1st Mondey or 2nd Monday in Month
[DayOfWeekInYear] VARCHAR(2),
[DayOfQuarter] VARCHAR(3),
[DayOfYear] VARCHAR(3),
[WeekOfMonth] VARCHAR(1),--Week Number of Month
[WeekOfQuarter] VARCHAR(2), --Week Number af the Quarter
[WeekYear] VARCHAR(2), --Week Number ofthe Year
[Month] VARCHAR(2), --Number of the Month 1 xo 12
[MonthName] VARCHAR(9), --January, February te
[MonthOfQuarter] VARCHAR(2), --Month Number belongs to Quarter
[Quarter] CHAR(1),
[QuarterName] VARCHAR(9),--First Second.
[Year] CHAR(4),-- Year voluc of Date stored in Row
[YearName] CHAR(7),-- CY 2012.7 2033
[Month Year] CHAR(10),--Jan-2014,Feb-2013
)
 */