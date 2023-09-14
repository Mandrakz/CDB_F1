/*Dependencies in Datawarehouse*/

ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime]
ADD 
CONSTRAINT FK_Fact_LapTimes_drivers FOREIGN KEY (dim_driverid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_drivers] (driverId);

ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime]
ADD 
CONSTRAINT FK_Fact_LapTimes_constructors FOREIGN KEY (dim_constructorid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_constructors] (constructorId);

ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime]
ADD 
CONSTRAINT FK_Fact_LapTimes_circuit FOREIGN KEY (dim_circuitid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_circuits] (circuitId);

ALTER TABLE [dwF1_LapTimes].[dbo].[fact_LapTime]
ADD 
CONSTRAINT FK_Fact_LapTimes_race FOREIGN KEY (dim_raceid)
REFERENCES [dwF1_LapTimes].[dbo].[dim_races] (raceId);



