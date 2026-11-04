/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */
select f2.title from film f1
join film_actor fa1 using (film_id)
join film_actor fa2 using (actor_id)
join film f2 on fa2.film_id = f2.film_id
where f1.title = 'AMERICAN CIRCUS'
group by f2.film_id, f2.title
having count(distinct fa1.actor_id) >= 2
order by f2.title;
