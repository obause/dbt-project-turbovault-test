{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Customers']
) }}

{%- set yaml_metadata -%}
sat_v0: CUSTOMER_P_S_v0
hashkey: HK_CUSTOMER_H
hashdiff: hd_CUSTOMER_P_S
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
