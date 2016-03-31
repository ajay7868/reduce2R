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
String uid=request.getParameter("userid");
String up=request.getParameter("pass");
String ue=request.getParameter("email");
String uf=request.getParameter("fname");
String ul=request.getParameter("lname");
String uloc=request.getParameter("loc");
String ucy=request.getParameter("cy");
String ust=request.getParameter("st");
String upn=request.getParameter("pn");
String uyn=request.getParameter("y/n");
int i;
Connection con=connect.getCon();
if(uyn.equals("no"))
{
PreparedStatement ps=con.prepareStatement("insert into userdetail(Fname,Lname,UserEmail,Locality,City,State,Phone No.,Userid,Userpass)values('" +uf+"','"+ul+"','"+ue+"','"+uloc+"','"+ucy+"','"+ust+"','"+upn+"','"+uid+"','"+up+"')");
  i=ps.executeUpdate("insert into userdetails(Fname,Lname,UserEmail,Locality,City,State,Phone No.,Userid,Userpass)values('" +uf+"','"+ul+"','"+ue+"','"+uloc+"','"+ucy+"','"+ust+"','"+upn+"','"+uid+"','"+up+"')");
 }
 else
 {
 PreparedStatement ps=con.prepareStatement("insert into vendor(Fname,Lname,UserEmail,Locality,City,State,Phone No.,Userid,Userpass)values('" +uf+"','"+ul+"','"+ue+"','"+uloc+"','"+ucy+"','"+ust+"','"+upn+"','"+uid+"','"+up+"')");
  i=ps.executeUpdate("insert into vendor(Fname,Lname,UserEmail,Locality,City,State,Phone No.,Userid,Userpass)values('" +uf+"','"+ul+"','"+ue+"','"+uloc+"','"+ucy+"','"+ust+"','"+upn+"','"+uid+"','"+up+"')");
 }
 
 if(i>0)
 {
 out.println("Registraion Successful !");
 }
 
 %>
<a href='index.jsp'> Go To Login</a>

</body>




</html>