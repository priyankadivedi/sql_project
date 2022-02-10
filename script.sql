-- data is collected by govwrnment sites
-- here I clean data and  check any possible error in data 
-- This data indicate all states and UTs and their  total vaccination dosse and population  

SELECT *
FROM db1.`covid_vacc_data`
ORDER BY 1;
-- data cleaning
-- change name of column of table
ALTER TABLE `db1`.`covid_vacc_data` CHANGE COLUMN `total_vaccination_doses` `Total_vaccination_doses` INT NULL ;
ALTER TABLE `db1`.`covid_vacc_data` CHANGE COLUMN `Dose 1` `Dose_1` INT NULL ;
ALTER TABLE `db1`.`covid_vacc_data` CHANGE COLUMN `Dose 2` `Dose_2` INT NULL ;

-- remove duplicate
SELECT distinct state/UTs,total_vaccination_doses, Dose_1, Dose_2,Population FROM db1.`covid_vacc_data`

--  state/UTs with highest vaccination 
SELECT *
FROM db1.`covid_vacc_data`
ORDER BY Total_vaccination_doses DESC ; -- Uttar pardesh
-- State/UTs with lowest vaccination  
SELECT *
FROM db1.`covid_vacc_data`
ORDER BY Total_vaccination_doses -- lakkshadweep
-- second dose  is more than first dose 
SELECT *
FROM db1.`covid_vacc_data`
WHERE Dose_2 >= Dose_1; -- in jammu and kashmir
-- check any state where doses are more than population
SELECT *
FROM db1.`covid_vacc_data`
WHERE Population < (Total_vaccination_doses/2); -- no row found
-- check any state where sum of doses is less than to total vaccination
SELECT *
FROM db1.`covid_vacc_data`
WHERE Total_vaccination_doses > (Dose_1 + Dose_2) ; -- no row found 

-- percenage of vaccinated people per state/Uts

SELECT * , 
(Total_vaccination_doses/Population)*100 as vaccination_percenatge
FROM db1.`covid_vacc_data`

-- here all the errors are remove and data is ready for visulization ###
