SELECT routine_name
FROM information_schema.routines
WHERE routine_type = 'FUNCTION' AND specific_schema = 'public';


SELECT * FROM movie_in_stock(25, 1);


CREATE OR REPLACE FUNCTION add_new_actor(
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50)
) 
RETURNS void LANGUAGE sql 
AS $$
    INSERT INTO actor (first_name, last_name, last_update)
    VALUES (p_first_name, p_last_name, CURRENT_TIMESTAMP);        
$$;


SELECT add_new_actor('Krutarth', 'Johsi');


ALTER TABLE country
ADD COLUMN country_code VARCHAR(50);

ALTER TABLE country
ALTER COLUMN country_code TYPE VARCHAR(2);



ALTER TABLE country
ADD CONSTRAINT your_column_unique_constraint UNIQUE(country_code);


INSERT INTO country(country, last_update, country_code)
VALUES('United Kingdom',CURRENT_TIMESTAMP,+44);



CREATE TABLE new_staff (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255) UNIQUE
);

INSERT INTO new_staff (id, first_name, last_name, email_address)
SELECT staff_id, first_name, last_name, email
FROM staff;


SELECT 
    m.title AS movie_title,
    COUNT(*) AS number_of_copies
FROM 
    movie AS m
JOIN
    inventory AS i ON m.movie_id = i.movie_id
GROUP BY
    m.title
ORDER BY
    number_of_copies DESC, m.title;


SELECT 
    c.name AS movie_category,
    ROUND(AVG(m.length), 2) AS average_movie_length
FROM 
    category AS c
JOIN
    movie_category AS mc ON c.category_id = mc.category_id
JOIN 
    movie AS m on mc.movie_id = m.movie_id
GROUP BY
    c.name
ORDER BY
    average_movie_length DESC;


SELECT 
    c.name AS movie_category,
    ROUND(AVG(m.length), 2) AS movie_above_average_movie_lenth
FROM 
    category AS c
JOIN
    movie_category AS mc ON c.category_id = mc.category_id
JOIN 
    movie AS m on mc.movie_id = m.movie_id
GROUP BY
    c.name
HAVING
    ROUND(AVG(m.length), 2)>115.27
ORDER BY
    movie_category DESC;