SELECT
    tls.room_type AS room_type,
    tls.price AS price
FROM {{ ref ('tb_listings_silver') }} AS tls
WHERE
    tls.room_type = 'Hotel room'
    AND
    tls.number_of_reviews > 20
    AND
    tls.host_acceptance_rate >= 60