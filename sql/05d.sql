/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */
select title from film
where film_id in (
    select fa2.film_id from film_actor fa1
    join film_actor fa2 using (actor_id)
    join film f1 on fa1.film_id = f1.film_id
    where f1.title = 'AMERICAN CIRCUS'
)
and film_id in (
    select fa2.film_id from film_actor fa1
    join film_actor fa2 using (actor_id)
    join film f1 on fa1.film_id = f1.film_id
    where f1.title = 'ACADEMY DINOSAUR'
)
and film_id in (
    select fa2.film_id from film_actor fa1
    join film_actor fa2 using (actor_id)
    join film f1 on fa1.film_id = f1.film_id
    where f1.title = 'AGENT TRUMAN'
)
order by title
