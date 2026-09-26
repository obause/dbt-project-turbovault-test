{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: PartSupp
ldts: 'sysdate()'
rsrc: '!PartSupp'
hashed_columns:
    HK_PART_H:
        - PS_PARTKEY
    HK_SUPPLIER_H:
        - PS_SUPPKEY
    HK_PART_SUPPLIER_L:
        - PS_PARTKEY
        - PS_SUPPKEY
    hd_PART_SUPPLIER_N_S:
        is_hashdiff: true
        columns:
            - PS_AVAILQTY
            - PS_COMMENT
            - PS_SUPPLYCOST
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
