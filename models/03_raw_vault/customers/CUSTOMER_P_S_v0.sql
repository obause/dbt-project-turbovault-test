{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Customers']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__customer
parent_hashkey: HK_CUSTOMER_H
src_hashdiff: hd_CUSTOMER_P_S
src_payload:
    - C_NAME
    - C_ADDRESS
    - C_PHONE
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
