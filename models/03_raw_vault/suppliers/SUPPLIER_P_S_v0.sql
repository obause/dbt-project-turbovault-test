{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Suppliers']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__supplier
parent_hashkey: HK_SUPPLIER_H
src_hashdiff: hd_SUPPLIER_P_S
src_payload:
    - S_ADDRESS
    - S_NAME
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
