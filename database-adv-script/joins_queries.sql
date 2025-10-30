-- it will select the user's email phone number 
SELECT
	U.FIRST_NAME,
	U.LAST_NAME,
	U.PHONE_NUMBER,
	U.EMAIL,
	B.STATUS,
	B.START_DATE,
	B.END_DATE,
	B.TOTAL_PRICE
FROM
	AIRBNB_SCHEMA."User" AS U
	INNER JOIN AIRBNB_SCHEMA."Booking" AS B ON U.USER_ID = B.USER_ID;

-- this query will retrive data from all data from property with there 
-- respective, review (if exsit ).and
-- will set null value to none 
SELECT
	P.NAME,
	P.DESCRIPTION,
	P.LOCATION,
	COALESCE(R.RATING, 0),
	COALESCE(R.COMMENT, 'None')
FROM
	AIRBNB_SCHEMA."Property" AS P
	LEFT JOIN AIRBNB_SCHEMA."Review" AS R ON P.PROPERTY_ID = R.PROPERTY_ID;

-- query will select user data from user table with there booking date if exsit from booking
SELECT
	U.FIRST_NAME,
	U.LAST_NAME,
	U.EMAIL,
	COALESCE(TO_CHAR(B.START_DATE, 'DD-Mon-YYYY'), 'none') AS START_DATE,
	COALESCE(TO_CHAR(B.END_DATE, 'DD-Mon-YYYY'), 'none') AS END_DATE,
	COALESCE(TO_CHAR(B.TOTAL_PRICE, '9999999999'), 'none') AS TOTAL_PRICE
FROM
	AIRBNB_SCHEMA."User" AS U
	FULL OUTER JOIN AIRBNB_SCHEMA."Booking" AS B ON U.USER_ID = B.USER_ID
ORDER BY
	U.FIRST_NAME;

