# **Identifing high- usage columns**
## **User** 
- **user_id** is used in join query.
- **email**during system login.
## **Property**
- **property_id** used in join query with booking,review,etc..
- **user_id** used in join query with User to identify host.
- **location** during search
- **price** used in filter search
## Booking
- **booking_id** primary key
- **property_id** used in join query ,order by and group by 
- **user_id**used in join query ,order by and group by
- **status** used  by admin .

# EXplain and Analyze table
- after we apply index in email
- Index Scan using uq_index_email on "User"  (cost=0.14..8.16 rows=1 width=1136)
- then after analyze 
-Seq Scan on "User"  (cost=0.00..1.12 rows=1 width=91)
this because since table is small postgresql use the seqsearch load the 


