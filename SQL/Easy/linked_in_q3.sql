#3 - LinkedIn Top Voice

LinkedIn is a professional social networking app. They want to give top voice badge to their best creators to encourage them to create more quality content. A creator qualifies for the badge if he/she satisfies following criteria.

 

1- Creator should have more than 50k followers.
2- Creator should have more than 100k impressions on the posts that they published in the month of Dec-2023.
3- Creator should have published atleast 3 posts in Dec-2023.

Write a SQL to get the list of top voice creators name along with no of posts and impressions by them in the month of Dec-2023.

tables:
select * from creators;
select * from posts;
 

Table: creators(primary key : creator_id)
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| creator_id   | int         |
| creator_name | varchar(20) |
| followers    | int         |
+--------------+-------------+
Table: posts(primary key : post_id)
+--------------+------------+
| COLUMN_NAME  | DATA_TYPE  |
+--------------+------------+
| creator_id   | int        |
| post_id      | varchar(3) |
| publish_date | date       |
| impressions  | int        |
+--------------+------------+
Hints
Expected Output
+---------------+-------------+-------------------+
| creator_name  | no_of_posts | total_impressions |
+---------------+-------------+-------------------+
| Aditi Kasture |           4 |            161000 |
| Ankit Bansal  |           3 |            132000 |
| Rahul Singh   |           3 |            119000 |
| Namrata Joshi |           3 |            107000 |
+---------------+-------------+-------------------+

query_results:


with test as (
select creator_id,post_id,publish_date,impressions,
 case when concat(year(publish_date),'-',month(publish_date)) ='2023-12' then 1 else 0 end as flag
from 
posts 
)
, test1 as (
select creator_id ,sum(impressions) as total
from test 
where flag=1
group by creator_id 
having sum(impressions)>100000 and count(post_id)>=3
)
select a.*
from creators a 
 join test1 b 
on a.creator_id=b.creator_id
where a.followers>50000

