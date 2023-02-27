USE Test
GO

/*Creation of Circuits table > PK => circuitID 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[circuits]
Create TABLE [Test].[dbo].[circuits] (
/* PRIMARY key*/
circuitId INT PRIMARY KEY NOT NULL ,

circuitRef VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
location VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
/*lat float NOT NULL ,
lng float NOT NULL,*/
lat DECIMAL(8,6) NOT NULL ,
lng DECIMAL(9,6) NOT NULL,
alt int ,
url VARCHAR(255) NOT NULL

);

/*Creation of [seasons] table 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[seasons]
Create TABLE [Test].[dbo].[seasons] (
/* PRIMARY key*/
year INT PRIMARY KEY  NOT NULL ,

url VARCHAR(255) NOT NULL,

);

/*Creation of [races] table > raceId
*/
Drop TABLE IF EXISTS  [Test].[dbo].[races]
Create TABLE [Test].[dbo].[races] (
/* PRIMARY key*/
raceId INT PRIMARY KEY NOT NULL ,

round INT NOT NULL,
name VARCHAR(50) NOT NULL,
date DATE,
time time(0),
url VARCHAR(255) NOT NULL,
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

/* FOREIGN key*/
year INT NOT NULL
CONSTRAINT FK_Races_Seasons FOREIGN KEY (year)
REFERENCES [Test].[dbo].[seasons] (year),

circuitId INT NOT NULL
CONSTRAINT FK_Races_Circuits FOREIGN KEY (circuitId)
REFERENCES [Test].[dbo].[circuits] (circuitId)

);

/*Creation of [constructors] table > PK => constructorStandingsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[constructors]
Create TABLE [Test].[dbo].[constructors] (
/* PRIMARY key*/
constructorId INT PRIMARY KEY NOT NULL ,

constructorRef VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL,
url VARCHAR(255) NOT NULL
);

/*Creation of Constructor_results table > PK => constructorResultsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[constructor_results]
Create TABLE [Test].[dbo].[constructor_results] (
/* PRIMARY key*/
constructorResultsId INT PRIMARY KEY NOT NULL ,

points INT NOT NULL,
status VARCHAR(50) NOT NULL,

/* FOREIGN key*/
raceId INT NOT NULL,
CONSTRAINT FK_ConstructorResults_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

constructorId INT NOT NULL
CONSTRAINT FK_ConstructorResults_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId)

);

/*Creation of [constructor_standings] table > PK => constructorStandingsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[constructor_standings]
Create TABLE [Test].[dbo].[constructor_standings] (
/* PRIMARY key*/
constructorStandingsId INT PRIMARY KEY NOT NULL ,

points INT NOT NULL,
position INT NOT NULL,
positionText VARCHAR(50) NOT NULL,
wins INT NOT NULL,

/* FOREIGN key*/
raceId INT NOT NULL,
CONSTRAINT FK_ConstructorStandings_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

constructorId INT NOT NULL
CONSTRAINT FK_ConstructorStandings_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId)
);

/*Creation of [drivers] table > PK => drivers
*/
Drop TABLE IF EXISTS  [Test].[dbo].[drivers]
Create TABLE [Test].[dbo].[drivers] (
/* PRIMARY key*/
driverId INT PRIMARY KEY NOT NULL ,

driverRef VARCHAR(50) NOT NULL,
number INT,
code VARCHAR(50),
forename VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
dob DATE,
nationality VARCHAR(50) NOT NULL,
url VARCHAR(255) NOT NULL

);

/*Creation of [driver_standings] table > PK => driverStandingsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[driver_standings]
Create TABLE [Test].[dbo].[driver_standings] (
/* PRIMARY key*/
driverStandingsId INT PRIMARY KEY NOT NULL ,

points INT NOT NULL,
position INT NOT NULL,
positionText VARCHAR(50) NOT NULL,
wins INT NOT NULL,

/* Foreign key*/
raceId INT NOT NULL,
CONSTRAINT FK_DriverStandings_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

driverId INT NOT NULL,
CONSTRAINT FK_DriverStandings_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId)
);

