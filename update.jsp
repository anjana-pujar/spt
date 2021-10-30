<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table{
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
<%@page import="java.sql.*,calldatabase.*" %>
<form action="Update">
<table>
<tr><th colspan="2">Update Fields</th></tr>
<%
try{
	int id=Integer.parseInt(request.getParameter("id"));
	session=request.getSession();
	session.setAttribute("spid",id);
	Connection cn=GetData.getCn();
	PreparedStatement ps=cn.prepareStatement("select size,cost,facility from space where sid=?");
	ps.setInt(1, id);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
%>
<tr><td>Enter new size </td><td><input type="text" name="size" value=<%=rs.getString(1) %>></td></tr>
<tr><td>Enter new cost </td><td><input type="text" name="cost" value=<%=rs.getString(2) %>></td></tr>
<tr><td>Enter new facility </td><td><input type="text" name="facility" value=<%=rs.getString(3) %>></td></tr>
<%}else{ %>
	<font color="red">No record found</font><br>
	<a href="update.html">Back</a>
<% } %>
<%}catch(Exception e){
	out.print(e);
} %>
<tr><td colspan="2"><input type="submit" value="update"></td></tr>
</table>

</form>
</body>
</html>