SELECT 
	order_id, 
	order_date, 
	customer_id, 
	employee_id, 
	store_id, 
	status,
	case status
		when 'Pending' then 1
		when 'Processing' then 2
		else 3
	end status_num,
	updated_at
FROM 
	{{source('landing', 'orders')}}