/*Creation of [pit_stops] table > PK => 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[pit_stops]
Create TABLE [Test].[dbo].[pit_stops] (

/* Foreign key*/
raceId INT NOT NULL,
CONSTRAINT FK_PitStops_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

driverId INT NOT NULL,
CONSTRAINT FK_PitStops_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId),


stop INT NOT NULL,
lap INT NOT NULL, 
time time(0)  ,
duration time(3)  ,
milliseconds INT NOT NULL,
);

/*Creation of [lap_times] table > PK => drivers
*/
Drop TABLE IF EXISTS  [Test].[dbo].[lap_times]
Create TABLE [Test].[dbo].[lap_times] (

/* Foreign key*/
raceId INT NOT NULL,
CONSTRAINT FK_LapTimes_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

driverId INT NOT NULL,
CONSTRAINT FK_LapTimes_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId),

lap INT NOT NULL,
position INT NOT NULL,
time time(3)  NOT NULL,
milliseconds INT NOT NULL

);

/*Creation of [qualifying] table > PK => qualifyingId
*/
Drop TABLE IF EXISTS  [Test].[dbo].[qualifying]
Create TABLE [Test].[dbo].[qualifying] (

/* Primary Key*/
qualifyId INT PRIMARY KEY NOT NULL , 

number INT NOT NULL, 
position INT NOT NULL,
q1 time(3)  ,
q2 time(3)  ,
q3 time(3)  ,

/* Foreign key*/
raceId INT NOT NULL,
CONSTRAINT FK_Qualifying_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

driverId INT NOT NULL,
CONSTRAINT FK_Qualifying_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId),

constructorId INT NOT NULL,
CONSTRAINT FK_Qualifying_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId)
);

/*Creation of [status] table > PK => statusId
*/
Drop TABLE IF EXISTS  [Test].[dbo].[status]
Create TABLE [Test].[dbo].[status] (
/* Primary Key*/
statusId INT PRIMARY KEY NOT NULL ,
status VARCHAR(50) NOT NULL,

);

/*Creation of [results] table > PK => 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[results]
Create TABLE [Test].[dbo].[results] (
/* Primary Key*/
resultId INT PRIMARY KEY  NOT NULL , 

number INT ,
grid INT NOT NULL ,
position INT  , /*ADMIT NULLS VALUES > */

positionText VARCHAR(50) NOT NULL,
positionOrder INT NOT NULL,
points INT NOT NULL,
laps INT NOT NULL,
milliseconds INT ,
fastestLap INT,
rank INT,
fastestLapTime time(3), 
fastestLapSpeed DECIMAL(6,3),
time VARCHAR(50),

/* Foreign key*/
raceId INT NOT NULL,
CONSTRAINT FK_Results_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

driverId INT NOT NULL,
CONSTRAINT FK_Results_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId),

constructorId INT NOT NULL,
CONSTRAINT FK_Results_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId),

statusId INT NOT NULL,
CONSTRAINT FK_Results_Status FOREIGN KEY (statusId)
REFERENCES [Test].[dbo].[status] (statusId)

);

/*Creation of [sprint_results] table > PK => 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[sprint_results]
Create TABLE [Test].[dbo].[sprint_results] (

resultId INT NOT NULL , /* Primary Key*/


number INT NOT NULL ,
grid INT NOT NULL ,
position INT  ,
positionText VARCHAR(50) NOT NULL,
positionOrder INT NOT NULL,
points INT NOT NULL,
laps INT NOT NULL,
time VARCHAR(50),
milliseconds INT ,
fastestLap INT,
fastestLapTime time(3),


/* Foreign key*/
raceId INT NOT NULL,
CONSTRAINT FK_SprintResults_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId),

driverId INT NOT NULL,
CONSTRAINT FK_SprintResults_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId),

constructorId INT NOT NULL,
CONSTRAINT FK_SprintResults_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId),

statusId INT NOT NULL,
CONSTRAINT FK_SprintResults_Status FOREIGN KEY (statusId)
REFERENCES [Test].[dbo].[status] (statusId)

);
