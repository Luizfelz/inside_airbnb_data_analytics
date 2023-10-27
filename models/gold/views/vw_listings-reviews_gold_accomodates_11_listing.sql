SELECT
    tls.listing_id AS listing_id,
    CAST(tls.accommodates AS INTEGER) AS accommodates,
    trs.review_id AS review_id,
    trs.review_date AS review_date,
    trs."comments" AS "comments"
FROM {{ ref('tb_listings_silver') }} AS tls
INNER JOIN {{ ref('tb_reviews_silver') }} AS trs
ON tls.listing_id = trs.listing_id
WHERE
    tls.listing_id = '853793'