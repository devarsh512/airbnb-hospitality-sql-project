use dev02;
show tables;

#1. Import Data from both the .CSV files to create tables, Listings and Booking Details.

select * from listings;
select * from Booking_Details;

#2. Write a query to show names from Listings table
select
	name
from
	listings;

#3. Write a query to fetch total listings from the listings table.
select
	count(id)
from
	listings;

#4. Write a query to fetch total listing_id from the booking_details table
select
	*
from
	Booking_Details;

select
	count(listing_id)
from
	Booking_Details;

#5. Write a query to fetch host ids from listings table
select
	host_id
from
	listings;

#6. Write a query to fetch all unique host name from listings table
select
	distinct host_name
from
	listings;

#7. Write a query to show all unique neighbourhood_group from listings table
select
	distinct neighbourhood_group
from
	listings;

#8. Write a query to show all unique neighbourhood from listings table
select
	distinct neighbourhood
from
	listings;

#9. Write a query to fetch unique room_type from listings tables
select
	distinct room_type
from
	listings;

#10. Write a query to show all values of Brooklyn & Manhattan from listings tables
select
	*
from
	listings
where
	neighbourhood_group in ('Brooklyn', 'Manhattan');

#11. Write a query to show maximum price from booking_details table
select
	max(price)
from
	Booking_Details;

#12. Write a query to show minimum price fron booking_details table
select
	min(price)
from
	Booking_Details;

#13. Write a query to show average price from booking_details table
select
	avg(price)
from
	Booking_Details;

#14. Write a query to show minimum value of minimum_nights from booking_details table
select
	min(minimum_nights)
from
	Booking_Details;

#15. Write a query to show maximum value of minimum_nights from booking_details table
select
	max(minimum_nights)
from
	Booking_Details;

#16. Write a query to show average availability_365
select
	avg(availability_365)
from
	Booking_Details;


#17. Write a query to show id , availability_365 and all availability_365 values greater than 300
select
	listing_id,
	availability_365
from
	Booking_Details
where
	availability_365 > 300;

#18. Write a query to show count of id where price is in between 300 to 400
select
	count(listing_id)
from
	Booking_Details
where
	price between 300 and 400;

#19. Write a query to show count of id where minimum_nights spend is less than 5
select
	count(listing_id)
from
	Booking_Details
where
	minimum_nights < 5;

#20. Write a query to show count where minimum_nights spend is greater than 100
select
	count(listing_id)
from
	Booking_Details
where
	minimum_nights > 100;

#21. Write a query to show all data of listings & booking_details
select
	*
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id;

#22. Write a query to show host name and price
select
	l.host_name,
	bd.price
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id;

#23. Write a query to show room_type and price
select
	l.room_type,
	bd.price
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id;

#24. Write a query to show neighbourhood_group & minimum_nights spend
select
	l.neighbourhood_group,
	bd.minimum_nights
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id;

#25. Write a query to show neighbourhood & availability_365
select
	l.neighbourhood,
	bd.availability_365
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id;

#26. Write a query to show total price by neighbourhood_group
select
	l.neighbourhood_group,
	sum(bd.price) as TotalPrice
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.neighbourhood_group;

#27. Write a query to show maximum price by neighbourhood_group
select
	l.neighbourhood_group,
	max(bd.price) as MaxPrice
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.neighbourhood_group;

#28. Write a query to show maximum night spend by neighbourhood_group
select
	l.neighbourhood_group,
	max(bd.minimum_nights) as MaxNight
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.neighbourhood_group;

#29. Write a query to show maximum reviews_per_month spend by neighbourhood
select
	l.neighbourhood,
	max(bd.reviews_per_month) as Max_Reviews_per_Month
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.neighbourhood;

#30. Write a query to show maximum price by room type
select
	l.room_type,
	max(bd.price) as Max_Price
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.room_type;

#31. Write a query to show average number_of_reviews by room_type
select
	l.room_type,
	avg(bd.number_of_reviews) as AVG_no_of_reviews
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.room_type;

#32. Write a query to show average price by room type
select
	l.room_type,
	avg(bd.price) as AVG_Price
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.room_type;

