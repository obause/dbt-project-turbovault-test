{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__webshop__web_order
      bk_columns:
          - web_order_id
hashkey: hk_web_order_h
business_keys:
    - web_order_id
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
