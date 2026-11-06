{{ config(
    materialized='view',
    tags=['staging', 'webshop']
) }}

{%- set yaml_metadata -%}
source_model:
    webshop: web_session
ldts: "sysdate()"
rsrc: "!WEBSHOP"
hashed_columns:
    hd_web_account_session_mas:
        is_hashdiff: true
        columns:
            - session_id
            - user_agent
            - started_at
multi_active_config:
    multi_active_key: 'session_id'
    main_hashkey_column: 'hk_web_account_h'
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
