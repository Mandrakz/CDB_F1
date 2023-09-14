USE dwF1_LapTimes
GO

Drop TABLE IF EXISTS  [dwF1_LapTimes].[dbo].[dim_circuits]
Create TABLE [dwF1_LapTimes].[dbo].[dim_circuits] (

dim_circuitId int identity(1,1),
circuitId int primary key NOT NULL,
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
lat DECIMAL(8,6) NOT NULL ,
lng DECIMAL(9,6) NOT NULL,
alt int 

);



Drop TABLE IF EXISTS  [dwF1_LapTimes].[dbo].[dim_constructors]
Create TABLE [dwF1_LapTimes].[dbo].[dim_constructors] (

dim_constructorId int identity(1,1) ,
constructorId int primary key NOT NULL,
constructorRef VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL

);


Drop TABLE IF EXISTS  [dwF1_LapTimes].[dbo].[dim_drivers]
Create TABLE [dwF1_LapTimes].[dbo].[dim_drivers] (


dim_driverID int identity(1,1) ,
driverId INT primary key NOT NULL ,
number INT,
forename VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL

);
Drop TABLE IF EXISTS  [dwF1_LapTimes].[dbo].[dim_races]
Create TABLE [dwF1_LapTimes].[dbo].[dim_races] (


dim_raceId int identity(1,1) ,
raceId INT primary key NOT NULL ,
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
Winner_forename VARCHAR(50) NOT NULL,
Winner_Surname VARCHAR(50) NOT NULL,
WinnerID  INT NOT NULL ,
ID_Winner_Constructor INT NOT NULL

);


Drop TABLE IF EXISTS  [dwF1_LapTimes].[dbo].[fact_LapTime]
Create TABLE [dwF1_LapTimes].[dbo].[fact_LapTime] (

table_Tests_id int identity(1,1) primary key
,lap INT NOT NULL,
position INT NOT NULL,
time time(3)  NOT NULL,
milliseconds INT NOT NULL

,race_date date
,seasons_year INT NOT NULL



/* FOREIGN key*/
,dim_driverid INT NOT NULL
CONSTRAINT FK_Fact_LapTimes_drivers FOREIGN KEY (dim_driverid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_drivers] (driverId)


/* FOREIGN key*/
,dim_constructorid INT NOT NULL
CONSTRAINT FK_Fact_LapTimes_constructors FOREIGN KEY (dim_constructorid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_constructors] (constructorId)

/* FOREIGN key*/
,dim_circuitid INT NOT NULL
CONSTRAINT FK_Fact_LapTimes_circuit FOREIGN KEY (dim_circuitid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_circuits] (circuitId)

/* FOREIGN key*/
,dim_raceid INT NOT NULL
CONSTRAINT FK_Fact_LapTimes_race FOREIGN KEY (dim_raceid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_races] (raceId)

);