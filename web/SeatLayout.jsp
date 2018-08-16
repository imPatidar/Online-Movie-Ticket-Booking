
<%@page import="com.pankaj.Bean.MovieBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%><!DOCTYPE html>
<html>
<head>
<title>Movie Ticket Booking Widget</title>
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.seat-charts.js"></script>
</head>
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
     
    String sql ="SELECT movieid from Movie where moviename=?";
    st=con.prepareStatement(sql);
    String moviename=request.getParameter("movie");
    st.setString(1,moviename);
    rs=st.executeQuery();
    System.out.println(sql);
    int movieid=0;
    if(rs.next())
    {
     movieid=rs.getInt(1);
     System.out.println(movieid);
    }
    session.setAttribute("movieid", movieid);
    String sql1 ="SELECT m.movieid,m.moviename,s.starttime,s.endtime,s.price from movie m,show s where s.movieid=m.movieid and m.movieid=?";
    PreparedStatement st2=null;
    st2=con.prepareStatement(sql1);
    System.out.println("In this place "+movieid);
    st2.setInt(1, movieid);
     rs1=st2.executeQuery();
    System.out.println("Hi pankaj"); 
    rs1.next();
    System.out.println(rs1.getInt(1));
   System.out.println("Hello pankaj");
    
  %>
  <form action="Ticket.jsp">
<div class="content">
	<h1>Movie Ticket Booking</h1>
	<div class="main">
		<h2>Multiplex Theatre Showing Screen </h2>
		<div class="demo">
			<div id="seat-map">
				<div class="front">SCREEN</div>					
			</div>
			<div class="booking-details">
				<ul class="book-left">
                                        <li>Movie ID    </li>
					<li>MovieName  </li>
					<li>Start Time  </li>
                                        <li>End Time    </li>
					<li>Tickets     </li>
					<li>Total Price </li>
					<li>Seats       </li>
				</ul>
				<ul class="book-right">
					<li>:<%=rs1.getInt(1)%></li>
                                        <li>:<%= rs1.getString(2)%></li>
					<li>:<%= rs1.getString(3)%></li>
                                        <li>:<%= rs1.getString(4)%></li>
					<li>: <span id="counter">0</span></li>
                                        <li>: <b><i>Rs.</i><span id="total">0</span></b></li>
				</ul>
				<div class="clear"></div>
				<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
                               
                 <!--               <fieldset>
                              Add Snacks
                              
                               <br/>
                               <select  name="combo" id="combo1" onclick="additem()">
                                   <option value="Burger">Burger</option>
                                   <option value="Pizza">Pizza</option>
                                   <option value="Coldrink">Coldrink</option>
                                   <option value="Popcorn">Popcorn</option>
                               </select>
                               Enter quantity
                               <input type="text" name="addsnack" id="addsnack"/>
                                </fieldset>
                                -->
                                <input type="submit" class="checkout-button" value="Book Now"/>
				<div id="legend"></div>
			</div>
			<div style="clear:both"></div>
	    </div>
                            

			<script type="text/javascript">
				var price=<%= rs1.getString(5)%> ; //price
                                document.write(price);
                               $(document).ready(function() {
					var $cart = $('#selected-seats'), //Sitting Area
					$counter = $('#counter'), //Votes
					$total = $('#total'); //Total money
					
					var sc = $('#seat-map').seatCharts({
						map: [  //Seating chart
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__________',
							'aaaaaaaa__',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__aaaaaa__'
						],
						naming : {
							top : false,
							getLabel : function (character, row, column) {
								return column;
							}
						},
						legend : { //Definition legend
							node : $('#legend'),
							items : [
								[ 'a', 'available',   'Available' ],
								[ 'a', 'unavailable', 'Sold'],
								[ 'a', 'selected', 'Selected']
							]					
						},
						click: function () { //Click event
							if (this.status() == 'available') { //optional seat
                                                            
								$('<li>Row'+(this.settings.row+1)+' Seat'+this.settings.label+'</li>')
									.attr('id', 'cart-item-'+this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);
                                                                                                                                                                 
                                    
                                        
								$counter.text(sc.find('selected').length+1);
								$total.text(recalculateTotal(sc)+price);
											
								return 'selected';
							} else if (this.status() == 'selected') { //Checked
									//Update Number
									$counter.text(sc.find('selected').length-1);
									//update totalnum
									$total.text(recalculateTotal(sc)-price);
										
									//Delete reservation
									$('#cart-item-'+this.settings.id).remove();
									//optional
									return 'available';
							} else if (this.status() == 'unavailable') { //sold
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});
					//sold seat
					sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');
						
				});
				//sum total money
                                
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function () {
						total += price;
					});
							
					return total;
				}
                                
                                 
				
			</script>
                        
                        <script type="text/javascript">
                            
                            function additem()
                            {
                                   <% System.out.println("Hello NIIt");%>
                                           
                                    var textb=document.getElementById("combo1");
                                    
                                    var textc=document.getElementById("addsnack");
                                    textc.value+=textb.value;
                            }
                            
                            
                            
                             
                            </script>

        </div>

	<p class="copy_rights">&copy; 2018 Movie Ticket Booking. All Rights Reserved | Design by Pankaj M Patidar</a></p>
</div>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
</form>
</body>
</html>
