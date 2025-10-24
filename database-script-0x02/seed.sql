
-- insert into User 
INSERT INTO airbnb_schema."User" 
(user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
-- Guests
(gen_random_uuid(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword1', '555-0101', 'guest'),
(gen_random_uuid(), 'Michael', 'Brown', 'michael.brown@example.com', 'hashedpassword2', '555-0102', 'guest'),
(gen_random_uuid(), 'Sophia', 'Davis', 'sophia.davis@example.com', 'hashedpassword3', '555-0103', 'guest'),
(gen_random_uuid(), 'Daniel', 'Wilson', 'daniel.wilson@example.com', 'hashedpassword4', '555-0104', 'guest'),

-- Hosts
(gen_random_uuid(), 'Emily', 'Taylor', 'emily.taylor@example.com', 'hashedpassword5', '555-0201', 'host'),
(gen_random_uuid(), 'James', 'Anderson', 'james.anderson@example.com', 'hashedpassword6', '555-0202', 'host'),
(gen_random_uuid(), 'Olivia', 'Thomas', 'olivia.thomas@example.com', 'hashedpassword7', '555-0203', 'host'),

-- Admins
(gen_random_uuid(), 'Robert', 'Martinez', 'robert.martinez@example.com', 'hashedpassword8', '555-0301', 'admin'),
(gen_random_uuid(), 'Linda', 'Garcia', 'linda.garcia@example.com', 'hashedpassword9', '555-0302', 'admin'),
(gen_random_uuid(), 'David', 'Lee', 'david.lee@example.com', 'hashedpassword10', '555-0303', 'admin');


-- Insert demo property
INSERT INTO airbnb_schema."Property" 
(property_id, host_id, name, description, location, pricepernight)
VALUES

-- Emily Taylor's properties
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='emily.taylor@example.com' 
 AND role='host'),
 'Cozy Cottage',
 'A small cozy cottage in the countryside with garden and fireplace.',
 'Springfield, IL',
 120),

(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='emily.taylor@example.com'
 AND role='host'),
 'Lakeview Cabin',
 'Cabin with a beautiful lake view and modern amenities.',
 'Lakeview, MI',
 150),

-- James Anderson's properties
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='james.anderson@example.com' AND role='host'),
 'Downtown Apartment',
 'Modern apartment in the heart of the city, close to attractions.',
 'New York, NY',
 200),

(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='james.anderson@example.com' AND role='host'),
 'Suburban House',
 'Spacious suburban house with backyard and garage.',
 'Plano, TX',
 180),


-- Olivia Thomas's property
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='olivia.thomas@example.com' and role='host'),
 'Beachside Villa',
 'Luxury villa with private beach access and swimming pool.',
 'Malibu, CA',
 450);


 -- Insert  bookings 
INSERT INTO airbnb_schema."Booking" 
(booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
-- Booking 1: Alice books Cozy Cottage
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Cozy Cottage'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 '2025-11-01', '2025-11-05', 480, 'confirmed'),

-- Booking 2: Michael books Lakeview Cabin
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Lakeview Cabin'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='michael.brown@example.com'),
 '2025-12-10', '2025-12-15', 750, 'pending');
 
-- Booking 3: Daniel books Suburban House
INSERT INTO airbnb_schema."Booking" 
(booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Suburban House'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='daniel.wilson@example.com'),
 '2025-11-15', '2025-11-20', 900, 'confirmed');

