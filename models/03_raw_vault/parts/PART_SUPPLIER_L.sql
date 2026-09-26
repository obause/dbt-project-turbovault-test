{{ config(
    materialized='incremental',
    tags=['link', 'raw_vault', 'Parts']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__partsupp
link_hashkey: HK_PART_SUPPLIER_L
foreign_hashkeys:
    - HK_PART_H
    - HK_SUPPLIER_H
{%- endset -%}

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}
