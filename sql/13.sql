/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */
select * from (
    select a.actor_id, a.first_name, a.last_name, f.film_id, f.title,
        rank() over (
            partition by a.actor_id
            order by sum(p.amount) desc, f.film_id
        ) as rank,
        sum(p.amount) as revenue
    from actor a
    join film_actor using (actor_id)
    join film f using (film_id)
    join inventory using (film_id)
    join rental using (inventory_id)
    join payment p using (rental_id)
    group by a.actor_id, f.film_id
) t
where rank <= 3
order by actor_id, rank, film_id
