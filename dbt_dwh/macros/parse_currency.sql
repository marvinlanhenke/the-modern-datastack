{% macro parse_currency(column_name, currency) %}
    CAST(replace({{ column_name }}, '{{ currency }}', '') AS DECIMAL(10,2))
{% endmacro %}
