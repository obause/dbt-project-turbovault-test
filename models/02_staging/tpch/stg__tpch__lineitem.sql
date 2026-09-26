{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: LineItem
ldts: 'sysdate()'
rsrc: '!LineItem'
hashed_columns:
    HK_CUSTOMER_H:
        - L_SUPPKEY
    HK_PART_H:
        - L_PARTKEY
    HK_ORDER_H:
        - L_ORDERKEY
    HK_SUPPLIER_H:
        - L_SUPPKEY
    HK_LINEITEM_NL:
        - L_PARTKEY
        - L_ORDERKEY
        - L_SUPPKEY
        - L_LINENUMBER
derived_columns:
    l_shipisntruct:
      value: 'l_shipinstruct'
      src_cols_required: 'l_shipinstruct'
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
