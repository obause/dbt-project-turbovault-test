{{ config(
    materialized='incremental',
    tags=['satellite', 'multi_active', 'raw_vault', 'WebShop']
) }}

{%- set yaml_metadata -%}
source_model: stg__webshop__web_session
parent_hashkey: hk_web_account_h
src_hashdiff: hd_web_account_session_mas
src_ma_key:
    - session_id
src_payload:
    - user_agent
    - started_at
{%- endset -%}

{{ datavault4dbt.ma_sat_v0(yaml_metadata=yaml_metadata) }}
