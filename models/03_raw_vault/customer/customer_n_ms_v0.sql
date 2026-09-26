{{ config(
    materialized='incremental',
    tags=['satellite', 'multi_active', 'raw_vault', 'Customer']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__customer
parent_hashkey: HK_CUSTOMER_H
src_hashdiff: hd_customer_n_ms
src_ma_key:
    - C_MKTSEGMENT
src_payload:
    - customer_name
    - c_nationkey
    - c_phone
{%- endset -%}

{{ datavault4dbt.ma_sat_v0(yaml_metadata=yaml_metadata) }}
