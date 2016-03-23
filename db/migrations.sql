CREATE DATABASE sinatra_coupons;
\c sinatra_coupons
CREATE TABLE coupons (id SERIAL PRIMARY KEY, title VARCHAR(255), description VARCHAR(255), product VARCHAR(255), discount_price DECIMAL, expiration_date DATE);
