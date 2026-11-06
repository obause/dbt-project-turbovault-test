{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__webshop__web_customer
      bk_columns:
          - account_id
hashkey: hk_web_account_h
business_keys:
    - account_id
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
