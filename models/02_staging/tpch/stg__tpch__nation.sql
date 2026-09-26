{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: Nation
ldts: 'sysdate()'
rsrc: '!Nation'
hashed_columns:
    HK_NATION_REGION_H:
        - N_NATIONKEY
        - N_REGIONKEY
    HK_NATION_REGION_H:
        - N_NATIONKEY
        - N_REGIONKEY
    HK_NATION_H:
        - N_NATIONKEY
    HK_REGION_H:
        - N_REGIONKEY
    HK_nation_test_link_l:
        - N_REGIONKEY
        - N_NATIONKEY
        - N_REGIONKEY
    HK_NATION_RENAMED_H:
        - N_NATIONKEY
    HK_nation_test_link_l:
        - N_REGIONKEY
        - N_NATIONKEY
    hd_nation_2nd_rs:
        is_hashdiff: true
        columns:
            - n_comment
            - n_name
            - n_regionkey
    hd_nation_rs:
        is_hashdiff: true
        columns:
            - n_comment
            - n_name
            - n_regionkey
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
