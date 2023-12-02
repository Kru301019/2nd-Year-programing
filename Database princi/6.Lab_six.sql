DROP INDEX IF EXISTS my_phone;

UPDATE
    address        
SET
    phone = 02392844444
WHERE
    address_id = 100;

explain
SELECT*
FROM  
    address
WHERE
    address_id = 100;




CREATE VIEW Customer_info AS
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS Customer,
    CONCAT(c.email, ' ', a.phone) AS Contact_Details,
    a.address AS Customer_Address,
    ci.city AS Customer_City,
    cnt.country AS Customer_Country

FROM
    customer AS c
JOIN 
    address AS a ON c.address_id = a.address_id
JOIN
    city AS ci ON a.city_id = ci.city_id
JOIN    
    country AS cnt ON ci.country_id = cnt.country_id

ORDER BY 
    Customer_Country;


SELECT * FROM Customer_info;


SELECT 
    city,
    (SELECT country.country_id FROM country WHERE country_id = ct.country_id) AS country_name
FROM
    city AS ct
WHERE
    ct.country_id IN (SELECT country_id FROM country WHERE country = 'United Kingdom');



SELECT 
    city,
    (SELECT country FROM country WHERE country_id = ct.country_id) AS country_name
FROM
    city AS ct
WHERE
    ct.country_id IN (
        SELECT country_id FROM country WHERE country IN ('United Kingdom', 'France')
    )

GROUP BY 
    city, country_name;
