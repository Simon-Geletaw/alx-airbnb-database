## **1. User**
### First Normal Form (1NF)
- All values are atomic and dependent on the primary key `user_id`. No multi-valued elements exist.  
- **Conclusion:** User table is in 1NF.  

### Second Normal Form (2NF)
- Already in 1NF.  
- No partial dependency exists; all non-key attributes depend on the full primary key `user_id`.  
- **Conclusion:** User table is in 2NF.  

### Third Normal Form (3NF)
- Already in 2NF.  
- No non-key attribute is transitively dependent on the primary key.  
- Non-key attributes do not depend on each other.  
- **Conclusion:** User table is in 3NF.  
- **Redundancy:** No redundancy exists.  

---

## **2. Property**
### First Normal Form (1NF)
- All attributes are atomic.  
- `property_id` is a proper primary key.  
- **Conclusion:** Property table is in 1NF.  

### Second Normal Form (2NF)
- Already in 1NF.  
- Primary key is `property_id` (single-column).  
- No partial dependency exists; all non-key attributes depend on `property_id`.  
- **Conclusion:** Property table is in 2NF.  

### Third Normal Form (3NF)
- Non-key attributes (`host_id`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`) depend only on `property_id`.  
- **Conclusion:** Property table is in 3NF.  
- **Redundancy:** No redundancy exists.  

---

## **3. Booking**
### First Normal Form (1NF)
- All attributes are atomic.  
- `booking_id` uniquely identifies each row.  
- **Conclusion:** Booking table is in 1NF.  

### Second Normal Form (2NF)
- Already in 1NF.  
- Primary key is `booking_id` (single-column).  
- No partial dependency exists.  
- **Conclusion:** Booking table is in 2NF.  

### Third Normal Form (3NF)
- Already in 2NF.  
- Non-key attributes (`user_id`, `property_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`) depend only on `booking_id`.  
- No transitive dependencies exist.  
- **Conclusion:** Booking table is in 3NF.  
- **Redundancy:** No redundancy exists.  

---

## **4. Payment**
### First Normal Form (1NF)
- All attributes are atomic.  
- `payment_id` uniquely identifies each row.  
- **Conclusion:** Payment table is in 1NF.  

### Second Normal Form (2NF)
- Already in 1NF.  
- Primary key is `payment_id` (single-column).  
- No partial dependency exists.  
- **Conclusion:** Payment table is in 2NF.  

### Third Normal Form (3NF)
- Non-key attributes (`booking_id`, `payment_method`, `payment_date`, `amount`) depend only on `payment_id`.  
- **Conclusion:** Payment table is in 3NF.  
- **Redundancy:** No redundancy exists.  

---

## **5. Message**
### First Normal Form (1NF)
- All attributes are atomic.  
- `message_id` uniquely identifies each row.  
- **Conclusion:** Message table is in 1NF.  

### Second Normal Form (2NF)
- Already in 1NF.  
- Primary key is `message_id` (single-column).  
- No partial dependency exists.  
- **Conclusion:** Message table is in 2NF.  

### Third Normal Form (3NF)
- Non-key attributes (`sender_id`, `recipient_id`, `message_body`, `sent_at`) depend only on `message_id`.  
- **Conclusion:** Message table is in 3NF.  
- **Redundancy:** No redundancy exists.  

---

## **6. Review**
### First Normal Form (1NF)
- All attributes are atomic.  
- `review_id` uniquely identifies each row.  
- **Conclusion:** Review table is in 1NF.  

### Second Normal Form (2NF)
- Already in 1NF.  
- Primary key is `review_id` (single-column).  
- No partial dependency exists.  
- **Conclusion:** Review table is in 2NF.  

### Third Normal Form (3NF)
- Non-key attributes (`user_id`, `property_id`, `rating`, `comment`, `created_at`) depend only on `review_id`.  
- **Conclusion:** Review table is in 3NF.  
- **Redundancy:** No redundancy exists.  
