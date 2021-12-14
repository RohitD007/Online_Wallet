<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>LOGIN</title>

</head>

<body>

<%! String userdbName;
String userdbPsw;
%>

<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;
String driverName = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/online_wallet";
String user = "root";
String dbpsw = "Gloria@2012";
String sql = "select * from USER_ACCOUNT where NAME=? and Password=?";
String username = request.getParameter("username");
String password = request.getParameter("password");
if((!(username.equals(null) || username.equals("")) && !(password.equals(null) || 
password.equals(""))) )
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, username);
ps.setString(2, password);
rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("NAME");
userdbPsw = rs.getString("Password");
if(username.equals(userdbName) && password.equals(userdbPsw))
{
session.setAttribute("name",userdbName);
 
response.sendRedirect("home.html"); 
} 
}
else
out.println("USERNAME OR PASSWORD IS INCORRECT!!");
out.println("<center><a href='Login.html'>LOGIN</a>");
rs.close();
ps.close(); 
}
catch(Exception e)
{
	out.println("USERNAME OR PASSWORD IS INCORRECT!!");
	out.println("<center><a href='Login.html'>LOGIN</a>");
} 
}
else
{
%>

<center><p style="color:red">Error In Login</p></center>

<% 
getServletContext().getRequestDispatcher("/Login.html").include(request, 
response);
}
%>

</body>

</html>