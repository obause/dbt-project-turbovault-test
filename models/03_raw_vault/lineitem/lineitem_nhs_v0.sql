{{ config(
    materialized='incremental',
    tags=['satellite', 'non_historized', 'raw_vault', 'Lineitem']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__lineitem
parent_hashkey: HK_LINEITEM_NL
src_payload:
    - l_comment
    - l_shipisntruct
    - l_shipmode
{%- endset -%}

{{ datavault4dbt.nh_sat(yaml_metadata=yaml_metadata) }}
