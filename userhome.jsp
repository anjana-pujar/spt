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

</body>
</html>