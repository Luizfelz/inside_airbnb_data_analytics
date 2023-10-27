SELECT
    DISTINCT (tappt.property_type) AS property_types
FROM {{ ref('tb_listings_gold_avg_price_by_property_type') }} AS tappt