{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
sat_v0: web_account_session_mas_v0
hashkey: hk_web_account_h
hashdiff: hd_web_account_session_mas
ma_attribute:
    - session_id
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.ma_sat_v1(yaml_metadata=yaml_metadata) }}
