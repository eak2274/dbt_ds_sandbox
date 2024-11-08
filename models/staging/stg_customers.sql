SELECT 
	customer_id, 
	first_name, 
	last_name, 
	email, phone, 
	address, 
	city, 
	state, 
	zip_code, 
	updated_at,
	concat(first_name, ' ', last_name) as full_name
FROM 
	{{source('landing', 'customers')}}