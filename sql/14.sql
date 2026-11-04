/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */
select c.name, f.title, count(*) as "total rentals"
from category c
join film_category using (category_id)
join film f using (film_id)
join inventory using (film_id)
join rental using (inventory_id)
where f.film_id in (
    select f2.film_id from film_category fc2
    join film f2 using (film_id)
    join inventory i2 using (film_id)
    join rental r2 using (inventory_id)
    where fc2.category_id = c.category_id
    group by f2.film_id
    order by count(*) desc, f2.title desc
    limit 5
)
group by c.category_id, f.film_id
order by c.name, count(*) desc, f.title;
