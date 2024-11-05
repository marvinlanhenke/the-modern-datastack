{% snapshot scd_raw_customers %}

{{
    config(
        target_schema='dwh_transformed',
        unique_key='id',
        strategy='check',
        check_cols=['name','email'],
        file_format='iceberg',
        location_root='s3a://transformed/dwh/dim_customers/',
        invalidate_hard_deletes=True
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

{% endsnapshot %}
