SELECT
	U.LAST_NAME,
	U.EMAIL,
	P.COUNT
FROM
	AIRBNB_SCHEMA."User" AS U
	INNER JOIN (
		SELECT
			USER_ID,
			COUNT(USER_ID)
		FROM
			AIRBNB_SCHEMA."Booking"
		GROUP BY
			USER_ID
	) AS P ON P.USER_ID = U.USER_ID
ORDER BY
	P.COUNT ASC;


	
--optimezed oone
select u.last_name,u.email,
COALESCE(count(b.booking_id),0) 
as booking_count from airbnb_schema."User" inner join