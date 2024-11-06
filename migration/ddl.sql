BEGIN;

-- Создание схем
DROP SCHEMA IF EXISTS L1_LANDING CASCADE;
DROP SCHEMA IF EXISTS L2_PROCESSING CASCADE;
DROP SCHEMA IF EXISTS L3_CONSUMPTION CASCADE;

CREATE SCHEMA L1_LANDING;
CREATE SCHEMA L2_PROCESSING;
CREATE SCHEMA L3_CONSUMPTION;

-- Создание таблицы Dates в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.dates;
CREATE TABLE L1_LANDING.dates (
  ddate DATE NOT NULL,
  day INT,
  month TEXT,
  year INT,
  quarter INT,
  day_of_week TEXT,
  week_of_year INT,
  updated_at TIMESTAMP
);

-- Создание таблицы Customers в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.customers;
CREATE TABLE L1_LANDING.customers (
  customer_id BIGINT NOT NULL,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip_code TEXT,
  updated_at TIMESTAMP
);

-- Создание таблицы Employees в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.employees;
CREATE TABLE L1_LANDING.employees (
  employee_id BIGINT NOT NULL,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  job_title TEXT,
  hire_date DATE,
  manager_id BIGINT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip_code TEXT,
  updated_at TIMESTAMP
);

-- Создание таблицы Stores в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.stores;
CREATE TABLE L1_LANDING.stores (
  store_id BIGINT NOT NULL,
  store_name TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip_code TEXT,
  email TEXT,
  phone TEXT,
  updated_at TIMESTAMP
);

-- Создание таблицы Suppliers в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.suppliers;
CREATE TABLE L1_LANDING.suppliers (
  supplier_id BIGINT NOT NULL,
  supplier_name TEXT,
  contact_person TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  zip_code TEXT,
  updated_at TIMESTAMP
);

-- Создание таблицы Products в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.products;
CREATE TABLE L1_LANDING.products (
  product_id BIGINT NOT NULL,
  name TEXT,
  category TEXT,
  retail_price NUMERIC(10, 2),
  supplier_price NUMERIC(10, 2),
  supplier_id BIGINT,
  updated_at TIMESTAMP
);

-- Создание таблицы OrderItems в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.order_items;
CREATE TABLE L1_LANDING.order_items (
  order_item_id BIGINT NOT NULL,
  order_id BIGINT,
  product_id BIGINT,
  quantity INT,
  unit_price NUMERIC(10, 2),
  updated_at TIMESTAMP
);

-- Создание таблицы Orders в схеме L1_LANDING
DROP TABLE IF EXISTS L1_LANDING.orders;
CREATE TABLE L1_LANDING.orders (
  order_id BIGINT NOT NULL,
  order_date DATE,
  customer_id BIGINT,
  employee_id BIGINT,
  store_id BIGINT,
  status TEXT,
  updated_at TIMESTAMP
);

-- Установка привилегий по умолчанию на все будущие таблицы и последовательности в схемах
GRANT USAGE ON SCHEMA l1_landing TO dbt_master;
GRANT CREATE ON SCHEMA l1_landing TO dbt_master;
ALTER DEFAULT PRIVILEGES IN SCHEMA l1_landing GRANT ALL PRIVILEGES ON TABLES TO dbt_master;
ALTER DEFAULT PRIVILEGES IN SCHEMA l1_landing GRANT ALL PRIVILEGES ON SEQUENCES TO dbt_master;

GRANT USAGE ON SCHEMA l2_processing TO dbt_master;
GRANT CREATE ON SCHEMA l2_processing TO dbt_master;
ALTER DEFAULT PRIVILEGES IN SCHEMA l2_processing GRANT ALL PRIVILEGES ON TABLES TO dbt_master;
ALTER DEFAULT PRIVILEGES IN SCHEMA l2_processing GRANT ALL PRIVILEGES ON SEQUENCES TO dbt_master;

GRANT USAGE ON SCHEMA l3_consumption TO dbt_master;
GRANT CREATE ON SCHEMA l3_consumption TO dbt_master;
ALTER DEFAULT PRIVILEGES IN SCHEMA l3_consumption GRANT ALL PRIVILEGES ON TABLES TO dbt_master;
ALTER DEFAULT PRIVILEGES IN SCHEMA l3_consumption GRANT ALL PRIVILEGES ON SEQUENCES TO dbt_master;

COMMIT;
