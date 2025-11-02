# Booking Table Partitioning: Performance and Query Guide

Partitioning the `Booking` table by `start_date` improves query efficiency and system scalability.  
Before partitioning, queries filtered by date scanned the entire table, causing high I/O and slower response times.  
With partitioning, the database performs **partition pruning**, accessing only the relevant year’s partition.  
Indexes on each partition are smaller and faster, improving lookups and aggregation performance.  
INSERTs are automatically routed to the correct partition, reducing contention and improving concurrency.  
Maintenance operations such as VACUUM, ANALYZE, and index rebuilds can be done per partition.  
Historical data management is simplified: old partitions can be archived or dropped without affecting current data.  
Aggregations (COUNT, SUM, AVG) operate only on relevant partitions, speeding up analytics.  
Overall, partitioning provides predictable, scalable, and high-performance query execution.  

## Example Queries

-- Fetch all bookings in 2024
```sql
SELECT * 
FROM airbnb_schema."Booking"
WHERE start_date >= '2024-01-01' 
  AND start_date < '2025-01-01';
