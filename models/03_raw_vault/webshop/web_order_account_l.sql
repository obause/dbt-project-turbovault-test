{{ config(
    materialized='incremental',
    tags=['link', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__webshop__web_order
link_hashkey: hk_web_order_account_l
foreign_hashkeys:
    - hk_web_order_h
    - hk_web_account_h
{%- endset -%}

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}
