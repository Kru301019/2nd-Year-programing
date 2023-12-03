SELECT
    a.actor_id AS actor_id,
    a.first_name AS actor_first_name,
    a.last_name AS actor_last_name
FROM
    actor AS a    
WHERE
    a.first_name ILIKE 'scarlett%';    


SELECT 
    last_name,COUNT(last_name) AS unique_last_name 
FROM 
    actor
GROUP BY 
    last_name
ORDER BY 
    last_name;


SELECT last_name AS actor_with_unique_lastName
FROM actor
GROUP BY last_name
HAVING COUNT(*)=1
ORDER BY last_name;

SELECT 
    a.first_name,
    a.last_name,
    COUNT(*)

FROM actor AS a

GROUP BY 
    a.first_name,
    a.last_name;


SELECT 
    a.first_name AS actor_first_name, 
    a.last_name AS actor_last_name,
    COUNT(*) AS appearance_count
FROM 
    actor AS a
JOIN 
    movie_actor  USING (actor_id)
GROUP BY 
    a.first_name,
    a.last_name
ORDER BY 
    appearance_count DESC
LIMIT 1;
    

SELECT
    movie.title,movie.movie_id
FROM
    movie
WHERE 
    movie.title ILIKE 'Purple Movie';

select* from inventory;
movie_id = 705

SELECT
    s.store_id,
    i.inventory_id,
    m.title,
    COUNT(*) AS copies_available
FROM
    store AS s
JOIN 
    inventory AS i ON i.store_id = s.store_id
JOIN 
    movie AS m ON i.movie_id = m.movie_id 
WHERE
    s.store_id = 1 AND m.title ILIKE 'Purple Movie'
GROUP BY
    s.store_id, i.inventory_id, m.movie_id;


SELECT
    CONCAT(s.first_name,' ',s.last_name) AS staff_name,
    a.address AS staff_address,
    c.city AS staff_city,
    s.email AS staff_email

FROM
    city AS c
JOIN 
    address AS a ON c.city_id = a.city_id
JOIN
    staff AS s ON a.address_id = s.address_id;


SELECT
    CONCAT(a.first_name,' ',a.last_name) AS actor_in_agent_truman
FROM
    actor AS a
JOIN
    movie_actor AS mc ON a.actor_id = mc.actor_id
JOIN
    movie AS m ON m.movie_id = mc.movie_id
WHERE
    m.title ILIKE 'Agent Truman'
ORDER BY
    a.last_name;