Sachin Tendulkar - Also known as little master. You are given runs scored by Sachin in his first 10 matches. You need to write an SQL to get match number when he completed 500 runs and his batting average at the end of 10 matches.

Batting Average = (Total runs scored) / (no of times batsman got out)

Round the result to 2 decimal places.


select * from cricket_scores


Table: sachin
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| match_no    | int         |
| runs_scored | int         |
| status      | varchar(10) |
+-------------+-------------+

solutions :

with cte as (
select sum(runs_scored)/sum(case when status='out' then 1 else 0 end) as avg
from sachin
)
,cte1 as (
select 
match_no,runs_scored,status,
sum(runs_scored) over (order by match_no) as total,
b.avg 
from sachin 
join cte b
)
select *
from cte1 
where total>500
limit 1
