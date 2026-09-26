{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Customer']
) }}

{%- set yaml_metadata -%}
sat_v0: customer_n_ms_v0
hashkey: HK_CUSTOMER_H
hashdiff: hd_customer_n_ms
ma_attribute:
    - C_MKTSEGMENT
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.ma_sat_v1(yaml_metadata=yaml_metadata) }}
