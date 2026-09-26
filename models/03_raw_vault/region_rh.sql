{{ config(
    materialized='incremental',
    tags=['hub', 'reference', 'raw_vault']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__region
      ref_keys:
        - r_regionkey
        - r_name
ref_keys:
    - r_regionkey
    - r_name
{%- endset -%}

{{ datavault4dbt.ref_hub(yaml_metadata=yaml_metadata) }}
