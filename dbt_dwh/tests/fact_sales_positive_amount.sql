SELECT
    amount
FROM
    {{ ref('fact_sales') }}
WHERE amount < 0
LIMIT 10
