/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
select c.customer_id, c.first_name, c.last_name
from customer c
join rental r using (customer_id)
join inventory i using (inventory_id)
join film_category fc using (film_id)
join category cat using (category_id)
where cat.name = 'Action'
and r.rental_id in (
    select r2.rental_id from rental r2
    where r2.customer_id = c.customer_id
    order by r2.rental_date desc, r2.rental_id desc
    limit 5
)
group by c.customer_id
having count(*) >= 4
order by c.customer_id;
