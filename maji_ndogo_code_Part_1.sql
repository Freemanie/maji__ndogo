USE md_water_services;
-- 1. Get to know our data:
-- SHOW TABLES;

-- 1.1 Looking at the Location table
-- SELECT
-- 	*
-- FROM 
-- 	location
-- LIMIT
-- 	5;
-- 1.2 Lokking at the visits table
-- SELECT
-- 	*
-- FROM 
-- 	visits
-- LIMIT
-- 	5;
-- 1.3 Looking at the water_source table and other tables
-- SELECT
-- 	*
-- FROM 
-- 	well_pollution
-- LIMIT
-- 5;

-- 2. Dive into the water sources
-- 2.1 finding unique type of water sources
-- SELECT DISTINCT *
-- FROM 
-- 	water_source
-- -- LIMIT
-- 5; 

-- 2.2 retrieving all records from the visits table where time in queue is > 500min
-- SELECT *
-- FROM 
-- 	visits
-- WHERE 
-- 	time_in_queue > 500;

-- 3. Unpack the visits to water sources:
--  3.1 finding out the type of water sources that makes people wait 500mins
-- SELECT *
-- FROM 
-- 	water_source
-- WHERE
-- 	source_id = 'AkKi00881224'
-- 	OR source_id = 'SoRu37635224'
--     OR source_id = 'SoRu36096224';

-- 3.2 Checking for the type of water sources that people waited 0 mins
-- SELECT *
-- FROM 
-- 	water_source
-- WHERE
-- 	source_id = 'KiRu28935224'
-- 	OR source_id = 'AkLu01628224'
--     OR source_id = 'AkRu05234224'
--     OR source_id = 'KiRu28520224'
-- 	OR source_id = 'HaZa21742224'
--     OR source_id = 'AmDa12214224'
--     OR source_id = 'HaRu19725224'
--     OR source_id = 'AkKi00851224'
--     OR source_id = 'AmDa11956224'
    
-- 4. Assess the quality of water sources:
-- 4.1 find records where the subject_quality_score = 10 -- only looking for home taps -- and where the source was visited a second time
-- SELECT *
-- FROM 
-- 	water_quality
-- WHERE
-- 	subjective_quality_score = 10
--     AND
--     visit_count = 2
--     
-- 5. Investigate pollution issues:
-- 5.1 Find the right table and print the first few rows of the pollution table.
-- SELECT *
-- FROM 
-- 	well_pollution
-- LIMIT	
-- 	5;

-- 5.2 write a query that checks if the results is Clean but the biological column is > 0.01.
-- SELECT *
-- FROM 
-- 	well_pollution
-- WHERE
-- 	results = 'clean'
--     AND
--     biological > 0.01
-- 5.3  find these descriptions, search for the word Clean with additional characters after it. As this is what separates incorrect descriptions from the records that should have "Clean"
--  SELECT *
-- FROM 
-- 	well_pollution
-- WHERE
-- 	description LIKE 'Clean%'
--     AND
--     biological > 0.01


-- 5.4 Creating a copy of the well_population 
-- CREATE TABLE
-- md_water_services.well_pollution_copy 
-- AS (
-- SELECT
-- *
-- FROM
-- md_water_services.well_pollution
-- )

--
-- 5.5 updating the  error to rename the wrongly named columns
-- UPDATE
-- 	well_pollution_copy
-- SET
-- 	description = 'Bacteria: E. coli'
-- WHERE
-- 	description = 'Clean Bacteria: E. coli';
-- UPDATE
-- 	well_pollution_copy
-- SET
-- 	description = 'Bacteria: Giardia Lamblia'
-- WHERE
-- 	description = 'Clean Bacteria: Giardia Lamblia';
-- UPDATE
-- 	well_pollution_copy
-- SET
-- 	results = 'Contaminated: Biological'
-- WHERE
-- 	biological > 0.01 AND results = 'Clean';

--
-- 5.6 checking if the corrections were effected
-- SELECT *
-- FROM
-- 	well_pollution_copy
-- WHERE
-- 	description LIKE "Clean_%"
-- OR 
-- 	(results = "Clean" AND biological > 0.01);

-- 5.7 UPDATING THE MAIN TABLE AFTER THE CONFIRMING THAT THE WORK DONE INITIALLY IN THE COPY TABLE IS A SUCCESS


-- SELECT *
-- FROM
-- 	well_pollution
-- WHERE
-- 	description LIKE "Clean_%"
-- OR 
-- 	(results = "Clean" AND biological > 0.01);





-- SELECT *
-- FROM 
-- 	employee
-- WHERE 
-- 	position = 'field surveyor'
-- 	AND 
--     (employee_name LIKE '%A' OR employee_name LIKE '%M')
-- 	AND
-- 		(phone_number LIKE '%86%' OR phone_number LIKE '%11%'); 
