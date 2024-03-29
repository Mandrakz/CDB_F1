﻿/*dim races*/
/*dim races*/
WITH Result_TAB_drivers  AS
(
SELECT 
		aux_results.resultId,
		aux_results.raceId,
		positionOrder,
		aux_results.driverId,
		drivers.forename,
		drivers.surname,
		aux_results.constructorId
  FROM [Test].[dbo].results as aux_results
  INNER JOIN drivers ON drivers.driverId = aux_results.driverId) 
  ,

  Result_TAB_drivers_TAB_races AS
(
SELECT 
		 aux_races.[raceId]
      ,[year]
      ,[round]
      ,[name]
      ,[fp1_date]
      ,[fp1_time]
      ,[fp2_date]
      ,[fp2_time]
      ,[fp3_date]
      ,[fp3_time]
      ,[quali_date]
      ,[quali_time]
      ,[sprint_date]
      ,[sprint_time]
      ,aux_races.circuitId,
		Result_TAB_drivers.forename,
		Result_TAB_drivers.surname,
		Result_TAB_drivers.positionOrder,
		Result_TAB_drivers.driverID,
		Result_TAB_drivers.constructorId
  FROM races as aux_races
  INNER JOIN Result_TAB_drivers ON Result_TAB_drivers.raceId = aux_races.raceId)





/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  
     *
  FROM Result_TAB_drivers_TAB_races
WHERE year IN (SELECT max(year) from [Test].[dbo].[races] ) --Last year
AND positionOrder = 1
ORDER BY round ASC


/*dim Circuit * */ 
SELECT 
		circ.circuitId,
      circ.[name]
      ,[country]
      ,[lat]
      ,[lng]
      ,[alt]
  FROM [Test].[dbo].[circuits] as circ
  INNER JOIN races ON circ.circuitId = races.circuitId
WHERE year IN (SELECT max(year) from [Test].[dbo].[races] ) --Last year
ORDER BY date asc

/*dim Drivers * */
SELECT  
	DISTINCT(r.driverId),
	forename,
	surname,
	nationality,
	r.number
FROM (SELECT 
	drivertab.[driverId] --a
      ,drivertab.[number] --a
      ,[forename] --a
      ,[surname] --a 
      ,[nationality] --a
	  ,qualifying.raceId
  FROM [Test].[dbo].[drivers] AS drivertab
  INNER JOIN qualifying ON drivertab.driverId = qualifying.driverId) AS r
 INNER JOIN races ON r.raceId = races.raceId
WHERE year IN (SELECT max(year) from [Test].[dbo].[races] ) --Last year
ORDER BY r.driverId asc

/*dim Constructors * */
SELECT  
	DISTINCT(aux_construstor_standings.constructorId),
	constructorRef,
	aux_construstor_standings.name,
	nationality
FROM (SELECT 
	const.constructorId,
	constructorRef,
	name,
	nationality,
	constructor_standings.raceId
  FROM [Test].[dbo].[constructors] AS const
  INNER JOIN constructor_standings ON const.constructorId = constructor_standings.constructorId ) AS aux_construstor_standings
 INNER JOIN races ON aux_construstor_standings.raceId = races.raceId
WHERE year IN (SELECT max(year) from [Test].[dbo].[races] ) --Last year
ORDER BY constructorId ASC

/*FACT table LapTimes *  */
/*Join Lap Times and Races > I need date and yeard*//*Join Lap Times and Races > I need date and year*/
WITH 
LapTimes_TAB_Races
AS (
SELECT  aux_laptimes.[raceId]
		,aux_laptimes.driverId
      ,aux_laptimes.[lap]
      ,aux_laptimes.[position]
      ,aux_laptimes.[time]
      ,aux_laptimes.[milliseconds],
	  races.circuitId,
	  races.year,
	  races.date
  FROM [Test].[dbo].[lap_times] as aux_laptimes
  INNER JOIN races ON races.raceId = aux_laptimes.raceId ),


/*Join lap times and drivers > It´s used for seeing information and it´s in the middle*/
LapTimes_TAB_drivers
AS (
SELECT 
	aux_LapTimes_TAB_Races.raceId,--*
	aux_LapTimes_TAB_Races.driverId,--*
	aux_LapTimes_TAB_Races.[lap],
	aux_LapTimes_TAB_Races.position,
	aux_LapTimes_TAB_Races.time,
	aux_LapTimes_TAB_Races.milliseconds,
	aux_LapTimes_TAB_Races.date,
	aux_LapTimes_TAB_Races.year,
	aux_LapTimes_TAB_Races.circuitId,--*
	drivers.surname ,--*
	drivers.forename --*


  FROM LapTimes_TAB_Races AS aux_LapTimes_TAB_Races
INNER JOIN drivers
  ON drivers.driverId = aux_LapTimes_TAB_Races.driverId),


/*Join with drivers and sprint results > Obtain information about constructor id*/
  LapTimes_TAB_drivers_TAB_qualify
AS (
SELECT 
	aux_LapTimes_TAB_drivers.raceId,--*
	aux_LapTimes_TAB_drivers.driverId,--*
	aux_LapTimes_TAB_drivers.[lap],
	aux_LapTimes_TAB_drivers.position,
	aux_LapTimes_TAB_drivers.time,
	aux_LapTimes_TAB_drivers.milliseconds,
	aux_LapTimes_TAB_drivers.date,
	aux_LapTimes_TAB_drivers.year,
	aux_LapTimes_TAB_drivers.circuitId,--*
	aux_LapTimes_TAB_drivers.surname ,--*
	aux_LapTimes_TAB_drivers.forename,--*
	q1.constructorId
  FROM LapTimes_TAB_drivers AS aux_LapTimes_TAB_drivers
  INNER JOIN qualifying as q1 ON aux_LapTimes_TAB_drivers.raceId = q1.raceId AND q1.driverId = aux_LapTimes_TAB_drivers.driverId)
 

  SELECT 
  DISTINCT (lap),
	raceId,
	driverId,
	position,
	time,
	milliseconds,
	date,
	year,
	circuitId,
	constructorId
  FROM LapTimes_TAB_drivers_TAB_qualify
WHERE year IN (SELECT max(year) from [Test].[dbo].[races])  
ORDER BY driverId ASC, raceId,constructorId,circuitId,lap

