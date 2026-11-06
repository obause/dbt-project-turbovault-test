{{ config(
    materialized='view',
    tags=['staging', 'webshop']
) }}

{%- set yaml_metadata -%}
source_model:
    webshop: web_order
ldts: "sysdate()"
rsrc: "!WEBSHOP"
hashed_columns:
    hk_web_order_h:
        - web_order_id
    hk_web_account_h:
        - account_id
    hk_web_order_account_l:
        - web_order_id
        - account_id
    HK_ORDER_H:
        - tpch_orderkey
    hk_web_order_tpch_order_l:
        - web_order_id
        - tpch_orderkey
    hd_web_order_s:
        is_hashdiff: true
        columns:
            - channel
            - status
            - total_amount
            - placed_at
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
