{{ config(
    tags=['satellite', 'effectivity', 'raw_vault', 'Test']
) }}

{%- set yaml_metadata -%}
source_model: stg__test__test_table
tracked_hashkey: hk_test_h
source_is_single_batch: false
{%- endset -%}

{{ datavault4dbt.eff_sat_v0(yaml_metadata=yaml_metadata) }}
