{{ config(materialized='table') }}

select distinct Id, SUPPLIED_NAME, SUPPLIED_COMPANY, TYPE, STATUS, REASON, PRIORITY, POTENTIAL_LIABILITY_C, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','CASE')}}