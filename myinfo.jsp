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
<table style="border: solid;background-color: lime">
<tr><th colspan="5"> Details</th></tr>
<tr><td>ID</td><td>Name</td><td>Phone Number</td><td>Email</td><td>password</td></tr>
<%
try{
	session=request.getSession(false);
	String cid=(String)session.getAttribute("cid");
	Connection cn=GetData.getCn();
	PreparedStatement ps=cn.prepareStatement("select * from customer where cid=?");
	ps.setString(1, cid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td>
</tr>
<%} %>
<%}catch(Exception e){
	out.print(e);
} %>
</table>
<table style="border: solid;background-color: lime">
<tr><td>Space ID</td><td>Date</td></tr>
<%
try{
	session=request.getSession(false);
	String cid=(String)session.getAttribute("cid");
	Connection cn=GetData.getCn();
	PreparedStatement ps=cn.prepareStatement("select sid,date from booking where cid=?");
	ps.setString(1, cid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td>
</tr>
<%} %>
<%}catch(Exception e){
	out.print(e);
} %>
</table>
</body>
</html>