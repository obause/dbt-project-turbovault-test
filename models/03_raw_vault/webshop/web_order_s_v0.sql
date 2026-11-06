{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
source_model: stg__webshop__web_order
parent_hashkey: hk_web_order_h
src_hashdiff: hd_web_order_s
src_payload:
    - channel
    - status
    - total_amount
    - placed_at
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
