create user air_bnb_admin password '12131945#Et';
alter user air_bnb_admin with superuser;
create tablespace air_bnb_tablespace owner air_bnb_admin
location 'D:\Air-Bnb' 
;

Create database air_bnb_admin owner us_pd
Tablespace air_bnb_tablespace;

create schema airbnb_schema authorization air_bnb_admin;
create type airbnb_schema.usertype as ENUM ('guest','host','admin');

create table airbnb_schema."User" (
user_id UUID ,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
email VARCHAR(25)  NOT NULL,
password_hash VARCHAR(255) NOT NULL,
phone_number VARCHAR(20) NULL,
role airbnb_schema.usertype NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)tablespace air_bnb_tablespace;

ALTER TABLE airbnb_schema."User"
ADD CONSTRAINT pk_user_id PRIMARY KEY (user_id);

ALTER TABLE airbnb_schema."User"
ADD CONSTRAINT unique_email UNIQUE(email);

create table airbnb_schema."Property"(
property_id UUID,
host_id uuid,
name VARCHAR(25) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(200) NOT NULL,
pricepernight DECIMAL NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP
)tablespace air_bnb_tablespace;


alter table airbnb_schema."Property" add constraint pk_property_id primary key(property_id);

CREATE OR REPLACE FUNCTION airbnb_schema.update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_user_timestamp
BEFORE UPDATE ON airbnb_schema."Property"
FOR EACH ROW
EXECUTE FUNCTION airbnb_schema.update_timestamp();

 alter table airbnb_schema."Property" add constraint  
 fr_key_user_id Foreign key(host_id)
 REFERENCES airbnb_schema."User"(user_id) on update cascade
 on delete cascade;

 create type airbnb_schema.booking_status as enum('pending','confirmed','canceled');

 create table airbnb_schema."Booking"(
 booking_id   UUID, 
 
property_id   UUID,

user_id UUID,

start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL NOT NULL,
status  airbnb_schema.booking_status NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

 )tablespace air_bnb_tablespace;

 alter table airbnb_schema."Booking" add constraint pk_booking primary key(booking_id);
 
 alter table airbnb_schema."Booking" add constraint fk_fr_property foreign key(property_id) references airbnb_schema."Property"(property_id);

ALTER TABLE airbnb_schema."Booking"
ADD CONSTRAINT fk_fr_user_id
FOREIGN KEY (user_id)
REFERENCES airbnb_schema."User"(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

create type airbnb_schema."payment_type"
as ENUm('credit_card','paypal','stripe');

create table airbnb_schema."Payment"(
payment_id UUID,
booking_id uuid not null,
amount DECIMAL NOT NULL,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
payment_method airbnb_schema."payment_type" NOT NULL,
constraint fk_payment_booking
foreign key(booking_id)
references airbnb_schema."Booking"(booking_id)
on update cascade
on delete cascade,
constraint pk_payment primary key(payment_id)

)tablespace air_bnb_tablespace;

create table airbnb_schema."Review"(
review_id   UUID ,
property_id  UUID,
user_id UUID,
rating INTEGER NOT NULL,
comment TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

constraint fk_property_review foreign key(property_id)
references airbnb_schema."Property"(property_id),

constraint pk_Review primary key(review_id),
constraint rate_check check(rating>=1 and rating<=5)


)tablespace air_bnb_tablespace;

create table airbnb_schema."Message"(
message_id UUID,
sender_id UUID,
recipient_id UUID,
message_body text not null,
sent timestamp default current_timestamp,

constraint pk_message primary key(message_id),

constraint fk_sender_id foreign key(sender_id) 
references
airbnb_schema."User"(user_id),

constraint fk_recipient_id foreign key(recipient_id) 
references
airbnb_schema."User"(user_id)


)tablespace air_bnb_tablespace; 


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

create extension if not exists pgcrypto  ; 

alter table airbnb_schema."Booking" alter column booking_id set default gen_random_uuid();

alter table airbnb_schema."User" alter column user_id set default gen_random_uuid();

alter table airbnb_schema."Property" alter column property_id set default gen_random_uuid();

alter table airbnb_schema."Payment" alter column payment_id set default gen_random_uuid();

alter table airbnb_schema."Message" alter column message_id set default gen_random_uuid();

alter table airbnb_schema."Review" alter column review_id set default gen_random_uuid();


