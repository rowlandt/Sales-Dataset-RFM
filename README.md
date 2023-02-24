# Sales
Exploring a sales dataset and generating insights from customers' past purchase behavior. 

The first part of the analysis we examine the data to extract insight from customers' past purchase behaivor. Starting with analyzing sales revenue using SQL queries such as aggregate, subqueries, CTEs, and Window functions; and generated a customer segmentation analysis using Recency-Frequency-Monetary(RFM) technique to identify groups of customers for marketing. The visualizations used were made with Tableau. 

Below are tables of some of the columns in the dataset. Examining the dataset to understand the inputted data. Using the SELECT DISTINCT statement and found that the years in the dataset range from 2003-2005. With deal sizes being with s,mall, medium or large. The Productlines that are sold are  
Motorcycles, Classic Cars, Trucks and Buses, Vintage Cars, Planes, Ships, Trains. The countries represented are USA,
France,
Norway,
Australia,
Finland,
Austria,
UK,
Spain,
Sweden,
Singapore,
Canada,
Japan,
Italy,
Denmark,
Belgium,
Philippines,
Germany,
Switzerland,
Ireland. Im the NA, EMEA, APAC, and Japan territories. 

Questions asked were for our analysis: 

1. Which products sell the most?
![image](https://user-images.githubusercontent.com/125233093/221056813-0c411bfd-d120-46d8-9980-3c55cb06f315.png)

2. Which year sold the most? Digging further to understand the dramatic dip in revenue in 2005 uncovered that there was only data for the months of January to May. From the graph we can see that revenue was increasing each year and can deduce if there was more data that 2005 would possibly be the best year. 

![image](https://user-images.githubusercontent.com/125233093/221056958-0c7bbca9-1a4c-4122-95df-f838b786f521.png)

3. Which dealsize amounted the most revevnue?

![image](https://user-images.githubusercontent.com/125233093/221057070-99b2de9e-3e82-4103-9ccf-7f1c531f47ae.png)

4. What was the best month for sales? Noted that 2005 would not give a true representation of the year.

![image](https://user-images.githubusercontent.com/125233093/221066924-1b095c2f-432a-46b6-b7bd-ecca9c18412c.png)

5. What product do they sell the most in November (the month with the most sales)?

![image](https://user-images.githubusercontent.com/125233093/221067816-643c3205-1da1-4c58-933e-9d9b5838c074.png)

6. What city has the highest amount of sales in the United States? 

![image](https://user-images.githubusercontent.com/125233093/221068741-ee3f4024-abec-4b82-bc7f-5c91d766585d.png)

7. What is the best selling product in the United States?
 
 ![image](https://user-images.githubusercontent.com/125233093/221070304-1563ceda-1fda-4cf2-ba56-713fd7de9925.png)

# RFM Segmentation
RFM stands for Recency-Frequency-Monetary and is often used by marketers to target specific groups of customers for personalized campaigns relevant to their current patterns by using these three factors:

* Recency is how much time has elapsed since a customer's last activity or transaction with the brand.
* Frequency is how often a customer has interacted or exchanged transaction with the brand.
* Monetary Value reflects how much a customer has spent with the brand during a certain time period

Conducting such analysis can lead to increased conversion, revenue, personalization, response rate, and customer retention. 

For this analysis the customer were segments into 4 segments.
|Recency|	Frequency|	Monetary|
|---|----|-----|
|R-Tier-1 (most recent)|	F-Tier-1 (most frequent)|	M-Tier-1 (highest spend)|
|R-Tier-2	|F-Tier-2	|M-Tier-2|
|R-Tier-3	|F-Tier-3	|M-Tier-3|
|R-Tier-4 (least recent)|	F-Tier-4 (low transaction)|	M-Tier-4 (lowest spend)|


Below is a graph of the count of customers in each segment in this analysis. 
![image](https://user-images.githubusercontent.com/125233093/221087358-d7a98eb0-a880-44db-83c6-942e6b1275f9.png)


This graph shows the average days between the last purchase, average frequency of purchases, and the average amount spent in purchases.
![image](https://user-images.githubusercontent.com/125233093/221086747-5cbd9d0e-ca20-4e4f-ac01-e7d60b016804.png)





