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
    
print('hello')