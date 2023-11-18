CREATE TABLE COUNTY (
    county_id SERIAL PRIMARY KEY,
    county_name VARCHAR(30) NOT NULL
   );

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    county_id INT REFERENCES COUNTY(county_id),
    address_post_code VARCHAR(8) UNIQUE NOT NULL,
    address_name_one VARCHAR(50) NOT NULL,
    address_name_two VARCHAR(50)
);

CREATE TABLE CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    address_id INT REFERENCES address(address_id) NOT NULL,
    customer_fname VARCHAR(64) NOT NULL,
    customer_lname VARCHAR(64),
    customer_tel VARCHAR(20) UNIQUE NOT NULL,
    customer_email VARCHAR(254) UNIQUE NOT NULL,
    customer_priv BOOLEAN
);

CREATE TABLE BOAT (
    boat_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES CUSTOMER(customer_id) NOT NULL UNIQUE
    -- Add additional columns and constraints as needed
);
