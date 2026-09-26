{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: Customer
ldts: 'sysdate()'
rsrc: '!Customer'
hashed_columns:
    HK_CUSTOMER_H:
        - C_CUSTKEY
    hd_customer_n_ms:
        is_hashdiff: true
        columns:
            - customer_name
            - c_nationkey
            - c_phone
            - C_MKTSEGMENT
    hd_CUSTOMER_N_S:
        is_hashdiff: true
        columns:
            - C_COMMENT
            - C_MKTSEGMENT
            - C_ACCTBAL
    hd_CUSTOMER_P_S:
        is_hashdiff: true
        columns:
            - C_NAME
            - C_ADDRESS
            - C_PHONE
derived_columns:
    customer_name:
      value: 'C_name'
      src_cols_required: 'C_name'
multi_active_config:
    multi_active_key: 'C_MKTSEGMENT'
    main_hashkey_column: 'HK_CUSTOMER_H'
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
