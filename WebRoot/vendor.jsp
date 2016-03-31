<html>
<head>
<title> Find Vendor</title>



</head>
<body> 
<table border="2" width="60%" cellpadding="5">
<thead>
 <tr>
 <th colspan="2"> Enter the locality or place where you want your vendor</th>
 </tr>
 </thead>
 <tbody>
 <tr>
 <td>Locality</td>
 <td><input type="text" name="loc" value=""/></td>
 </tr>
 <tr>
 <td>City</td>
 <td><input type="text" name="cy" value=""/></td>
 </tr>
 <tr>
 <td>State</td>
 <td><input type="text" name="st" value=""/></td>
 </tr>
</tbody>


<%@page import="p1.connect"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "java.util.ListIterator"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.Connection"%> 

<%
        ArrayList vl=new ArrayList();
		ArrayList vc=new ArrayList();
		ArrayList vs=new ArrayList();
		ListIterator li1=vl.listIterator();
		ListIterator li2=vc.listIterator();
		ListIterator li3=vs.listIterator();
     String vloc=request.getParameter("loc");
     String vcy=request.getParameter("cy");
     String vst=request.getParameter("st");
     int i;
     Connection con=connect.getCon();
     PreparedStatement ps=con.prepareStatement("select Fname and Lname and Phone No. from vendor where Locality=vloc and City=vcy and State=vst");
     ResultSet rs1=ps.executeQuery();
     while(rs1.next())
		{
				vl.add(rs1.getString(1));
				vc.add(rs1.getString(2));
				vs.add(rs1.getString(3));

			}
     while(li1.hasNext())
     {
     %>
     <h1> <% out.print(li1.next());   out.print(li2.next());  out.print(li3.next()); %></h1>
     
    <%} %> 
     

</html>