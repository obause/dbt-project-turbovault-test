{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Parts']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__part
      bk_columns:
          - P_PARTKEY
hashkey: HK_PART_H
business_keys:
    - P_PARTKEY
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
