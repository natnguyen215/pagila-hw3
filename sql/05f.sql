/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
select title from film
where film_id in (
    select fc2.film_id from film f1
    join film_category fc1 using (film_id)
    join film_category fc2 using (category_id)
    where f1.title = 'AMERICAN CIRCUS'
    group by fc2.film_id
    having count(distinct fc1.category_id) >= 2
)
and film_id in (
    select fa2.film_id from film f1
    join film_actor fa1 using (film_id)
    join film_actor fa2 using (actor_id)
    where f1.title = 'AMERICAN CIRCUS'
)
order by title;
