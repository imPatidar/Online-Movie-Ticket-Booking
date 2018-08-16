<%@page import="com.pankaj.Bean.MovieBean"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
                 <link rel="stylesheet" href="css/style.css">
        
        <title>Movie Selection List</title>
        
    </head>
    <body>
       <%

      Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    MovieBean mb=new MovieBean();
     try
     {
   
    Class.forName("org.apache.derby.jdbc.ClientDriver");
            String url = "jdbc:derby://localhost:1527/Sound";
            String user= "pankaj";
            String pass="pankaj";
            con = DriverManager.getConnection(url, user, pass);
     }
     catch(Exception e)
     {
         out.println(e);
     }
    String sql ="SELECT moviename from Movie";
    st=con.createStatement();
    rs = st.executeQuery(sql);
   

 %>
 
  <form action="SeatLayout.jsp">
        <div class="container"> 
 
 <div id="login-box">
  <div class="left">
      <h1>Select Movie Name</h1>
    <select name="movie">
   <% 
     while(rs.next())
    {
   %>
     <option value="<%= rs.getString("moviename")%>"><%= rs.getString("moviename") %></option>
     <%
         }
    %>
</select>
   
    <input type="submit" value="Go" />
    </form>
  </div>
  
    
</div>
                   
    </body>
</html>