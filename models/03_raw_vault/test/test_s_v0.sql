{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
source_model: stg__test__test_table
parent_hashkey: hk_test_h
src_hashdiff: hd_test_s
src_payload:
    - col_b
    - col_c
    - col_d
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
