/*
 * Compute the number of customers who live outside of the US.
 *
 * NOTE:
 * It is possible to solve this problem with the "cheesy" query
 * ```
 * SELECT 563 AS count;
 * ```
 * Although this type of query will pass the test case for your homework,
 * it will not score you any points on your midterm/final exams.
 * I therefore strongly recommend that you solve this query "properly".
 *
 * Your goal should be to have your queries remain correct even if the data in the database changes arbitrarily.
 */
select count(*) from customer c 
where c.address_id not in (
    select a.address_id 
    from address a 
    join city ci using (city_id) 
    join country co using (country_id) 
    where co.country = 'United States')
