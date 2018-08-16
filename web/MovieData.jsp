<%-- 
    Document   : MovieData
    Created on : 23 Jun, 2018, 8:43:09 PM
    Author     : hp
--%>
<%@page import="com.pankaj.Bean.MovieBean"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Movie Page</title>
    </head>
    <body>
        <h1>Selected Movie Data</h1>
        
        <%

      Connection con = null;    
      PreparedStatement st = null;

    ResultSet rs = null;
    ResultSet rs1 = null;
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
    String sql ="SELECT movieid from Movie where moviename=?";
    st=con.prepareStatement(sql);
    
    st.setString(1, request.getParameter("movie"));
    rs=st.executeQuery();
    rs.next();
    int movieid=rs.getInt(1);
    String sql1 ="SELECT m.movieid,m.moviename,s.starttime,s.endtime,s.price from movie m,show s where s.movieid=m.movieid and m.movieid=? ";
    PreparedStatement st2=null;
    st2=con.prepareStatement(sql1);
   
    st2.setInt(1, movieid);
     rs1=st2.executeQuery();
     
   if(rs1.next())
   {
      
   %>    
  
 <table>
     <br>   Movie ID        : <%= rs1.getString(1)%></br>
     <br>   Movie Name      : <%= rs1.getString(2)%></br>
     <br>   Show Start Time : <%= rs1.getString(3)%></br>
     <br>   Show End Time   : <%= rs1.getString(4)%></br>
     <br>   Movie Price     : <%= rs1.getString(5)%></br>
    
     
  <%   
      }
 %>
 </table>
        
    </body>
</html>
