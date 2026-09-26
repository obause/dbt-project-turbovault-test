{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Part']
) }}

{%- set yaml_metadata -%}
sat_v0: part_n_ms_v0
hashkey: HK_PART_H
hashdiff: hd_part_n_ms
ma_attribute:
    - discount_level
    - discount_country
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.ma_sat_v1(yaml_metadata=yaml_metadata) }}
