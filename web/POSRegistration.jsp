<%-- 
    Document   : Login
    Created on : 11 Jun, 2018, 1:26:58 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>POS Registration Page</title>
         <meta charset="UTF-8">
       <link rel="stylesheet" href="css/style.css">

        
    </head>
    <body>



<div id="login-box">
  <div class="left">
    <h1>Register</h1>
    <form action="POSAction">
    <input type="text" name="role" placeholder="Role" />    
    
        <input type="text" name="uName" placeholder="Username" />    
    <input type="text" name="city" placeholder="City" />
    
    <input type="password" name="password" placeholder="Password" />
   
    
    <input type="submit" value="Register" />
  </div>
  
    
</div>
        
</form>
    </body>
</html>
