{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Suppliers']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__supplier
parent_hashkey: HK_SUPPLIER_H
src_hashdiff: hd_SUPPLIER_N_S
src_payload:
    - S_ACCTBAL
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
