SELECT
    DISTINCT(number_of_reviews) AS number_of_reviews,
    COUNT(listing_id) AS number_of_listings_id
FROM public.tb_listings_silver
GROUP BY 1