<html>
<head>

<title>   <h1> Write Your Review</h1></title>

</head>

<body bgcolor="yellow">


<%@page import="p1.connect"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "java.util.ListIterator"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.Connection"%>


<form method="post" >
<table border="2" width="60%" cellpadding="3" bgcolor="red">
                <thead>
                    <tr>
                        <th colspan="2"><h1>Right Here</h1></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Review</td>
                        <td><input type="text" name="uname" value="" style="width: 400;height: 100" /></td>
                    </tr>
</tbody>
</table>
</centre>
</form>



<%

String tb1=request.getParameter("tb");
String rev=request.getParameter("review");

Connection con=connect.getCon();
PreparedStatement ps=con.prepareStatement("insert into " +tb1+"(REVIEW)values('"+rev+"') ");
		ResultSet rs=ps.executeQuery();

 %>



</body>
</html>