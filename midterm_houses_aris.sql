CREATE DATABASE IF NOT EXISTS house_price_regression;
CREATE TABLE IF NOT EXISTS house_price_data(
	`id` INT,
    `date` DATE,
	`bedrooms` INT,
	`bathrooms` FLOAT,
	`sqft_living` INT,  
	`sqft_lot` INT,
	`floors` FLOAT,
	`waterfront` INT,
	`view` INT,
	`condition` INT,
	`grade` INT,
	`sqft_above` INT,
	`sqft_basement` INT,
	`yr_built` INT,
	`yr_renovated` INT,
	`zipcode` INT,
	`lat` INT,
	`long` FLOAT,
	`sqft_living15` INT,
	`sqft_lot15` INT,
	`price` INT
	);
   SELECT * FROM house_price_data;
    
SELECT * FROM house_price_regression.house_price_data;

-- eliminar columna date y comprobarlo
ALTER TABLE house_price_data DROP COLUMN date;
SELECT * FROM house_price_data LIMIT 10;

-- Use sql query to find how many rows of data you have.
SELECT COUNT(*) AS total_rows FROM house_price_data;

-- What are the unique values in the column bedrooms?
SELECT DISTINCT bedrooms FROM house_price_data;
-- What are the unique values in the column bathrooms?
SELECT DISTINCT bathrooms FROM house_price_data;
-- What are the unique values in the column floors?
SELECT DISTINCT floors FROM house_price_data;
-- What are the unique values in the column condition?
SELECT DISTINCT `condition` FROM house_price_data;
-- What are the unique values in the column grade?
SELECT DISTINCT grade FROM house_price_data;

-- Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
SELECT id 
FROM house_price_data 
ORDER BY price DESC 
LIMIT 10;

-- What is the average price of all the properties in your data?
SELECT AVG(price) AS average_price FROM house_price_data;

-- What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. 
-- Use an alias to change the name of the second column.
SELECT bedrooms, AVG(price) AS average_price 
FROM house_price_data 
GROUP BY bedrooms;

-- What is the average sqft_living of the houses grouped by bedrooms? The returned result should have only two columns, 
-- bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
SELECT bedrooms, AVG(sqft_living) AS average_sqft_living 
FROM house_price_data 
GROUP BY bedrooms;

-- What is the average price of the houses with a waterfront and without a waterfront? 
-- The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.
SELECT waterfront, AVG(price) AS average_price 
FROM house_price_data 
GROUP BY waterfront;

-- Is there any correlation between the columns condition and grade?
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
SELECT `condition`, AVG(grade) AS average_grade 
FROM house_price_data 
GROUP BY `condition`;

-- One of the customers is only interested in the following houses:
-- Number of bedrooms either 3 or 4
-- Bathrooms more than 3
-- One Floor
-- No waterfront
-- Condition should be 3 at least
-- Grade should be 5 at least
-- Price less than 300000
-- For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?
SELECT * 
FROM house_price_data 
WHERE (bedrooms = 3 OR bedrooms = 4)
  AND bathrooms > 3
  AND floors = 1
  AND waterfront = 0
  AND `condition` >= 3
  AND grade >= 5
  AND price < 300000;
  
  -- Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
  -- Write a query to show them the list of such properties.  You might need to use a sub query for this problem.
  SELECT * 
FROM house_price_data 
WHERE price >= 2 * (SELECT AVG(price) FROM house_price_data);

-- Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW expensive_properties AS
SELECT * 
FROM house_price_data 
WHERE price >= 2 * (SELECT AVG(price) FROM house_price_data);

-- Most customers are interested in properties with three or four bedrooms.
-- What is the difference in average prices of the properties with three and four bedrooms?
SELECT 
    ABS(
        (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 3) - 
        (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 4)
    ) AS difference_in_average_price;
    
-- What are the different locations where properties are available in your database? (distinct zip codes)
SELECT DISTINCT zipcode 
FROM house_price_data;

-- Show the list of all the properties that were renovated.
SELECT * 
FROM house_price_data 
WHERE yr_renovated != 0;

-- Provide the details of the property that is the 11th most expensive property in your database.
SELECT * 
FROM house_price_data 
ORDER BY price DESC 
LIMIT 1 OFFSET 10;














