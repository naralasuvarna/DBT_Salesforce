{{ config(materialized='table') }}

select distinct ID, LAST_NAME, FIRST_NAME, NAME, COMPANY, STREET, CITY,STATE, POSTAL_CODE, COUNTRY, STATUS, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','LEAD')}}