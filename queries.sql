-- Yearly funding

SELECT CAST(year AS INTEGER) AS year,
       COUNT(*) AS deals,
       COUNT(amount) AS disclosed,
       ROUND(SUM(amount)/1e9, 2) AS total_usd_bn
FROM funding
WHERE year < 2020
GROUP BY year
ORDER BY year;

-- Top cities

SELECT city,
       COUNT(*) AS deals,
       ROUND(SUM(amount)/1e9, 2) AS total_usd_bn
FROM funding
WHERE city IS NOT NULL
GROUP BY city
ORDER BY SUM(amount) DESC
LIMIT 10;

-- Average deal size by sector (min 20 disclosed deals)

SELECT vertical,
       COUNT(amount) AS disclosed_deals,
       ROUND(AVG(amount)/1e6, 2) AS avg_deal_usd_mn
FROM funding
WHERE amount IS NOT NULL
GROUP BY vertical
HAVING COUNT(amount) >= 20
ORDER BY avg_deal_usd_mn DESC;
