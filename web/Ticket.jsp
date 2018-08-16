<%-- 
    Document   : Ticket
    Created on : 28 Jun, 2018, 8:00:29 PM
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
      <title>HTML to API - event tickets</title>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700|Lobster|Kreon:700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
  <!-- <link rel="stylesheet" href="styles/main.css" media="screen" charset="utf-8"/> -->
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="content-type" content="text-html; charset=utf-8">
</head>
<style>
  body {
    margin: 0;
    color: #ffffff;
    font-family: "Open Sans", sans-serif;
    font-weight: 400;
    font-size: 24px;
  }

  .container {
    
      width: 795px;
    margin: 0 auto;
  
    
  }

  section {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    height: 280px;
    padding: 0 60px;
    background-image: url(data:image/svg+xml;charset=utf-8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+Cjxzdmcgd2lkdGg9Ijc5NXB4IiBoZWlnaHQ9IjI4MHB4IiB2aWV3Qm94PSIwIDAgNzk1IDI4MCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4bWxuczpza2V0Y2g9Imh0dHA6Ly93d3cuYm9oZW1pYW5jb2RpbmcuY29tL3NrZXRjaC9ucyI+CiAgICA8IS0tIEdlbmVyYXRvcjogU2tldGNoIDMuNC40ICgxNzI0OSkgLSBodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2ggLS0+CiAgICA8dGl0bGU+R3JvdXA8L3RpdGxlPgogICAgPGRlc2M+Q3JlYXRlZCB3aXRoIFNrZXRjaC48L2Rlc2M+CiAgICA8ZGVmcz4KICAgICAgICA8bGluZWFyR3JhZGllbnQgeDE9IjUwJSIgeTE9IjAlIiB4Mj0iNTAlIiB5Mj0iMTAwJSIgaWQ9ImxpbmVhckdyYWRpZW50LTEiPgogICAgICAgICAgICA8c3RvcCBzdG9wLWNvbG9yPSIjOTQyM0U0IiBvZmZzZXQ9IjAlIj48L3N0b3A+CiAgICAgICAgICAgIDxzdG9wIHN0b3AtY29sb3I9IiNBMTkzQUMiIG9mZnNldD0iMTAwJSI+PC9zdG9wPgogICAgICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgICAgICAgPGZpbHRlciB4PSItNTAlIiB5PSItNTAlIiB3aWR0aD0iMjAwJSIgaGVpZ2h0PSIyMDAlIiBmaWx0ZXJVbml0cz0ib2JqZWN0Qm91bmRpbmdCb3giIGlkPSJmaWx0ZXItMiI+CiAgICAgICAgICAgIDxmZU1vcnBob2xvZ3kgcmFkaXVzPSI0IiBpbj0iU291cmNlQWxwaGEiIG9wZXJhdG9yPSJkaWxhdGUiIHJlc3VsdD0ic2hhZG93U3ByZWFkT3V0ZXIxIj48L2ZlTW9ycGhvbG9neT4KICAgICAgICAgICAgPGZlT2Zmc2V0IGR4PSIxIiBkeT0iOCIgaW49InNoYWRvd1NwcmVhZE91dGVyMSIgcmVzdWx0PSJzaGFkb3dPZmZzZXRPdXRlcjEiPjwvZmVPZmZzZXQ+CiAgICAgICAgICAgIDxmZUdhdXNzaWFuQmx1ciBzdGREZXZpYXRpb249IjQiIGluPSJzaGFkb3dPZmZzZXRPdXRlcjEiIHJlc3VsdD0ic2hhZG93Qmx1ck91dGVyMSI+PC9mZUdhdXNzaWFuQmx1cj4KICAgICAgICAgICAgPGZlQ29sb3JNYXRyaXggdmFsdWVzPSIwIDAgMCAwIDAgICAwIDAgMCAwIDAgICAwIDAgMCAwIDAgIDAgMCAwIDAuMzUgMCIgaW49InNoYWRvd0JsdXJPdXRlcjEiIHR5cGU9Im1hdHJpeCIgcmVzdWx0PSJzaGFkb3dNYXRyaXhPdXRlcjEiPjwvZmVDb2xvck1hdHJpeD4KICAgICAgICAgICAgPGZlTWVyZ2U+CiAgICAgICAgICAgICAgICA8ZmVNZXJnZU5vZGUgaW49InNoYWRvd01hdHJpeE91dGVyMSI+PC9mZU1lcmdlTm9kZT4KICAgICAgICAgICAgICAgIDxmZU1lcmdlTm9kZSBpbj0iU291cmNlR3JhcGhpYyI+PC9mZU1lcmdlTm9kZT4KICAgICAgICAgICAgPC9mZU1lcmdlPgogICAgICAgIDwvZmlsdGVyPgogICAgICAgIDxmaWx0ZXIgeD0iLTUwJSIgeT0iLTUwJSIgd2lkdGg9IjIwMCUiIGhlaWdodD0iMjAwJSIgZmlsdGVyVW5pdHM9Im9iamVjdEJvdW5kaW5nQm94IiBpZD0iZmlsdGVyLTMiPgogICAgICAgICAgICA8ZmVPZmZzZXQgZHg9IjAiIGR5PSIxNCIgaW49IlNvdXJjZUFscGhhIiByZXN1bHQ9InNoYWRvd09mZnNldE91dGVyMSI+PC9mZU9mZnNldD4KICAgICAgICAgICAgPGZlR2F1c3NpYW5CbHVyIHN0ZERldmlhdGlvbj0iMiIgaW49InNoYWRvd09mZnNldE91dGVyMSIgcmVzdWx0PSJzaGFkb3dCbHVyT3V0ZXIxIj48L2ZlR2F1c3NpYW5CbHVyPgogICAgICAgICAgICA8ZmVDb2xvck1hdHJpeCB2YWx1ZXM9IjAgMCAwIDAgMCAgIDAgMCAwIDAgMCAgIDAgMCAwIDAgMCAgMCAwIDAgMC4zNSAwIiBpbj0ic2hhZG93Qmx1ck91dGVyMSIgdHlwZT0ibWF0cml4IiByZXN1bHQ9InNoYWRvd01hdHJpeE91dGVyMSI+PC9mZUNvbG9yTWF0cml4PgogICAgICAgICAgICA8ZmVNZXJnZT4KICAgICAgICAgICAgICAgIDxmZU1lcmdlTm9kZSBpbj0ic2hhZG93TWF0cml4T3V0ZXIxIj48L2ZlTWVyZ2VOb2RlPgogICAgICAgICAgICAgICAgPGZlTWVyZ2VOb2RlIGluPSJTb3VyY2VHcmFwaGljIj48L2ZlTWVyZ2VOb2RlPgogICAgICAgICAgICA8L2ZlTWVyZ2U+CiAgICAgICAgPC9maWx0ZXI+CiAgICA8L2RlZnM+CiAgICA8ZyBpZD0iUGFnZS0xIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBza2V0Y2g6dHlwZT0iTVNQYWdlIj4KICAgICAgICA8ZyBpZD0ia2FydGEtMiIgc2tldGNoOnR5cGU9Ik1TQXJ0Ym9hcmRHcm91cCI+CiAgICAgICAgICAgIDxnIGlkPSJHcm91cCIgc2tldGNoOnR5cGU9Ik1TTGF5ZXJHcm91cCI+CiAgICAgICAgICAgICAgICA8cmVjdCBpZD0iUmVjdGFuZ2xlLTEiIGZpbGw9InVybCgjbGluZWFyR3JhZGllbnQtMSkiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiIHg9IjAiIHk9IjAiIHdpZHRoPSI3OTUiIGhlaWdodD0iMjg0LjA0NzM4OCI+PC9yZWN0PgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTU3OC41LDYyMyBDNzExLjMyNDQ4Miw2MjMgODE5LDUxNS4zMjQ0ODIgODE5LDM4Mi41IEM4MTksMjQ5LjY3NTUxOCA3MTEuMzI0NDgyLDE0MiA1NzguNSwxNDIgQzQ0NS42NzU1MTgsMTQyIDMzOCwyNDkuNjc1NTE4IDMzOCwzODIuNSBDMzM4LDUxNS4zMjQ0ODIgNDQ1LjY3NTUxOCw2MjMgNTc4LjUsNjIzIFoiIGlkPSJPdmFsLTIiIG9wYWNpdHk9IjAuMyIgZmlsbD0iI0ZGRkZGRiIgZmlsdGVyPSJ1cmwoI2ZpbHRlci0yKSIgc2tldGNoOnR5cGU9Ik1TU2hhcGVHcm91cCI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTM0NC43NjEyOCwyODMuMjcwMjE0IEMzNzIuNjE4NzczLDMxNC45ODMyNzYgNDEzLjQ3MTgwOCwzMzUgNDU5LDMzNSBDNTQyLjk0NzI4MiwzMzUgNjExLDI2Ni45NDcyODIgNjExLDE4MyBDNjExLDk5LjA1MjcxOCA1NDIuOTQ3MjgyLDMxIDQ1OSwzMSBDMzc1LjA1MjcxOCwzMSAzMDcsOTkuMDUyNzE4IDMwNywxODMgQzMwNywyMjEuNDE5MDkgMzIxLjI1MzY1OCwyNTYuNTA5MDYgMzQ0Ljc2MTI4LDI4My4yNzAyMTQgWiIgaWQ9Ik92YWwtMiIgc3Ryb2tlPSIjRkZGRkZGIiBzdHJva2Utd2lkdGg9IjEwIiBvcGFjaXR5PSIwLjIiIGZpbGw9IiNGRkZGRkYiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxjaXJjbGUgaWQ9Ik92YWwtMiIgb3BhY2l0eT0iMC4yIiBmaWxsPSIjRkZGRkZGIiBza2V0Y2g6dHlwZT0iTVNTaGFwZUdyb3VwIiBjeD0iNjU4IiBjeT0iMTE2IiByPSIxMTYiPjwvY2lyY2xlPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTU0MS41LDE2OSBDNTg4LjE2ODA2MSwxNjkgNjI2LDEzMS4xNjgwNjEgNjI2LDg0LjUgQzYyNiwzNy44MzE5Mzg2IDU4OC4xNjgwNjEsMCA1NDEuNSwwIEM0OTQuODMxOTM5LDAgNDU3LDM3LjgzMTkzODYgNDU3LDg0LjUgQzQ1NywxMzEuMTY4MDYxIDQ5NC44MzE5MzksMTY5IDU0MS41LDE2OSBaIiBpZD0iT3ZhbC0yIiBvcGFjaXR5PSIwLjMiIGZpbGw9IiNGRkZGRkYiIGZpbHRlcj0idXJsKCNmaWx0ZXItMykiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+);
    background-repeat: no-repeat;
    overflow: hidden;
  }
  section .title {
    float: left;
    padding: 22px 65px 23px;
    margin-bottom: 42px;
    background-color: #ffffff;
    box-shadow: 0px 11px 9px 0px rgba(0, 0, 0, 0.5);
    color: #984AD1;
    font-family: "Lobster", cursive;
    font-size: 2.48em;
  }
  section .event {
    width: 50%;
    float: right;
    padding-top: 15px;
    font-family: "Open Sans", sans-serif;
    font-weight: 700;
    font-size: 2.24em;
    text-align: right;
    line-height: 55px;
    text-transform: uppercase;
  }
  section .info {
    clear: both;
    margin-bottom: 40px;
    text-transform: uppercase;
  }
  section .seats {
    display: inline-block;
    margin-right: 150px;
    font-size: 0.375em;
    text-transform: uppercase;
    vertical-align: middle;
  }
  section .seats:last-child {
    margin-right: 0;
  }
  section .seats span {
    position: relative;
    font-family: "Kreon", serif;
    background-color: #fff;
    color: #984AD1;
    padding: 10px 15px;
    margin-left: 10px;
    font-size: 2.666em;
    box-shadow: 0px 8px 8px 4px rgba(0, 0, 0, 0.5);
    vertical-align: middle;
  }
</style>

<body>
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
    
     int movieid=(Integer)session.getAttribute("movieid");
    System.out.println(movieid);
     String sql1 ="SELECT m.movieid,m.moviename,s.starttime,s.endtime,s.price from movie m,show s where s.movieid=m.movieid and m.movieid=?";
    PreparedStatement st2=null;
    st2=con.prepareStatement(sql1);
    
    st2.setInt(1, movieid);
     rs1=st2.executeQuery();
     
    rs1.next();
   
    
  %>
    
  <div class="container">
    <section>
      <div class="title"><%= rs1.getString(2)%></div>
      <div class="event">Movie Ticket</div>
      <div class="info">Start Time :<%= rs1.getString(3)%> PM</div>
      <div class="seats">section<span>A</span></div>
      <div class="seats">row<span>1</span></div>
      <div class="seats">col<span>7</span></div>
    
    </section>
  </div>
      
      
      <input type="button" class="checkout-button" value="PrintTicket" onclick="print1()"/>
     
</body>
<script type="text/javascript">
     
            function print1()
            {
               
                window.print();
            }
     </script>
</html>

