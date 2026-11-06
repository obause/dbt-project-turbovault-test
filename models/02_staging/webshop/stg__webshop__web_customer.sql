{{ config(
    materialized='view',
    tags=['staging', 'webshop']
) }}

{%- set yaml_metadata -%}
source_model:
    webshop: web_customer
ldts: "sysdate()"
rsrc: "!WEBSHOP"
hashed_columns:
    hk_web_account_h:
        - account_id
    HK_CUSTOMER_H:
        - tpch_custkey
    hk_web_account_customer_l:
        - account_id
        - tpch_custkey
    hd_web_account_details_s:
        is_hashdiff: true
        columns:
            - email
            - display_name
            - marketing_opt_in
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
