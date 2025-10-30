[select 
u.phone_number ,
u.email,
b.status,
b.start_date,
b.end_date,
b.total_price
from airbnb_schema."User" as u 
inner join 
airbnb_schema."Booking" as b on
u.user_id=b.user_id;]



