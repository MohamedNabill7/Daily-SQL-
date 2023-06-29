USE [Olympic CaseStudy]; 

-- Show the data
SELECT * FROM athlete WHERE;

-- How many olympics games have been held?
SELECT 
	COUNT(DISTINCT(Games)) AS Games_Count 
FROM athlete;
-- ANS: 51

-- List down all Olympics games held so far.
SELECT 
	DISTINCT(Year), Season, City 
FROM athlete 
ORDER BY Year ASC;

-- Mention the total no of nations who participated in each olympics game?
SELECT 
	Games,COUNT(DISTINCT(NOC)) AS TotalCountries 
FROM athlete 
GROUP BY Games;

-- Which year saw the highest and lowest no of countries participating in olympics?
-- Which nation has participated in all of the olympic games?
-- Identify the sport which was played in all summer olympics.
SELECT Sport FROM athlete WHERE Season = 'Summer'
-- Which Sports were just played only once in the olympics?
-- Fetch the total no of sports played in each olympic games.
SELECT 
	Games, Count(Sport) AS TOT_NO_Sport 
FROM athlete 
GROUP BY Games 
ORDER BY 2

-- Fetch details of the oldest athletes to win a gold medal.
SELECT *
FROM
	(SELECT DISTINCT * , DENSE_RANK() OVER(ORDER BY Age DESC) AS 'Rank' FROM athlete WHERE Medal='Gold') TAB
WHERE Rank=1
ORDER BY Year ASC
  
-- Find the Ratio of male and female athletes participated in all olympic games.
SELECT
	CONCAT(CAST((SUM(CASE WHEN Sex = 'M' then 1 ELSE 0 END)*1.0/COUNT(Games))*100.0 AS decimal(18,2)),'%') AS ROM,
	CONCAT(CAST((SUM(CASE WHEN Sex = 'F' then 1 ELSE 0 END)*1.0/COUNT(Games))*100.0 AS decimal(18,2)),'%') AS ROF
from athlete
  
-- Fetch the top 5 athletes who have won the most gold medals.
WITH TAB1 AS
(
SELECT NAME, Team,COUNT(1) AS Medal_Gold from athlete WHERE Medal = 'Gold' group by Name,Team
), TAB2 AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY Medal_Gold DESC) AS DR FROM TAB1 
)
SELECT
	NAME, Team, Medal_Gold 
FROM TAB2 
WHERE DR <= 5 
ORDER BY DR

-- Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
WITH CTE1 AS
(
SELECT NAME, Team,COUNT(1) AS Medals from athlete WHERE Medal IN ('Gold','Silver','Bronze') group by Name,Team
), CTE2 AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY Medals DESC) AS DR FROM CTE1 
)
SELECT 
	NAME, Team, Medals 
FROM CTE2 
WHERE DR <= 5
ORDER BY DR

-- Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
SELECT
	TOP(5) NOC, COUNT(Medal) AS TOT_MEDALS 
FROM athlete
WHERE Medal IN ('Gold','Silver','Bronze') 
group by NOC
ORDER BY 2 DESC

-- List down total gold, silver and broze medals won by each country.
SELECT 
	NOC,
	SUM(CASE WHEN Medal='Gold' THEN 1 ELSE 0 END) AS Gold, 
	SUM(CASE WHEN Medal='Silver' THEN 1 ELSE 0 END) AS Silver,
	SUM(CASE WHEN Medal='Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM athlete
GROUP BY NOC
ORDER BY Gold DESC, Silver DESC ,Bronze DESC 
  
-- List down total gold, silver and broze medals won by each country corresponding to each olympic games.
SELECT 
	Games,
	NOC,
	SUM(CASE WHEN Medal='Gold' THEN 1 ELSE 0 END) AS Gold, 
	SUM(CASE WHEN Medal='Silver' THEN 1 ELSE 0 END) AS Silver,
	SUM(CASE WHEN Medal='Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM athlete
GROUP BY Games,NOC
ORDER BY Games

-- Identify which country won the most gold, most silver and most bronze medals in each olympic games.
-- Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
-- Which countries have never won gold medal but have won silver/bronze medals?
-- In which Sport/event, India has won highest medals.
-- Break down all olympic games where india won medal for Hockey and how many medals in each olympic games.

