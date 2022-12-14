{{ config(materialized='incremental') }}

select distinct ID, NAME, TYPE, STATUS, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','CAMPAIGN')}} 
where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 