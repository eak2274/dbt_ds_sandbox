DO $$
BEGIN

	--01. Inserting test data to the Customers table
	INSERT INTO L1_LANDING.customers
	(customer_id, first_name, last_name, email, phone, address, city, state, zip_code, updated_at)
	VALUES
	(1, 'John', 'Smith', 'john.smith@email.com', '555-0101', '123 Main St', 'Chicago', 'IL', '60601', CURRENT_TIMESTAMP),
	(2, 'Mary', 'Johnson', 'mary.j@email.com', '555-0102', '456 Oak Ave', 'New York', 'NY', '10001', CURRENT_TIMESTAMP),
	(3, 'Robert', 'Williams', 'rob.w@email.com', '555-0103', '789 Pine Rd', 'Los Angeles', 'CA', '90001', CURRENT_TIMESTAMP),
	(4, 'Patricia', 'Brown', 'pat.b@email.com', '555-0104', '321 Elm St', 'Houston', 'TX', '77001', CURRENT_TIMESTAMP),
	(5, 'Michael', 'Jones', 'michael.j@email.com', '555-0105', '654 Maple Dr', 'Phoenix', 'AZ', '85001', CURRENT_TIMESTAMP),
	(6, 'Linda', 'Garcia', 'linda.g@email.com', '555-0106', '987 Cedar Ln', 'Philadelphia', 'PA', '19101', CURRENT_TIMESTAMP),
	(7, 'James', 'Miller', 'james.m@email.com', '555-0107', '147 Birch St', 'San Antonio', 'TX', '78201', CURRENT_TIMESTAMP),
	(8, 'Jennifer', 'Davis', 'jen.d@email.com', '555-0108', '258 Walnut Ave', 'San Diego', 'CA', '92101', CURRENT_TIMESTAMP),
	(9, 'David', 'Rodriguez', 'david.r@email.com', '555-0109', '369 Pine St', 'Dallas', 'TX', '75201', CURRENT_TIMESTAMP),
	(10, 'Maria', 'Martinez', 'maria.m@email.com', '555-0110', '741 Oak Rd', 'San Jose', 'CA', '95101', CURRENT_TIMESTAMP),
	(11, 'Joseph', 'Anderson', 'joseph.a@email.com', '555-0111', '852 Maple St', 'Austin', 'TX', '73301', CURRENT_TIMESTAMP),
	(12, 'Sarah', 'Taylor', 'sarah.t@email.com', '555-0112', '963 Cedar Ave', 'Jacksonville', 'FL', '32201', CURRENT_TIMESTAMP),
	(13, 'Charles', 'Thomas', 'charles.t@email.com', '555-0113', '159 Elm Rd', 'San Francisco', 'CA', '94101', CURRENT_TIMESTAMP),
	(14, 'Jessica', 'Hernandez', 'jessica.h@email.com', '555-0114', '357 Birch Dr', 'Indianapolis', 'IN', '46201', CURRENT_TIMESTAMP),
	(15, 'Christopher', 'Moore', 'chris.m@email.com', '555-0115', '486 Walnut Ln', 'Columbus', 'OH', '43201', CURRENT_TIMESTAMP),
	(16, 'Ashley', 'Martin', 'ashley.m@email.com', '555-0116', '729 Pine Ave', 'Fort Worth', 'TX', '76101', CURRENT_TIMESTAMP),
	(17, 'Andrew', 'Lee', 'andrew.l@email.com', '555-0117', '813 Oak St', 'Charlotte', 'NC', '28201', CURRENT_TIMESTAMP),
	(18, 'Sandra', 'Gonzalez', 'sandra.g@email.com', '555-0118', '924 Maple Rd', 'Detroit', 'MI', '48201', CURRENT_TIMESTAMP),
	(19, 'Kevin', 'Wilson', 'kevin.w@email.com', '555-0119', '135 Cedar St', 'El Paso', 'TX', '79901', CURRENT_TIMESTAMP),
	(20, 'Michelle', 'Anderson', 'michelle.a@email.com', '555-0120', '246 Elm Ave', 'Seattle', 'WA', '98101', CURRENT_TIMESTAMP);

	--02. Inserting test data to the Dates table
	WITH temp_date_table AS (
		SELECT
			(DATE '2020-01-01' + (FLOOR(RANDOM() * (4 * 365))) * INTERVAL '1 day') AS curr_date
		FROM
			generate_series(1, 21)
	)
	INSERT INTO L1_LANDING.dates (
		ddate,
		day,
		month,
		year,
		quarter,
		day_of_week,
		week_of_year,
		updated_at
	)
	SELECT
		curr_date,
		EXTRACT(DAY FROM curr_date),
		TO_CHAR(curr_date, 'FMMonth'),  -- Форматирование месяца
		EXTRACT(YEAR FROM curr_date),
		EXTRACT(QUARTER FROM curr_date),
		TO_CHAR(curr_date, 'FMDay'),  -- Форматирование дня недели
		EXTRACT(WEEK FROM curr_date),
		CURRENT_TIMESTAMP
	FROM
		temp_date_table;
		
	--03. Inserting test data to the Employees table
	INSERT INTO L1_LANDING.employees
	(employee_id, first_name, last_name, email, job_title, hire_date, manager_id, address, city, state, zip_code, updated_at)
	VALUES
	(1, 'William', 'Johnson', 'w.johnson@company.com', 'Store Manager', '2020-01-15', NULL, '123 Business Ave', 'Chicago', 'IL', '60601', CURRENT_TIMESTAMP),
	(2, 'Emma', 'Davis', 'e.davis@company.com', 'Sales Associate', '2020-02-01', 1, '456 Commerce St', 'Chicago', 'IL', '60601', CURRENT_TIMESTAMP),
	(3, 'Michael', 'Brown', 'm.brown@company.com', 'Store Manager', '2020-01-20', 1, '789 Market St', 'New York', 'NY', '10001', CURRENT_TIMESTAMP),
	(4, 'Sofia', 'Garcia', 's.garcia@company.com', 'Sales Associate', '2020-03-01', 3, '321 Retail Dr', 'New York', 'NY', '10001', CURRENT_TIMESTAMP),
	(5, 'James', 'Wilson', 'j.wilson@company.com', 'Store Manager', '2020-02-01', NULL, '654 Shop Ave', 'Los Angeles', 'CA', '90001', CURRENT_TIMESTAMP),
	(6, 'Olivia', 'Martinez', 'o.martinez@company.com', 'Sales Associate', '2020-03-15', 5, '987 Store St', 'Los Angeles', 'CA', '90001', CURRENT_TIMESTAMP),
	(7, 'Alexander', 'Anderson', 'a.anderson@company.com', 'Store Manager', '2020-02-15', NULL, '147 Retail Ln', 'Houston', 'TX', '77001', CURRENT_TIMESTAMP),
	(8, 'Isabella', 'Taylor', 'i.taylor@company.com', 'Sales Associate', '2020-04-01', 9, '258 Commerce Dr', 'Houston', 'TX', '77001', CURRENT_TIMESTAMP),
	(9, 'Benjamin', 'Thomas', 'b.thomas@company.com', 'Store Manager', '2020-03-01', NULL, '369 Market Ave', 'Phoenix', 'AZ', '85001', CURRENT_TIMESTAMP),
	(10, 'Mia', 'Hernandez', 'm.hernandez@company.com', 'Sales Associate', '2020-04-15', 9, '741 Business Rd', 'Phoenix', 'AZ', '85001', CURRENT_TIMESTAMP),
	(11, 'Lucas', 'Moore', 'l.moore@company.com', 'Store Manager', '2020-03-15', NULL, '852 Shop St', 'Philadelphia', 'PA', '19101', CURRENT_TIMESTAMP),
	(12, 'Charlotte', 'Martin', 'c.martin@company.com', 'Sales Associate', '2020-05-01', 2, '963 Store Ave', 'Philadelphia', 'PA', '19101', CURRENT_TIMESTAMP),
	(13, 'Henry', 'Lee', 'h.lee@company.com', 'Store Manager', '2020-04-01', NULL, '159 Retail St', 'San Antonio', 'TX', '78201', CURRENT_TIMESTAMP),
	(14, 'Amelia', 'Gonzalez', 'a.gonzalez@company.com', 'Sales Associate', '2020-05-15', 2, '357 Commerce Ln', 'San Antonio', 'TX', '78201', CURRENT_TIMESTAMP),
	(15, 'Sebastian', 'Wilson', 's.wilson@company.com', 'Store Manager', '2020-04-15', NULL, '486 Market Dr', 'San Diego', 'CA', '92101', CURRENT_TIMESTAMP),
	(16, 'Harper', 'Anderson', 'h.anderson@company.com', 'Sales Associate', '2020-06-01', 15, '729 Business St', 'San Diego', 'CA', '92101', CURRENT_TIMESTAMP),
	(17, 'Jack', 'Taylor', 'j.taylor@company.com', 'Store Manager', '2020-05-01', NULL, '813 Shop Ave', 'Dallas', 'TX', '75201', CURRENT_TIMESTAMP),
	(18, 'Evelyn', 'Thomas', 'e.thomas@company.com', 'Sales Associate', '2020-06-15', 17, '924 Store Rd', 'Dallas', 'TX', '75201', CURRENT_TIMESTAMP),
	(19, 'Daniel', 'Hernandez', 'd.hernandez@company.com', 'Store Manager', '2020-05-15', NULL, '135 Retail Ave', 'San Jose', 'CA', '95101', CURRENT_TIMESTAMP),
	(20, 'Victoria', 'Moore', 'v.moore@company.com', 'Sales Associate', '2020-07-01', 19, '246 Commerce St', 'San Jose', 'CA', '95101', CURRENT_TIMESTAMP);
	
	
	--04. Inserting test data to the Stores table
	INSERT INTO L1_LANDING.stores
	(store_id, store_name, address, city, state, zip_code, email, phone, updated_at)
	VALUES
	(1, 'Downtown Chicago Store', '123 State St', 'Chicago', 'IL', '60601', 'chicago.downtown@store.com', '555-1001', CURRENT_TIMESTAMP),
	(2, 'Manhattan Central', '456 5th Ave', 'New York', 'NY', '10001', 'nyc.central@store.com', '555-1002', CURRENT_TIMESTAMP),
	(3, 'LA Downtown', '789 Broadway', 'Los Angeles', 'CA', '90001', 'la.downtown@store.com', '555-1003', CURRENT_TIMESTAMP),
	(4, 'Houston Main', '321 Main St', 'Houston', 'TX', '77001', 'houston.main@store.com', '555-1004', CURRENT_TIMESTAMP),
	(5, 'Phoenix Central', '654 Central Ave', 'Phoenix', 'AZ', '85001', 'phoenix.central@store.com', '555-1005', CURRENT_TIMESTAMP),
	(6, 'Philly Downtown', '987 Market St', 'Philadelphia', 'PA', '19101', 'philly.downtown@store.com', '555-1006', CURRENT_TIMESTAMP),
	(7, 'San Antonio Main', '147 Commerce St', 'San Antonio', 'TX', '78201', 'sanantonio.main@store.com', '555-1007', CURRENT_TIMESTAMP),
	(8, 'San Diego Central', '258 Harbor Dr', 'San Diego', 'CA', '92101', 'sandiego.central@store.com', '555-1008', CURRENT_TIMESTAMP),
	(9, 'Dallas Downtown', '369 Dallas Pkwy', 'Dallas', 'TX', '75201', 'dallas.downtown@store.com', '555-1009', CURRENT_TIMESTAMP),
	(10, 'San Jose Main', '741 First St', 'San Jose', 'CA', '95101', 'sanjose.main@store.com', '555-1010', CURRENT_TIMESTAMP),
	(11, 'Austin Central', '852 Congress Ave', 'Austin', 'TX', '73301', 'austin.central@store.com', '555-1011', CURRENT_TIMESTAMP),
	(12, 'Jacksonville Main', '963 Bay St', 'Jacksonville', 'FL', '32201', 'jacksonville.main@store.com', '555-1012', CURRENT_TIMESTAMP),
	(13, 'SF Downtown', '159 Market St', 'San Francisco', 'CA', '94101', 'sf.downtown@store.com', '555-1013', CURRENT_TIMESTAMP),
	(14, 'Indy Central', '357 Monument Cir', 'Indianapolis', 'IN', '46201', 'indy.central@store.com', '555-1014', CURRENT_TIMESTAMP),
	(15, 'Columbus Main', '486 High St', 'Columbus', 'OH', '43201', 'columbus.main@store.com', '555-1015', CURRENT_TIMESTAMP),
	(16, 'Fort Worth Downtown', '729 Main St', 'Fort Worth', 'TX', '76101', 'fortworth.downtown@store.com', '555-1016', CURRENT_TIMESTAMP),
	(17, 'Charlotte Central', '813 Trade St', 'Charlotte', 'NC', '28201', 'charlotte.central@store.com', '555-1017', CURRENT_TIMESTAMP),
	(18, 'Detroit Main', '924 Woodward Ave', 'Detroit', 'MI', '48201', 'detroit.main@store.com', '555-1018', CURRENT_TIMESTAMP),
	(19, 'El Paso Downtown', '135 Texas Ave', 'El Paso', 'TX', '79901', 'elpaso.downtown@store.com', '555-1019', CURRENT_TIMESTAMP),
	(20, 'Seattle Central', '246 Pike St', 'Seattle', 'WA', '98101', 'seattle.central@store.com', '555-1020', CURRENT_TIMESTAMP);
	
	
	--05. Inserting test data to the Suppliers table
	INSERT INTO L1_LANDING.suppliers
	(supplier_id, supplier_name, contact_person, email, phone, address, city, state, zip_code, updated_at)
	VALUES
	(1, 'Tech Supplies Co', 'John Tech', 'john@techsupplies.com', '555-2001', '100 Tech Park', 'San Jose', 'CA', '95101', CURRENT_TIMESTAMP),
	(2, 'Electronics World', 'Mary Electronics', 'mary@electronicsworld.com', '555-2002', '200 Electronics Ave', 'Austin', 'TX', '73301', CURRENT_TIMESTAMP),
	(3, 'Digital Devices', 'Bob Digital', 'bob@digitaldevices.com', '555-2003', '300 Digital Rd', 'Seattle', 'WA', '98101', CURRENT_TIMESTAMP),
	(4, 'Smart Gadgets', 'Alice Smart', 'alice@smartgadgets.com', '555-2004', '400 Gadget St', 'Boston', 'MA', '02101', CURRENT_TIMESTAMP),
	(5, 'Computer Parts Plus', 'Charlie Parts', 'charlie@computerparts.com', '555-2005', '500 Computer Dr', 'Phoenix', 'AZ', '85001', CURRENT_TIMESTAMP),
	(6, 'Mobile Accessories', 'Diana Mobile', 'diana@mobileacc.com', '555-2006', '600 Mobile Ln', 'Miami', 'FL', '33101', CURRENT_TIMESTAMP),
	(7, 'Network Solutions', 'Edward Network', 'edward@networksol.com', '555-2007', '700 Network Ave', 'Denver', 'CO', '80201', CURRENT_TIMESTAMP),
	(8, 'Gaming Gear', 'Frank Gaming', 'frank@gaminggear.com', '555-2008', '800 Gaming Blvd', 'Las Vegas', 'NV', '89101', CURRENT_TIMESTAMP),
	(9, 'Audio Equipment', 'Grace Audio', 'grace@audioequip.com', '555-2009', '900 Audio St', 'Nashville', 'TN', '37201', CURRENT_TIMESTAMP),
	(10, 'Video Systems', 'Henry Video', 'henry@videosys.com', '555-2010', '1000 Video Rd', 'Atlanta', 'GA', '30301', CURRENT_TIMESTAMP),
	(11, 'Storage Solutions', 'Ivy Storage', 'ivy@storagesol.com', '555-2011', '1100 Storage Dr', 'Portland', 'OR', '97201', CURRENT_TIMESTAMP),
	(12, 'Power Supplies', 'Jack Power', 'jack@powersup.com', '555-2012', '1200 Power Ave', 'Philadelphia', 'PA', '19101', CURRENT_TIMESTAMP),
	(13, 'Printer Partners', 'Kelly Printer', 'kelly@printerpart.com', '555-2013', '1300 Printer St', 'Houston', 'TX', '77001', CURRENT_TIMESTAMP),
	(14, 'Cable Connections', 'Leo Cable', 'leo@cableconn.com', '555-2014', '1400 Cable Rd', 'Chicago', 'IL', '60601', CURRENT_TIMESTAMP),
	(15, 'Memory Masters', 'Mike Memory', 'mike@memorymasters.com', '555-2015', '1500 Memory Ln', 'Detroit', 'MI', '48201', CURRENT_TIMESTAMP),
	(16, 'Display Direct', 'Nina Display', 'nina@displaydirect.com', '555-2016', '1600 Display Dr', 'San Diego', 'CA', '92101', CURRENT_TIMESTAMP),
	(17, 'Keyboard Kings', 'Oscar Keyboard', 'oscar@keyboardkings.com', '555-2017', '1700 Keyboard Ave', 'Dallas', 'TX', '75201', CURRENT_TIMESTAMP),
	(18, 'Mouse Masters', 'Paula Mouse', 'paula@mousemasters.com', '555-2018', '1800 Mouse St', 'Sacramento', 'CA', '95801', CURRENT_TIMESTAMP),
	(19, 'Security Systems', 'Quinn Security', 'quinn@securitysys.com', '555-2019', '1900 Security Rd', 'Baltimore', 'MD', '21201', CURRENT_TIMESTAMP),
	(20, 'Wireless World', 'Ray Wireless', 'ray@wirelessworld.com', '555-2020', '2000 Wireless Blvd', 'Cleveland', 'OH', '44101', CURRENT_TIMESTAMP);

	--06. Inserting test data into the Products table
	INSERT INTO L1_LANDING.Products
	(product_id, name, category, retail_price, supplier_price, supplier_id, updated_at)
	VALUES
	(1, 'Laptop Pro', 'Computers', 1299.99, 899.99, 1, CURRENT_TIMESTAMP),
	(2, 'Smartphone X', 'Mobile Phones', 899.99, 599.99, 2, CURRENT_TIMESTAMP),
	(3, 'Wireless Headphones', 'Audio', 199.99, 99.99, 3, CURRENT_TIMESTAMP),
	(4, 'Smart Watch', 'Wearables', 299.99, 149.99, 4, CURRENT_TIMESTAMP),
	(5, 'Gaming Console', 'Gaming', 499.99, 299.99, 5, CURRENT_TIMESTAMP),
	(6, 'Tablet Air', 'Tablets', 699.99, 449.99, 6, CURRENT_TIMESTAMP),
	(7, 'Desktop Computer', 'Computers', 999.99, 699.99, 7, CURRENT_TIMESTAMP),
	(8, 'Wireless Speaker', 'Audio', 149.99, 79.99, 8, CURRENT_TIMESTAMP),
	(9, 'Digital Camera', 'Cameras', 599.99, 399.99, 9, CURRENT_TIMESTAMP),
	(10, '4K Monitor', 'Displays', 399.99, 249.99, 10, CURRENT_TIMESTAMP),
	(11, 'Gaming Mouse', 'Accessories', 79.99, 39.99, 11, CURRENT_TIMESTAMP),
	(12, 'Mechanical Keyboard', 'Accessories', 129.99, 69.99, 12, CURRENT_TIMESTAMP),
	(13, 'External SSD', 'Storage', 199.99, 119.99, 13, CURRENT_TIMESTAMP),
	(14, 'Graphics Card', 'Components', 699.99, 499.99, 14, CURRENT_TIMESTAMP),
	(15, 'Router Pro', 'Networking', 199.99, 119.99, 15, CURRENT_TIMESTAMP),
	(16, 'Wireless Earbuds', 'Audio', 159.99, 89.99, 16, CURRENT_TIMESTAMP),
	(17, 'Power Bank', 'Accessories', 49.99, 24.99, 17, CURRENT_TIMESTAMP),
	(18, 'Webcam HD', 'Accessories', 89.99, 49.99, 18, CURRENT_TIMESTAMP),
	(19, 'Smart Home Hub', 'Smart Home', 149.99, 89.99, 19, CURRENT_TIMESTAMP),
	(20, 'Bluetooth Speaker', 'Audio', 129.99, 69.99, 20, CURRENT_TIMESTAMP);
	
	--07. Inserting test data into the Orders table
	WITH 
	RECURSIVE numbers AS (
    SELECT 1 as n
    UNION ALL
    SELECT n + 1 
    FROM numbers 
    WHERE n < 10
	),
	random_counts AS (
		SELECT 
			ddate,
			1 + floor(random() * 10)::int as repeat_count
		FROM L1_LANDING.dates
	),
	expanded_rows AS (
		SELECT 
			d.ddate,
			n.n as row_num
		FROM L1_LANDING.dates d
		JOIN random_counts rc ON d.ddate = rc.ddate
		JOIN numbers n ON n.n <= rc.repeat_count
	)
	INSERT INTO L1_LANDING.orders
	(order_id, order_date, customer_id, employee_id, store_id, status, updated_at)
	SELECT 
		ROW_NUMBER() OVER (ORDER BY ddate) as order_id,
		ddate as order_date,
		1 + floor(random() * 20)::int as customer_id, 
		1 + floor(random() * 20)::int as employee_id, 
		1 + floor(random() * 20)::int as store_id,
		CASE 
			WHEN random() < 0.33 THEN 'Completed'
			WHEN random() < 0.66 THEN 'Processing'
			ELSE 'Pending'
		END,
		CURRENT_TIMESTAMP
	FROM 
		expanded_rows
	ORDER BY ddate;
	
	
	--08. Inserting test data into the Orders table
	WITH 
	RECURSIVE numbers AS (
    SELECT 1 as n
    UNION ALL
    SELECT n + 1 
    FROM numbers 
    WHERE n < 10
	),
	random_counts AS (
		SELECT 
			order_id,
			1 + floor(random() * 10)::int as repeat_count
		FROM L1_LANDING.orders
	),
	expanded_rows AS (
		SELECT 
			d.order_id,
			n.n as row_num
		FROM L1_LANDING.orders d
		JOIN random_counts rc ON d.order_id = rc.order_id
		JOIN numbers n ON n.n <= rc.repeat_count
	)
	INSERT INTO L1_LANDING.order_items
	(order_item_id, order_id, product_id, quantity, unit_price, updated_at)
	SELECT 
		ROW_NUMBER() OVER (ORDER BY order_id) as order_item_id,
		order_id,
		1 + floor(random() * 20)::int as product_id, 
		1 + floor(random() * 100)::int as quantity, 
		round((random() * 1000)::numeric + 0.01, 2) as unit_price,
		CURRENT_TIMESTAMP
	FROM 
		expanded_rows
	ORDER BY order_id;
	
END $$;
