{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Nation']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__nation
      bk_columns:
          - N_NATIONKEY
hashkey: HK_NATION_H
business_keys:
    - N_NATIONKEY
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
