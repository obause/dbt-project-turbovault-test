{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Suppliers']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__supplier
      rsrc_static: "Supplier"
      bk_columns:
          - S_SUPPKEY
hashkey: HK_SUPPLIER_H
business_keys:
    - S_SUPPKEY
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
