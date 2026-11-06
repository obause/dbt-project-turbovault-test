{{ config(
    materialized='incremental',
    tags=['satellite', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
source_model: stg__webshop__web_customer
parent_hashkey: hk_web_account_h
src_hashdiff: hd_web_account_details_s
src_payload:
    - email
    - display_name
    - marketing_opt_in
    - updated_at
{%- endset -%}

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}
