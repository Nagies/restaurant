CREATE TABLE foods (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
cuisine_type VARCHAR(255),
description text,
price INT,
allergens VARCHAR(255),
created_at TIMESTAMP,
updated_at TIMESTAMP
);

CREATE TABLE parties (
id SERIAL PRIMARY KEY,
table_number INT,
number_of_guests INT,
paid BOOLEAN,
created_at TIMESTAMP,
updated_at TIMESTAMP
);

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
food_id INT,
party_id INT,
quantity INT,
created_at TIMESTAMP,
updated_at TIMESTAMP
);