{{ config(
    materialized='view',
    tags=['satellite', 'v1', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
sat_v0: web_account_details_s_v0
hashkey: hk_web_account_h
hashdiff: hd_web_account_details_s
add_is_current_flag: true
{%- endset -%}

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }}
