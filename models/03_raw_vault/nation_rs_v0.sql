{{ config(
    materialized='incremental',
    tags=['satellite', 'reference', 'raw_vault']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__nation
parent_ref_keys:
    - n_nationkey
src_hashdiff: hd_nation_rs
src_payload:
    - n_comment
    - n_name
    - n_regionkey
{%- endset -%}

{{ datavault4dbt.ref_sat_v0(yaml_metadata=yaml_metadata) }}
