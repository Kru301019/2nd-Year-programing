select artist.artist_name, artwork.work_title
from artist
join creates on  artist.artist_id = creates.artist_id
join artwork on creates. artwork_id =  artwork.artwork_id
where artwork.work_title ='Rainbow';


SELECT aw.work_title
FROM artist a
JOIN artwork aw ON a.artist_id = aw.artwork_id
WHERE a.artist_name = 'Lolo';


SELECT c.cust_name, a.work_title, a.price
FROM customer AS c
JOIN purchase AS p ON c.cust_id = p.cust_id
JOIN artwork AS a ON a.artwork_id = p.artwork_id
WHERE a.price <= 200;
