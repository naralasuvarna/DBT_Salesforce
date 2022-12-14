{{ config(materialized='incremental') }}

select distinct Id, SUPPLIED_NAME, SUPPLIED_COMPANY, TYPE, STATUS, REASON, PRIORITY, POTENTIAL_LIABILITY_C, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','CASE')}}
where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 