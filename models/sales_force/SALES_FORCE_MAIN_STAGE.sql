{{ config(materialized='table') }}

select A.ID,A.NAME,A.TYPE,A.BILLING_STREET,A.BILLING_CITY,A.BILLING_STATE,A.BILLING_POSTAL_CODE,
A.BILLING_COUNTRY,A.SHIPPING_STREET,A.SHIPPING_CITY,A.SHIPPING_STATE,A.SHIPPING_POSTAL_CODE,A.SHIPPING_COUNTRY,
A.INDUSTRY,A.OWNERSHIP,A.RATING,A.UPSELL_OPPORTUNITY_C,A.CUSTOMER_PRIORITY_C,A.ACTIVE_C,

opp.ID as opp_id,opp.NAME AS opp_name,opp.STAGE_NAME,opp.type as opp_type,opp.LEAD_SOURCE,opp.FORECAST_CATEGORY,opp.MAIN_COMPETITORS_C,opp.AMOUNT as opp_amount,

C.ID AS CAMP_ID,C.NAME AS CAMP_NAME,C.TYPE AS CAMP_TYPE,C.STATUS AS C_STATUS,C.EXPECTED_REVENUE,C.BUDGETED_COST,C.ACTUAL_COST,

CS.ID AS CS_ID,CS.SUPPLIED_NAME,CS.SUPPLIED_COMPANY,CS.TYPE AS CS_TYPE,CS.STATUS AS CS_STATUS,CS.REASON,CS.PRIORITY,CS.POTENTIAL_LIABILITY_C,

CT.ID AS CT_ID,CT.NAME AS CT_NAME,CT.MAILING_STREET,CT.MAILING_CITY,CT.MAILING_STATE,CT.MAILING_POSTAL_CODE,CT.MAILING_COUNTRY,
CT.PHONE,CT.MOBILE_PHONE,CT.EMAIL,

CR.ID AS CR_ID,CR.BILLING_STREET AS CR_BILLING_STREET,CR.BILLING_CITY AS CR_BILLING_CITY,CR.BILLING_STATE AS CR_BILLING_STATE,
CR.BILLING_POSTAL_CODE AS CR_BILLING_POSTAL_CODE,CR.BILLING_COUNTRY AS CR_BILLING_COUNTRY,CR.STATUS AS CR_STATUS,
CR.COMPANY_SIGNED_ID,CR.CUSTOMER_SIGNED_ID,CR.CUSTOMER_SIGNED_TITLE,CR.CUSTOMER_SIGNED_DATE,

L.ID AS L_ID,L.LAST_NAME,L.FIRST_NAME,L.NAME AS L_NAME,L.COMPANY,L.STREET,L.CITY,L.STATE,L.POSTAL_CODE,L.COUNTRY,L.STATUS AS L_STATUS,

O.ID AS O_ID,O.STATUS AS O_STATUS,O.BILLING_STREET AS O_BILLING_STREET,O.BILLING_CITY AS O_BILLING_CITY,O.BILLING_STATE AS O_BILLING_STATE,
O.BILLING_POSTAL_CODE AS O_BILLING_POSTAL_CODE,O.BILLING_COUNTRY AS O_BILLING_COUNTRY,O.SHIPPING_STREET AS O_SHIPPING_STREET,
O.SHIPPING_CITY AS O_SHIPPING_CITY,O.SHIPPING_STATE AS O_SHIPPING_STATE,O.SHIPPING_POSTAL_CODE AS O_SHIPPING_POSTAL_CODE,O.SHIPPING_COUNTRY AS O_SHIPPING_COUNTRY,

P.ID AS P_ID,P.NAME AS P_NAME,P.IS_ACTIVE,P.PRODUCT_CODE

from "DEVELOPER_DB"."ANJALI_SCHEMA"."ACCOUNT" as A
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."OPPORTUNITY" as opp on A.ID=opp.ACCOUNT_ID   
left join  "DEVELOPER_DB"."ANJALI_SCHEMA"."CAMPAIGN" as C on C.ID=opp.CAMPAIGN_ID and A.ID=opp.ACCOUNT_ID
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."CASE" as CS on A.ID=CS.ACCOUNT_ID
left join  "DEVELOPER_DB"."ANJALI_SCHEMA"."CONTACT" as CT on A.ID=CT.ACCOUNT_ID
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."CONTRACT" as CR on A.ID=CR.ACCOUNT_ID
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."LEAD" as L on A.ID=L.CONVERTED_ACCOUNT_ID   
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."ORDER" as O on A.ID=O.ACCOUNT_ID
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."ORDER_ITEM" as o_i on o_i.ORDER_ID=O.ID and A.ID=O.ACCOUNT_ID
left join "DEVELOPER_DB"."ANJALI_SCHEMA"."PRODUCT_2" as P on P.ID=o_i.PRODUCT_2_ID and o_i.ORDER_ID=O.ID and A.ID=O.ACCOUNT_ID