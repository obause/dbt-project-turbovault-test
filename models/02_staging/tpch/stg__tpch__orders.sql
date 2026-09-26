{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: Orders
ldts: 'sysdate()'
rsrc: '!Orders'
hashed_columns:
    HK_ORDER_H:
        - O_ORDERKEY
    HK_CUSTOMER_H:
        - O_CUSTKEY
    HK_CUSTOMER_DUPLICATE_H:
        - O_ORDERKEY
    hk_customer_duplicate_customer_l:
        - O_CUSTKEY
        - O_ORDERKEY
    HK_ORDERS_CUSTOMERS_L:
        - O_ORDERKEY
        - O_CUSTKEY
        - O_COMMENT
    hd_ORDERS_N_S:
        is_hashdiff: true
        columns:
            - CLERK
            - COMMENT
            - ORDERDATE
            - ORDERPRIORITY
            - ORDERSTATUS
            - SHIPPRIORITY
            - TOTALPRICE
derived_columns:
    CLERK:
      value: 'O_CLERK'
      src_cols_required: 'O_CLERK'
    COMMENT:
      value: 'O_COMMENT'
      src_cols_required: 'O_COMMENT'
    ORDERDATE:
      value: 'O_ORDERDATE'
      src_cols_required: 'O_ORDERDATE'
    ORDERPRIORITY:
      value: 'O_ORDERPRIORITY'
      src_cols_required: 'O_ORDERPRIORITY'
    ORDERSTATUS:
      value: 'O_ORDERSTATUS'
      src_cols_required: 'O_ORDERSTATUS'
    SHIPPRIORITY:
      value: 'O_SHIPPRIORITY'
      src_cols_required: 'O_SHIPPRIORITY'
    TOTALPRICE:
      value: 'O_TOTALPRICE'
      src_cols_required: 'O_TOTALPRICE'
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
