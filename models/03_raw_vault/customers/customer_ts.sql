{{ config(
    materialized='incremental',
    tags=['satellite', 'record_tracking', 'raw_vault', 'Customers']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__tpch__customer
      rsrc_static: "Customer"
    - name: stg__tpch__lineitem
      rsrc_static: "LineItem"
tracked_hashkey: HK_CUSTOMER_H
{%- endset -%}

{{ datavault4dbt.rec_track_sat(yaml_metadata=yaml_metadata) }}
