{{ config(
    materialized='incremental',
    tags=['link', 'raw_vault', 'Orders']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__orders
link_hashkey: HK_ORDERS_CUSTOMERS_L
foreign_hashkeys:
    - HK_ORDER_H
    - HK_CUSTOMER_H
{%- endset -%}

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}
