CREATE ROLE junior_analyst
  WITH LOGIN
  PASSWORD 'Uop@123';

GRANT SELECT ON TABLE  STAFF  TO junior_analyst;


CREATE ROLE cashier
  WITH LOGIN
  PASSWORD 'Uop@123';

GRANT INSERT ON TABLE  payment_p2022_01  TO cashier;
GRANT USAGE, SELECT ON SEQUENCE payment_p2022_01_payment_id_seq TO cashier;

GRANT SELECT ON TABLE  rental  TO cashier;
GRANT INSERT ON TABLE  rental  TO cashier;


GRANT DELETE ON TABLE  rental  TO cashier;


CREATE ROLE manager 
  WITH LOGIN
  PASSWORD 'Uop@123';
GRANT UPDATE ON country to manager;
GRANT manager TO sales;

CREATE ROLE sales  
  WITH LOGIN
  PASSWORD 'Uop@123';

GRANT UPDATE ON country to sales;

DROP ROLE manager;
DROP ROLE sales;

SELECT current_user;

GRANT SELECT ON TABLE customer_view TO sales;

CREATE ROLE admin  
  WITH LOGIN
  PASSWORD 'Uop@123';
ALTER ROLE admin CREATEROLE;

;

psql -h localhost -p 5432 -U senior -d movie_rental

GRANT SELECT ON ALL TABLE TO admin;
GRANT UPDATE ON TABLE staff TO admin;



UPDATE staff SET role = 'admin' WHERE first_name = 'Val' AND last_name = 'Adam';



CREATE ROLE senior
WITH LOGIN
  PASSWORD 'Uop@123';
GRANT CREATE, USAGE ON SCHEMA public TO senior;
GRANT DELETE ON ALL TABLES IN SCHEMA public TO senior;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM senior;