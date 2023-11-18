
\dv

EXPLAIN ANALYZE
SELECT
    movie.title,
    category.name
FROM
    movie
JOIN
    movie_category ON movie.movie_id = movie_category.movie_id
JOIN
    category ON movie_category.category_id = category.category_id;
where     
    category.name = 'Documentary';  


EXPLAIN ANALYZE
SELECT
    movie.title,
    category.name
FROM
    movie
JOIN
    movie_category ON movie.movie_id = movie_category.movie_id
JOIN
    category ON movie_category.category_id = category.category_id
where     
    category.category_id = 6;  
