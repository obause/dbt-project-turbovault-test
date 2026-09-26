{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Orders']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__orders
parent_hashkey: HK_ORDER_H
src_hashdiff: hd_ORDERS_N_S
src_payload:
    - CLERK
    - COMMENT
    - ORDERDATE
    - ORDERPRIORITY
    - ORDERSTATUS
    - SHIPPRIORITY
    - TOTALPRICE
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
