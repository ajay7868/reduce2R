<html>

<body>
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
String uid=request.getParameter("uname");
String upass=request.getParameter("pass");
String tb=request.getParameter("tname");
String user;


Connection con=connect.getCon();
PreparedStatement ps=con.prepareStatement("select * from uesrdetail where userid=" +uid+" and userpass= "+ upass+"");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{   
		 session.setAttribute("loggedIn", "admin");
		
		%>
		<a href='review.jsp?tb'></a>

 <%
 }
      else{
       out.println("Invalid user name or password");
        %>
       <a href='index.jsp'></a>
       
     <%} %>  
       <a href=reg.jsp> Sign Up </a>
</body>
</html>