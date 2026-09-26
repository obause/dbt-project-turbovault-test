{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault']
) }}

{%- set yaml_metadata -%}
ref_sat_v0: nation_2nd_rs_v0
ref_keys:
    - n_nationkey
hashdiff: hd_nation_2nd_rs
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.ref_sat_v1(yaml_metadata=yaml_metadata) }}
