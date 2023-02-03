/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [resultId],
      Result.raceId,
	  Result.constructorId,
	  Result.driverId
      ,[positionOrder]
      ,[points],
	  Result.laps as Laps_Completed,
	  Result.fastestLap as Fastest_Lap,
	  Result.fastestLapTime as Fastest_Lap_Time,
	  /*Values that come from others tables */
	  Driver.surname as Driver_name,
      Constructor.name as Constructor_name,
	  Race.name as Race_Name,
	   Laps.lap as number_lap,
	   Laps.position as position_lap,
	  Laps.time as time_lap,
	  Laps.milliseconds as milisecond_lap 
     
  FROM [Portfolio_Project_F1].[dbo].[results] as Result
LEFT JOIN [Portfolio_Project_F1].[dbo].[drivers] Driver 
  ON Result.driverId = Driver.driverId
  LEFT JOIN [Portfolio_Project_F1].[dbo].[constructors] Constructor
  ON Result.constructorId= Constructor.constructorId
 LEFT JOIN [Portfolio_Project_F1].[dbo].[races] Race
  ON Result.raceId = Race.raceId
  LEFT JOIN [Portfolio_Project_F1].[dbo].[lap_times] Laps
  ON Result.raceId = Laps.raceId AND Result.driverId = Laps.driverId 
  /*
 WHERE result.raceId  = 1096 */


 /*lap(antigua) => 528.785 rows
  lap (neun) => 
 */