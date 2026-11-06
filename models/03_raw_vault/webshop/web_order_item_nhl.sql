{{ config(
    materialized='incremental',
    tags=['link', 'non_historized', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__webshop__web_order_item
link_hashkey: hk_web_order_item_nhl
foreign_hashkeys:
    - hk_web_order_h
    - HK_PART_H
payload:
    - quantity
    - unit_price
{%- endset -%}

{{ datavault4dbt.nh_link(yaml_metadata=yaml_metadata) }}
