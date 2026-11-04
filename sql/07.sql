/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
select distinct a2.first_name || ' ' || a2.last_name as "Actor Name"
from actor a1
join film_actor fa1 using (actor_id)
join film_actor fa2 using (film_id)
join film_actor fa3 on fa2.actor_id = fa3.actor_id
join film_actor fa4 on fa3.film_id = fa4.film_id
join actor a2 on fa4.actor_id = a2.actor_id
where a1.first_name = 'RUSSELL'
and a1.last_name = 'BACALL'
and a2.actor_id != a1.actor_id
and a2.actor_id not in (
    select fa2.actor_id from actor a1
    join film_actor fa1 using (actor_id)
    join film_actor fa2 using (film_id)
    where a1.first_name = 'RUSSELL'
    and a1.last_name = 'BACALL'
)
order by "Actor Name"
