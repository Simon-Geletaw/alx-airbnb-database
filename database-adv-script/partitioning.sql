create table airbnb_schema."Booking_2025"

partition of airbnb_schema."booking"
for values from('2020-0-01')