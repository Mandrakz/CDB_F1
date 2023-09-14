DROP DATABASE IF EXISTS Test
CREATE DATABASE Test COLLATE Latin1_General_100_CI_AI_SC_UTF8;
GO
USE Test
GO

/*Creation of Circuits table > PK => circuitID 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[circuits]
Create TABLE [Test].[dbo].[circuits] (

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


/*Creation of Constructor_results table > PK => constructorResultsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[constructor_results]
Create TABLE [Test].[dbo].[constructor_results] (

constructorResultsId INT PRIMARY KEY NOT NULL ,
points INT NOT NULL,
status VARCHAR(50) ,


raceId INT NOT NULL,
constructorId INT NOT NULL
);

/*Creation of [constructor_standings] table > PK => constructorStandingsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[constructor_standings]
Create TABLE [Test].[dbo].[constructor_standings] (

constructorStandingsId INT PRIMARY KEY NOT NULL ,
points INT NOT NULL,
position INT NOT NULL,
positionText VARCHAR(50) NOT NULL,
wins INT NOT NULL,


raceId INT NOT NULL,
constructorId INT NOT NULL
);




/*Creation of [constructors] table > PK => constructorStandingsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[constructors]
Create TABLE [Test].[dbo].[constructors] (

constructorId INT PRIMARY KEY NOT NULL ,
constructorRef VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL,
url VARCHAR(255) NOT NULL
);




/*Creation of [driver_standings] table > PK => driverStandingsId 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[driver_standings]
Create TABLE [Test].[dbo].[driver_standings] (

driverStandingsId INT PRIMARY KEY NOT NULL ,
points INT NOT NULL,
position INT NOT NULL,
positionText VARCHAR(50) NOT NULL,
wins INT NOT NULL,


raceId INT NOT NULL,
driverId INT NOT NULL,
);



/*Creation of [drivers] table > PK => drivers
*/
Drop TABLE IF EXISTS  [Test].[dbo].[drivers]
Create TABLE [Test].[dbo].[drivers] (

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



/*Creation of [lap_times] table > PK => drivers
*/
Drop TABLE IF EXISTS  [Test].[dbo].[lap_times]
Create TABLE [Test].[dbo].[lap_times] (

raceId INT  NOT NULL , /*Foreging Key*/
driverId INT NOT NULL, /* Foreging key*/

lap INT NOT NULL,
position INT NOT NULL,
time time(3)  NOT NULL,
milliseconds INT NOT NULL

);

/*Creation of [status] table > PK => statusId
*/
Drop TABLE IF EXISTS  [Test].[dbo].[status]
Create TABLE [Test].[dbo].[status] (

statusId INT PRIMARY KEY NOT NULL ,
status VARCHAR(50) NOT NULL,

);



/*Creation of [seasons] table 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[seasons]
Create TABLE [Test].[dbo].[seasons] (

year INT PRIMARY KEY  NOT NULL ,
url VARCHAR(255) NOT NULL,

);



/*Creation of [races] table > raceId
*/
Drop TABLE IF EXISTS  [Test].[dbo].[races]
Create TABLE [Test].[dbo].[races] (

raceId INT PRIMARY KEY NOT NULL ,
year INT NOT NULL,
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


circuitId INT NOT NULL

);



/*Creation of [qualifying] table > PK => qualifyingId
*/
Drop TABLE IF EXISTS  [Test].[dbo].[qualifying]
Create TABLE [Test].[dbo].[qualifying] (

qualifyId INT PRIMARY KEY NOT NULL , /*Foreging Key*/
number INT NOT NULL, /* Foreging key*/
position INT NOT NULL,
q1 time(3)  ,
q2 time(3)  ,
q3 time(3)  ,


raceId INT NOT NULL, /* Foreging key*/
driverId INT NOT NULL,
constructorId INT NOT NULL,
);


/*Creation of [pit_stops] table > PK => 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[pit_stops]
Create TABLE [Test].[dbo].[pit_stops] (

raceId INT NOT NULL , /* Key*/
driverId INT NOT NULL, /*  key*/
stop INT NOT NULL,
lap INT NOT NULL, 
time time(0)  ,
duration time(3)  ,
milliseconds INT NOT NULL,
);


/*Creation of [results] table > PK => 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[results]
Create TABLE [Test].[dbo].[results] (

resultId INT PRIMARY KEY  NOT NULL , /* Primary Key*/

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

raceId INT NOT NULL, /* ForeG key*/
driverId INT NOT NULL,
constructorId INT NOT NULL,
statusId INT NOT NULL,

);



/*Creation of [sprint_results] table > PK => 
*/
Drop TABLE IF EXISTS  [Test].[dbo].[sprint_results]
Create TABLE [Test].[dbo].[sprint_results] (

resultId INT NOT NULL , /* Primary Key*/
raceId INT NOT NULL, /* ForeG key*/
driverId INT NOT NULL,
constructorId INT NOT NULL,
statusId INT NOT NULL,

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
fastestLapTime time(3)
);
