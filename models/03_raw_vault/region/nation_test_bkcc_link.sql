{{ config(
    materialized='incremental',
    tags=['link', 'raw_vault', 'Region']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__nation
link_hashkey: HK_nation_test_link_l
foreign_hashkeys:
    - HK_REGION_H
    - HK_NATION_REGION_H
{%- endset -%}

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}
