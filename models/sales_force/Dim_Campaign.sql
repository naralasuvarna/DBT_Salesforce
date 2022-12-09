{{ config(materialized='table') }}

select distinct ID, NAME, TYPE, STATUS, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','CAMPAIGN')}} 