WITH total AS (
    SELECT 
      tcs.listing_id AS listing_id,
      extract(YEAR FROM tcs."date") AS "year",
      sum(tcs.adjusted_price) AS total_acquired_in_Reais
    FROM {{ ref('tb_calendar_silver') }} AS tcs
    GROUP BY 1, 2
    ORDER BY 1, 2
)

SELECT 
	*
FROM total