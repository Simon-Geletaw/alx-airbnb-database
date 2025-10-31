create unique index uq_index_email
on airbnb_schema."User"(email);

create unique index uq_index_property_id
on airbnb_schema."Property"(property_id);

create unique index uq_index_booking
on airbnb_schema."Booking"(booking_id);

create unique index uq_index_booking_payment
on airbnb_schema."Payment"(booking_id);



create unique index uq_index_property_id_booking
on airbnb_schema."Booking"(property_id);
