{{ config(
    materialized='incremental',
    tags=['link', 'non_historized', 'raw_vault', 'LineItem']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__lineitem
link_hashkey: HK_LINEITEM_NL
foreign_hashkeys:
    - HK_PART_H
    - HK_ORDER_H
    - HK_SUPPLIER_H
payload:
    - L_QUANTITY
    - L_EXTENDEDPRICE
    - L_DISCOUNT
    - L_TAX
    - L_RETURNFLAG
    - L_LINESTATUS
    - L_SHIPDATE
    - L_COMMITDATE
    - L_RECEIPTDATE
    - L_SHIPINSTRUCT
    - L_SHIPMODE
    - L_COMMENT
{%- endset -%}

{{ datavault4dbt.nh_link(yaml_metadata=yaml_metadata) }}
