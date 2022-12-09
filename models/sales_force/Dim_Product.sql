{{ config(materialized='table') }}

select distinct Id, NAME, IS_ACTIVE, PRODUCT_CODE, _FIVETRAN_SYNCED as Load_Time from {{source('DEVELOPER_DB','PRODUCT_2')}}
