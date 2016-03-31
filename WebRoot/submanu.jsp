<!DOCTYPE html>
<html lang="en">


<head>

<%@page import="p1.connect"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "java.util.ListIterator"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="com.ibm.nosql.json.api.BasicDBList"%>
<%@page import="com.ibm.nosql.json.api.BasicDBObject"%>
<%@page import="com.ibm.nosql.json.util.JSON"%>

    
    <%
        ArrayList<String> id1=new ArrayList<String>();
		ArrayList<String> submanu=new ArrayList<String>();
		ArrayList<String> desc=new ArrayList<String>();
		//ListIterator li1=id1.listIterator();
	//	ListIterator li2=submanu.listIterator();
		//ListIterator li3=desc.listIterator();
		String table = request.getParameter("id");
		System.out.println(table);
		String h;
		h=table;
		
		Connection con=connect.getCon();table="SELECT * FROM"+" "+table;
		PreparedStatement ps=con.prepareStatement(table);
		//ps.setString(1,"ELECTRONICS");
		ResultSet rs=ps.executeQuery();	
 		int i1=0;
		while(rs.next())
		{	
		//i1++;
			id1.add(rs.getString(1));
			submanu.add(rs.getString(2));
			desc.add(rs.getString(3));
			
		}
		int count1=id1.size();
		int count2=submanu.size();
		int count3=desc.size();
     %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sub Product</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/round-about.css" rel="stylesheet">

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
      <li class="active"><a href="#"><%=h %></a></li>
      <li><a href="#"></a></li>
      <li><a href="#"></a></li> 
      <li><a href="#"></a></li> 
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logoutprocess.jsp"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
      
    </ul>
  </div>
</nav>

    <!-- Page Content -->
    <div class="container">
<br><br>

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <center><h2 class="page-header"><em><u><%=h %></u></em></h2></center>
                </h1>
              <br>
            </div>
        </div>

  
         
          <%  int i,j;
             
                for(i=0;i<count1;i=i+3)
                {
                j=count1-i;
                if(j<3&&j>0)
                	{}
                else
         	        j=0;
                
                
                
            %>
        <div class="row">
         <center>  
         
         <%if(j<=2){ %>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <a href="item.jsp?item=<%=submanu.get(i)%>&id1=<%=h%>"><h3><%=submanu.get(i)%></a>
                    <small></small>
                </h3>
                <p><%=desc.get(i)%></p>
          <%}
          if(j==2||j==0){ %>
            </div>
                <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <a href="item.jsp?item=<%=submanu.get(i+1)%>&id1=<%=h %>"><h3><%=submanu.get(i+1)%></a>
                    <small></small>
                </h3>
                <p><%=desc.get(i+1)%></p>
            </div>
            <%}if(j==0){ %>
                <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <a href="item.jsp?item=<%=submanu.get(i+2)%>&id1=<%=h %>"><h3><%=submanu.get(i+2)%></a>
                    <small></small>
                </h3>
                <p><%=desc.get(i+2)%></p>
            </div>
            </div>
            </center>
            <%}} %>
          
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2016</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
