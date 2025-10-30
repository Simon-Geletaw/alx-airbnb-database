select 
u.phone_number ,
u.email,
b.status,
b.start_date,
b.end_date,
b.total_price
from airbnb_schema."User" as u 
inner join 
airbnb_schema."Booking" as b on
u.user_id=b.user_id;

select p.name,
p.description,p.location,
COALESCE(r.rating,0),
COALESCE(r.comment,'None')
from airbnb_schema."Property" as p
left join  airbnb_schema."Review" as r
on p.property_id=r.property_id;


select 
u.first_name,
u.last_name,
u.email,
COALESCE(TO_CHAR(b.start_date,'DD-Mon-YYYY')
, 'none'),

COALESCE(TO_CHAR(b.total_price,'9999999999')
, 'none')
from airbnb_schema."User" as u 
full outer join 
airbnb_schema."Booking" as b on
u.user_id=b.user_id;




