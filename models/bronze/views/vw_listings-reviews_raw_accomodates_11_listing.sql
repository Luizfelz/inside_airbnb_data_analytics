SELECT
    tls.id AS listing_id,
    CAST(tls.accommodates AS INTEGER) AS accommodates,
    trs.review_id AS review_id,
    trs.review_date AS review_date,
    trs."comments" AS "comments"
FROM public.tb_listings_raw AS tls
INNER JOIN public.tb_reviews_raw AS trs
ON tls.id = trs.listing_id
WHERE
    tls.id = '853793'