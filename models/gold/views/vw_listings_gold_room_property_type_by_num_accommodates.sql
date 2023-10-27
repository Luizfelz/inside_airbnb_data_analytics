WITH accommodates_11 AS (
    SELECT
        tls.listing_id AS listing_id,
        CAST(tls.accommodates AS INTEGER) AS accommodates,
        tls.room_type AS room_type,
        tls.property_type AS property_type,
        tls.bathrooms_text AS bathrooms_text,
        tls.bedrooms AS bedrooms,
        tls.last_review AS last_review,
        tls.review_scores_rating AS review_scores_rating,
        tls.review_scores_accuracy AS review_scores_accuracy,
        tls.review_scores_cleanliness AS review_scores_cleanliness,
        tls.review_scores_checkin AS review_scores_checkin,
        tls.review_scores_location AS review_scores_location,
        tls.review_scores_communication AS review_scores_communication,
        tls.review_scores_value AS review_scores_value
    FROM {{ ref('tb_listings_silver') }} AS tls
)

SELECT 
	  *
FROM accommodates_11
WHERE
    accommodates = 11