{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Orders']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__orders
      bk_columns:
          - O_ORDERKEY
hashkey: HK_ORDER_H
business_keys:
    - O_ORDERKEY
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
