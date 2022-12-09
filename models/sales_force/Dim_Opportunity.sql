{{ config(materialized='table') }}

select distinct ID, NAME, STAGE_NAME, TYPE, LEAD_SOURCE, FORECAST_CATEGORY, MAIN_COMPETITORS_C, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','OPPORTUNITY')}}
