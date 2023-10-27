WITH avg_price_by_room AS (
    SELECT
        tls.room_type AS room_type,
        AVG(tls.price) AS average_price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tls.price) AS median
    FROM {{ ref ('tb_listings_silver') }} AS tls
    WHERE
        tls.number_of_reviews > 20
        AND
        tls.host_acceptance_rate >= 60
    GROUP BY room_type
)

SELECT
    room_type AS room_type,
    ROUND((average_price::NUMERIC), 2) AS average_price_in_Reais,
    median AS median
FROM avg_price_by_room
ORDER BY average_price_in_Reais ASC