/*Races*/

ALTER TABLE [Test].[dbo].[races]
ADD 
CONSTRAINT FK_Races_Seasons FOREIGN KEY (year)
REFERENCES [Test].[dbo].[seasons] (year);

ALTER TABLE [Test].[dbo].[races]
ADD 
CONSTRAINT FK_Races_Circuits FOREIGN KEY (circuitId)
REFERENCES [Test].[dbo].[circuits] (circuitId);

/*Constructor Results */


ALTER TABLE [Test].[dbo].[constructor_results]
ADD
CONSTRAINT FK_ConstructorResults_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[constructor_results]
ADD
CONSTRAINT FK_ConstructorResults_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId)


/*Constructor Standings*/
 
ALTER TABLE [Test].[dbo].[constructor_standings]
ADD
CONSTRAINT FK_ConstructorStandings_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[constructor_standings]
ADD
CONSTRAINT FK_ConstructorStandings_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId);


/* Driver Standings*/
ALTER TABLE [Test].[dbo].[driver_standings]
ADD
CONSTRAINT FK_DriverStandings_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[driver_standings]
ADD
CONSTRAINT FK_DriverStandings_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId)




/* Pit Stops*/
ALTER TABLE [Test].[dbo].[pit_stops]
ADD
CONSTRAINT FK_PitStops_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[pit_stops]
ADD
CONSTRAINT FK_PitStops_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId);

/*Laps Times */

ALTER TABLE [Test].[dbo].[lap_times]
ADD
CONSTRAINT FK_LapTimes_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[lap_times]
ADD
CONSTRAINT FK_LapTimes_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId);


/*Qualyf*/
ALTER TABLE [Test].[dbo].[qualifying]
ADD
CONSTRAINT FK_Qualifying_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[qualifying]
ADD
CONSTRAINT FK_Qualifying_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId);

ALTER TABLE [Test].[dbo].[qualifying]
ADD
CONSTRAINT FK_Qualifying_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId);


/*Results*/  
ALTER TABLE [Test].[dbo].[results]
ADD
CONSTRAINT FK_Results_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[results]
ADD
CONSTRAINT FK_Results_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId);

ALTER TABLE [Test].[dbo].[results]
ADD
CONSTRAINT FK_Results_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId);

ALTER TABLE [Test].[dbo].[results]
ADD
CONSTRAINT FK_Results_Status FOREIGN KEY (statusId)
REFERENCES [Test].[dbo].[status] (statusId);


/*Sprint Results*/  
ALTER TABLE [Test].[dbo].[sprint_results]
ADD
CONSTRAINT FK_SprintResults_Races FOREIGN KEY (raceId)
REFERENCES [Test].[dbo].[races] (raceId);

ALTER TABLE [Test].[dbo].[sprint_results]
ADD
CONSTRAINT FK_SprintResults_Drivers FOREIGN KEY (driverId)
REFERENCES [Test].[dbo].[drivers] (driverId);

ALTER TABLE [Test].[dbo].[sprint_results]
ADD
CONSTRAINT FK_SprintResults_Constructors FOREIGN KEY (constructorId)
REFERENCES [Test].[dbo].[constructors] (constructorId);

ALTER TABLE [Test].[dbo].[sprint_results]
ADD
CONSTRAINT FK_SprintResults_Status FOREIGN KEY (statusId)
REFERENCES [Test].[dbo].[status] (statusId);

