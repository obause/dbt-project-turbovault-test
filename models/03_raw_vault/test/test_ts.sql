{{ config(
    materialized='incremental',
    tags=['satellite', 'record_tracking', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
source_models:
    - name: stg__test__test_table
tracked_hashkey: hk_test_h
{%- endset -%}

{{ datavault4dbt.rec_track_sat(yaml_metadata=yaml_metadata) }}
