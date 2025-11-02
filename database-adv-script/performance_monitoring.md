# Database Performance Monitoring and Optimization

**Objective:** Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Monitoring Query Performance

We used the following commands to analyze frequently used queries:

```sql
-- Example in PostgreSQL
EXPLAIN ANALYZE
SELECT * 
FROM airbnb_schema."Booking"
WHERE start_date >= '2024-01-01' 
  AND start_date < '2025-01-01';

-- Example in MySQL
SHOW PROFILE FOR QUERY 1;
