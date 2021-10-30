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

<li><a href="rent.jsp">Rent Space</a></li>
<li><a href="myinfo.jsp">My Profile</a></li>

<li><a href="index.html">Logout</a></li>
<li>
<%
session=request.getSession(false);
String cname=(String)session.getAttribute("name");
%>
<font color="white">Welcome :<%=cname %></font>

</li>
</ul>
</td>
</tr>
</table>
<form action="Rent">
<table border="1">
<tr><th>Space Size</th><th>Space Cost</th><th>Facility</th><th>Select</th></tr>
<%
try{
	Connection cn=GetData.getCn();
	PreparedStatement ps=cn.prepareStatement("select  size,cost,facility,sid from space where status='free'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><input type="radio" name="sc" value=<%=rs.getString(4) %>></td>
</tr>
<%} %>
<%}catch(Exception e){
	out.print(e);
}
	%>
<tr><td colspan="5"><input type="submit" value="Reserve"></td></tr>
</table>
</form>
</body>
</html>