SELECT 
	order_item_id, 
	order_id, 
	product_id, 
	quantity, 
	unit_price, 
	updated_at,
	(quantity*unit_price) total_price
FROM 
	{{source('landing', 'order_items')}}