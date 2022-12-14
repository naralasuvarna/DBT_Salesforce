{{ config(materialized='incremental') }}

select distinct ID, BILLING_STREET, BILLING_CITY, BILLING_STATE, BILLING_POSTAL_CODE, BILLING_COUNTRY, STATUS, COMPANY_SIGNED_ID, CUSTOMER_SIGNED_ID, 
CUSTOMER_SIGNED_TITLE, CUSTOMER_SIGNED_DATE, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','CONTRACT')}}
 where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 