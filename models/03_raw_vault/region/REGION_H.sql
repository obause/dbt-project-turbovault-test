{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Region']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__region
      bk_columns:
          - R_NAME
hashkey: HK_REGION_H
business_keys:
    - REGION_NAME
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
