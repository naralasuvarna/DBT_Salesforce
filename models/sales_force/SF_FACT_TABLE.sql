{{ config(materialized='incremental') }}

select A.ID as Account_id,o.ID as order_id,opper.ID as OPPORTUNITY_ID,S.OPP_AMOUNT AS OPPORTUNITY_AMOUNT,cap.ID as campaign_id,S.EXPECTED_REVENUE,S.BUDGETED_COST,
S.ACTUAL_COST,L.ID as lead_Id,contract.ID as contract_Id,p.ID as product_id,
contact.ID as contact_id,cases.ID as case_Id,count(S.ID) AS NO_OF_ORDERS from "DEVELOPER_DB"."ANJALI_SCHEMA"."SALES_FORCE_MAIN_STAGE" as S
LEFT join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_ACCOUNT" as A on S.ID=A.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_ORDER" as o on S.O_ID=o.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_OPPORTUNITY"as opper on S.OPP_ID=opper.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_CAMPAIGN"as cap on S.CAMP_ID=cap.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_LEAD" as L on S.L_ID=L.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_CONTRACT" as contract on S.CR_ID=contract.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_PRODUCT"as p on S.P_ID=p.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_CONTACT" as contact on S.CT_ID=contact.ID
LEFT OUTER join "DEVELOPER_DB"."ANJALI_SCHEMA"."DIM_CASE" as cases on S.CS_ID=cases.ID

where date(A.LOAD_TIME)=date(current_timestamp) or date(o.LOAD_TIME)=date(current_timestamp) or date(opper.LOAD_TIME)=date(current_timestamp) 
or date(cap.LOAD_TIME)=date(current_timestamp) or date(L.LOAD_TIME)=date(current_timestamp) or date(contract.LOAD_TIME)=date(current_timestamp) 
or date(p.LOAD_TIME)=date(current_timestamp) or date(contact.LOAD_TIME)=date(current_timestamp) or date(cases.LOAD_TIME)=date(current_timestamp) 


group by A.ID,o.ID,opper.ID,S.OPP_AMOUNT,cap.ID,S.EXPECTED_REVENUE,S.BUDGETED_COST,
S.ACTUAL_COST,L.ID,contract.ID,p.ID,
contact.ID,cases.ID,S.ID