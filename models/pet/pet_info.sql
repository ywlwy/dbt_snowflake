{{ config(materialized="view",) }}
select name, species, food_like, food_dislike
from {{ source("pet", "animal") }}
