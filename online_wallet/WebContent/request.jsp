<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send</title>
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
   String identifier = request.getParameter("email_id");
   //String phone = request.getParameter("phone");
   int amount = Integer.parseInt(request.getParameter("amount"));
   String memo = request.getParameter("memo");
   String from = request.getParameter("from");
   String SSN =request.getParameter("SSN");
  
  
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");  
   
   PreparedStatement ps2=con.prepareStatement("Insert into REQUEST_TRANSACTION (Amount,Date_Time,Memo,SSN)values (?,?,?,?)");
   ps2.setInt(1,amount);
   ps2.setDate(2,java.sql.Date.valueOf(java.time.LocalDate.now()));
   ps2.setString(3,memo);
   ps2.setString(4,SSN);

  int j=ps2.executeUpdate();

  if(j>0)
  {
 out.print("Request successfully"); 
 out.print("<center><a href='Account_info.html'>ACCOUNT INFO</a>");

 
  }
  else
	  out.print("Request Failed"); 
  	  out.print("<center><a href='Request.html'>BACK</a>");
}
catch(Exception e){out.print("Request Failed"+e);
out.print("<center><a href='Request.html'>BACK</a>");}
%>   
</body>
</html>
