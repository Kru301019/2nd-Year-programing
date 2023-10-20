CREATE DATABASE lab1;

select artist.artist_name, artwork.work_title
from artist
join artwork on  artist.artist_id = artwork.artwork_id 
where artwork.work_title ='Rainbow';

select  artwork.work_title
from artist
join artwork on  artist.artist_id = artwork.artwork_id 
where artist.artist_name = 'Lolo';

select customer.cust_name, artwork.work_title, artwork.price
from customer
join  purchase on customer.cust_id = purchase.cust_id
join artwork on artwork.artwork_id = purchase.artwork_id
WHERE artwork.price <= 200;
