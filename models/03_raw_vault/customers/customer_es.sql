{{ config(
    materialized='incremental',
    tags=['satellite', 'effectivity', 'raw_vault', 'Customers']
) }}

{%- set yaml_metadata -%}
source_model: stg__tpch__customer
tracked_hashkey: HK_CUSTOMER_H
{%- endset -%}

{{ datavault4dbt.eff_sat_v0(yaml_metadata=yaml_metadata) }}
