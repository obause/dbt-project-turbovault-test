{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Nation']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__nation
      bk_columns:
          - N_NATIONKEY
          - N_REGIONKEY
hashkey: HK_NATION_REGION_H
business_keys:
    - NATIONKEY
    - REGIONKEY
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
