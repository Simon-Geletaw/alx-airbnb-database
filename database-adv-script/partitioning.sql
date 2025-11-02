
-- 2. Create parent table (no data stored here)
CREATE TABLE airbnb_schema."Booking_partitioned" (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status airbnb_schema.booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions
CREATE TABLE airbnb_schema.booking_2023 PARTITION OF airbnb_schema."Booking_partitioned"
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE airbnb_schema.booking_2024 PARTITION OF airbnb_schema."Booking_partitioned"
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE airbnb_schema.booking_2025 PARTITION OF airbnb_schema."Booking_partitioned"
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE airbnb_schema.booking_future PARTITION OF airbnb_schema."Booking_partitioned"
    FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

-- 4. Add indexes / constraints on each partition
ALTER TABLE airbnb_schema.booking_2023 ADD CONSTRAINT pk_booking_2023 PRIMARY KEY (booking_id);
ALTER TABLE airbnb_schema.booking_2024 ADD CONSTRAINT pk_booking_2024 PRIMARY KEY (booking_id);
ALTER TABLE airbnb_schema.booking_2025 ADD CONSTRAINT pk_booking_2025 PRIMARY KEY (booking_id);
ALTER TABLE airbnb_schema.booking_future ADD CONSTRAINT pk_booking_future PRIMARY KEY (booking_id);

-- 5. Add foreign keys (can be added on parent)
ALTER TABLE airbnb_schema."Booking_partitioned"
ADD CONSTRAINT fk_property FOREIGN KEY(property_id)
REFERENCES airbnb_schema."Property"(property_id);

ALTER TABLE airbnb_schema."Booking_partitioned"
ADD CONSTRAINT fk_user FOREIGN KEY(user_id)
REFERENCES airbnb_schema."User"(user_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

INSERT INTO airbnb_schema."Booking_partitioned" 
SELECT*
FROM airbnb_schema."Booking"
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01';

INSERT INTO airbnb_schema."Booking_partitioned" 
SELECT *
FROM airbnb_schema."Booking"
WHERE start_date >= '2024-01-01' AND start_date < '2025-01-01';
