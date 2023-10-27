{% test higher_or_equal_to_one(model, column_name) %}

WITH validation AS (
    SELECT
        {{ column_name }} AS test_field
    FROM {{ model }}
),

validation_errors AS (
    SELECT
        test_field
    FROM validation
    WHERE test_field < 1
)

SELECT 
    *
FROM validation_errors

{% endtest %}