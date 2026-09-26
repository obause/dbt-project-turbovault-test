{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Parts']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__partsupp
parent_hashkey: HK_PART_SUPPLIER_L
src_hashdiff: hd_PART_SUPPLIER_N_S
src_payload:
    - PS_AVAILQTY
    - PS_COMMENT
    - PS_SUPPLYCOST
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
