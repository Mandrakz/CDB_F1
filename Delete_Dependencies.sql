/*RACES*/
ALTER TABLE [Test].[dbo].[races] DROP CONSTRAINT [FK_Races_Seasons]
ALTER TABLE [Test].[dbo].[races] DROP CONSTRAINT [FK_Races_Circuits]

/*Constructor Results */
ALTER TABLE [Test].[dbo].[constructor_results] DROP CONSTRAINT [FK_ConstructorResults_Races]
ALTER TABLE [Test].[dbo].[constructor_results] DROP CONSTRAINT [FK_ConstructorResults_Constructors]

/* Constructor Standings */
ALTER TABLE [Test].[dbo].[constructor_standings] DROP CONSTRAINT [FK_ConstructorStandings_Races]
ALTER TABLE [Test].[dbo].[constructor_standings] DROP CONSTRAINT [FK_ConstructorStandings_Constructors]

/* Driver Standings */
ALTER TABLE [Test].[dbo].[driver_standings] DROP CONSTRAINT [FK_DriverStandings_Races]
ALTER TABLE [Test].[dbo].[driver_standings] DROP CONSTRAINT [FK_DriverStandings_Drivers]

/* Pits */
ALTER TABLE [Test].[dbo].[pit_stops] DROP CONSTRAINT [FK_PitStops_Races]
ALTER TABLE [Test].[dbo].[pit_stops] DROP CONSTRAINT [FK_PitStops_Drivers]

/* Laps Times */
ALTER TABLE [Test].[dbo].[lap_times] DROP CONSTRAINT [FK_LapTimes_Races]
ALTER TABLE [Test].[dbo].[lap_times] DROP CONSTRAINT [FK_LapTimes_Drivers]

/*Qualy*/
ALTER TABLE [Test].[dbo].[qualifying] DROP CONSTRAINT [FK_Qualifying_Races]
ALTER TABLE [Test].[dbo].[qualifying] DROP CONSTRAINT [FK_Qualifying_Drivers]
ALTER TABLE [Test].[dbo].[qualifying] DROP CONSTRAINT [FK_Qualifying_Constructors]

/*Results*/
ALTER TABLE [Test].[dbo].[results] DROP CONSTRAINT [FK_Results_Races]
ALTER TABLE [Test].[dbo].[results] DROP CONSTRAINT [FK_Results_Drivers]
ALTER TABLE [Test].[dbo].[results] DROP CONSTRAINT [FK_Results_Constructors]
ALTER TABLE [Test].[dbo].[results] DROP CONSTRAINT [FK_Results_Status]





