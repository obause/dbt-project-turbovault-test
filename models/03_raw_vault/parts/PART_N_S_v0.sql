{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Parts']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__part
parent_hashkey: HK_PART_H
src_hashdiff: hd_PART_N_S
src_payload:
    - P_BRAND
    - P_COMMENT
    - P_CONTAINER
    - P_MFGR
    - P_NAME
    - P_RETAILPRICE
    - P_SIZE
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
