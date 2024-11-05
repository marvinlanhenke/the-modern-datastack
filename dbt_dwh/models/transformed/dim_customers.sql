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

WITH src_customers AS (
    SELECT * FROM parquet.`s3a://raw/dwh/customers/`
)

SELECT
    id
    , name
    , email
    , created_at
FROM src_customers
