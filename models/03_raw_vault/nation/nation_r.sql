{{ config(
    materialized='view',
    tags=['reference_table', 'raw_vault']
) }}

{%- set yaml_metadata -%}
ref_hub: nation_rh
ref_satellites:
    nation_2nd_rs_v1:
      exclude:
        - n_comment
        - n_regionkey
    nation_rs_v1:
      include:
        - n_comment
        - n_regionkey
historized: 'latest'
{%- endset -%}

{{ datavault4dbt.ref_table(yaml_metadata=yaml_metadata) }}
