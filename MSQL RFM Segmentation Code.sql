-- RFM ANALYSIS

/* Who is our best customer (this could be best answered with RFM Recency-Frequency-Montetary Value)
-- Is an indexing technique that uses past purchase behaivor to segment customers, using three key metrics
	-- recency(how long ago their last purchase), frequency(how often they purchase), montetary(how much they spent) */

DROP TABLE IF EXISTS rfms;
-- CREATE TEMPORARY TABLE rfms -- created so that we will not have to call the entire function below to obtain rfms
WITH rfm_segmentation AS
(
	SELECT 
		CUSTOMERNAME, 
		ROUND(sum(sales),2) MonetaryValue,
		ROUND(avg(sales),2) AvgMonetaryValue,
		count(ORDERNUMBER) Frequency,
		max(ORDERDATE) last_order_date,
		(SELECT max(ORDERDATE) FROM sales_sample_data) max_order_date, -- shows the max date in the entire dataset so we can compare how recent the customer order was to the lastest order. 
		DATEDIFF((SELECT max(ORDERDATE) FROM sales_sample_data), max(ORDERDATE)) Recency -- to capture recency
	FROM sales_sample_data
	GROUP BY CUSTOMERNAME
 ),
-- SELECT r.* --  make sure CTE works
 -- FROM rfm r;

rfm_calc as
 (
	SELECT r.*,
		NTILE(4) OVER (ORDER BY Recency) rfm_recency,
		NTILE(4) OVER (ORDER BY Frequency DESC) rfm_frequency,
		NTILE(4) OVER (ORDER BY MonetaryValue DESC) rfm_monetary
	FROM rfm_segmentation r
 )
-- SELECT c.* -- make sure CTE works
-- FROM rfm_calc c; 

SELECT 
	c.*, rfm_recency+ rfm_frequency+ rfm_monetary AS rfm_cell,
	CONCAT(cast(rfm_recency AS CHAR(1)), cast(rfm_frequency AS CHAR(1)),cast(rfm_monetary AS CHAR(1))) rfm_cell_string
FROM rfm_calc c; 

SELECT * 
FROM rfms
ORDER BY MonetaryValue DESC;

-- Segmenting the customer
SELECT CUSTOMERNAME , rfm_recency, rfm_frequency, rfm_monetary,
	CASE 
		WHEN rfm_cell_string IN (111) THEN 'Best Customers' 
		WHEN rfm_cell_string LIKE ('12%') THEN 'Potential' 
		WHEN rfm_cell_string LIKE ('_1_') THEN 'Loyal'
		WHEN rfm_cell_string LIKE ('%1') THEN 'Big Spenders'
		WHEN rfm_cell_string IN (311) THEN 'Almost Lost' 
		WHEN rfm_cell_string LIKE ('4%') THEN 'Lost Customers'
        WHEN rfm_cell_string LIKE ('2%') THEN 'Look Out Buyers' 
        WHEN rfm_recency >= (2) AND rfm_frequency >= 2  THEN 'Occasional Buyers' 
        WHEN rfm_recency = (1) and rfm_frequency >=3 THEN 'Recent Users'
	END rfm_segment

FROM rfms;
