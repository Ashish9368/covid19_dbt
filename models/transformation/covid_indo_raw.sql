
{{ config(materialized='table') }}

select 
cast(Date as date) as dt,
week(cast(Date as date)) as wk,
month(cast(Date as date)) as mon,
year(cast(Date as date)) as yr,
Location as location,
sum(New_Cases) as new_cases,
sum(New_Deaths) as new_deaths,
sum(New_Recovered) as new_recovered,
sum(New_Active_Cases) as active_cases,
(select Total_Cases from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_BHOSALEE" order by date desc limit 1) as total_cases,
(select Total_Deaths from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_BHOSALEE" order by date desc limit 1) as total_deaths,
(select Total_Recovered from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_BHOSALEE" order by date desc limit 1) as total_recovered,
(select Total_Active_Cases from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_BHOSALEE" order by date desc limit 1) as total_active_cases
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_BHOSALEE"
group by date, location