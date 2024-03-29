SELECT * FROM hotelinfo.`hotel reservation dataset`;

select distinct type_of_meal_plan from hotelinfo.`hotel reservation dataset`;
/* 1. What is the total number of reservations in the dataset? */
select count(distinct booking_id) as num_of_res from hotelinfo.`hotel reservation dataset`;
/* 2. Which meal plan is the most popular among guests?  */
select type_of_meal_plan, count(*) as count_of_meal_plan from hotelinfo.`hotel reservation dataset` group by type_of_meal_plan order by count_of_meal_plan desc limit 1;
/* 3. What is the average price per room for reservations involving children?*/
select avg(avg_price_per_room) as Average_price_room from  hotelinfo.`hotel reservation dataset` where no_of_children>0;
/* 4. How many reservations were made for the year 20XX (replace XX with the desired year)?*/
select count(*) from hotelinfo.`hotel reservation dataset` where  arrival_date like '%-2018';
/*5. What is the most commonly booked room type?*/
select room_type_reserved , count(*) as count_of_rooms from hotelinfo.`hotel reservation dataset` group by room_type_reserved order by count_of_rooms desc ;
/* 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?*/
select count(*) as number_of_reservation from hotelinfo.`hotel reservation dataset` where no_of_weekend_nights>0;
/* 7. What is the highest and lowest lead time for reservations? */
select max(lead_time) as max_time , min(lead_time) as min_time from hotelinfo.`hotel reservation dataset`;
/* 8. What is the most common market segment type for reservations?*/
select market_segment_type,count(market_segment_type) from hotelinfo.`hotel reservation dataset` group by market_segment_type;
/* 9. How many reservations have a booking status of "Confirmed"?*/
select count(*) from hotelinfo.`hotel reservation dataset` where booking_status='Not_Canceled';
/* 10. What is the total number of adults and children across all reservations? */
select sum(no_of_adults) as num_of_adults , sum(no_of_children) as num_childred from hotelinfo.`hotel reservation dataset` ;
/* 11. What is the average number of weekend nights for reservations involving children?  */
select avg(no_of_weekend_nights)  from hotelinfo.`hotel reservation dataset` where no_of_children>0;
/* 12. How many reservations were made in each month of the year? */
select substring(arrival_date,4,2) as month,count(*) as reservation_count from hotelinfo.`hotel reservation dataset` where arrival_date like '%-2018'
group by substring(arrival_date,4,2) order by month;
/* 13. What is the average number of nights (both weekend and weekday) spent by guests for each room
type? */
select avg(no_of_weekend_nights) as weekend_night ,avg(no_of_week_nights),room_type_reserved as week_night from hotelinfo.`hotel reservation dataset` group by room_type_reserved ;
/* 14. For reservations involving children, what is the most common room type, and what is the average
price for that room type? */
select avg(avg_price_per_room) as average_price,room_type_reserved from hotelinfo.`hotel reservation dataset` group by room_type_reserved having sum(no_of_children)>0;
/* 15. Find the market segment type that generates the highest average price per room. */
select max(avg_price_per_room),market_segment_type from hotelinfo.`hotel reservation dataset` group by market_segment_type;