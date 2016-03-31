<!DOCTYPE html>
<html lang="en">

<head>


<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "java.util.ListIterator"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.Connection"%>
<%@page import="p1.connect"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="com.ibm.nosql.json.api.BasicDBList"%>
<%@page import="com.ibm.nosql.json.api.BasicDBObject"%>
<%@page import="com.ibm.nosql.json.util.JSON"%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<% 
       
       ArrayList<String> productid=new ArrayList<String>();
       ArrayList<String> review1=new ArrayList<String>();
		ArrayList<String> date1=new ArrayList<String>();
		ArrayList<String> review2=new ArrayList<String>();
		ArrayList<String> date2=new ArrayList<String>();
		ArrayList<String> review3=new ArrayList<String>();
		ArrayList<String> date3=new ArrayList<String>();
		//ListIterator li1=review1.listIterator();
		//ListIterator li2=date1.listIterator();
		//ListIterator li3=review2.listIterator();
		//ListIterator li4=date2.listIterator();
		//ListIterator li5=review3.listIterator();
		//ListIterator li6=date3.listIterator();
		//ListIterator li7=productid.listIterator();
		
		String product = request.getParameter("item");
		String table = request.getParameter("id1");
		table=" "+table;
		String info;
		String h;
		h=table;
		Connection con=connect.getCon();  
		info="SELECT * FROM '"+table+"' WHERE SUBMANU='"+product+"'";
		PreparedStatement ps=con.prepareStatement(info);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
				productid.add(rs.getString(1));
			//	System.out.println(productid);				

			}
		String pid = "";

for (String s : productid)
{
    pid += s + "\t";
}
		//System.out.println(pid);
		String rd1="SELECT REVIEW,DATE FROM REDUCE WHERE PRODUCTID ='"+pid+"'";
		PreparedStatement ps1=con.prepareStatement(rd1);
		ResultSet rs1=ps1.executeQuery();
		
		String rd2="SELECT REVIEW,DATE FROM RECYCLE WHERE PRODUCTID ='"+pid+"'";
		PreparedStatement ps2=con.prepareStatement(rd2);
		ResultSet rs2=ps2.executeQuery();
		
		String rd3="SELECT REVIEW,DATE FROM REUSE WHERE PRODUCTID ='"+pid+"'";
		PreparedStatement ps3=con.prepareStatement(rd3);
		ResultSet rs3=ps3.executeQuery();
		while(rs1.next())
		{
				review1.add(rs1.getString(1));
				date1.add(rs1.getString(2));
				

			}
			
			while(rs2.next())
		{
				review2.add(rs2.getString(1));
				date2.add(rs2.getString(2));

			}
			
			while(rs3.next())
		{
				review3.add(rs3.getString(1));
				date3.add(rs3.getString(2));

			}
	int count1=review1.size();
	int count2=review2.size();
	int count3=review3.size();
    
 %>
    <title><% out.println(product); %></title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/small-business.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
      <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
	 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
     <a class="navbar-brand" href="#">
                    <img src="img/logo.png" style="margin-top:-12px" alt=""></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#"><%  out.println(product); %></a></li>
      <li><a href="#"></a></li>
      <li><a href="#"></a></li> 
      <li><a href="#"></a></li> 
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logoutprocess.jsp"><span class="glyphicon glyphicon-user"></span> </a></li>
      
    </ul>
  </div>
</nav>

    <!-- Page Content -->
    <div class="container">
<br><br>
<br><br>
        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive img-rounded" src="http://placehold.it/900x350" alt="">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-4">
                <h1>Business Name or Tagline</h1>
                <p>This is a template that is great for smal l businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
                <td align="center">
       <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Find The Nearby Vendor</button>
         
           </td>
            </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    This is a well that is a great spot for a business tagline or phone number for easy access!
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4">
                <h2>Reduce</h2>
               <%
              int i=0; 
              for(i=0;i<count1;i++)
               {
                %>
               
               
               
                <p> <% date1.get(i); %>   <% review1.get(i); %></p>
                <a class="btn btn-default" href="#"></a>
            <% } %>
            <td align="center">
        
     <%   if (session.getAttribute("loggedIn") != null)
           {%>

       <a href="review.jsp?id=REDUCE"> <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#">Put Your Review</button></a>
     
       <%} 
 
    else  
    {%>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Put Your Review</button>  
    <% } %>
    
           </td>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Recycle</h2>
                <%
               
               for(i=0;i<count2;i++)
               {
                %>
               
               
               
                <p> <%date2.get(i); %>   <%review2.get(i); %></p>
                <a class="btn btn-default" href="#"></a>
            <% } %>
              <td align="center">
        
     <%   if (session.getAttribute("loggedIn") != null)
           {%>

       <a href="review.jsp?id=RECYCLE"> <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#">Put Your Review</button></a>
     
       <%} 
 
    else  
    {%>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Put Your Review</button>  
    <% } %>
         
           </td>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Reuse</h2>
                 <%
               
               for(i=0;i<count3;i++)
               {
                %>
               
               
               
                <p> <%date3.get(i); %>   <% review3.get(i); %></p>
                <a class="btn btn-default" href="#"></a>
            <% } %>
           <td align="center">
        
     <%   if (session.getAttribute("loggedIn") != null)
           {%>

       <a href="review.jsp?id=REDUCEG"> <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#">Put Your Review</button></a>
     
       <%} 
 
    else 
    {%>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Put Your Review</button>  
    <% } %>
          
           </td>
           <td align="center">
          
            <TD/>
            </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p> &copy; </p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>






   <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Please Login First</h4>
      </div>
      <div class="modal-body">
       <form method="post" action="login.jsp">
            <center>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
//<a href=reg.jsp> Sign Up </a>
      </div>
<!-- -->



  <!-- Modal -->
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">The Website Need TO Find Your Location</h4>
      </div>
      <div class="modal-body">
       <input type="button" id="getLocation"
 onclick="getLocation()" value="Allow"/>
//<a href=reg.jsp> Not Allow </a>
      </div>
<!-- -->







<script>

function getLocation(){
if (navigator.geolocation) {
  var timeoutVal = 10 * 1000 * 1000;
  navigator.geolocation.getCurrentPosition(
    displayPosition, 
    displayError,
    { enableHighAccuracy: true, timeout: timeoutVal, maximumAge: 0 }
  );
}
else {
  alert("Geolocation is not supported by this browser");
}

function displayPosition(position) {
  var Latitude=position.coords.latitude
  
  var Longitude=position.coords.longitude
  
   var Lo1=Longitude-5;
  var La1=Latitude-5;
  var La2=Latitude+5;
  var Lo2=Longitude+5;
  
 
 
  //alert("Latitude: " + position.coords.latitude + ", Longitude: " + position.coords.longitude);
}
</script>


<script>
function displayError(error) {
  var errors = { 
    1: 'Permission denied',
    2: 'Position unavailable',
    3: 'Request timeout'
  };
  alert("Error: " + errors[error.code]);
} 
}

</script>








</body>

</html>
