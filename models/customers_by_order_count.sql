{{config(materialized='table')}}

with customers_by_order_count as
(
	select 
	   c.customer_id, concat(c.first_name, ' ', c.last_name) as full_name,
	   count(*) order_cnt
	from 
	   l1_landing.customers c
	left join
	   l1_landing.orders o on c.customer_id = o.customer_id 
	group by
	   c.customer_id , full_name
)
select 
   *
from
   customers_by_order_count
order by 
   order_cnt desc, customer_id