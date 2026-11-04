/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
select a.first_name, a.last_name from actor a
where exists (
    select 1 from film_actor fa
    join film_category fc using (film_id)
    join category c using (category_id)
    where fa.actor_id = a.actor_id
    and c.name = 'Children'
)
and not exists (
    select 1 from film_actor fa
    join film_category fc using (film_id)
    join category c using (category_id)
    where fa.actor_id = a.actor_id
    and c.name = 'Horror'
)
order by a.last_name, a.first_name;
