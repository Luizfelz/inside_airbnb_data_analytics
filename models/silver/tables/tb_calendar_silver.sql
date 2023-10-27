SELECT 
    tcr.listing_id AS listing_id,
    CAST(tcr."date" AS DATE) as "date",
    tcr.available AS available,
    tcr.price AS price,
    tcr.adjusted_price AS adjusted_price,
    tcr.minimum_nights AS minimum_nights,
    tcr.maximum_nights AS maximum_nights
FROM public.tb_calendar_raw tcr