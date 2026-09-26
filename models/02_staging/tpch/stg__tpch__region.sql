{{ config(
    materialized='view',
    tags=['staging', 'tpch']
) }}

{%- set yaml_metadata -%}
source_model:
    tpch: Region
ldts: 'sysdate()'
rsrc: '!Region'
hashed_columns:
    HK_NATION_REGION_H:
        - R_REGIONKEY
        - R_REGIONKEY
    HK_REGION_H:
        - R_NAME
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
