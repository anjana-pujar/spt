<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="mystyle.css" >
</head>
<body>
<%@page import="java.sql.*,calldatabase.*" %>
<table class="center">
<tr>
<td>
<ul>
<li><a class="active" href="index.html">Home</a></li>
<li><a href="spaceinfo.jsp">Space Information</a></li>
<li><a href="register.html">Register</a></li>
<li><a href="login.html">User Login</a></li>
<li><a href="about.html">About Us</a></li>
<li><a href="contact.html">Contact US</a></li>

</ul>
</td>
</tr>
</table>
<table border="2">
<tr><th colspan="5">Space Info</th></tr>
<tr><td>ID</td><td>Size of the Space</td><td>Monthly Cost</td><td>Facility</td><td>Status</td></tr>
<%
try{
	Connection cn=GetData.getCn();
	PreparedStatement ps=cn.prepareStatement("select * from space where status='free'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
</tr>
<%} %>
<%}catch(Exception e){
	out.print(e);
} %>
</table>

</body>
</html>