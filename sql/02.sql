/*
 * Compute the country with the most customers in it. 
 */
select country from country c 
join city ci using (country_id)
join address using (city_id) 
join customer using (address_id) 
group by country 
order by count(*) desc 
limit 1 
