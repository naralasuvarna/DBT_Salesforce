{{ config(materialized='incremental') }}

select distinct ID, NAME, STAGE_NAME, TYPE, LEAD_SOURCE, FORECAST_CATEGORY, MAIN_COMPETITORS_C, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','OPPORTUNITY')}}
 where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 
