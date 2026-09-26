{{ config(
    materialized='incremental',
    tags=['link', 'raw_vault', 'Customer']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__orders
link_hashkey: hk_customer_duplicate_customer_l
foreign_hashkeys:
    - HK_CUSTOMER_H
    - HK_CUSTOMER_DUPLICATE_H
{%- endset -%}

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}
