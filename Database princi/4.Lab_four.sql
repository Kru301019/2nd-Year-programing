SELECT first_name, last_name,	hire_date
FROM Employees
WHERE
	Title = 'Sales Representative'

Select first_name, last_name,	hire_date
From Employees
Where
	Title = 'Sales Representative'
	and Country = 'UK';

SELECT order_id, order_date, shipper 
FROM orders INNER JOIN shippers ON shippers . shipper_id = orders . ship_via 
WHERE order_id < 10300 
ORDER BY order_id

SELECT DISTINCT U.name
FROM USER U, EATS E, PIZZA P
WHERE U.gender = 'female'
AND U.name = E.name
AND E.pizza = P.name
AND (P.name = 'mushroom' OR P.name = 'pepperoni');

          π (name)
             |
            ⨝ (U.gender = 'female')
             |
            σ (pizza = 'mushroom' ∨ pizza = 'pepperoni')
             |
           ┌─────┐─────┐
         name    pizza user
SELECT p.p_name
FROM PASSENGER p
WHERE p.p_city = 'Portsmouth';

