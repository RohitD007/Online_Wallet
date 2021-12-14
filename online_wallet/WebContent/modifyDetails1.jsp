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
   //String name = request.getParameter("username");
   String password = request.getParameter("password");
   String ssn = request.getParameter("SSN1");
   //String phone = request.getParameter("phone");
   //out.print("wecome"+name+password+ssn+phone);
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");
   out.print("connection established");
   PreparedStatement ps=con.prepareStatement("update USER_ACCOUNT set Password=? where SSN=?");
   ps.setString(1,password);    
   ps.setString(2,ssn);  
   //ps.setString(1,phone);
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Your Password is Updated successfully"); 
 out.print("<center><a href='Account_info.html'>ACCOUNT INFO</a>");

  
  }
  else
	  out.print("Your Password is Not Updated"); 
  	  out.print("<center><a href='modifyDetails.html'>BACK</a>");
}
catch(Exception e){out.print("our Password is Not Updated."+e);
out.print("<center><a href='modifyDetails.html'>BACK</a>");}
%>   
</body>
</html>