# Supply Chain Analytics Dashboard (2015–2018)

## About This Project
I built this project to track how a global supply chain performs across sales, profit, and shipping speed. Using **Python**, **MySQL**, and **Power BI**, I cleaned the raw order data, structured it into a database, and created an interactive dashboard to see which product categories bring in the most revenue and where delivery delays are happening.

## Dashboard Preview
![Supply Chain Analytics Dashboard](DASHBOARD%20(2).png)

## What the Data Shows
* **Sales & Volume:** The business generated **$36.78M** in total sales across more than **180.5K** order items between 2015 and 2018.
* **Profitability:** Total net profit came out to **$3.97M**.
* **Shipping Efficiency:** Only **42.72%** of orders arrived on time, with an average shipping delay of **0.57 days**—a clear area where logistics could be tightened up.
* **Top Performers:** **Fishing** ($6.9M), **Cleats** ($4.4M), and **Camping & Hiking** ($4.1M) brought in the highest sales.
* **Custom Views:** The dashboard includes filters so anyone can break down these numbers by **Customer Segment** (Consumer, Corporate, Home Office) or **Market** (Africa, Europe, LATAM, Pacific Asia, USCA).

## Tools Used
* **Python (Pandas, SQLAlchemy):** Used to clean missing values, reshape the data, and push the tables straight into MySQL.
* **MySQL:** Used to store the structured tables and run SQL queries to verify the numbers.
* **Power BI Desktop:** Used to build the star-schema relationships, write DAX measures, and design the final report.

## How I Built It
1. **Cleaning & Loading (`supply chain.py`):** Took the raw dataset, handled missing values, split it into a clean Star Schema (`dim_customers`, `dim_products`, `fact_orders`), and loaded those tables into MySQL.
2. **SQL Analysis (`supply chain queries.sql`):** Wrote queries to double-check order counts, delivery statuses, regional sales, and category profits before building visuals.
3. **Dashboarding (`supply chain.pbix`):** Connected Power BI directly to the MySQL database, created DAX measures for Total Sales, Total Profit, Avg Delay Days, and On-Time Delivery %, and laid out the final view.

## Files in This Repo
* `supply chain.py` – Python script for data cleaning and loading tables into MySQL.
* `supply chain queries.sql` – SQL queries used to explore the data and check KPIs.
* `supply chain.pbix` – The interactive Power BI dashboard file.
* `DASHBOARD (2).png` – Screenshot of the finished dashboard.
*
