SELECT
    trr.listing_id AS listing_id,
    trr.review_id AS review_id,
    CAST(trr.review_date AS DATE) AS review_date,
    trr.reviewer_id AS reviewer_id,
    trr.reviewer_name AS reviewer_name,
    trr.comments AS comments
FROM public.tb_reviews_raw as trr