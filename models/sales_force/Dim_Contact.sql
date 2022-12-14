{{ config(materialized='incremental') }}

select distinct ID, NAME, MAILING_STREET, MAILING_CITY, MAILING_STATE, MAILING_POSTAL_CODE, MAILING_COUNTRY,PHONE, MOBILE_PHONE, EMAIL, _FIVETRAN_SYNCED as Load_Time
from {{source('DEVELOPER_DB','CONTACT')}}
where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 
