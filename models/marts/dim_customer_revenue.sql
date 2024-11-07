SELECT 
	c.customer_id, 
	c.full_name,
	count(fo.order_id) order_cnt,
	sum(fo.revenue) revenue
FROM 
	{{ref('stg_customers')}} c
left join
	{{ref('fct_orders')}} fo on c.customer_id = fo.customer_id 
group by
	c.customer_id,c.full_name 
order by
	c.customer_id 