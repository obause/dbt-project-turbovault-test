{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
sat_v0: nation_s_v0
hashkey: HK_NATION_H
hashdiff: hd_nation_s
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
