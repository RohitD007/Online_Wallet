<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTER</title>
<style type="text/css">
body{background-image:url(onlineWallet.jpg);
	font-size:25px;
	font-family:courier;
	background-size:cover;
	background-repeat:no-repeat;}</style>
</head>
<body>
<%
try{
   String name = request.getParameter("username");
   String password = request.getParameter("password");
   String ssn = request.getParameter("SSN");
   String phone = request.getParameter("phone");
   out.print("wecome"+name+password+ssn+phone);
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");
   out.print("connection established");
   PreparedStatement ps=con.prepareStatement("insert into USER_ACCOUNT values (?,?,?,?,null,null,null,null)");
   ps.setString(1,name);  
   ps.setString(2,password);  
   ps.setString(3,ssn);  
   ps.setString(4,phone);
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("You are successfully registered..."); 
 out.print("<center><a href='login.html'>LOGIN</a>");

  
  }
  else
	  out.print("You are NOT successfully registered..."); 
  	  out.print("<center><a href='Register.html'>BACK</a>");
}
catch(Exception e){out.print("You are NOT successfully registered."+e);
out.print("<center><a href='Register.html'>BACK</a>");}
%>   
</body>
</html>