-- Booking 4: Alice books Beachside Villa
INSERT INTO airbnb_schema."Booking" 
(booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES

(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Beachside Villa'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 '2025-12-01', '2025-12-05', 2250, 'pending');

 -- Booking 6: Sophia books Downtown Apartment)
INSERT INTO airbnb_schema."Booking" 
(booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Downtown Apartment'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='sophia.davis@example.com'),
 '2025-10-20', '2025-10-22', 400, 'canceled');


-- Insert  payments
INSERT INTO airbnb_schema."Payment"
(payment_id, booking_id, amount, payment_method)
VALUES
-- Payment for Booking 1 (Alice, Cozy Cottage)
(gen_random_uuid(),
 (SELECT booking_id FROM airbnb_schema."Booking" b
  JOIN airbnb_schema."Property" p ON b.property_id = p.property_id
  JOIN airbnb_schema."User" u ON b.user_id = u.user_id
  WHERE u.email='alice.johnson@example.com' AND p.name='Cozy Cottage'),
 480, 'credit_card'),

-- Payment for Booking 2 (Michael, Lakeview Cabin)
(gen_random_uuid(),
 (SELECT booking_id FROM airbnb_schema."Booking" b
  JOIN airbnb_schema."Property" p ON b.property_id = p.property_id
  JOIN airbnb_schema."User" u ON b.user_id = u.user_id
  WHERE u.email='michael.brown@example.com' AND p.name='Lakeview Cabin'),
 750, 'paypal'),

-- Payment for Booking 3 (Sophia, Downtown Apartment, canceled)
(gen_random_uuid(),
 (SELECT booking_id FROM airbnb_schema."Booking" b
  JOIN airbnb_schema."Property" p ON b.property_id = p.property_id
  JOIN airbnb_schema."User" u ON b.user_id = u.user_id
  WHERE u.email='sophia.davis@example.com' AND p.name='Downtown Apartment'),
 400, 'stripe'),

-- Payment for Booking 4 (Daniel, Suburban House)
(gen_random_uuid(),
 (SELECT booking_id FROM airbnb_schema."Booking" b
  JOIN airbnb_schema."Property" p ON b.property_id = p.property_id
  JOIN airbnb_schema."User" u ON b.user_id = u.user_id
  WHERE u.email='daniel.wilson@example.com' AND p.name='Suburban House'),
 900, 'credit_card'),

-- Payment for Booking 5 (Alice, Beachside Villa)
(gen_random_uuid(),
 (SELECT booking_id FROM airbnb_schema."Booking" b
  JOIN airbnb_schema."Property" p ON b.property_id = p.property_id
  JOIN airbnb_schema."User" u ON b.user_id = u.user_id
  WHERE u.email='alice.johnson@example.com' AND p.name='Beachside Villa'),
 2250, 'paypal');
 
-- insert into Reviews
INSERT INTO airbnb_schema."Review" (review_id, property_id, user_id, rating, comment)
VALUES
-- Alice reviews Cozy Cottage
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Cozy Cottage'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 5, 'Lovely cozy place! Very clean and quiet.'),

-- Michael reviews Lakeview Cabin
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Lakeview Cabin'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='michael.brown@example.com'),
 4, 'Great view of the lake, but kitchen was small.'),

-- Daniel reviews Suburban House
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Suburban House'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='daniel.wilson@example.com'),
 5, 'Spacious house, perfect for our family vacation.'),

-- Alice reviews Beachside Villa
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Beachside Villa'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 5, 'Amazing villa with private beach! Highly recommend.'),

-- Sophia reviews Downtown Apartment
(gen_random_uuid(),
 (SELECT property_id FROM airbnb_schema."Property" WHERE name='Downtown Apartment'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='sophia.davis@example.com'),
 3, 'Good location, but noisy at night.');
 
-- Messages between hosts and guests
INSERT INTO airbnb_schema."Message" (message_id, sender_id, recipient_id, message_body)
VALUES
-- Alice asks Emily (host) about Cozy Cottage
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='emily.taylor@example.com'),
 'Hi Emily, can we check in earlier on Nov 1?'),

-- Emily replies to Alice
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='emily.taylor@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 'Hi Alice, yes, early check-in is fine.'),

-- Michael asks James (host) about Lakeview Cabin
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='michael.brown@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='james.anderson@example.com'),
 'Hello James, is the cabin heated?'),

-- James replies to Michael
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='james.anderson@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='michael.brown@example.com'),
 'Yes, the cabin has central heating.'),

-- Sophia asks James about Downtown Apartment
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='sophia.davis@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='james.anderson@example.com'),
 'Hi, is parking available nearby?'),

-- James replies to Sophia
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='james.anderson@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='sophia.davis@example.com'),
 'Yes, there is a public parking lot just 2 blocks away.'),

-- Alice asks Olivia (host) about Beachside Villa
(gen_random_uuid(),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='alice.johnson@example.com'),
 (SELECT user_id FROM airbnb_schema."User" WHERE email='olivia.thomas@example.com'),
 'Hello Olivia, is the pool heated?');
