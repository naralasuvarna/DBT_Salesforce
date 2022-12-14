{{ config(materialized='incremental') }}

select distinct ID, LAST_NAME, FIRST_NAME, NAME, COMPANY, STREET, CITY,STATE, POSTAL_CODE, COUNTRY, STATUS, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','LEAD')}}
 where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 