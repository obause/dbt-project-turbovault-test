{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__test__test_table
      bk_columns:
          - col_a
hashkey: hk_test_h
business_keys:
    - col_a
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
