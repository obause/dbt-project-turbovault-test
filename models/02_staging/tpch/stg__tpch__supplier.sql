{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: Supplier
ldts: 'sysdate()'
rsrc: '!Supplier'
hashed_columns:
    HK_SUPPLIER_H:
        - S_SUPPKEY
    hd_SUPPLIER_N_S:
        is_hashdiff: true
        columns:
            - S_ACCTBAL
    hd_SUPPLIER_P_S:
        is_hashdiff: true
        columns:
            - S_ADDRESS
            - S_NAME
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
