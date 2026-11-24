use project_csat_analytics;
SELECT *
from CSAT;

SELECT COUNT(*) AS total_records
FROM CSAT;

DESCRIBE CSAT;

SELECT *
FROM CSAT
LIMIT 10;

-- DATA QUALITY CHECK -- 
-- Q  - for checking whether id is unique.
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT id) AS unique_ids
FROM CSAT;
 
 -- Q -  to find duplicate ID
SELECT
    id,
    COUNT(*) AS occurrence_count
FROM CSAT
GROUP BY id
HAVING COUNT(*) > 1;

-- Q - for Checking missing values
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS missing_id,
    SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS missing_customer_name,
    SUM(CASE WHEN sentiment IS NULL THEN 1 ELSE 0 END) AS missing_sentiment,
    SUM(CASE WHEN csat_score IS NULL THEN 1 ELSE 0 END) AS missing_csat,
    SUM(CASE WHEN call_timestamp IS NULL THEN 1 ELSE 0 END) AS missing_timestamp,
    SUM(CASE WHEN Call_Day IS NULL THEN 1 ELSE 0 END) AS missing_call_day,
    SUM(CASE WHEN reason IS NULL THEN 1 ELSE 0 END) AS missing_reason,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS missing_state,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS missing_channel,
    SUM(CASE WHEN response_time IS NULL THEN 1 ELSE 0 END) AS missing_response_time,
    SUM(CASE WHEN call_duration_in_minutes IS NULL THEN 1 ELSE 0 END) AS missing_duration,
    SUM(CASE WHEN call_center IS NULL THEN 1 ELSE 0 END) AS missing_call_center
FROM CSAT;

-- Q - What types of customer sentiment exist, and how common is each?
SELECT
    sentiment,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY sentiment
ORDER BY total_calls DESC;

-- Q - Which customer-service channel is used most frequently?
SELECT
    channel,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY channel
ORDER BY total_calls DESC;

-- Q - Why are customers contacting customer service?
SELECT
    reason,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY reason
ORDER BY total_calls DESC;

-- Q - Where are customer-service calls coming from?
SELECT
    state,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY state
ORDER BY total_calls DESC;

-- Q - How are calls distributed among call centers?
SELECT
    call_center,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_center
ORDER BY total_calls DESC;

-- Q - Which days receive more customer-service calls?
SELECT
    call_timestamp, Call_Day,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY Call_Day, call_timestamp
ORDER BY total_calls DESC;

-- Q - What is the overall customer satisfaction level and how are the scores distributed?
SELECT
    MIN(csat_score) AS minimum_csat,
    MAX(csat_score) AS maximum_csat,
    AVG(csat_score) AS average_csat
FROM CSAT;

SELECT
    csat_score,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY csat_score
ORDER BY csat_score, total_calls desc;

-- Q -- time taken by the representative to respond to the customer's initial inquiry.
SELECT
    response_time,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY response_time
ORDER BY response_time;

SELECT
    MIN(response_time) AS minimum_response_time,
    MAX(response_time) AS maximum_response_time,
    AVG(response_time) AS average_response_time
FROM CSAT;

-- Q - length of the call in minutes.
SELECT
    MIN(call_duration_in_minutes) AS minimum_duration,
    MAX(call_duration_in_minutes) AS maximum_duration,
    AVG(call_duration_in_minutes) AS average_duration
FROM CSAT;

SELECT
    call_duration_in_minutes,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_duration_in_minutes
ORDER BY call_duration_in_minutes;

-- Q - What period does this dataset actually cover?
SELECT
    MIN(call_timestamp) AS first_call,
    MAX(call_timestamp) AS last_call
FROM CSAT;

 -- Q - top 20 cities by call volume.
 SELECT
    COUNT(DISTINCT city) AS unique_cities,
    COUNT(DISTINCT state) AS unique_states
FROM CSAT;

SELECT
    city,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY city
ORDER BY total_calls DESC
LIMIT 20;

-- 1. CSAT and sentiment
SELECT
    csat_score,
    sentiment,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY csat_score, sentiment
ORDER BY csat_score, total_calls DESC;

-- 2. CSAT = 0 by SLA
SELECT
    response_time,
    COUNT(*) AS total_calls
FROM CSAT
WHERE csat_score = 0
GROUP BY response_time
ORDER BY total_calls DESC;

-- 3. CSAT > 0 by SLA
SELECT
    response_time,
    COUNT(*) AS total_calls
FROM CSAT
WHERE csat_score > 0
GROUP BY response_time
ORDER BY total_calls DESC;

-- 4. CSAT by sentiment
SELECT
    sentiment,
    COUNT(*) AS total_calls,
    AVG(csat_score) AS average_csat
FROM CSAT
GROUP BY sentiment
ORDER BY average_csat;

-- 5. CSAT by channel
SELECT
    channel,
    COUNT(*) AS total_calls,
    AVG(csat_score) AS average_csat
FROM CSAT
GROUP BY channel
ORDER BY average_csat DESC;

-- 6. CSAT by reason
SELECT
    reason,
    COUNT(*) AS total_calls,
    AVG(csat_score) AS average_csat
FROM CSAT
GROUP BY reason
ORDER BY average_csat DESC;

-- 7. CSAT by SLA
SELECT
    response_time,
    COUNT(*) AS total_calls,
    AVG(csat_score) AS average_csat
FROM CSAT
GROUP BY response_time
ORDER BY average_csat DESC;

-- Check the call date format
SELECT
    CASE
        WHEN call_timestamp LIKE '%/%' THEN 'Slash Format'
        WHEN call_timestamp LIKE '%-%' THEN 'Hyphen Format'
        ELSE 'Other Format'
    END AS date_format,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY date_format;

SELECT
    call_timestamp,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_timestamp
ORDER BY call_timestamp
LIMIT 20;

SELECT
    call_timestamp,
    STR_TO_DATE(REPLACE(call_timestamp, '-', '/'), '%m/%d/%Y') AS cleaned_date
FROM CSAT
LIMIT 20;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        STR_TO_DATE(REPLACE(call_timestamp, '-', '/'), '%m/%d/%Y') IS NULL
    ) AS invalid_dates
FROM CSAT;

SELECT
    MIN(STR_TO_DATE(REPLACE(call_timestamp, '-', '/'), '%m/%d/%Y')) AS start_date,
    MAX(STR_TO_DATE(REPLACE(call_timestamp, '-', '/'), '%m/%d/%Y')) AS end_date
FROM CSAT;

SELECT COUNT(*) AS total_records
FROM CSAT;