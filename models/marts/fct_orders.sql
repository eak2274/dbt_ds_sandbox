SELECT 
	o.order_id, 
	o.order_date, 
	o.customer_id, 
	o.employee_id, 
	o.store_id, 
	o.status,
	o.status_num,
	count(*) as items_cnt,
	sum(oi.total_price) as revenue
FROM 
	{{ref('stg_orders')}} o
join
	{{ref('stg_order_items')}} oi on o.order_id=oi.order_id
group by
	o.order_id,
	o.order_date, 
	o.customer_id, 
	o.employee_id, 
	o.store_id, 
	o.status,
	o.status_num
order by
	o.order_id