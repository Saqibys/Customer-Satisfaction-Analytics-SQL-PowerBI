
SHOW GRANTS;


SELECT
    id,
    customer_name,
    sentiment,
    csat_score,

    STR_TO_DATE(
        REPLACE(call_timestamp, '-', '/'),
        '%m/%d/%Y'
    ) AS call_date,

    Call_Day,
    reason,
    city,
    state,
    channel,
    response_time,
    call_duration_in_minutes,
    call_center

FROM CSAT;

SELECT COUNT(*) AS total_records
FROM CSAT;