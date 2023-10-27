WITH total_amenities AS (
SELECT
    listing_id,
    unnest(string_to_array(amenities, ',')) AS words,
    AVG(review_scores_rating) AS avg_review_scores_rating,
    AVG(review_scores_accuracy) AS avg_review_scores_accuracy,
    AVG(review_scores_checkin) AS avg_review_scores_checkin,
    AVG(review_scores_cleanliness) AS avg_review_scores_cleanliness,
    AVG(review_scores_communication) AS avg_review_scores_communication,
    AVG(review_scores_location) AS avg_review_scores_location,
    AVG(review_scores_value) AS avg_review_scores_value
FROM {{ ref('tb_listings_silver') }}
GROUP BY 1, 2
)

SELECT 
    listing_id,
    COUNT(words) as amount_amenities,
    avg_review_scores_rating,
    avg_review_scores_accuracy,
    avg_review_scores_checkin,
    avg_review_scores_cleanliness,
    avg_review_scores_communication,
    avg_review_scores_location,
    avg_review_scores_value
FROM total_amenities
GROUP BY 1, 3, 4, 5, 6, 7, 8, 9
ORDER BY 2 ASC