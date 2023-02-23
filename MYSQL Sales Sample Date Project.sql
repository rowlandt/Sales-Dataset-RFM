-- Inspecting Data
USE sales_sample_data; 
SELECT * FROM sales_sample_data;
SELECT STR_TO_DATE(ORDERDATE, '%m/%d/%Y') AS NEWORDERDATE
FROM sales_sample_data; -- Converting ORDERDATE column from string to date. 

-- Checking unique values

SELECT DISTINCT status FROM sales_sample_data; -- plot
SELECT DISTINCT year_id FROM sales_sample_data;
SELECT DISTINCT PRODUCTLINE FROM sales_sample_data; -- plot
SELECT DISTINCT COUNTRY FROM sales_sample_data; -- plot
SELECT DISTINCT DEALSIZE FROM sales_sample_data; -- plot
SELECT DISTINCT TERRITORY FROM sales_sample_data; -- plot

-- Did they operate the full year in 2005? Checking since they did not have alot of revenue.
SELECT DISTINCT MONTH_ID FROM sales_sample_data
WHERE year_id = '2005';

-- ANALYSIS

-- Let's start by grouping sales by productline, which products sell the most. Sum of sales per productline. 
SELECT PRODUCTLINE, ROUND(sum(sales), 2) Revenue
FROM sales_sample_data
GROUP BY PRODUCTLINE
ORDER BY 2 DESC;

-- Which year sold the most. 2005 was low as they did not operate the entire year as opposed to the other years. Sales across year.
SELECT YEAR_ID, ROUND(sum(sales), 2) Revenue
FROM sales_sample_data
GROUP BY YEAR_ID
ORDER BY 2 DESC;

-- Whcih dealsize amounted the most revenue. Medium deal sizes amounted the most revenue
SELECT  DEALSIZE,  ROUND(sum(sales), 2) Revenue
FROM sales_sample_data
GROUP BY  DEALSIZE
ORDER BY 2 DESC;

-- What was the best month for sales in a specific year? How much was earned that month? 
-- It wouldnt be a true reflection of the entire year in 2005.
SELECT  MONTH_ID, ROUND(sum(sales), 2) Revenue, count(ORDERNUMBER) Frequency
FROM sales_sample_data
WHERE YEAR_ID = 2004 -- change year to see the rest
GROUP BY  MONTH_ID
ORDER BY 2 DESC;


-- November seems to be the month with the most sales, what product do they sell the most in November.
SELECT  MONTH_ID, PRODUCTLINE, ROUND(sum(sales), 2) Revenue, count(ORDERNUMBER) Frequency
FROM sales_sample_data
WHERE YEAR_ID = 2003 and MONTH_ID = 11 -- change year to see the rest
GROUP BY  MONTH_ID, PRODUCTLINE
ORDER BY 3 DESC;

-- What city has the highest number of sales in a specific country
SELECT city, sum (sales) Revenue
FROM sales_sample_data
WHERE country = 'UK'
GROUP BY city
ORDER BY 2 DESC;

-- What is the best product in United States?
SELECT country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
FROM sales_sample_data
WHERE country = 'USA'
GROUP BY  country, YEAR_ID, PRODUCTLINE
ORDER BY 4 DESC;

