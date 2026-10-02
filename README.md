# Where Does the Money Go? Indian Startup Funding Analysis (2015-2019)

## Problem
Which sectors, cities and investors get the most startup funding in India, and how has the typical deal size changed over time?

## Dataset
Indian Startup Funding dataset from Kaggle: https://www.kaggle.com/datasets/sudalairajkumar/indian-startup-funding
3,044 funding records. The file is not included in this repo, so please download it from the link above.

## Tools
Python (pandas, matplotlib), SQL (SQLite), Google Colab

## Data Cleaning
- Converted `amount` from text (e.g. "20,00,00,000") to numbers, and `date` from text to real dates
- Removed hidden junk characters from the city and sector columns
- Merged duplicate city names (Bangalore/Bengaluru, Gurgaon/Gurugram, Delhi/New Delhi)
- Merged duplicate sector names (eCommerce, E-Commerce, ECommerce, etc.)
- Split rows with multiple investors, removed "Undisclosed" placeholders, and merged spelling variants of the top firms (e.g. Sequoia Capital / Sequoia India)
- Checked for duplicate rows (none found)
- Excluded 2020 from year trends because it has only 7 rows
- Rapido's 2019 round was recorded as $3.9B, a likely entry error, so I excluded it from amount calculations

## Key Findings
1. **Funding is concentrated in a few cities.** Bangalore received 44.4% of all funding, and the top 3 cities (Bangalore, Mumbai, Gurgaon) received 71.2%. Pune received 2.2%.
2. **The typical deal got bigger.** The median disclosed deal grew from $1.0M in 2016 to $12.0M in 2019. I used the median because a few mega-deals skew the average.
3. **E-Commerce raised the most money, Consumer Internet had the most deals.** E-Commerce raised $8.25B across 299 deals (average $40.4M). Consumer Internet raised $6.25B across 941 deals (average $10.6M).
4. **A small group of investors dominates.** Sequoia Capital (121 deals) and Accel Partners (78 deals) lead. Three of the top 10 are individual angels or angel networks.

## Charts
[Cities](chart_cities.png)
[Sectors](chart_sectors.png)
[Median deal size](chart_median.png)
[Investors](chart_investors.png)

## SQL
Queries for yearly funding, top cities and average deal size by sector are in `queries.sql`. Results matched my pandas results.

## Limitations
- About 32% of deals have no disclosed amount, so funding totals are understated
- Data coverage drops sharply after 2017, so year-to-year totals should not be read as real growth or decline
- Investor names were only partly standardized, and counts reflect investor mentions, not unique deals
- Delhi and Gurgaon are kept as separate cities
- A few non-city entries (e.g. "India") remain in the city column

## Files
- `startup_funding_analysis.ipynb`: full analysis notebook
- `queries.sql`: SQL queries
- `chart_*.png`: charts used above