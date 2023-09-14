/*RACES*/
ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime] DROP CONSTRAINT IF EXISTS [FK_Fact_LapTimes_drivers]
ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime] DROP CONSTRAINT IF EXISTS [FK_Fact_LapTimes_constructors]
ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime] DROP CONSTRAINT IF EXISTS [FK_Fact_LapTimes_circuit]
ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime] DROP CONSTRAINT IF EXISTS [FK_Fact_LapTimes_race]



/*Clean Information Datawarehouse*/

TRUNCATE TABLE [dwF1_LapTimes].[dbo].[dim_circuits];
TRUNCATE TABLE [dwF1_LapTimes].[dbo].[dim_constructors];
TRUNCATE TABLE [dwF1_LapTimes].[dbo].[dim_drivers]; 
TRUNCATE TABLE  [dwF1_LapTimes].[dbo].[fact_LapTime];
TRUNCATE TABLE [dwF1_LapTimes].[dbo].[dim_races];
