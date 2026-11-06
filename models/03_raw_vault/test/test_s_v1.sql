{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
sat_v0: test_s_v0
hashkey: hk_test_h
hashdiff: hd_test_s
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
