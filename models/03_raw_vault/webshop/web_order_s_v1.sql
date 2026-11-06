{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
sat_v0: web_order_s_v0
hashkey: hk_web_order_h
hashdiff: hd_web_order_s
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
