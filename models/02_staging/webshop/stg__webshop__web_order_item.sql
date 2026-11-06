{{ config(
    materialized='view',
    tags=['staging', 'webshop']
) }}

{%- set yaml_metadata -%}
source_model:
    webshop: web_order_item
ldts: "sysdate()"
rsrc: "!WEBSHOP"
hashed_columns:
    hk_web_order_h:
        - web_order_id
    HK_PART_H:
        - tpch_partkey
    hk_web_order_item_nhl:
        - web_order_id
        - tpch_partkey
        - line_no
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
