{{
    config(
        materialized='incremental',
        file_format='iceberg',
        unique_key='id',
        incremental_strategy='merge',
        location_root='s3a://curated/dwh/',
        schema='curated'
    )
}}

SELECT
    fct.id
    , fct.product
    , fct.amount
    , fct.currency
    , dim.name AS buyer
    , dim.email AS buyer_email
    , fct.sale_date
FROM {{ ref('fact_sales') }} AS fct
LEFT JOIN {{ ref('dim_customers') }} AS dim
    ON dim.id == fct.customer_id
