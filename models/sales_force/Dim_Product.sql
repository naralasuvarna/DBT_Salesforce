{{ config(materialized='incremental') }}

select distinct Id, NAME, IS_ACTIVE, PRODUCT_CODE, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','PRODUCT_2')}}
 where date(CREATED_DATE)=date(current_timestamp) or date(LAST_MODIFIED_DATE)=date(current_timestamp) 
