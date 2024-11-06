{{
    config(
        materialized='incremental',
        file_format='iceberg',
        unique_key='id',
        incremental_strategy='merge',
        location_root='s3a://transformed/dwh/',
        schema='transformed'
    )
}}

WITH src_sales AS (
    SELECT * FROM parquet.`s3a://raw/dwh/sales/`
)

SELECT
    id
    , customer_id
    , product
    , {{ parse_currency('amount', '$') }} AS amount
    , sale_date
FROM src_sales
