use world

show tables

-- 1---TOP 10 Most Populated Countries ----

select Name,Code,Population from country order by Population desc limit 10

-- 2 -- Least Populated Countries----

select Name,Code,Population from country order by Population asc limit 10

-- 3 --Most populated Cities ---

select * from city order by Population desc limit 10


--4 --- Least Populated Cities---

select * from city order by Population asc limit 10

-- 5---Different forms of governments in the countries---

select GovernmentForm,count(GovernmentForm) from country group by GovernmentForm order by 
count(GovernmentForm) desc

-- 6-- all the languages that is spoken in europe-----

select country.Continent,countrylanguage.Language from country
join countrylanguage on countrylanguage.CountryCode=Country.Code
where country.Continent='Europe'


---7--find the capital of spain,india and usa---

select country.Name ,city.Name from country join city on city.ID=Country.Capital
where country.Name in ('United States','India','Spain')


-- 8 --SQL statement to update president of United States after election in 2016.

alter table country
update country 
set HeadofState='DONALD TRUMPH' where Name='United States'
select * from country where Name='United States'


-- 9----countries with highest life expectancy--

select Name,LifeExpectancy  from country order by LifeExpectancy desc limit 10

