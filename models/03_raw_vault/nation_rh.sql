{{ config(
    materialized='incremental',
    tags=['hub', 'reference', 'raw_vault']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__nation
      ref_keys:
        - n_nationkey
ref_keys:
    - n_nationkey
{%- endset -%}

{{ datavault4dbt.ref_hub(yaml_metadata=yaml_metadata) }}
