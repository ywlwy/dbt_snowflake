{{
    config(
        materialized="table", 

    )
}}

select
    c.id as user_id,
    c.first_name,
    c.last_name,
    date_trunc('month', order_date)::date as month,
    o.status,
    count(o.id) as order_cnt
from {{ ref("stg_customers") }} as c
join {{ ref("stg_orders") }} as o on c.id = o.user_id
group by 1, 2, 3, 4, 5
order by 1, 4, 5
