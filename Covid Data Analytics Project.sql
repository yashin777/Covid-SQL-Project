SELECT * 
FROM owid_covid_data
WHERE continent IS NOT NULL
order by 3,4


SELECT location,date,total_cases,new_cases,total_deaths,population 
FROM owid_covid_data ocd
WHERE continent is not null
order by 1,2


-- Looking at Total Cases vs Total Deaths

SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM owid_covid_data ocd
WHERE location like  '%states'
order by 1,2

-- looking total_cases vs total population
-- shows what percentage of population got Covid
SELECT location,date,population,total_cases, (total_deaths/total_cases)*100 as DeathPercentage
FROM owid_covid_data ocd
WHERE location like  '%states'
order by 1,2

-- looking at countries with highest infection rate compare to population
SELECT location,population,MAX(total_cases) AS highest_infection_rate, MAX(total_cases/population)*100
FROM owid_covid_data ocd
Group by location,population 
order by highest_infection_rate DESC

-- showing countries highest deaths --error
SELECT location , MAX(total_deaths) as TotalDeathCount
FROM owid_covid_data ocd
-- WHERE location like '%states%'
WHERE continent is NOT NULL
Group by location
order by  TotalDeathCount DESC





