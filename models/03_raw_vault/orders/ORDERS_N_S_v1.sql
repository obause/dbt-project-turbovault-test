{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Orders']
) }}

{%- set yaml_metadata -%}
sat_v0: ORDERS_N_S_v0
hashkey: HK_ORDER_H
hashdiff: hd_ORDERS_N_S
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
