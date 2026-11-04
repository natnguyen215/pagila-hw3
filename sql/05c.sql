/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */
select f2.title from film f1
join film_actor fa1 using (film_id)
join film_actor fa2 using (actor_id)
join film f2 on fa2.film_id = f2.film_id
where f1.title in (
    'AMERICAN CIRCUS',
    'ACADEMY DINOSAUR',
    'AGENT TRUMAN'
)
group by f2.film_id, f2.title
having count(*) >= 3
order by f2.title
