{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Suppliers']
) }}

{%- set yaml_metadata -%}
sat_v0: SUPPLIER_P_S_v0
hashkey: HK_SUPPLIER_H
hashdiff: hd_SUPPLIER_P_S
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
