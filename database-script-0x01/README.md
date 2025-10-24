#  Airbnb Database Schema (PostgreSQL)

This project contains a **PostgreSQL database schema** for an Airbnb-like platform.  
It covers users, properties, bookings, payments, reviews, and messaging — all designed with proper normalization, constraints, and relationships.

---

##  Setup Overview

- **Database User**: `air_bnb_admin` (superuser)  
- **Tablespace**: `air_bnb_tablespace` located at `D:\Air-Bnb`  
- **Schema**: `airbnb_schema` (all objects are organized here)

---

##  Data Types

- **User Roles**: ENUM `usertype` → `guest`, `host`, `admin`  
- **Booking Status**: ENUM `booking_status` → `pending`, `confirmed`, `canceled`  
- **Payment Type**: ENUM `payment_type` → `credit_card`, `paypal`, `stripe`  

---

##  Tables Created

### 1. **User**
- Stores all users (guests, hosts, admins)  
- Attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`  
- Constraints: Primary Key, Unique Email  

### 2. **Property**
- Stores properties listed by hosts  
- Attributes: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`  
- Relationships: `host_id` references `User(user_id)`  
- Trigger: Updates `updated_at` automatically on modification  

### 3. **Booking**
- Records reservations between users and properties  
- Attributes: `booking_id`, `user_id`, `property_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`  
- Relationships: `user_id` → User, `property_id` → Property  
- Constraints: Primary Key, Foreign Keys with cascading updates/deletes  

### 4. **Payment**
- Tracks payments for bookings  
- Attributes: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`  
- Relationships: `booking_id` → Booking  
- Constraints: Primary Key, Foreign Key with cascade  

### 5. **Review**
- Stores user reviews for properties  
- Attributes: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`  
- Constraints: Primary Key, Foreign Keys, Rating check (`1-5`)  

### 6. **Message**
- Stores direct messages between users  
- Attributes: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent`  
- Constraints: Primary Key, Foreign Keys (sender & recipient)  

---


