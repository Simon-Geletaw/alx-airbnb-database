## Entities and Attributes

### 1. User
- `user_id` (PK)  
- `first_name`  
- `last_name`  
- `email`  
- `password_hash`  
- `phone_number`  
- `role`  
- `created_at`  

### 2. Property
- `property_id` (PK)  
- `host_id` (FK → User)  
- `name`  
- `description`  
- `location`  
- `price_per_night`  
- `created_at`  
- `updated_at`  

### 3. Booking
- `booking_id` (PK)  
- `user_id` (FK → User)  
- `property_id` (FK → Property)  
- `start_date`  
- `end_date`  
- `total_price`  
- `status`  
- `created_at`  

### 4. Payment
- `payment_id` (PK)  
- `booking_id` (FK → Booking)  
- `payment_method`  
- `payment_date`  
- `amount`  

### 5. Message
- `message_id` (PK)  
- `sender_id` (FK → User)  
- `recipient_id` (FK → User)  
- `message_body`  
- `sent_at`  

### 6. Review
- `review_id` (PK)  
- `user_id` (FK → User)  
- `property_id` (FK → Property)  
- `rating`  
- `comment`  
- `created_at`  
## Relationship

### User ↔ Property
- **Description:** A User can list many Properties. Each Property is listed by one User (host).  
- **Cardinality:** 1-to-many (User → Property)  

### User ↔ Booking
- **Description:** A User can have many Bookings. Each Booking is made by one User.  
- **Cardinality:** 1-to-many (User → Booking)  

### Property ↔ Booking
- **Description:** A Property can be booked in many Bookings. Each Booking is for one Property.  
- **Cardinality:** 1-to-many (Property → Booking)  

### Booking ↔ Payment
- **Description:** Each Booking has one Payment. Each Payment is linked to one Booking.  
- **Cardinality:** 1-to-1  

### User ↔ Message
- **Description:** A User can send and receive many Messages.  
- **Cardinality:** Many-to-many (via `sender_id` and `recipient_id`)  

### User ↔ Review
- **Description:** A User can write many Reviews. Each Review is written by one User.  
- **Cardinality:** 1-to-many (User → Review)  

### Property ↔ Review
- **Description:** A Property can have many Reviews. Each Review is for one Property.  
- **Cardinality:** 1-to-many (Property → Review)  
