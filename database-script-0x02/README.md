# Airbnb Demo Data

This repository contains sample data for an Airbnb-like platform built on PostgreSQL.

- **Users:** 10 users including guests, hosts, and admins with realistic names, emails, and phone numbers.
- **Properties:** 5 properties listed by hosts; names and locations (e.g., Cozy Cottage, Beachside Villa) were sourced from the web for realism.
- **Bookings:** 6 bookings connecting users and properties with different statuses (confirmed, pending, canceled).
- **Payments:** Each confirmed booking has an associated payment with realistic amounts and payment methods (credit_card, paypal, stripe).
- **Reviews:** Users provided ratings (1-5) and comments for properties they booked.
- **Messages:** Demo conversations between guests and hosts simulating pre- and post-booking communication.
- **UUIDs:** All primary keys are generated using `gen_random_uuid()` for uniqueness..
- **Timestamps:** `created_at` and `updated_at` fields track record creation and updates automatically.
- **Purpose:** This dataset is intended for testing, demonstration, and development of Airbnb-like features.
