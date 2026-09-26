{{ config(
    materialized='incremental',
    tags=['satellite', 'multi_active', 'raw_vault', 'Part']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__part
parent_hashkey: HK_PART_H
src_hashdiff: hd_part_n_ms
src_ma_key:
    - discount_level
    - discount_country
src_payload:
    - discount_amount
    - discount_minimum_basket_price
{%- endset -%}

{{ datavault4dbt.ma_sat_v0(yaml_metadata=yaml_metadata) }}
