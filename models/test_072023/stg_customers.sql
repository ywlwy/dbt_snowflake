{{ config(materialized="view", unique_key="id") }}
select id, first_name, last_name
from {{ source("jaffle_shop", "customers") }}
