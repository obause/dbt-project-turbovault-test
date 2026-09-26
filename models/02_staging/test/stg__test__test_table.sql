{{ config(
    materialized='view',
    tags=['staging', 'test']
) }}

{%- set yaml_metadata -%}
source_model:
    test: TEST_TABLE
ldts: 'ldts'
rsrc: 'rsrc'
hashed_columns:
    hk_test_h:
        - col_a
    hd_test_s:
        is_hashdiff: true
        columns:
            - col_b
            - col_c
            - col_d
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
