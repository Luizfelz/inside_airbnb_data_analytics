WITH avg_price_by_period AS (
    SELECT
        extract(month from tcs."date") AS "month",
        AVG(tcs.price) AS price,
        AVG(tcs.adjusted_price) AS adjusted_price
    FROM {{ ref('tb_calendar_silver') }} AS tcs
    GROUP BY "month"
)

SELECT
    CASE 
        WHEN "month" = 1 THEN 'Jan'
        WHEN "month" = 2 THEN 'Feb'
        WHEN "month" = 3 THEN 'Mar'
        WHEN "month" = 4 THEN 'Apr'
        WHEN "month" = 5 THEN 'May'
        WHEN "month" = 6 THEN 'Jun'
        WHEN "month" = 7 THEN 'Jul'
        WHEN "month" = 8 THEN 'Aug'
        WHEN "month" = 9 THEN 'Sep'
        WHEN "month" = 10 THEN 'Oct'
        WHEN "month" = 11 THEN 'Nov'
        WHEN "month" = 12 THEN 'Dec'
    END AS "month",
    ROUND((price::NUMERIC), 2) AS average_price_in_Reais,
    ROUND((adjusted_price::NUMERIC), 2) AS average_adjusted_price_in_Reais
FROM avg_price_by_period
ORDER BY average_price_in_Reais, average_adjusted_price_in_Reais ASC