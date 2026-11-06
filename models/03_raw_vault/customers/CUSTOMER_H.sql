{{ config(
    materialized='incremental',
    tags=['hub', 'raw_vault', 'Customers']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__customer
      rsrc_static: "Customer"
      bk_columns:
          - C_CUSTKEY
    - name: stg__tpch__lineitem
      rsrc_static: "LineItem"
      bk_columns:
          - L_SUPPKEY
hashkey: HK_CUSTOMER_H
business_keys:
    - C_CUSTKEY
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