#33. Write a query to show average night spend by room type
select
	l.room_type,
	avg(bd.minimum_nights) as AVG_Night
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.room_type;

#34. Write a query to show average price by room type but average price is less than 100
select
	l.room_type,
	avg(bd.price) as AVG_Price
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.room_type
having
	AVG_Price < 100;

#35. Write a query to show average night by neighbourhood and average_nights is greater than 5
select
	l.neighbourhood,
	avg(bd.minimum_nights) as AVG_Night
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
group by
	l.neighbourhood
having
	avg_night > 5;

#36. 36. Write a query to show all data from listings where price is greater than 200 using sub-query.
select
	*
from
	listings
where
	id in (
	select
		listing_id
	from
		Booking_Details
	where
		price>200
);

#37. Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select
	*
from
	Booking_Details
where
	listing_id in (
	select
		id
	from
		listings
	where
		host_id = 314941
);

#38. Find all pairs of id having the same host id, each pair coming once only.
select
	distinct l1.id,
	l2.host_id
from
	listings l1,
	listings l2
where
	l1.host_id = l2.host_id
	and l1.id <> l2.id
order by
	host_id;

#39. Write an sql query to show fetch all records that have the term cozy in name
select
	*
from
	listings
where
	name like '%cozy%';

#40. Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select
	l.host_id,
	l.neighbourhood_group,
	bd.price
from
	listings l
inner join Booking_Details bd
on
	l.id = bd.listing_id
where
	l.neighbourhood_group = "manhattan";

/* 41. Write a query to show id , host name, neighbourhood and price but only 
 * for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100 */

select
	l.id, 
	   l.host_name,
	   l.neighbourhood,
	   bd.price
from
	listings l
inner join booking_details bd
on
	l.id = bd.listing_id
where
	l.neighbourhood in ("Upper West Side", "Williamsburg")
	and bd.price > 100;


/*42. Write a query to show id , host name, neighbourhood and price for
 *  host name Elise and neighbourhood is Bedford-Stuyvesant*/
select
	l.id,
	l.host_name,
	l.neighbourhood,
	bd.price
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
where
	l.host_name = "Elise"
and l.neighbourhood = "Bedford-Stuyvesant";

/*43. Write a query to show host_name, availability_365,minimum_nights only
 *  for 100+ availability_365 and minimum_nights*/
select
	l.host_name,
	bd.availability_365,
	bd.minimum_nights
from
	listings l
inner join booking_details bd
on
	l.id = bd.listing_id
where
	bd.availability_365 > 100
and minimum_nights > 100 ;

/* 44. Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show 
 * only that records where number of reviews are 500+ and review per month is 5+*/
select
	l.id,
	l.host_name,
	bd.number_of_reviews,
	bd.reviews_per_month
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
where
	bd.number_of_reviews > 500
	and bd.reviews_per_month > 5;

/*45. Write a query to show neighbourhood_group which have most total number of review */
select
	l.neighbourhood_group,
	sum(bd.number_of_reviews) as Total_Review
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
group by
	l.neighbourhood_group
order by
	total_review desc
limit 1;

/* 46. Write a query to show host name which have most cheaper total price */
select
	l.host_name,
	sum(bd.price) Total_price
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
group by
	l.host_name
order by
	Total_price
limit 1;

/*47. Write a query to show host name which have most costly total price */
select
	l.host_name,
	sum(bd.price) Total_price
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
group by
	l.host_name
order by
	Total_price desc
limit 1;

/*48. Write a query to show host name which have max price using sub-query */

select
	l.host_name,
	bd.price as Max_price
from
	listings l
inner join booking_details bd
on
	l.id = bd.listing_id
where
	bd.price = (
	select
		max(price) as Max_price
	from
		booking_details
);

/*49. Write a query to show neighbourhood_group where price is less than 100*/
select
	l.neighbourhood_group,
	bd.price
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
where
	bd.price < 100
order by
	bd.price desc;

/*50. Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.*/
select
	distinct l.room_type,
	max(bd.price) as Max_price,
	avg(bd.availability_365)
from
	listings l
inner join booking_details bd 
on
	l.id = bd.listing_id
group by
	l.room_type
order by
	Max_price;












