<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phone</title>
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
   String phone = request.getParameter("phone");
   String ssn = request.getParameter("SSN");

   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");
   PreparedStatement ps=con.prepareStatement("update USER_ACCOUNT set PHONE_NO=? where SSN=?");
   ps.setString(1,null);    
   ps.setString(2,ssn);  

   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Your PHONE is successfully updated"); 
 out.print("<center><a href='Account_info.html'>ACCOUNT INFO</a>");

  
  }
  else
	  out.print("Your phone is not updated"); 
  	  out.print("<center><a href='AddPhone.html'>BACK</a>");
}
catch(Exception e){out.print("Your phone is not updated"+e);
out.print("<center><a href='AddPhone.html'>BACK</a>");}
%>   
</body>
</html>