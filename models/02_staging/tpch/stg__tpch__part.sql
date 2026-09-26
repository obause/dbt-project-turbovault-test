{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: Part
ldts: 'sysdate()'
rsrc: '!Part'
hashed_columns:
    HK_PART_H:
        - P_PARTKEY
    hd_part_n_ms:
        is_hashdiff: true
        columns:
            - discount_amount
            - discount_minimum_basket_price
            - discount_level
            - discount_country
    hd_PART_N_S:
        is_hashdiff: true
        columns:
            - P_BRAND
            - P_COMMENT
            - P_CONTAINER
            - P_MFGR
            - P_NAME
            - P_RETAILPRICE
            - P_SIZE
multi_active_config:
    multi_active_key: 'discount_level'
    main_hashkey_column: 'HK_PART_H'
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
