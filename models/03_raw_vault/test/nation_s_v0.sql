{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__nation
parent_hashkey: HK_NATION_H
src_hashdiff: hd_nation_s
src_payload:
    - n_name
    - n_comment
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
